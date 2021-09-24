Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D7EC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 15:31:53 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B25060EE0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 15:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B25060EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac7228a5;
	Fri, 24 Sep 2021 15:31:51 +0000 (UTC)
Received: from sonic308-2.consmr.mail.bf2.yahoo.com
 (sonic308-2.consmr.mail.bf2.yahoo.com [74.6.130.41])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 036737c7
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 15:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1632497505; bh=dli71u1QX91vFhJKklk+5VxEaemYssneUfXh9407/TE=;
 h=From:To:Subject:Date:References:From:Subject:Reply-To;
 b=iBta6i/6turovJyv9m1Sr061RaF42K6+x37G/E0wWCr6NXmf4xZb37nIPCc3Au6cbVZEfemb5BtZZdpZx9tP/js6cK1Pi44kI6d/EnxUl9osjf/b7IcCH7hHnc+KjYyW+0Lsbv0Pt+Ulm3RTtblLnaWiar4K52Eh6tsBwtbI3Ig58YDETA9rOHNn4I2aJtE7nqIRCzWsUYhvt7CD5Cbq4ldvCCRglEMbaD55vUR0Gtm8r7SyOJGYx/kOX6w9Qzkg+WplR/iW4gEdZKe9lOuJubBGxCWgrVr3GM6pC53XZ9qEJA4yaJdCe/qg/BDjGSmbcS+3LJZoNN+RpNEPC8yxNA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1632497505; bh=f6U5vJyITnnM+lY1nv/Gg+0cZ+aO9tMERi8LEPbwCs9=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=S2a0E2dvDlZBaokZir8Gsu3a/JcOi1bxGNlQoDDqMs+U0q1JAsD4RTcmldm3q0dOVQ/EffC0I91wHQdAj0MErLobBmQii1OL8MySamB2lLbPMGPaQr3mZ+X8kVH6S1fhgpTckHBnTQ8G+Sq2JnwM4fpWbUYhyVuTC54EbM6EPSqs9WeUIXAOZ45TP8RGGFFhmNcXMBg6kjbjlSnW93O/7vRib7WoX6oigiAOo7GCiI78U2EHUtkUi/u6dva01Y41j0+hJViRENI96Gy97Z38LL3HyaxL2ZfR1Ml4xafc3JDfpW4ziDhKt9nX+it3cDivjW8QrYs0dlPVcSPzG7Mwnw==
X-YMail-OSG: btVsujcVM1nWaK1W7NQBt5_Erw21f.d9UyYwwYadxUvHgjiJkg0MCMyjOfrFosY
 uuFv713U7tieo1E_FST9qH_4GQBU8o9PGFu2FjRsSGHdbXXSoD8pNTiCnk38wyYjCujLrL4euFWT
 inMzAu274VyiweUxK74N.dSh9t6HhH77.51Uv2M72X6QshvbOoFy52Ev7scTyC7PmFmDSqcuuwAp
 Xrmc.goC5czvVGrlYS7YMFHFyfochsE7O5WUka7nS5cnIZjsQNPBHwOqWmLSuQJw5V2nBAbwb3Cj
 .YzrD5xAomOO00IPClPwP06_7vwohpPFd3i1lgYNkV43WveJjUb_L2ZmtDRlDXgqEcOTQ6eAVkmv
 fDXcaO04j0QlpWu14qdZgkahuoG_7u7_t0HFhDvypfx_ccMId0Qe_pGEsn4XrHt6HaHiaL2Ub1ED
 stf8FCiFE8ez0pDTjHuCaDSMtoaYodtmpOX9L_fW1FdwjZVClGiJlBzDlVy7Cc4u6ggV_xItoaZz
 R78VDivC6qFSdoISmihfO7QsmNoN0QOz9UKzPUxiKz94zBzk1NxY52fMeZWMHz0llJOJ6ggNM0fj
 Gqg0vGvUrBTAV0Q2qm5NRJKx7kZRwPfPyLRtcvfyEaMYsV6ADeA__llDinJeUVWd6uO2IXrHpANr
 37kqJWSSsUBbF6SVjN.tK1ZeuIJnpVt21_FmQFaa4CT9EOiCox9XFkbBMiWJmtIw2BF8tZXzgaRq
 3ECI4Nwfp9j1fMzMCBKLpAnQM6GY1a4ktZtdcbv_ak8F6Gd8oB2O00LlPt54TIiFTtnbkpliLl2K
 kxVge8yNxht4.du280V0VD0.3PEqmVFGm9T3lI_7ImWvikH6y9HQjfAEcFf76PjKBraz.RS5BpXX
 bSUBV52Tu6ozi6zsfkCpTkRKXGyAL5ardkNmfq1tBXdJBegnQNyobwZvWvkpoXAs6zzcLG_LO000
 G3tgLgXFiIvt_uLFrCsG7k95xzfvt6RM2x9LlI5N5puEJZnQ5O16U1GX9ajvY8L.Pc4n4Pb8IIpp
 4OSLwLNkE26Nn.7UyFb9w2FQxyMd7ROSCAeSh0VAO1ybCqhG7OyHMWeWaoWm1N3JZlyNvWFB9kE7
 C7zO8OZdbj4BhkZlZur7eg_tA1FUv52eaT35BBwkAcI5zLGQ.Dd9gKGLPyTbid9uz0Z5xc4Bn8FM
 25hVpMdgnTPiSET8nCnxSbJqp8PeRzYr52VJFjgbQKyhE.tUPB74085E0ni3nU3Od6jVNCXWYcyX
 Q45kdQXsxj2O9SHFzSea7KbrBjJBd2dHEBAk.8Yikp0L9XuWL1KMlNJnzqSdeTbeUv.oUp_4vGOY
 wPrFDBHGSRZHFpESNN2QwPbtNnffR2_ejLmQtgtqcylC0sHbzO.5svq1OYhm2ZGtsrvzEq5f6Ja1
 K_qmr.tl0Mwel0YItsBjPhMBmMZdNhHo1eqTnotreSqgjR7sN8ltOmQKFu.Ly5bclmGe9Mngg_P5
 CMT0BpzKu3LSNmgYFMDE8unGBBnQuDK825O8evj8N2.Oa6BMpa4PGkv4SILP2HuQCqwmaYR9m6Mb
 Bh_wFo4vt2oNuS3e8R8jFTD7wDJSrV01zYTJP1VKy3dzDW0VwQdxOZa7e9H3mv06O1djieru9QHx
 WdyrvZYijLip_NZGJmjHyRs4.4fXoWy.9ZQudf04U3irBJOkYZHhcJJe0I0faJzOAmnNlV5EM714
 i9DMPXHK8qviL36srpfTwZnkIH6fmElKLXgnarqZB9eC6G8xDDc9utruayjaHgAy3EaAfdf6YiFP
 coV34saSl32R4BZv_AFxx3aXPZHqZVk8d97OB8fyIO6UWTJ9E7H75d0_SLa.DVxkdmkGcbE4e5Sd
 4cDrFi60CaQzyt3NuQblDXNBsgg4LaPqkKVp_qsFIkXoNEQHHszhKMetRtvKUzdBf4BOsz004iov
 PwFlTwDUJTkQcgFUn7Z_iUsJU72tpVDij9s8FV4_.eCB.hM5fY4lcpDJXmC5yNDw7cjiMBYtMc5.
 _jCDRqqJTu7t3ut5ENDx35fKHhyeIvl7I2h4MFKf62BQJY5Me_brlccrf013a.VwaaoOLJigqOrj
 YNc.VdPz44iEYM2d4aEZKJr71helWssLH60EGEsGK38Q16j3sgnpkYIuwRfcJ.H4OceqDoK1HJ_D
 4qFLI5.xm4nB9mO57pkK36XXRTzDI1cOI8vyyuBETzWpCwGBd0vkKzMHN8H0dXKUdBPJhBinaWI1
 P1WR6JNfyfoCOs83Wpd7WPBmmwo4o2OBrY9UF6B8cSC4R70ElzJ1iTqI4KGxit8L_GhZn
X-Sonic-MF: <tlhackque@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.bf2.yahoo.com with HTTP; Fri, 24 Sep 2021 15:31:45 +0000
Received: by kubenode585.mail-prod1.omega.bf1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 75063b87ebe7bd4a4da0c56bfc424256; 
 Fri, 24 Sep 2021 15:31:41 +0000 (UTC)
From: tlhackque <tlhackque@yahoo.com>
To: wireguard <wireguard@lists.zx2c4.com>
Subject: Wireguard Neighborhood (IPv6)
Message-ID: <0fa09c57-e2de-b1fc-8ca1-2f03fe543bec@yahoo.com>
Date: Fri, 24 Sep 2021 11:31:40 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="S3ztQWRLAvVJ7sTxSqtEsrC9jLzTO6KCa"
References: <0fa09c57-e2de-b1fc-8ca1-2f03fe543bec.ref@yahoo.com>
X-Mailer: WebService/1.1.19043
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--S3ztQWRLAvVJ7sTxSqtEsrC9jLzTO6KCa
Content-Type: multipart/mixed; boundary="zi56s0GFEJ2C7ZeWVTleScHkV63f8Cg7I";
 protected-headers="v1"
From: tlhackque <tlhackque@yahoo.com>
To: wireguard <wireguard@lists.zx2c4.com>
Message-ID: <0fa09c57-e2de-b1fc-8ca1-2f03fe543bec@yahoo.com>
Subject: Wireguard Neighborhood (IPv6)

--zi56s0GFEJ2C7ZeWVTleScHkV63f8Cg7I
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

TLDR; It seems that WireGuard isn't supporting IPv6 NDP, and it should.=C2=
=A0
Use case & a work-around.

Full story:

Configuration:

WireGuard server (Linux, details below) behind a site router that
handles IPv4 NAT & an IPv6 tunnel.

Server LAN has other hosts (and multiple subnets/vlans) - mostly dual sta=
ck.

The WireGuard server is able to access the WireGuard peers (clients)
over IPv6.=C2=A0 The other hosts (and the router) are not.

The clients can't even ping the other hosts - the echo replies are
generated, but they end up with an icmp6 unreachable.

It turns out that the other hosts (and router) send an icmp6 Neighbor
Solicitation for the clients, which is never answered.

My interim solution was to implement
https://github.com/setaou/ndp-proxy, which will respond with Neighbor
Advertisements for the entire WireGuard subnet.

This is a rather crude solution - since ndp-proxy doesn't know what
clients are connected, and since it requires one proxy process/wg interfa=
ce.

It seems to me that WireGuard (in this case on the server) should at
least be responding to Neighbor Solicitations for AllowedIPs of its
active peers... Of course in the case of a WireGuard tunnel between two
such sites, this is symmetric.

I did look at net.ipv6.conf.*.proxy_ndp, but that requires adding each
address - and in any case I couldn't get it to work.=C2=A0 Neither did
advertising the server as a "router" with radvd.

Unless I'm missing something, it seems to me that supporting NDP is the
simplest "it just works" approach in any case...

wireguard-tools v1.0.20210424 - https://git.zx2c4.com/wireguard-tools/

Linux hagrid 5.13.16-200.fc34.x86_64 #1 SMP Mon Sep 13 12:39:36 UTC 2021
x86_64 x86_64 x86_64 GNU/Linux



--zi56s0GFEJ2C7ZeWVTleScHkV63f8Cg7I--

--S3ztQWRLAvVJ7sTxSqtEsrC9jLzTO6KCa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEhUZRCZitYt5SlPbZ3PhOoB301mYFAmFN71wFAwAAAAAACgkQ3PhOoB301mYk
WQ/+Mliy/6Fj17GCj3D5TRPs6BftADUtNvGOglKUfSijhIK0VW39ykXDaw3YZ/lIA0kWBSygb3NR
uIJXgsHJ6AnkaDGtE+aS308zled0AQfrGiZhxlvTRSFyy1be0vGdYZ8Sf1NHDQeV1LPGUyUOyn6u
o7aX5Rz2NvoXbpaI1ur1r7pudiqZiG+350fQhvgy/InAY4lcnIO1qhN9PFLWFVVZ4JTpNb0LzBou
nL6oxJ36fQzyPvElg7O+OyxnhHnhCIkMb3qejsF8uppzmucLvLX51mbEJBgY6Eu6HJNAXnL97Iqc
OvkU0x64nkgL69jxBoteC3GhlM+ktrnJLtGmYskAaHul8drZK90nzuLBnt6ecaAq9JogN+UttjeB
rPtE2tJjcI6/nDunZLftNd4PUia42cj6/otvNd8uy7cgfEfKqkHFFfC9XSwuEtsbPhhkldehNv2G
b4mVplbK2UkuGrMRjz56r7zxlAiYU1yG4fnxMlBgt0t7lKGUiRcoXtAvxQTA33O/QqZ773JTNjyE
/mhPXm3X81obr0qJJVG7BDyioTkdT2rP6PvPtbktRBisvBwmNSHT2QnYE4vkryaOMUviCQGHS7MQ
TLkYyPDiMYOrcyV8fTB8bnTMb+BCaY44I3K1CZxbdPIG1ncrMKHSXHa8sEYw3js+8skfGtt6t/bc
LKI=
=xUrT
-----END PGP SIGNATURE-----

--S3ztQWRLAvVJ7sTxSqtEsrC9jLzTO6KCa--
