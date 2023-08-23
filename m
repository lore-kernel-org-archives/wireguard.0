Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1581AEE49B2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Aug 2023 16:20:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be7d6d24;
	Wed, 23 Aug 2023 16:07:21 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [185.244.194.184])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e52038fa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Aug 2023 14:55:17 +0000 (UTC)
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
 by relay01-mors.netcup.net (Postfix) with ESMTPS id 4RW8QY4Rc5z8y5T;
 Wed, 23 Aug 2023 16:55:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mk16.de; s=key2;
 t=1692802517; bh=6cWWg7T6HaOt89e3R8NYYem4zQobz0bnJMHsh5vyyjg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DxUFU8DPgjDbxseSZjHGKO7I2tzdp7pPqkx42Hz+Pi8XJ1GPBt9zpL0LKf0UAgIhR
 e5r4abnA9cyApRWBmlRyJTWtwcvx1/f5xUS9sX8GG6foeuz6w1qF+c6R2KxFk9BQU7
 +CidP+DTSPmT+GrGsWltgcNqMfK3IkXu34UlKdS6dyuxQrLl3Z1NdQrFqUykw9n9sD
 FoBBHXW+zKSj3IpTbncv/4goXmEUEsERmEIuyjyNI9D+cAQFiRvuzafQodIADx2/dP
 /rf6aFfq+Yd4OQT2eitKjk9RN5ajQdR1VnVWc2B82GuYnGs9WMnz7TfXhaTzG65IAo
 fD2gsQNNSejDw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by relay01-mors.netcup.net (Postfix) with ESMTPS id 4RW8QY3lCyz7yhM;
 Wed, 23 Aug 2023 16:55:17 +0200 (CEST)
Received: from mxe87b.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4RW8QY0Y9cz8sZV;
 Wed, 23 Aug 2023 16:55:17 +0200 (CEST)
Received: from parrot (unknown [IPv6:2605:6400:c5ac:3cc6::12])
 by mxe87b.netcup.net (Postfix) with ESMTPSA id 0198D1C002D;
 Wed, 23 Aug 2023 16:55:11 +0200 (CEST)
Authentication-Results: mxe87b; spf=pass (sender IP is 2605:6400:c5ac:3cc6::12)
 smtp.mailfrom=m-k-mailling-list@mk16.de smtp.helo=parrot
Received-SPF: pass (mxe87b: connection is authenticated)
Date: Wed, 23 Aug 2023 16:58:40 +0200
From: Marek =?UTF-8?B?S8O8dGhl?= <m-k-mailling-list@mk16.de>
To: wireguard@lists.zx2c4.com
Cc: luizluca@gmail.com
Subject: Re: IPv6 and PPPoE with MSSFIX
Message-ID: <20230823165840.7bf3b910@parrot>
In-Reply-To: <CAJq09z6Dz3idziDgB-3-VOVa=YEWk6ZOrLOwLTBctRb5VkLMLA@mail.gmail.com>
References: <CAJq09z6Dz3idziDgB-3-VOVa=YEWk6ZOrLOwLTBctRb5VkLMLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O+OUkAgm3z342eLCr0H1TlW";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-PPP-Message-ID: <169280251286.2939724.6727716490621365691@mxe87b.netcup.net>
X-Rspamd-Queue-Id: 0198D1C002D
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: kPb8TwcD5S2NH5Aq/5RIooL1UjOLeESKfjftla8LS68XNr1DrCjtm4g=
X-Mailman-Approved-At: Wed, 23 Aug 2023 16:07:07 +0000
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

--Sig_/O+OUkAgm3z342eLCr0H1TlW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Aug 2023 17:39:23 -0300
Luiz Angelo Daros de Luca <luizluca@gmail.com> wrote:

> Hello,
>=20
> We noticed an issue with clients that use PPPoE and connect to WG
> using IPv6. Both sides start to fragment the encrypted packet leading
> to a severe degradation in performance. We reduced the wireguard MTU
> from the default 1420 to 1400 and the issue was solved. However, I
> wonder if it could be fixed with MSSFIX (in my case, nftables
> equivalent).

PPPoE adds 8 bytes of overhead so that an MTU of 1432 can be used. I
also have to do this at home with my DSL line for example.
The MTU should be set on each side (on both peers) for this to work.

> The server does know that the remote address has a smaller MTU as it
> fragments the packet accordingly when any VPN peer sends some traffic.

Presumably the OS on the server does this and not WireGuard itself. I
could imagine that the server first receives an ICMP Too big message
and only then performs the fragmentation.

> The traffic inside the VPN does adjust the TCP MSS to fit into vpn
> interface MTU (1420 by default, now 1400).

Keep in mind that TCP MSSFIX only applies to TCP and other Layer 4
protocols like UDP might still have problems.

> I could dynamically add firewall rules to clamp MSS per authorized_ips
> but, theoretically, the kernel has all the info to do that
> automatically. I wonder if MSSFIX could detect the best MTU for a
> specific address through the wireguard. It should consider the
> peer-to-peer PMTU, the IP protocol wireguard is using and the normal
> wireguard headers.

As far as I know WireGuard does not do PMTU.

--=20
Marek K=C3=BCthe
m.k@mk16.de
er/ihm he/him

--Sig_/O+OUkAgm3z342eLCr0H1TlW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEmqKBWfzrPNg7whIBfoaRRmmRCMcFAmTmHqAACgkQfoaRRmmR
CMe7aw//VKKSSKV+RGEcDd1h8onzNsrifY6oAA7wV/AseY1z2bKVVGr64DR5q6W0
J1WvlfSScCYG+P6tIMEUaZW/K4gtQJBJlt/OnaarojwSksac3jnlugvWteHdOhY3
w5PCNPNaI05Y9tqcI13wEmkwnCBOT5LbxjQ0Q+fZXoNwlUkRVKU6SqXze9kXdrrm
MrKnXBEQuRsMkw8ZTDjiwh1ohRdv+RelClrVHfGegW/HHkjoAjTwTnDreKlLLoPf
PlT/O+SSu6omwJdVgidEdE2mtGSZBPHakOx9kf0omTS5+bXQ8OlLGPMYPb6wn+GZ
uWvf9CyLDQ55v2TAzV7IzCZ6M0ndOQXGLiMBkIuyL3q2xTb7Rk3tK6p/M7gv10g8
4/EOCQunDM53rk4D2YQM5SusEURzXo5CrE5KOov/rduMot7SCpNhaI9f72vUHGLr
phABFURHvw9+TKWE2qxiczOo+ia7sDlB/Eha6edzfB+BcnuxWB6vePxYBsU5XcTg
CtOXizcLqkcCP1t5jog1XomNlw/x25IZ/b5wHYPihJhLT0DlpF1FrDup3vxqzjf/
tF9fTf4RH6g2QoCMyAiUHpRYrn6JHD4oUmNKlPjViPyTkJ3jf9on0iZvbsCe3hYo
Ib1ppHPIhKorrJLA456nOTjtciQ8w1q+PzNJdVbsaYsk9Z1U06M=
=l4tm
-----END PGP SIGNATURE-----

--Sig_/O+OUkAgm3z342eLCr0H1TlW--
