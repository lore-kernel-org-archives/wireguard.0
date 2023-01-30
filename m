Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106EFC636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Feb 2023 04:33:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4df1902;
	Tue, 7 Feb 2023 04:29:49 +0000 (UTC)
Received: from mail-40140.protonmail.ch (mail-40140.protonmail.ch
 [185.70.40.140])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0b8e2ca7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jan 2023 12:27:01 +0000 (UTC)
Date: Mon, 30 Jan 2023 12:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1675081620; x=1675340820;
 bh=TujwsQQng72hFtXAGEvkuS/fpk2aDjrsGDtMIMToiFk=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=bxd0L1Vrys3+I+/20sSCdL0LrVgxATI21WnBmHrfC9U+XajUEZ5eUEGdV0UsWXyGs
 JW89ZdR3LtK+gSiYMYWOpPQR43xDVX2DOmLKrcK2UQmdfHmarNixo0wQQKZWr1eGJt
 AZbds8leNUbiE4mDH2YEwvix30rx7AZMrQ0iH7O9BzS8Ny3CvgJUAeIM5I4774FM1U
 7Fcq8dFJIWhJaQW5qTEeK5rBCr+g14LCrb9Llk1EixX9vpbiIDiJJfZrLWO+OugCa6
 zPr8T88WnjHNP2c1j3mryswTCi/fUJGt/6Q3C3AslhJa7GvZePExDT2WNSi6JJvm65
 FX6os/7ZgwwfA==
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: James Wynn <jameswynn23@proton.me>
Subject: Throughput significantly lower than expected, possible regression?
Message-ID: <6bLjfHXI_ooAaDHnWuIx4oVWGCoSbAfYtUxpL4bakYfOSb0nQnfD3viB1b_xFhtpVmpF_OQbFTJza15Ea65FJMwAQ0Avq4raIwVBDFl8L-w=@proton.me>
Feedback-ID: 66599953:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 07 Feb 2023 04:29:34 +0000
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

Hi.

I noticed a massive performance regression for WireGuard on Ubuntu 20.04, U=
buntu 22.04 and Fedora 37. I reported in Ubuntu and Fedora users mailing li=
st and was advised to post here.

It's possible I did something wrong(?), but I have=C2=A0fully reproducible =
steps to demonstrate this issue on a vanilla DigitalOcean=C2=A0droplet, min=
imal WireGuard configuration and no firewall rules. I've also seen this iss=
ue on other hosting providers.

Testing between two droplets (over VPC) with `iperf3 -c XXX -P 5`:

- DigitalOcean's VPC =3D ~2Gbps
- WireGuard Ubuntu 18.04 =3D ~1.3Gbps
- WireGuard Ubuntu 20.04 =3D ~400Mbps
- WireGuard Ubuntu 22.04 =3D ~400Mbps
- WireGuard Fedora 37 =3D ~400Mbps

htop reported only 20-30% load on the vCPU core so it isn't CPU-bound. Afte=
r doing these tests, I did them all again on a different day to rule out te=
mporary network congestion.


Steps to reproduce below. Repeat with each OS version.

0. Create a DigitalOcean account.
1. Create two $6 droplets (eg, LON1 region) with Regular CPU & 1GB RAM each=
, called test01 & test02.
2. `apt-get update && DEBIAN_FRONTEND=3Dnoninteractive apt-get dist-upgrade=
 -y && reboot`
3. `apt-get install -y wireguard iperf3`


4. On test01, create `/etc/wireguard/test.conf` with these contents. Replac=
e `YYY` with the IP address of the eth1 interface (VPC) on test02.

--------------------
[Interface]
PrivateKey =3D wOEa8/RS2v065wgYGQn5k7FqOXuZJ9aC/6NDW569c3g=3D
Address =3D 192.168.200.10/24
ListenPort =3D 51820
SaveConfig =3D false

[Peer]
PublicKey =3D wdXOzBptLD/QMZjhG475GErrz95Vpj4S7JPEwzcDMV8=3D
PresharedKey =3D j5Oeyhu/qDag2LunpVlFqKycp/9CH+Izjza5aq2cYss=3D
Endpoint =3D YYY:51820
AllowedIPs =3D 192.168.200.20/32
--------------------


5. On test02, create `/etc/wireguard/test.conf` with these contents. Replac=
e `XXX` with the IP address of the eth1 interface (VPC) on test01.

--------------------
[Interface]
PrivateKey =3D kCJ/4rVDTy86HxP9N5wUmgMF1Esqjc051jQPGhrQIGw=3D
Address =3D 192.168.200.20/24
ListenPort =3D 51820
SaveConfig =3D false

[Peer]
PublicKey =3D s/GtXkHOtPsqcNDy0BSRoMuxXYb4hK18dsQdkZk20yQ=3D
PresharedKey =3D j5Oeyhu/qDag2LunpVlFqKycp/9CH+Izjza5aq2cYss=3D
Endpoint =3D XXX:51820
AllowedIPs =3D 192.168.200.10/32
--------------------

6. On both droplets, run `systemctl start wg-quick@test`
7. On test01, run `iperf3 -s -B XXX`.
8. On test02, run `iperf3 -c XXX -P 5 -t 30` and observe ~2Gbps.
9. On test01, run `iperf3 -s -B 192.168.200.10`
10. On test02, run `iperf3 -c 192.168.200.10 -P 5 -t 30` and observe ~400Mb=
ps.

In steps 7 and 8, replace XXX with the IP address of the eth1 interface on =
test01.
