Return-Path: <SRS0=0td0=MH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DATE_IN_PAST_12_24,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIM_INVALID,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3860AECE560
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Sep 2018 03:17:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 654F22145D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Sep 2018 03:17:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=grandmasfridge.org header.i=@grandmasfridge.org header.b="qbJfBD5n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 654F22145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grandmasfridge.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed263eff;
	Tue, 25 Sep 2018 03:14:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24dcca8c
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Sep 2018 10:08:34 +0000 (UTC)
Received: from serenity.grandmasfridge.org (grandmasfridge.org [45.56.116.213])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4aaed276
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Sep 2018 10:08:34 +0000 (UTC)
Received: from localhost (unknown [24.51.165.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: aaron@grandmasfridge.org)
 by serenity.grandmasfridge.org (Postfix) with ESMTPSA id 286F37F985
 for <wireguard@lists.zx2c4.com>; Sun, 23 Sep 2018 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grandmasfridge.org;
 s=serenity; t=1537697454;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:in-reply-to:
 references; bh=1PXUqIknVtpJOvwzWn1HupmCrXZvtsCsU9Xgw1Iwu4A=;
 b=qbJfBD5nYSHwjfNbDD5nKk8hGg5OnwYRlLutBrmGKxwnnhr0fvFZTVtmq4PcFHC2UBdXSx
 jRcf7aILUSfUSeZgybI26x90G/SsCT8LVSO6JIcirDOOPZr8wlviMJzlkgKbntN9Su7KCe
 44S/4SUxrPR07VYPSs/isu7kGfllPCQ=
Received: by localhost (Postfix, from userid 1000)
 id 8FD4E903C989; Sat, 22 Sep 2018 15:55:22 -0400 (EDT)
Date: Sat, 22 Sep 2018 15:55:22 -0400
From: "Aaron W. Swenson" <aaron@grandmasfridge.org>
To: wireguard@lists.zx2c4.com
Subject: IPv6 Not Getting Past Server
Message-ID: <20180922195522.GA25561@gengoff>
MIME-Version: 1.0
OpenPGP: url=https://grandmasfridge.org/uploads/pgp-pubkey-0x2153C852F779174F.asc; 
 id=0x2153C852F779174F
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 25 Sep 2018 05:14:34 +0200
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
Content-Type: multipart/mixed; boundary="===============4994500854975632886=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============4994500854975632886==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I=E2=80=99m going to use the official documentation IP addresses. I am usin=
g real IPv6
addresses and not using NAT66. Naturally, NAT is being used for IPv4. Here =
are
the definitions I=E2=80=99m using:

    Server Public IPv6: 2001:DB8::DEAD:F00D/64
    Server Public IPv4: 192.0.2.1
    Routed /116: 2001:DB8::BEEF:3000/116
    Server Wireguard IPv6: 2001:DB8::BEEF:3001
    Server Wireguard IPv4: 10.0.0.1
    Client Wireguard IPv6: 2001:DB8::BEEF:3002
    Client Wireguard IPv4: 10.0.0.2

I can ping the outside world through IPv4 just fine. However, with IPv6 I c=
an
only ping the server=E2=80=99s IPv6 addresses (2001:DB8::BEEF:3001 and
2001:DB8::DEAD:F00D). The outside world stays out of reach. The packets are=
 just
dropped. I=E2=80=99m not getting network unreachable or any other error mes=
sage back.

When I enabled forwarding for IPv6 on the server, I did have to manually add
the route so that IPv6 would continue working on the server
(ip -r route add default fe80::1). I can SSH into the server, and ping the
outside world no problem. And, the outside world can reach my server via IP=
v6
just fine, too.

I=E2=80=99m running Gentoo on the server and client.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Sysctl Settings I know to be relevant
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
net.ipv6.conf.all.accept_ra =3D 2
net.ipv6.conf.default.accept_ra =3D 2
net.ipv6.conf.all.forwarding =3D 1
net.ipv6.conf.default.forwarding =3D 1
net.ipv4.conf.all.forwarding =3D 1
net.ipv4.conf.default.forwarding =3D 1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Wireguard Server Configuration
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[Interface]
Address =3D 10.0.0.1/24, 2001:DB8::BEEF:3001/116
SaveConfig =3D true
ListenPort =3D 51820
PrivateKey =3D ServerPrivateKey

[Peer]
PublicKey =3D ClientPublicKey
AllowedIPs =3D 10.0.0.2/32, 2001:DB8::BEEF:3002/128
Endpoint =3D 192.0.2.204:53132

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Wireguard Client Configuration
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[Interface]
Address =3D 10.0.0.2/32
Address =3D 2001:DB8::BEEF:3002
PrivateKey =3D ClientPrivateKey
DNS =3D 8.8.8.8

[Peer]
PublicKey =3D ServerPublicKey
AllowedIPs =3D 0.0.0.0/0, ::/0
Endpoint =3D 192.0.2.1:51820
PersistentKeepalive =3D 25

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Server Nftables
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
flush ruleset;

table inet filter {
  chain input {
    type filter hook input priority 0; policy drop;

    # established/related connections
    ct state {established, related} accept

    # loopback interface
    iifname "lo" accept

    icmp type echo-request accept
    icmpv6 type { echo-request, nd-neighbor-solicit, nd-neighbor-advert, nd=
-router-advert, redirect } accept

    # TCP ports
    tcp dport {smtp, http, https, submission, imaps, irc} accept
    # ssh
    tcp dport #ssh# accept
    # Secured IRC
    tcp dport #notthatchatty# accept

    # UDP ports
    udp dport 51820 accept

    ip6 daddr 2001:DB8::BEEF:3000/116 accept
  }

  chain forward {
    type filter hook forward priority 0;

    # allow established/related connections
    ct state {established, related} accept

    # early drop of invalid connections
    ct state invalid drop

    # Allow packets to be forwarded from the VPNs to the outer world
    ip saddr 10.0.0.0/8 iifname wg0 oifname enp0s3 accept
    ip6 saddr 2001:DB8::BEEF:3000/116 iifname wg0 oifname enp0s3 accept
  }
}
# IPv4 NAT table
table ip nat {
  chain prerouting {
    type nat hook prerouting priority 0; policy accept;
  }
  chain postrouting {
    type nat hook postrouting priority 100; policy accept;
    ip saddr 10.0.0.0/8 oif "enp0s3" snat to 192.0.2.1
  }
}


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Client =E2=80=98ip -6 route=E2=80=99
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
# ip -6 route
2001:DB8::BEEF:3002 dev wg0 proto kernel metric 256 pref medium
fe80::/64 dev enp1s0 proto kernel metric 100 pref medium


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Server =E2=80=98ip -6 route=E2=80=99
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
2001:DB8::BEEF:3000/116 dev wg0 proto kernel metric 256 pref medium
2001:DB8::/64 dev enp0s3 proto kernel metric 256 expires 2326066sec pref me=
dium
fe80::/64 dev enp0s3 proto kernel metric 256 pref medium
default via fe80::1 dev enp0s3 metric 1024 pref medium

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iNUEABYKAH0WIQQEC6Ot+QKFRWIXfOT/l1wNKJSl0QUCW6aeKl8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MDQw
QkEzQURGOTAyODU0NTYyMTc3Q0U0RkY5NzVDMEQyODk0QTVEMQAKCRD/l1wNKJSl
0XxoAP9lcm1nv8he9m8KH7ReVI1tdBb8J9/+bco+UiF58b/WnQD/XlkVAj9zoWu+
mo9u/LGdxJO0tzh1WZhBjP/u2LcIJAQ=
=/Q9d
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--

--===============4994500854975632886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4994500854975632886==--
