Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D256C27C53
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Jun 2024 09:45:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93b1cfde;
	Wed, 19 Jun 2024 09:45:27 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f781921c
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Jun 2024 09:45:25 +0000 (UTC)
Received: from bridge.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 7B8A120DF9
 for <wireguard@lists.zx2c4.com>; Wed, 19 Jun 2024 11:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1718790325;
 bh=J8B21YZth03FIHD8rBKVznzRKtRuwHUr7v8bIY2j85Q=;
 h=From:To:Subject:Date:From;
 b=F/UtbdWNirdVWUbml8DOlGWnDPELlnLAvkR9LDy9s/8HKK1CDW1W+XKUDOFmKJlLz
 9lJMIh5KMaff+LpAx8O1TOS99z/Io/D5tKri7DCoJxieUUiHvQFP0OuCOw4Q81aXMq
 2EBuZf7M2HZQL5OUw9SjKpEexxIMji19ltFMrJrhX/LqyPphOwoOb88uHmfs0HnNg4
 72HD6T/cN4qnDKfbZFOFGNjs4Jur3lSpB5bPr1tWuV7/XiPCAmDAU5sbrgX2+zsFZI
 /ZC7ASVQev045nn0aMpYTtcowZKFibUZ97gz6w6xnlltiV5+J3LA76oD8JnWqBGxWv
 AFwD971tkWzQg==
Received: by bridge.localdomain (Postfix, from userid 1000)
 id A39ED1A6A2B4; Wed, 19 Jun 2024 11:42:34 +0200 (CEST)
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Wireguard broken with ip rule due to missing address binding
Date: Wed, 19 Jun 2024 11:42:34 +0200
Message-ID: <87h6dpi7zp.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
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

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hello,

a follow up to the previous thread: if one uses "ip rule" for doing
source based routing, wireguard is broken / cannot be used
correctly. Let's take the following test case:

a) We have a separate VRF / routing table for wireguard endpoints

[09:35] server141.place10:~# ip rule ls
0:      from all lookup local
32765:  from 192.168.1.0/24 lookup 42
32766:  from all lookup main
32767:  from all lookup default
[09:37] server141.place10:~# ip route sh table 42
194.5.220.0/24 via 192.168.1.254 dev eth1 proto bird metric 32=20
194.187.90.23 via 192.168.1.254 dev eth1 proto bird metric 32=20
212.103.65.231 via 192.168.1.254 dev eth1 proto bird metric 32=20

b) ping with a random IP address does not work (correct)

[09:35] server141.place10:~# ping -c2 194.187.90.23
PING 194.187.90.23 (194.187.90.23): 56 data bytes

=2D-- 194.187.90.23 ping statistics ---
2 packets transmitted, 0 packets received, 100% packet loss

c) ping with the correct source ip address does work

[09:35] server141.place10:~# ping -I 192.168.1.149 -c2 194.187.90.23
PING 194.187.90.23 (194.187.90.23) from 192.168.1.149: 56 data bytes
64 bytes from 194.187.90.23: seq=3D0 ttl=3D57 time=3D3.883 ms
64 bytes from 194.187.90.23: seq=3D1 ttl=3D57 time=3D3.810 ms

=2D-- 194.187.90.23 ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max =3D 3.810/3.846/3.883 ms
[09:35] server141.place10:~#=20

d) wireguard does not work

[09:38] server141.place10:~# wg show
interface: oserver120
  public key: EqrNWstRSdJnj1trm5KSWbVNxLi10w/ea2EbdADJSWU=3D
  private key: (hidden)
  listening port: 54658

peer: hUm9SGQnhOG7dPn4OuiGXJZ3Wk9UZZ9JdHd32HYyH0w=3D
  endpoint: 194.187.90.23:4011
  allowed ips: ::/0, 0.0.0.0/0
  transfer: 0 B received, 8.09 KiB sent
[09:38] server141.place10:~#=20


From=20my perspective this is yet another bug that one encounters due to
missing IP address binding in wireguard.

And no, putting everything into a separate namespace is not an option,
because processes from the non namespaced part need access to the
tunnel.

I really hope the address binding issue can be solved soon, especially
giving there is already a patch for it available.

Best regards,

Nico

=2D-=20
Sustainable and modern Infrastructures by ungleich.ch

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJRBAEBCgA7FiEEZZsNkehufiT9FWnQxykhoSk/LSQFAmZyqAodHG5pY28uc2No
b3R0ZWxpdXNAdW5nbGVpY2guY2gACgkQxykhoSk/LSQhgRAAgOTVBYEySfN/LucN
9Zw6M86/OLoOLcI6r2ZJZVl3ABrbTBC7jA/uaEUQH8EIG7E5c9PQS1W6m4+AArTP
FJGwvsqk74zzJTiBDHQmMYwROT1PNBpK8PPJ6bbQudoTd5sHFpcHXp7eJZ5kwcwt
drdECQyMCDG0dG/hDFBCJk2TLpcGnHzWnedpDIy4jXMTRnuMbA0zQE8R6EToukz8
kSKitxfRUXbA881krrgAvuMBDBPjUNFC33ycBN5uKMkemDLXNsecaZ1gtCXlGjMr
70lyTYS7WC6HI7+UWFIaZYka5EtGYZHLTV8XqMl8fsAMhNPqqrqAowPjv1BZi+ad
oq9BiZiMdoYWKi0wBFNnf5NKFaFUShTtPmHaCaVjATJak4kRQoMMw1Ob/dZlRVfx
5TmqKfRdMzAjIEvQxrIbuSOsE0USXoen+m/1kOfs7XxoHqszC0iOo6D/5gOwShcR
ueyZ9MgBtkfd0Z5BaDNwgTBDrDD/WMPpPfJV7nUjspemxfhYqEiIZvaywFGjiWRb
8ElTbg29+thlLnj0M7f+B6JjKNWJwVwEG/KVqEB2vwR/yE4aeyPEqNAo759h2E2c
YLQcHkUHJCVfmytCFiIFqHTcmw12j84bn4vlGn/U0vH1H8ePCVaf3oeJewmJJTuP
QRzY8B1WeMG9aYVWuHo5pPnNktA=
=6piC
-----END PGP SIGNATURE-----
--=-=-=--
