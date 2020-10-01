Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6955C433E7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:13:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7F5920709
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7F5920709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=friedels.name
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 588a9542;
	Fri, 9 Oct 2020 11:40:10 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8c2a1fd4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 17:03:28 +0000 (UTC)
Received: from [192.168.177.20] ([91.63.180.92]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis) id
 1MmlbE-1kmxiS3z3G-00jnFD for <wireguard@lists.zx2c4.com>; Thu, 01 Oct 2020
 19:35:18 +0200
From: "Hendrik Friedel" <hendrik@friedels.name>
To: wireguard@lists.zx2c4.com
Subject: Connection works -ping not
Date: Thu, 01 Oct 2020 17:35:08 +0000
Message-Id: <em9bd2ff82-25aa-4820-bc4c-ad768aadd441@ryzen>
User-Agent: eM_Client/7.2.37929.0
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2bt9f3Ik42o99IIekcpSLn52N8/gyj71paVX+YSPLa5YsaMLXUw
 FIs7BJM78bjrUdo0Yj5ePhvEhyf8ncwNj1yaTx58jrmxbAdV0ObLO57qS/xcokqB7LRI0Py
 mUq15+FOOQatrK7jP0i5odrijLRpgYwr8xfNMrcelY8CD46rurlJKkeGu/KjLaKroHT1HuU
 ixxBQJroV1IC44b4Dxl6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gx7vQy4x250=:oiuoh8OpZdWAil1KthaaiT
 hpwmxbHMx5guNY7/EXxkhig0OnMVgke0k0SnbbwSb2UXldHkJoQjqrlrRO64ApmT+iqaIMQn7
 UmdG4KSoAggw8Mvcp+7oeiGI3NTVsny9QbRngtpfA8KSjFYTS7tnNWeBdPo2WvmpxEouVBnVO
 We6IxYY4EvYRknUIu1Cze5JpxBsgthvwys6aN4nSD8f0IwAhvelE+LPXs+pCEhLrlYQ2ST5T8
 mPPrim8ex0ZKAsRS214EOnkEN+1oduiS3aK1zU/ZBh5WXY298KUV8X0l+7OBFTVzGL29iaLoM
 BvWyiWXKUHjlRGcS3BgXuApoBqSHUO8AjRtykb036LRZVjEBl30Q+T9TgN3ANbO+77W0yIx4j
 tLEd5moOY9bk5SKL+2gsLCxMpJ9nsw7AmazZHTql9EvYxkKB2oHU7YkYdiXzNDuJnVwS7TZAQ
 aAde5g4eo/n5Fdb3FddwvAICz8mQ/YU0CtBJIWS9Ne+/GsSXSywMydbRo83PJAPPXsb2j34I5
 ftRW9lXtksoI9qFKucP6A1EWJIgNFgsrRJLO/R0+aOcR12DPwqXgdOBjKUtNSnylG74uI7sMd
 bVA/zWkjP6ln1gRZi/P4oFByZAmWpsXrNRgOVJeH3IVDRyGk+tOmTh1TCrp4ROCnxFqt9KHdn
 Zlt8EkBziXShBIp8a5VPXXsflZe3miKz1/pXdiIJ3MEK3aSRvDAeRtuN2rVC44xs4/Lmd4lAD
 DLhfVOu/MU06oMuh7u7sflmD6kaD0xUsq6nz1riLAImbW/k9XnSu5kZANWi9PegR7dLPTNOLZ
 x2lrYCNDRwCcxeRa3/399V+i8C+pr7dSlJtZASdO+GYto5E0THrPGLcN+D4i2uQyKGfPFnD
X-Mailman-Approved-At: Fri, 09 Oct 2020 13:40:09 +0200
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
Reply-To: Hendrik Friedel <hendrik@friedels.name>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

I am using wireguard to connect two machines.
My local server is connected  to the internet via a router. I am using thei=
s Server also for connecting other devices (e.g. mobile phones) to my home=
 network. This works great.

But when connecting to another server (both debian 10), I only get a succes=
sful connection, but no ping.
*My server:*

wg show
interface: wgnet0
   public key: xxxxx=3D
   private key: (hidden)
   listening port: 51820

peer: sdfsdfsdfsdfsdfsdf=3D
   endpoint: 109.41.64.83:15167
   allowed ips: 10.192.122.2/32
   latest handshake: 1 minute, 7 seconds ago
   transfer: 10.95 MiB received, 40.35 MiB sent

peer: yyyy=3D
   endpoint: 185.22.142.254:51380
   allowed ips: 10.192.122.3/32
   transfer: 0 B received, 5.20 KiB sent

peer: yyyy=3D
   endpoint: 93.214.229.137:64119
   allowed ips: 10.192.122.4/32

peer: yyyy=3D
   endpoint: 93.214.225.116:49819
   allowed ips: 10.192.122.5/32

peer: yyyy=3D
   allowed ips: 10.192.122.6/32

peer: yyyy=3D
   allowed ips: 10.192.122.7/32


more /etc/wireguard/wgnet0.conf
[Interface]
Address =3D 10.192.122.1/24
SaveConfig =3D true
PostUp =3D iptables -A FORWARD -i wgnet0 -j ACCEPT; iptables -A FORWARD -o=
 wgnet0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown =3D iptables -D FORWARD -i wgnet0 -j ACCEPT; iptables -D FORWARD -=
o wgnet0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
ListenPort =3D 51820
PrivateKey =3D aaa=3D

[Peer]
PublicKey =3D yyyy=3D
AllowedIPs =3D 10.192.122.2/32
Endpoint =3D 123.41.67.233:18314

[Peer]
PublicKey =3D xxx=3D
AllowedIPs =3D 10.192.122.3/32
Endpoint =3D 123.22.142.254:51380





ip route
default via 192.168.177.1 dev eth0 proto static
10.192.122.0/24 dev wgnet0 proto kernel scope link src 10.192.122.1

and the other side/server:

interface: wgnet0
   public key: xxxxx=3D
   private key: (hidden)
   listening port: 54004
   fwmark: 0xca6c

peer: yyyyy=3D
   endpoint: [2003:cb:aaa:bbb:9ec7:a6ff:fefd:3a6d]:51820
   allowed ips: 0.0.0.0/0
   transfer: 0 B received, 2.75 KiB sent
   persistent keepalive: every 25 seconds



   more wgnet0.conf
[Interface]
Address =3D 10.192.122.3/32
PrivateKey =3D xxxxx=3D

[Peer]
PublicKey =3D yyyyy=3D
Endpoint =3D v.myfritz.net:51820
AllowedIPs =3D 0.0.0.0/0
PersistentKeepalive =3D 25

It seems to me, that the connection is successfully established , but data=
 is only transmitted in one direction.

How can I find the reason?

Regards,
Hendrik

