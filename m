Return-Path: <SRS0=uuIP=E5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593A7C56202
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 16:42:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 659D120782
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 16:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 659D120782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=friedels.name
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c30bfa3;
	Mon, 23 Nov 2020 16:36:57 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3807b15b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Nov 2020 19:34:43 +0000 (UTC)
Received: from [192.168.177.174] ([91.63.166.210]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis) id
 1N7Qt9-1kBAOJ2ubt-017oee for <wireguard@lists.zx2c4.com>; Sun, 22 Nov 2020
 20:39:58 +0100
From: "Hendrik Friedel" <hendrik@friedels.name>
To: wireguard@lists.zx2c4.com
Subject: Connection works, ping does not
Date: Sun, 22 Nov 2020 19:39:59 +0000
Message-Id: <embf875782-3b93-421c-bb54-3c3566b671bb@desktop-g0r648m>
User-Agent: eM_Client/8.0.3385.0
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bm9HeX1+n6VTPWhYj9lAn30mm+ManWsWw8KIZeoRtRAF2TiFeEk
 ztMrS81Xgm6lNQOV3n40bCFzvynrC9TxMddSYOnTP2IuK/7yoZqfeDAdvM622WYrKXUa2X7
 +ejWqf61oMmFlVqjCJNm2WcNzHbchJD4OczA/KbnDCuc9xgGjekvh5l5ghloyYjRXTzqnqr
 poOXn49laPhjKm44v7oCA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1Tp6CZ9O8mA=:Yi/ZSP5B3ZrCu5n2HaH6cC
 gAAs4qWemic3hPRIC0DVermy/5A79ZWSG1wtd+GY7CsFNZ/JKaPY1unLuzJpSp/xL9755TnRv
 H+CPscU8i4rPRT7lpnmx0WX+SpzMrNNsSr2P9IVKEemNASzYB3tQEWV9bWVHXVn+sK1h8z/OT
 Hg2GIC47sU8JdeKtrg5pS6usQw6OuTSGWOzIdFn4JIVtHeRttW+XeGq5LXqERt81kJhzt8S8a
 JTAZPRPH8IXmisiGxnPupo0HOTXNOnzihId8tBqRUg5YbivMD7bvyih/aFF5Y9WwHBj6Vg3gI
 hjiTsPANM+Kao5gAaEw8s11pLxyuwdq2pP5kaKluCy0AYHPruqy5mButycXzriBIBSqrT42A6
 vmAFJthYxSN27qukaUqPKMWDLuehNeBTgi6mKsp11W7Tf+rmVjf1+zk0EWUWFo+kAAj/td/sQ
 aUJZH+hJ0w==
X-Mailman-Approved-At: Mon, 23 Nov 2020 17:36:56 +0100
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

(I posted this a while ago, but it never appeared on the list; if the list=
 is the wrong place for this question, please let me know; I would appreciat=
e a hint for a more appropriate place)

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

