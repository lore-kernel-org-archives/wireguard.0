Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3319FC28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:52:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B17ED206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="cexbZBDw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B17ED206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1fe20226;
	Wed, 6 May 2020 10:38:10 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a2587925
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Apr 2020 20:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1587934910;
 bh=bbL26dJuZtFCckwQq9vpdAyUzzGLjixIdLWl2evCyww=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=cexbZBDwfJrFino+nzuqAdHgz2HBQ6hZ9znSUUTxQtyjErid1J8i0DwetSLdL2Z3x
 69B5+Mom06hAVM9dZM7ovgRng2Mt9m2xWDrehnJZR2x68O05d33bMF5LySVwEVbJVy
 ava+OWxsQ4nizzl/LHO6OYSUivAlJm79s9aVtZww=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gandalf.arda.local ([93.164.92.140]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MTzf6-1jc3YK2eO2-00QxPA
 for <wireguard@lists.zx2c4.com>; Sun, 26 Apr 2020 23:01:50 +0200
Date: Sun, 26 Apr 2020 23:01:49 +0200
From: Kent Friis <leeloored@gmx.com>
To: wireguard@lists.zx2c4.com
Subject: Multiple unreachable
Message-Id: <20200426230149.bf9e998b37a983892c635e78@gmx.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.31; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cs5sQLQG4fD8Lz+JO354MC7XESVkRjdDbA6Yp0lvkUF25sgdnYz
 i2Ty3onW5urS1xZDeeLQG+AUeg/vf8n9FI5sI9ROd487JJKdlYY2JxhvfI4Q1cDK8VCW3Cs
 nadS+lQNqVhwVVBr0eKz542R/r2J+THlLD86B0/DJwtWXMmIXswJ0tqtWlGYK2SrKsLAIs0
 zEd+KGSfiM3p0gM9nsKnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3FG/yKRPXYA=:na0j/ph5QSSVg//k9g2Ug6
 FxOANR+NP4DYwjQHV6tzRkQWKKwaw+xknfSKS93cMC+E9dmdUeYzAqYNGYgP0saPu1YgY2c0u
 TT0H4EqZ1LTggB0AwK/KByRc33QDiSUd7xq9Kn5pEr6zJ2/PZe6jnp4DOpUz9ZCZtNBTsnmkB
 aG7qVlc5VXZ5MLgmCRqsKJfQ1HobZqyI7eodukhDOeMsNbKm5NHjwXHIV4qY0T2YsPv6fovbT
 D0dw5XTnJwu5wwtbTY8StcfKD6vixN+7xJ+uf8mP/fLF4hvmFJ7tBNFmBTASONUjkRuNNKeKZ
 0OeMSKsDzIVRsG2V2o9pCZxaMLN9T1xvVRTOPsy+K3/jbfLgi3Ja4E5li8DIVbrit/UJZTIdx
 LbGH1PDyXg8VFIVDi7+XLJEWf+SX6uRy3aYKNRR3+9MDUqHalfWQXXv0jMy0g6kOXFcaVI/Js
 3NFf+JFK3c0cnM7LCT7H6R9Ozo2lVKusRtS7EXtIX/CyRoQWPOw2yg8PltwrH2AMgIt/IdKmJ
 Hxq5rc3LMMKldxf8m91NPD/2I7HtoO2IrME64d8VxeoYqrtxLwnOHhRDtvy6hQPaVHV2g/Olq
 DvytIeR3f7F+TFgLDpTE6myLLYyrOySvf1qR6EP5xXUp9Qbk5MUDy6bOFag+oFKLZD5AgSrSA
 3NrvXh1vIDmMDrhRyQ2Q/dtU/cTwkuR+TNHKyzxPMwiLNPqeSdAThI7mWdkEJBRi0P2iwLvFs
 GPJsKvrx2dOEQjjKn4ITTLJFdbffUPFOnC3iJrAgl79eVqepc1ClHFZD6Uf3wPGsahci2Nuig
 yG7ALqaiJaj90fyYBbpENWC7QCW6z2oJ99oaZm8ahjSmciBKPkNrl45/emML0yz1c+ta7YfMl
 Kl8XO0d+NVRaRfM4q1v/JFr0gbSHo5ndjCW/ZSDHrTOXGJIQ26Pa3bqxIR2sDRDPUBZctopkF
 cafM23dsxY7iyocr+aCU//j23ovFUapYkqx4m0OVFTQF/3cnSJioeIF4bN2kqTE+TBko/JgDF
 40kmA+Y0DYTL9GIjnkvTNbgI6XdBq5QwUP0OXBP25otNuoZgo4xinzUmfBbKQakXH/etDkid5
 CIbO4DIalIIzC39EP4/15hXNaK76yGv3ItVhDfhMe/ze2qYouWgDeKt9yyv0mmAypm6RaOUw+
 rgbxIr+DkilSMqMYyPbVP0IF2xnyOK/0OglbKNmU2X8qYZmLOnZYWMHeSCa0MIdHqAjxuy9DM
 +woUSfob9OrhPyuyX
X-Mailman-Approved-At: Wed, 06 May 2020 12:38:09 +0200
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

I have a pretty simple Wireguard setup between two machines. The power
supply in my brothers server died, so the tunnel is of course down. My
machine is running Linux 5.6.7 (from kernel.org, no patches or out of
tree drivers) with in-kernel Wireguard.

To see if he has gotten his server back up, I tried to ping it (via the
tunnel). That gave more unreachable responses than expected (note the
sequence number):

PING 172.16.1.1 (172.16.1.1) 56(84) bytes of data.
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
...
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
From 172.24.0.1 icmp_seq=1 Destination Host Unreachable
ping: sendmsg: Destination address required
^C
--- 172.16.1.1 ping statistics ---
1 packets transmitted, 0 received, +50 errors, 100% packet loss, time 0ms

172.24.0.1 is my end.
172.16.1.1 is my brother (not online)

rc.wireguard:
ip link add dev wg0 type wireguard
wg setconf wg0 /etc/wireguard/wg0.conf
ip address add dev wg0 172.24.0.1
ip link set up dev wg0
ip route add 172.16.1.0/24 dev wg0

wg0.conf:
[Interface]
PrivateKey = removed
ListenPort = 51820

[Peer]
PublicKey = also removed
AllowedIPs = 172.16.1.0/24

My PC has been rebooted since the tunnel was last up, so Wireguard has no
ip address for the other end.

This is not causing any problems that I've noticed, but I assume there is
a bug somewhere to give this many errors. Pinging an unreachable host on the
LAN only gives one "Host Unreachable" message per sequence number.

-Kent
