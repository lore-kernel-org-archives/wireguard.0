Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF0AC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 02:46:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D0861040
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 02:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8D0861040
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 229c6496;
	Thu, 23 Sep 2021 02:46:55 +0000 (UTC)
Received: from sonic308-2.consmr.mail.bf2.yahoo.com
 (sonic308-2.consmr.mail.bf2.yahoo.com [74.6.130.41])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ec1d5557
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 22:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1632350038; bh=GuvR56jyLhfUlCS7ByzcxLDmopCC8pXfGsYC4CbHRqI=;
 h=From:Subject:To:Date:References:From:Subject:Reply-To;
 b=FITmUqghyNsex+GCM4UTMBtjT6Z7r4QHfMNgBUoomO1W5os72ZdVDDv38ksjxICEMYJlWsPKRXYVkCZduN+kDc2azBGo9qK2HMrLseYHIaDJRDbq9OJLI/MNp8lxOOypuNBBF5aof+1qJ7tc6UV9yAaY1MpwRgdXJX4GO4PoGRrCIcXdasJquE002yirK0nPizYcKIsfhtXSBpgzjvLzOWsEAHbJ7cffmY28ACO55rTEP5LLsnNRjH5V1sbJs/o0fKoiCUaUbjAQjUCMo5tCLxDDlKwOyg1h4jLR0cqvll8vZFm7LoAbFxRVS9VY0MB+0gbYDG/wgMn5hDN2iKN5yw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1632350038; bh=UuWy9vk6u9xQim96QlBRepaqTM81CrRhT2PM5cSz+rv=;
 h=X-Sonic-MF:From:Subject:To:Date:From:Subject;
 b=CA0YR2GbpxhfnwXAUTANZcXrZE2fNJDEYxDGr94AR/RzgLvaNq/7oox7FdLhbXphrspXfZRFfrXF9U+whh2lzcSCmjFbL4gyXBkngyNTfCSTSdGn8QTjHsmSxJblGkucfvTGaRbVSwBzz3d6U0beGXL9i3TOO2FeVNJvVfsleJNukp5eMy0R+Q5XSImcn7i+/C+yjYrsGi7dh78ISq9AP90kZYOQ8scjtazwBVCX1Hu9YbkwuNvRo2bDTa0blKMCYbMYbBu0F9UNJbf67rK38miKYz66z2d7KwY0/3zOI20VmsLc9M4GCjgOEosq9oUNm8S6mO/XmC3xoAmrOQJ5yg==
X-YMail-OSG: O8tGG2sVM1n8TiisuVBqVR4MMVXkHg2Kzlw1e0am3_aHDpyUE3nDvSWPFGSp85F
 QSyPXPAkE.jboNc4iSCULwqa0KdahOT7bIagMuhFCqdCU1qLHIJPX_cBNguouEdg0kUjDtGSWJ_C
 YeVIUPN7pKvHuwYBbuxlaVb7TuYbngK99vA0491eBMv_jQhD7gV42jgLSxnD_1lbOtMCf8SSru7n
 kKiXIMM7r1AyNP6Dg4_Ri8WvxPQu7tQaT8wu7fF72W01w.XzysqhCevpfwHOPPAsidEMs6_QuOI3
 ZHN6UpOJu7DtYbDS4SYGEnKJ1EvFdry9jFGG5RCC8FAsRxSvEb_BJp9z07.vVeTFhJJ64mP.IwLi
 OwOjv3wGvBtqDzaE_ev.2kjnK.h12UPAjBkEbLqLTbcrn8LQ2oEDoZIuJMgf4bW07K_akUbn6xxU
 os_daCMO3BhvdXqxO4TpM27Ys_7BL_JTixF.87.t9X7DvZRqwaKwRD2vZvHoP9XOe_ULyA5FcsGg
 DpxUjZsibyE5IErDJNPR7M5VlBvd9PKbR4VcU4Zzvy7fwcYoMWYka9oiCQmFbPOWPqi2IMd33wvl
 _Vqatq7CNiw4ujJZv62zWJCv_cV2aW08hq2mW8m3K05qgOlwIvRnmOEnl0Y2kr6FtWtZQS0HPK1I
 XS4pGOABjX9A7eVByr9mPtUu.t3vq4DPOHOh6d3AtuGWJbEYqTZtgKCWSveG.nXXaNT6r3VbyizP
 ynFHDYyXvz2FDyOEWxTPPkWHbhQvy2XNo4UsRLzUIX5BqSXelthjZT0VHhSIizF5g8N14fSfBezA
 T3kX_7TxXfyYNVV0_MBfLuJnLYhhJFdZSg84sN.cavzu6bAS_ncJ7nTIUdubpejl9Gsqc7epJvJz
 Ev0vq74QeHtj56cYQE6eqtQ4mi7RjBHuNy_zh7PTeJ1mjBf.OMU_kzmiYkSWLRmRZ4IuJPEK9ADK
 ZJwkyX.8O_C71H4qXpeEXExdVAy9kI_NntfOo7Yy.GDyr3XgI8dwduJyJ0xG.SMmY4xNWbUSqH7p
 ge6JgrqctoQ_k3VN3LuOy1BpNTKUVyFr4EXoJMpGmNG8t7RcNEHEwAa1kyepLFiOGvzr4zF1Ih6s
 J6xMPNA6_jNrEIWrAVhSjfEdjQFvOpc01Ho8i5UA8ARyb3XWE19uF9dDjU7m2DUHEF5veTZpDrv5
 5Xfz.5fDYfyJ5wvvlh5RmiEQqYRNid7_ndBkdiWX9gSPfYWWxDbjgAkIgrog9wVsOsQYSNZJ69NY
 Z04QCUX.IYqlWjynwgqI6Ljv9uI8vfk5qznffnr4vz.gAR.96QT.9tsrwftQyUBuv_Rnqk1vn7gh
 vhH_l6fTsYzxwr6jqkxqIcSFxS67YP2n1gAR5tdcJ3FcvvNgEzoHlNBVeXpMt74GZhEZsbfOYEgp
 famUVMrLKkmrxR3VGqQvkyjiHQtDte7xgggcSQjK9HjmKNa0A1c8P1Fb4tI6wNyVJOnhrbksKZaK
 IB5c9oUb6SKUCj_rFCz9UaVmPO7qCF0GZmHwtNLPi8Obo1kwnkDAIqioMiiYQmFcirR.iBvcKTF8
 pb4yAsjqZXYVAKnnwO3ktb1EiiYzjdFRsCl0SzBRp4OKXYjeHzcIdfEH0eZ6C9mYeJLx9mToDYxw
 3.qRD2Hk17qmZa8WoqF495NCgkMUsN5dAs5QB0Na4whKcQMfxxRhx2vCgb1BRfXKvOBnqNDYpMDF
 KADSNFztSwZ16ZNJuwNBXeDMHgw2grlxBc0qOTeACHWqTHVryW9Sj951Acrvbun2z2AFt4FggYiw
 TmrPILa73CvIp7pjhOD0M1RZVTaTc0r.HPmFt1oKg4kmaneeyMIn_igRUMCa81sIET_hdvre136k
 ..JZtw2_srxl_PjoL5VvojjbNl6srpQ9atfQ9dsjOMpj40a7l9ONFCukDn4TwHMou7xjAgzOuwms
 OvK2UM7NMxffFKQwCP.keNdEAdmVZTdmdnLYiLoh3dMY_Z_19L_SFCKJWbN7FhrK6ZrhNQMIT3Y_
 9ydhcPXLfsPdS8g3H7T_mQi3vamoJPNd0uWi4nJ4Xj7EjAURSVyeptUfBCY4Hr1oAp5.JTQfWxDl
 .1QeR540HquQ.KdU3Z_RoiBKL2Unqdd1p3fphF6jJQMDXrS3q8.kOSMtNe.4IKDSIrEpTZQvyD0K
 mV7T_V0bLxl8xfyScsPRofuBaCGOMCCgkcFf6FcxpY9htE3x0DWoG2rOm4kid3GiJeo6sknWziCI
 SpZA5frykIxFjqlz1tAthfOzr_dI1.IzY4xAUu3m8uSjnlmY4pGXsfOimJkvPX3vXofUaKmdVf_K
 B
X-Sonic-MF: <tlhackque@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.bf2.yahoo.com with HTTP; Wed, 22 Sep 2021 22:33:58 +0000
Received: by kubenode588.mail-prod1.omega.bf1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 17c96fc171828d2c1a5ab96f6a455956; 
 Wed, 22 Sep 2021 22:33:55 +0000 (UTC)
From: tlhackque <tlhackque@yahoo.com>
Subject: DNS setup issues
To: wireguard@lists.zx2c4.com
Message-ID: <c866ae33-489b-1075-99ef-953e38566b73@yahoo.com>
Date: Wed, 22 Sep 2021 18:33:54 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vH6wCrTGFujU4GzqxabpmcuSb7yjLFLP1"
References: <c866ae33-489b-1075-99ef-953e38566b73.ref@yahoo.com>
X-Mailer: WebService/1.1.19043
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Approved-At: Thu, 23 Sep 2021 02:46:54 +0000
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
--vH6wCrTGFujU4GzqxabpmcuSb7yjLFLP1
Content-Type: multipart/mixed; boundary="aIqKvgnxOBA1vlIHIeSOgq2elmIewBCSQ";
 protected-headers="v1"
From: tlhackque <tlhackque@yahoo.com>
To: wireguard@lists.zx2c4.com
Message-ID: <c866ae33-489b-1075-99ef-953e38566b73@yahoo.com>
Subject: DNS setup issues

--aIqKvgnxOBA1vlIHIeSOgq2elmIewBCSQ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Working my way through setting up a WireGuard (linux) server, starting
with a simple configuration.

I find that I'm unable to configure the clients (Android, Windows) to
resolve the server endpoint.

This seems to be a bug/oversight in wireguard.=C2=A0 Here's why:

When on the VPN, the client needs to use a DNS server that has an
internal IP address.=C2=A0

This is because the DNS for the server site has split views.

  * From an internal IP address, both internal and external names are
    resolved - recursively if necessary
  * From a public IP address, only not only are internal hosts
    un-resolvable, some (including the vpn server) have different
    internal and public addresses.

Also, the endpoint has multiple addresses (e.g. v4 and v6), so a name is
especially desirable.

Thus:

  * when the tunnel is up, the client must use an internal DNS server,
    which only has an internal IP address
  * when the tunnel is down (or restarting), the client must use some
    DNS server with a public IP address to resolve the tunnel endpoint.
  * when the tunnel changes state, any DNS cache has to be flushed (or
    tagged with VPN state) so that the correct addresses are used.
  * when a WiFi client initially connects to WiFi, it may have to use
    the DHCP-provided DNS server in order to get through the WiFi portal
    process.

The clients seem to use the DNS server specified in the configuration to
resolve the endpoint address at all times.=C2=A0 Obviously, this fails.

I don't see a way to configure the client to accommodate this use case,
which is pretty common.=C2=A0

Am I missing something?=C2=A0 If not, a fix would be very helpful.



--aIqKvgnxOBA1vlIHIeSOgq2elmIewBCSQ--

--vH6wCrTGFujU4GzqxabpmcuSb7yjLFLP1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEhUZRCZitYt5SlPbZ3PhOoB301mYFAmFLr1IFAwAAAAAACgkQ3PhOoB301mZ7
lxAAwd+Pgdvhli+GbF6I7dG7YFfD6yZlOj6pgX55O4zyXP4lvW+Lu/C7MgJ/GaEucTKQ/l2JCXzJ
G8RoNVpv//6/eq5otIyRgVw8mSg74aBIfEu8hOBN5PhP29Mzhie2bYmJHCg8DHqHglGxlbdvwDii
hXFwMjYh1cQimLm+XZONNkpAfcZ6ODFH0nGCIayb1DHRPZg9gmHrqiwL6Yr6TymlbTc8sMGyheU5
ObfoNNABHx49Ois3OekS9io+XitgiFQDizuntSMzXudZsMsciRbDzInNhWX2FDcMBvJwq/JZvMsO
UDXEeUw2bJwZfvHDNb019VBf9LrVub3EwFQw2ryH/TrFMGtzfkeWL48IthCPdO/83ptsaZSt09CG
GMfEu6bG/BNyeidq+2qOGaI7tN01H3FN/uAHAfO300YBHSgmyXkWLA35nr/xlIBj7s/HNqjjdn3r
CMREr1SyisAU/HN4Zgf7iigpLRZaR0bYPfWtCLd0VVYL+XxvD/jLAwATGci/MLhx3MQVdUX+JkZl
wo6DRnsLylqFfyjTP3UY5iSAnHS/0WZQELWWa9jxLmqAU2I9+L9gARN9Jfh7sUYXzdjt+46lWgLv
UM5/vX7umvTz7BWORaMQxUnLSci/j7JIBXUgqPcLoxC/nRk1+v3gZXgca+NWp3yt71GE5wKlgW/+
xRE=
=bsAg
-----END PGP SIGNATURE-----

--vH6wCrTGFujU4GzqxabpmcuSb7yjLFLP1--
