Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A629CA5FFC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 09:24:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c56e5afa;
	Mon, 5 Oct 2026 06:56:41 +0000 (UTC)
Received: from mail-10697.protonmail.ch (mail-10697.protonmail.ch
 [79.135.106.97])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2137b965
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Sep 2026 17:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1790787885; x=1791047085;
 bh=p1DkH3l6rDzJO4wYWViKjwTOkX8tD+jZPSQ/HL8ziTo=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=F3Pwa2MIDU9CbC/jrGysEkk3+YuYQI7GCcDggGDhs4lGPs1rb/TN2eltMagoREi0P
 4pXPDLLj2IFHFpMvUJ7Z7fRu/buRrOVx/6BZ+AQMH8I31hDSLRZRtXOF4QfAzqGc6n
 b9wrRoUeMv3fICierloAoR/sebnf/H3hhA/yy5jLAwks+/eXAjVBUdOvNZBnPDiXQy
 wmtdGJokzAFgxkDrJ+otWVc2RJJZ+4n7d3Tj2XmHqVLNflQhYs2wSXrNggCC5eL18i
 jZaxuaYo7+PntiT93MiJLBZmlPU6u45qdO8op3x6eQWYiBPT2FdM18HsiNTcT9iI8m
 swJVGp6qOtrLg==
Date: Wed, 30 Sep 2026 17:04:42 +0000
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: "frank.martino1" <frank.martino1@protonmail.com>
Subject: wg-quick fails with RTNETLINK: Invalid argument
Message-ID: <fJAqhQFnI1Mw3nbgZZmCgA99Pdg7wdkUNp9n8MGFPCb0sJQxcDPkAvF3XemLHS7DsEDCS2dg5DiwpXvxN-SIVyVUY7Q3SUK_Ecbj-bi4Qjk=@protonmail.com>
Feedback-ID: 182524978:user:proton
X-Pm-Message-ID: b4bba09a919ff9142bd883e4c299fac784378221
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>



### Description of the Bug
When switching WireGuard servers using `wg-quick` on a configuration file t=
hat specifies `Table =3D off`, the initialization fails during the IP addre=
ss assignment phase, throwing the following error:
`RTNETLINK answers: Invalid argument`

### Steps to Reproduce

1. Create two WireGuard configuration files (`serverA.conf` and `serverB.co=
nf`) with `Table =3D off` and different `Endpoint` IPs.
2. Connect to the first server: `sudo wg-quick up serverA`
3. Implement manual host routes to the endpoint via your physical gateway.
4. Switch to the second server in a single sequence:
=C2=A0 =C2=A0```bash
=C2=A0 =C2=A0sudo wg-quick down serverA && sudo wg-quick up serverB
=C2=A0 =C2=A0```
5. Observe the `RTNETLINK answers: Invalid argument` failure printing out d=
uring the execution trace of `serverB`.

### Expected Behavior

`wg-quick` should cleanly tear down all interface states from the previous =
execution, allowing the kernel network namespace to settle so that the newl=
y spawned interface can bind its IP address and configuration parameters su=
ccessfully on the first attempt.

### Actual Behavior / Execution Trace

The script wrapper executes its hardcoded command sequence:
1. `ip link add wg0 type wireguard`
2. `wg setconf wg0 /dev/fd/63`
3. `ip -4 address add <ip>/32 dev wg0` =C2=A0<-- **CRASHES HERE with EINVAL=
**

### Root Cause Analysis

This bug is a timing and state synchronization race condition between `ipro=
ute2`, the `wireguard` kernel module, and Netfilter:

1. **Asynchronous Deletion Delay:** When `wg-quick down` deletes the virtua=
l device link, the namespace unregistration and hook flushes happen asynchr=
onously in the background.
2. **Socket Cache Pollution:** Because `wg-quick up` instantly creates a ne=
w interface container (`add_if`) and populates keys/endpoints (`set_config`=
), the module instantiates UDP sockets while the background cleanup is stil=
l running. The new socket structure inherits a dirty socket destination cac=
he (`sk_dst_cache`) pointing to the *old* server IP.
3. **Netlink Veto:** When `wg-quick` subsequently tries to execute `ip addr=
ess add`, the Netlink engine evaluates the active routing layout, detects a=
n structural paradox (a new interface instance whose sockets are tied to an=
 un-flushed legacy routing table index), and rejects the address assignment=
 with `EINVAL`.
4. **Cascading Deadlock:** The failed state causes the kernel to loop hands=
hake traffic destined for the old server into `OUT=3Dwg0`, deadlocking loca=
l socket queues and freezing local DNS proxies.

### Environment & Configuration

* **OS / Kernel:** Linux Kernel (Stateful tracking via `nf_conntrack` enabl=
ed)
* **Tools:** `wg-quick` from `wireguard-tools`
* **Relevant Config Snippet:**
=C2=A0 ```ini
=C2=A0 [Interface]
=C2=A0 Address =3D 10.67.57.124/32
=C2=A0 Table =3D off
=C2=A0 ```

### Workaround / Possible Fix

The failure can be avoided entirely by performing an explicit, native proto=
col routing flush **prior** to initializing the new interface container. Ad=
ding the following block to the teardown sequence clears the routing indice=
s from live memory, ensuring Netlink encounters a pristine workspace:

```bash
# Force the kernel to drop sticky server routing mappings before regenerati=
ng the link
sudo ip route flush dev <physical_interface> proto boot
sudo ip route flush cache
```
