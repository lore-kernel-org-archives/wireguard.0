Return-Path: <SRS0=DDek=NQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3046FC0044C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 22:53:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 819CB2081C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 22:53:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="JZ/IyFyU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 819CB2081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ce646f5;
	Mon, 5 Nov 2018 22:49:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5cf675f
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 22:49:09 +0000 (UTC)
Received: from pv33p04im-asmtp001.me.com (pv33p04im-asmtp001.me.com
 [17.143.181.10])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5bfaf111
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 22:49:09 +0000 (UTC)
Received: from process-dkim-sign-daemon.pv33p04im-asmtp001.me.com by
 pv33p04im-asmtp001.me.com
 (Oracle Communications Messaging Server 8.0.2.2.20180531 64bit (built May 31
 2018)) id <0PHQ00200SRBRJ00@pv33p04im-asmtp001.me.com> for
 wireguard@lists.zx2c4.com; Mon, 05 Nov 2018 22:53:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=04042017;
 t=1541458405;	bh=QUmtbxpCmdU/8pLZNjKoZXP2mSzh0pzqyezANfeI58E=;
 h=From:Message-id:Content-type:MIME-version:Subject:Date:To;
 b=JZ/IyFyU2/mOk963MAtALjWtl2tat/a05At/Y3xWer+hqSOEMwGXYE7u5suD1uRoP
 0iSRj5w67hRqoZoavx4bfIhaNyYOCF5CPU6DF8kITgkW1ivCGkDIuxWYhkpeDUXz2N
 U+3P0DbmDzUYUfqLyTWuADhqKIjn1GQB8aWuXIGDkvtk8R5GJqmoLKRv1ca1u+TlZq
 qGJ7RoQZMgdal2FgxXW9cOgW4IV9Q0xiya6cp8g3SoNIs+9DLZrXUhPd8CZYViDxQi
 TGdBtMufIz0USwJN3AS6mnkYULDlo+1HJLZ+0dt+KGwPoQQZDsa92bvlR/51S5wXeh
 Pzc2m+M8SzTeA==
Received: from icloud.com ([127.0.0.1]) by pv33p04im-asmtp001.me.com
 (Oracle Communications Messaging Server 8.0.2.2.20180531 64bit (built May 31
 2018)) with ESMTPSA id <0PHQ006GBSWW6450@pv33p04im-asmtp001.me.com>; Mon,
 05 Nov 2018 22:53:22 +0000 (GMT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1811050202
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2018-11-05_13:,, signatures=0
From: Lee Yates <rainmakerraw@icloud.com>
Message-id: <2FFC5AC1-8BA3-4ACB-97E6-04990AA2DA8B@icloud.com>
MIME-version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Subject: Re: WireGuard for iOS - TestFlight
Date: Mon, 05 Nov 2018 22:53:19 +0000
In-reply-to: <CAHmME9p5bjmP8qSapvf1vmiMAk3BAkONjwXev3O_QtGYM=k3QQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAHmME9p5bjmP8qSapvf1vmiMAk3BAkONjwXev3O_QtGYM=k3QQ@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.101.1)
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============3288041534206180788=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============3288041534206180788==
Content-type: multipart/signed;
 boundary="Apple-Mail=_EC20648F-E46F-47B9-8668-FE9BDEAD365B";
 protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_EC20648F-E46F-47B9-8668-FE9BDEAD365B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

This is great news! Well done Jason and Roopesh.

I=E2=80=99m no app coder, but I can at least give my feedback for what =
that=E2=80=99s worth. It imported my conf via QR and connected without =
issues, so far. It=E2=80=99ll be great to see VPN-on-Demand added (eg =
phone restarts, dead batteries, network switches(?) etc). I=E2=80=99ve =
also been testing the TunSafe iOS app, which does have VPNoD but is =
bugging out with UDP writes atm. No doubt soon enough we=E2=80=99ll have =
at least two good open source apps to choose from. It=E2=80=99s great to =
have such choice and flexibility when working with my favourite VPN =
protocol. Keep up the great work everyone, and thanks for what you do.


> On 5 Nov 2018, at 21:27, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Hey folks,
>=20
> For the last few weeks, Roopesh and I have been hard at work on the
> WireGuard for iOS app. Today we're happy to share a
> likely-buggy-and-broken TestFlight that you can run on your phone:
> <https://testflight.apple.com/join/63I19SDT>. As usual, use at your
> own risk, especially since it's alpha quality.
>=20
> Please let us know about any bugs as you find them -- you can send
> them to me or to team@wireguard.com. Our current TODO list lives here
> [1], linked via the main project TODO list [2], and if you're an iOS
> person and want to contribute code, we'd be happy to have you on
> board.
>=20
> The app costs $3.99 and requires an email address to sign up; we
> manage all your tunnels for you in the cloud. JUST KIDDING! Like the
> rest of WireGuard, the iOS app is free and open source [3]. I make
> this rather tasteless joke, because of the rather surprising
> quantities of people encouraging me to do the iOS stuff as proprietary
> paid software, because "apple users will pay" or because "open source
> is cool, but iphone folks don't care about it so you can get away with
> charging" or because "none of the other vpn players are doing open
> source mobile implementations" or even because "apple is more likely
> to accept paid software into its app store" and so on and so forth.
> But, as usual, I much prefer for this to be a community project than a
> closed one, and so like everything else, it's FLOSS.
>=20
> Enjoy! And do let us know about the bugs as you run into them. I'm
> sure there are plenty.
>=20
> Regards,
> Jason
>=20
> [1] =
https://docs.google.com/document/d/1BnzImOF8CkungFnuRlWhnEpY2OmEHSckat62aZ=
6LYGY
> [2] https://www.wireguard.com/todo/
> [3] https://git.zx2c4.com/wireguard-ios/
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--Apple-Mail=_EC20648F-E46F-47B9-8668-FE9BDEAD365B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEExF+G9PyiAB1cKHnz7yXLzDsoqZIFAlvgyd8ACgkQ7yXLzDso
qZJ8Qwf/cjZixbEIk7Mfa8VBItSfnpnagswzVJmLUbk3B0JvsUwIwPrqunjDhps8
65ccIvvyAZSl0Wnq5uHFTVPUTF2J1ddNyUqBTD2GroPQMXGbaQI+sui1EUYEEE6D
7CuwVVAPN0Mzbx2WFNCIg0pnXRf8ZXMJ/Of0/ps62UQiLhjrvr2k61agU7v1RnqN
dx6R0KQY3pFlT9uUivt2A+MO5mosU84BSvYspail77FvOUvxo1bwo7xBby43VO+o
/H+GuxcPxpltxe1u8n+W7ysA5iZqbzvKresPup06zbZIMZ228UrkM57o2/B68Siw
ARoX7u2bAraBOXAOlkdqOZrkHhNCNw==
=z+Aj
-----END PGP SIGNATURE-----

--Apple-Mail=_EC20648F-E46F-47B9-8668-FE9BDEAD365B--

--===============3288041534206180788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3288041534206180788==--
