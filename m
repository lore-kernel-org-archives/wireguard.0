Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F608C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:34:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E436206DD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:34:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdtfuHBd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E436206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffbaa7a8;
	Sun, 25 Aug 2019 15:30:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79060a80
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Aug 2019 11:42:45 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f114aa1
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Aug 2019 11:42:44 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id t14so2238070lji.4
 for <wireguard@lists.zx2c4.com>; Wed, 14 Aug 2019 04:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Xd9lYOJvSQqOH5qt/vMsfi+HXmcFR4iO4vPRx6y5axs=;
 b=GdtfuHBdlQn1nd20mMfZWRsUXihl1HWNAj9EQtnj7aB0+azECPGi/Hr5W4YEspRFCy
 fOw979gjIY8yrHAKJQr8bm7KnF7a6A8HdPVioA4JhSWF7zDC7L960P9buVky+jmRgxAw
 76g5Ltdx0SwnRgg3KCwubK5PkLJzldNaGzhx6wL+soL8fCqk3fnMSIi6FQpgJLcWpDfc
 ooKgRBDTzqcvxEGqdLiEnpWWrnR5V4WVfwizEJIvkqD3ZfqgrTvraPOwysQ30nygUi9G
 75jrNO0qNoojfpEzT76VSCjEwinTLwWIOWSG4hBuLsiIgbd/joLs2xbVXMVaGpdDaAKq
 UrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Xd9lYOJvSQqOH5qt/vMsfi+HXmcFR4iO4vPRx6y5axs=;
 b=CS5YXPRHK0dP+dSxD82I8v3tIlyY++G2av3Fqh82yqm0IOUh1Ypj2ZJdSEBUWPZG52
 9JB1VVG9sFG/etVqKaFsPwXcPGEhwwrFyKzYaYi+DH8mCWbLEWdw06DQ1EX40RfmLYEZ
 lD9DX1pOq3+rLrojjvAYXu0mIxbNIc7GjR6HnpM4LGK6+UN3en8vLRPFDGBjcf3PFgXJ
 7J1zx9hj2i2/25YTjj0ukDF+GpKejqFuYQUwJ094w6Mpy33fMzmbI1givpQJg7fWaMQ0
 t11OQPD4rnNhvESixc/NIWL4Gc0nwIG0Rk9nh129u/Nak91j8QFej7wczyzS0ULqfELe
 73UQ==
X-Gm-Message-State: APjAAAVMKTukpD1xA6+ez702E1o1Fr/68aUlAs9HepYcsT3ftf4Tzxgi
 3Y8E95kDUZsDq3E8Cc5eKt8Pr7PM6aqA/CIFD0umScDh
X-Google-Smtp-Source: APXvYqykzJLmMREnXQRwP2Cea2enf4mromO1TRjLumWTiS2OAVlfafMhhLuzX8rpJqe+mP/iZzQxKlAcLhrJuS0knXs=
X-Received: by 2002:a2e:9887:: with SMTP id b7mr3929297ljj.45.1565782962299;
 Wed, 14 Aug 2019 04:42:42 -0700 (PDT)
MIME-Version: 1.0
From: Dimitar Vassilev <dimitar.vassilev@gmail.com>
Date: Wed, 14 Aug 2019 14:42:30 +0300
Message-ID: <CAF+AZZUuUgPTJLu-JJz4Nf7vopyGjhjrbzuHpue6dNEGkckTKA@mail.gmail.com>
Subject: Setting Wireguard for enabling remote access to a SOHO DMZ service
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:30:11 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6562304584564156211=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6562304584564156211==
Content-Type: multipart/alternative; boundary="0000000000004367cb05901241d6"

--0000000000004367cb05901241d6
Content-Type: text/plain; charset="UTF-8"

Dear Wireguard users and developers,

I'm in the planning phase of enabling remote access to a SOHO DMZ service
for myself and a few peers. I would appreciate if you could help me clear
the uncertainties before me on the drawing board /implementation level.
My setup is:

   - LibreCMC 1.4.8 with latest stock wireguard from the LibreCMC repo. The
   router is being fed with Internet by DHCP from my ISP.
   - DMZ VLAN
   - DMZ network hosting the service - /24. Say 192.168.200.0/24
   - Internal LAN - /24, fed by the internal DHCP. Say 192.168.100.0/24
   - default route  -  say 192.168.20.1
   - DMZ firewall zone. Only outgoing DMZ traffic is allowed for the time
   being.
   - LAN firewall zone. outgoing traffic to wan + DMZ is allowed
   - NAT-traversal
   - DynDNS
   - Peer with "public" /24 network - 10.10.10.0/24

What I would like to achieve is


   - Setup a wireguard interface in the same DMZ network range or a subset
   of it
   - Port-forward the wireguard traffic from my peer to the DMZ wireguard
   VPN entry-point for the particilar service
   - Route the rest of the traffic unencrypted


I've checked the manual and quick deployment guide and would appreciate
your feedback on doing the things in the proper way. The specific questions
I have are:


   - Is it a good idea to put the wg interface in the same network range as
   the DMZ or should I split the DMZ into 2 x /25 networks or pick a separate
   wireguard network
   - Given that I'm assigned a default route via DHCP, should I create
   custom static routes like in the example below on the command line

              # ip route add 10.10.10.0/24 via 192.168.20.1 dev eth1

or should I leave this up to the routing daemons to decide themselves? I'm
still mixing up the concepts of the different VPN implementations. I also
see by web searching that in LuCI I got a checkbox to resolve my problems
with routing the private networks.

Thanks for your comments and feedback!

Dimitar

--0000000000004367cb05901241d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear Wireguard users and developers,<div><br></div><div>I&=
#39;m in the planning phase of enabling remote access to a SOHO DMZ service=
 for myself and a few peers. I would appreciate if you could help me clear =
the uncertainties before me on the drawing board /implementation level.</di=
v><div>My setup is:</div><div><ul><li>LibreCMC 1.4.8 with latest stock wire=
guard from the LibreCMC repo. The router is being fed with Internet by DHCP=
 from my ISP.</li><li>DMZ VLAN=C2=A0</li><li>DMZ network hosting the servic=
e - /24. Say <a href=3D"http://192.168.200.0/24">192.168.200.0/24</a></li><=
li>Internal LAN - /24, fed by the internal DHCP. Say <a href=3D"http://192.=
168.100.0/24">192.168.100.0/24</a></li><li>default route=C2=A0 -=C2=A0 say =
192.168.20.1</li><li>DMZ firewall zone. Only outgoing DMZ traffic is allowe=
d for the time being.</li><li>LAN firewall zone. outgoing traffic to wan=C2=
=A0+ DMZ is allowed</li><li>NAT-traversal</li><li>DynDNS</li><li>Peer with =
&quot;public&quot; /24 network - <a href=3D"http://10.10.10.0/24">10.10.10.=
0/24</a></li></ul><div>What I would like to achieve is</div></div><div><br>=
</div><div><ul><li>Setup a wireguard interface in the same DMZ network rang=
e or a subset of it</li><li>Port-forward the wireguard traffic from my peer=
 to the DMZ wireguard VPN entry-point for the particilar service</li><li>Ro=
ute the rest of the traffic unencrypted</li></ul><div><br></div></div><div>=
I&#39;ve checked the manual and quick deployment guide and would appreciate=
 your feedback on doing the things in the proper way. The specific question=
s I have are:</div><div><br></div><div><ul><li>Is it a good idea to put the=
 wg interface in the same network range as the DMZ or should I split the DM=
Z into 2 x /25 networks or pick a separate wireguard network</li><li>Given =
that I&#39;m assigned a default route via DHCP, should I create custom stat=
ic routes like in the example below on the command line=C2=A0</li></ul>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # ip route add <a href=3D"htt=
p://10.10.10.0/24">10.10.10.0/24</a>=C2=A0via 192.168.20.1=C2=A0dev eth1=C2=
=A0</div><div><br></div><div>or should I leave this up to the routing daemo=
ns to decide themselves? I&#39;m still mixing up the concepts of the differ=
ent VPN implementations. I also see by web searching that in LuCI I got a c=
heckbox to resolve my problems with routing the private networks.</div><div=
><br></div><div>Thanks for your comments and feedback!</div><div><br></div>=
<div>Dimitar</div><div><br></div><div><br></div><div><br></div><div><br></d=
iv><div>=C2=A0<br></div></div>

--0000000000004367cb05901241d6--

--===============6562304584564156211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6562304584564156211==--
