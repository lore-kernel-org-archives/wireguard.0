Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00FBC4706C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:25:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d027881f;
	Wed, 20 Dec 2023 04:59:03 +0000 (UTC)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [2607:f8b0:4864:20::b2e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 70cf34d9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2023 20:39:16 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-db5e5647c24so739711276.1
 for <wireguard@lists.zx2c4.com>; Fri, 01 Dec 2023 12:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701463155; x=1702067955; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CO2vFDqc5YvSB7HGz083DWkF4hiCN0xbxd5JpiBhNJk=;
 b=BJAdbKYHA44/EbJs7cxBm3WokIIa2iv/glGy9ovelKhfA0WXIPaT67OsBJ04QxvZCQ
 3JQ/CvL0uO5FrYF3XwXh/pCGf60p7rx3lFmy/qTgIrXGQh+ZksNBp+nDPOP1cthlxqNH
 FhoS4+b0htKUYpXEgfopRRuuh3iJ3gXf1GgS2WaWE6MxCnbuEynq/K7kEy0yV/WDVtCk
 mVL59ZRutBtJDxmuQ7XWzA8Kw85g3YqTcOoDE++Zl6+dw/0hE16m5Qep6J3yMbBWOxcf
 OWBLCdctUBiefVaf7ggbxAsia6u84IEfm1mN2cnylpSFP/lhBmpXp1PfHl+AyyUw0SXv
 bHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701463155; x=1702067955;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CO2vFDqc5YvSB7HGz083DWkF4hiCN0xbxd5JpiBhNJk=;
 b=RkYAyt9Ve4HgG1outk3XlcmPjk6UeTxxsSYSAGqOSQ7dRedn08Ckx88ARaU0OSNhnz
 iV6zifjr/6NO0a1JuxOHTnGqfbUuBc6ogYn68Tpa/SHDjSR5sH+fe769REsJxNC/BdxV
 quoiA6sdhDPIURoSMc/kUXkpVf96E10cAx14DT3G/6PeKv8OPieGQ+r57vOAY7+++UnK
 ygKrLGHSrnONF0GGKTZV+QDKSDxDdQ1+mlJ1lo29aqbzWvBo8dcj4noVsbHvFterG6H/
 NvDuz1csOeLwB2Gi8aHdJjAsqJst8EXMGBFSnRK1Cx9dXAL0mTzUqww6H6t3hCAcjwwb
 JDoQ==
X-Gm-Message-State: AOJu0YzpBH4H08zEc2uvzlrxFwi9//iMflvt6ZnIxIwc8RQl+ee4c8i6
 DWmwEhCmJkaksGQsmNU7hnBTj7lNsTqK/70thL9AnAE3eLLPBJ8X
X-Google-Smtp-Source: AGHT+IEbsuuna5oIcIMm5iaaqaOp+3US91AHIOFcWksNShHcSbXMR/8n1uOQEQjKVRmenpcqZ7B2jLbAU7WtqgO5B7U=
X-Received: by 2002:a25:bd8f:0:b0:db7:daec:ec65 with SMTP id
 f15-20020a25bd8f000000b00db7daecec65mr86587ybh.44.1701463154813; Fri, 01 Dec
 2023 12:39:14 -0800 (PST)
MIME-Version: 1.0
From: Colin Williams <colin.williams.orcas@gmail.com>
Date: Fri, 1 Dec 2023 12:39:04 -0800
Message-ID: <CAN8Z3GvdnCEzdMZ6W-jN0XLypGPJYNa+H0qRjXNk3AK-yuxMVw@mail.gmail.com>
Subject: No mention of ip tables to setup VPN
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 20 Dec 2023 04:58:44 +0000
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

I setup wireguard following the site. I did not create configuration
files. I just followed the example on
https://www.wireguard.com/quickstart/

I can ping between the hosts through wg via their interface IPs
10.0.0.1 / 10.0.0.2

One host I wish to use it as a VPN. Call it Host A

I set `net.ipv4.ip_forward = 1 on host A and checked it was set properly.


Then to setup the routing I follow the section `````Overriding The
Default Route```` in https://www.wireguard.com/netns/ on Host B


After adding routes by above, I can still ping each host via their ip
and am still connected to the other host via SSH . But I lose my
internet connection on Host B otherwise. I copied my wg command
outputs and config details below.

Does anyone know what I'm doing wrong?


In some examples I see folks using iptables like:


setting `iptables -t nat -A POSTROUTING -j MASQUERADE` on Host A .


If it's likely necessary, why don't I see a mention of this on the
documentation on wireguard.com ?




Some errors I see:

PING google.com (142.250.69.206) 56(84) bytes of data.

From XXX (10.0.0.2) icmp_seq=1 Destination Host Unreachable

ping: sendmsg: Required key not available

From XXX (10.0.0.2) icmp_seq=2 Destination Host Unreachable

ping: sendmsg: Required key not available

From XXX (10.0.0.2) icmp_seq=3 Destination Host Unreachable

ping: sendmsg: Required key not available

../../../lib/isc/netmgr/uverr2result.c:98:isc___nm_uverr2result():
unable to convert libuv error code in udp_send_cb
(../../../lib/isc/netmgr/udp.c:802) to isc_result: -126: Unknown
system error -126

;; communications error to 1.1.1.1#53: timed out

../../../lib/isc/netmgr/uverr2result.c:98:isc___nm_uverr2result():
unable to convert libuv error code in udp_send_cb
(../../../lib/isc/netmgr/udp.c:802) to isc_result: -126: Unknown
system error -126

^C[colin_williams@JT9M367J07 wg]$ ping 10.0.0.1

PING 10.0.0.1 (10.0.0.1) 56(84) bytes of data.

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Host A wg command output

interface: wg0

public key: 5ZXlotq43t3g3qz97ZkXeSu75+E6UchzO5hj4=

private key: (hidden)

listening port: XXXXX


peer: 5mjkoeRw2e0IbPa2rontt5AvO8oJgCVBlJgqVil+1T4=

endpoint: 203.45.131.16:33333

allowed ips: 10.0.0.2/32

latest handshake: 8 minutes, 4 seconds ago

transfer: 27.48 KiB received, 33.24 KiB sent

Host B wg command output

interface: wg0

public key: 5mjko3qg3g3qg35AvO8oJgCVBlJgqVil+1T4=

private key: (hidden)

listening port: 35052


peer: 5ZXlosrq6L+ZT+O5Bg1mz97ZkXeSu75+E6UchzO5hj4=

endpoint: 203.4.11.174:38101

allowed ips: 10.0.0.1/32

latest handshake: 9 minutes, 9 seconds ago

transfer: 26.73 KiB received, 30.51 KiB sent

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Routing table Host B before additions. Everything works from Host A &&
B at this point

default via 192.168.10.1 dev wlp1s0f0 proto dhcp src 192.168.10.177 metric 600

10.0.0.0/24 dev wg0 proto kernel scope link src 10.0.0.2

192.168.10.0/24 dev wlp1s0f0 proto kernel scope link src
192.168.10.177 metric 600

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Adding `````Overriding The Default Route```` from doc in
https://www.wireguard.com/netns/ on Host B

route.

After adding the route to HostB, I can no longer access most internet
resources from HostB. However, host B can still ping Host A and vice
versa via IP address.

The errors shown above for Host B are after I set the routing table.
Please excuse if the route table looks funny. I think I am having
trouble pasting from my laptop.


Kernel IP routing table

Destination Gateway Genmask Flags Metric Ref Use Iface

0.0.0.00.0.0.0128.0.0.0U 0 0 0 wg0

default _gateway 0.0.0.0UG 600 0 0 wlp1

10.0.0.00.0.0.0255.255.255.0 U 0 0 0 wg0

128.0.0.00.0.0.0128.0.0.0U 0 0 0 wg0

192.168.10.00.0.0.0255.255.255.0 U 600 0 0 wlp1

203.45.131.16:33333 _gateway 255.255.255.255 UGH 0 0 0 wlp1
