Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA495C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 15:31:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C41AA20828
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 15:31:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="rrV0qGB1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C41AA20828
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42699dac;
	Tue, 10 Dec 2019 15:31:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c75922e
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 15:31:28 +0000 (UTC)
Received: from mail-40140.protonmail.ch (mail-40140.protonmail.ch
 [185.70.40.140])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee9ec6ff
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 15:31:28 +0000 (UTC)
Date: Tue, 10 Dec 2019 15:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1575991886;
 bh=1stlpp/Kk5kimINaQ59dcDfP4Ltk03hzDHiEAj3AQUM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=rrV0qGB1TbgIP9IXLsj6twJeSaaJ6rV/TOo0lhDpeN0M/iBl+pr8/CYP0XnJJjL4P
 6S3MZ6r+n8/ehvQ99qsb0d3vevQQ73y1obZnXFydVh4LVGDTSSc7Bwboo8iqJMSjeZ
 I/3uchdrMrX95oXJ5bdyFrVQKvFuunceAGjdIhYk=
To: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
From: jugs <jugs@protonmail.ch>
Subject: Re: [ANNOUNCE] WireGuard merged to net-next, on its way to Linux 5.6
Message-ID: <I3IsDS9HxwJ2pvubl3X455CARFLgl2BazV2rAPdhWBBijUMJFRz6cqdQWW-RkUQclsBj-RVd0kwVAndoCbpT5pvg4zJEJxxrTsU-xeap99g=@protonmail.ch>
In-Reply-To: <CANTUoed99k59kcEG0XUcsQMmFfixQm846_HDmsxQ0RN6otDf=Q@mail.gmail.com>
References: <CAHmME9oRJqvMWF9rnSZejWe9J6ONUMbk108VkH1Qfy513Vp=dg@mail.gmail.com>
 <87lfrlzf55.fsf@fifthhorseman.net>
 <CANTUoed99k59kcEG0XUcsQMmFfixQm846_HDmsxQ0RN6otDf=Q@mail.gmail.com>
Feedback-ID: l5912sx8f7ze17aF2E50eCMwplN7_A2H_WSCNtsZWRC-U4YSUWtBPxa-S1GFTRwo0RVjE2747bkieuJ6mwwGrw==:Ext:ProtonMail
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: jugs <jugs@protonmail.ch>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1985542277144951428=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1985542277144951428==
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="---------------------55050e29e22741b4d52ac32e13f1feb6"; charset=UTF-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
-----------------------55050e29e22741b4d52ac32e13f1feb6
Content-Type: multipart/mixed;boundary=---------------------ffcce7ff781007f48dbb7f9e2302ea97

-----------------------ffcce7ff781007f48dbb7f9e2302ea97
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

On Monday, December 9, 2019 3:53 PM, Fredrik Str=C3=B6mberg <stromberg@mul=
lvad.net> wrote:

> On Mon, Dec 9, 2019 at 4:46 PM Daniel Kahn Gillmor
> dkg@fifthhorseman.net wrote:
> =


> > On Mon 2019-12-09 11:12:23 +0100, Jason A. Donenfeld wrote:
> > =


> > > I'm happy to announce that WireGuard has been merged into Dave
> > > Miller's net-next tree. That means when Linus Torvalds opens up his
> > > tree for Linux 5.6, Dave will send a pull request to Linus, and
> > > WireGuard will wind up in Linux 5.6.
> > =


> > Congratulations! This is excellent news.
> > I know the path to this process is a long and winding one, and involve=
s
> > lots of changes and compromises. but i am really glad that this projec=
t
> > has stuck through it all. The additional reach for the project (both i=
n
> > terms of users and in terms of developer eyeballs) is huge.
> > Looking forward to thinking through what possibilities open up next
> > here...
> =


> I couldn't agree more. This is great news. Congratulations!
> =


> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

It's a big moment for you and for the project Jason, its been a long =


journey and the community thanks you for your tireless efforts.

Congrats!
-----------------------ffcce7ff781007f48dbb7f9e2302ea97
Content-Type: application/pgp-keys; filename="publickey - jugs@protonmail.ch - 0xFD2E0B45.asc"; name="publickey - jugs@protonmail.ch - 0xFD2E0B45.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - jugs@protonmail.ch - 0xFD2E0B45.asc"; name="publickey - jugs@protonmail.ch - 0xFD2E0B45.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tDQpWZXJzaW9uOiBPcGVuUEdQLmpz
IHY0LjYuMg0KQ29tbWVudDogaHR0cHM6Ly9vcGVucGdwanMub3JnDQoNCnhzQk5CRmRKbUlRQkNB
REtVSXpyc05YcmpvTks0b2ZCeFI1dStTTkxzbW1hRC9ld2lEeXdaNXNTVHFFQQ0KKytDU2pVVXh1
UThxTVdJVHZkMld4MlBGMXZwNmN1WGJDTXJkVHR4NHkzNXRJbVIwbVdsejJ2TkNGOERSDQplZU9h
WURFS25pU3pXdGlHeW4wWDFTeVZYL0ZONk1XQzdjQkVoemVOZVlSZnNKYmFkUlhaT0JBbE1PSCsN
CnhqY010VUJBNFMzeG1xVlBPak1SM3kwZ29Pd0hCQnRsVUJFeGdJbjZZc2NaL29YTUxidnV3RTNv
UWQwZQ0KS2E1aCtnQmdVZE5TYzMySkpxY2lBZlBRaW1NVTVURFNNb21mMy8ybWk4KzBIUEN1aEdS
enFJUjlPMnBmDQpyQTJDT0E5QTNWRVM4UDcyTUk0YmE1WGw5WU8xU1czVFhYZzNFbzRoa2lMZ21J
QmowalRCbDRDckFCRUINCkFBSE5KMnAxWjNOQWNISnZkRzl1YldGcGJDNWphQ0E4YW5WbmMwQndj
bTkwYjI1dFlXbHNMbU5vUHNMQQ0KZndRUUFRZ0FLUVVDV09HQXRRWUxDUWNJQXdJSkVPa09PaURx
YTY3TUJCVUlDZ0lERmdJQkFoa0JBaHNEDQpBaDRCQUFvSkVPa09PaURxYTY3TWlHNEgvQTZ1QXhZ
akwyTE5icFliTEFiaWo5QWR2K09OYnJkditrNHYNCktKWWx4c01VbTJNaUtiNFdURmljN0ZUV0xD
U1VjZnZrSmJZMndFU3c2d3JTL0Jtc1ZGcjVzNE1mM2xKcA0KSjlTZzQwbGdSajJSUUd3dHZDVzk5
L2V4dWpJZG9WQmxZY1VEMVRLd3pqSU5UVlU0VmkrZjNVVnVGaW1JDQpaZDljSit5djgzTW1qbDJ6
SjRTTzNMSEFHUEJOaVJSS2JoZ3pYanpGV2lRTjBwd3BVdlExS1NuMTZ5dkUNClhpektSUzRjRjdG
amNFYkppR1JYQkJFeWIrcHdmUit1ZmprZ2tUR2M2ZHFWSGFtMVJsNkFCYzJEdnVlaw0KL3N5OTht
Y1dpVUM4b3JzcE1ObEwxOXdPVkdjaWJmU1lYRk1BUjNMemxIS2svaDd2ZzhpN0F0dC8vNXJaDQpj
c1lDamJiT3dFMEVWMG1ZaEFFSUFNNWdYUUpvZWhWVVFkTENka3BlWXVrQkM1eDVyYXY0cWZuK1B4
K20NCloxTU9DYlhkVzE2MXZuQ0UvME0xVDBFMHJoM3RBeGRuZlJWcitJemhWWTNtNXAyZVk3WFRX
NlhwdE10MQ0KZDIvenZjdEFpOGduSWxDNE4ydkNUZ2Y5WktQWG5hVHNLRENKMmtEME12QlU1OHdI
TDl5ZEhidXFpMWh6DQp6dTh0Q2JlNTl5T2NtMkdYSEo3VGhrSi9Qd0kyOWRURUtmSGhPaGdqL2t3
SGdBZFZhSmcrVFo4dW9zaG4NCmZWeUE4eDBSdmhkZlRYcWVkSXhMR2lTWWwxQVBiNG5HV0JtOGVy
SXhBRkJJUDU2U0RqcUp6ZlF3aGd4aA0KMlAyVFo0Q3ZvdXFKYTR6UU5YZTJCNDJZZEQ2d01OODZL
YTlCVXEwMTR6dVlrSTJpaVM3cm9nMkkzdEFTDQpNYjBBRVFFQUFjTEFhUVFZQVFnQUV3VUNXT0dB
dFFrUTZRNDZJT3BycnN3Q0d3d0FDZ2tRNlE0NklPcHINCnJzeGF4UWY2QXJYanJ2eS9nSTlPai9a
dXU3cFdpWCsvN2ZaQjFoQjQ4TCtFSG1uZHkrVXdoV0RGZWFKcA0KN3V6WFBOUTVLVVIyT3VWRXRC
Rmd0OXQxZEZIN3VKS01odUZlNHhQZDJMcHNMMWNMSEZLS3VUbjJGb2RPDQplM1FSZzVzUFlGb0I2
NXJzMEQ5QURGVkE1OFFCT0N0UVJ1NW9YTWw4T2VGV0s2c1R1eUNvcFNjOGlXaXINCmdURGVZZ0F1
c0x3Z1lnZDZvcUxQYzErOXN5VW1JeEk0a2RsNWVXYy8wY2NDVUlWVGV3eWx2Y2Y0L0hLVg0KMVlz
c2N0VFBUcWZKeTdrcXVySUVESHFLenVJNkpoUW1ZL1JPOTFPKzgrY093SElHRzNUckxxd0d6Lzc4
DQo1elA4c2ZFOTc1VW1iUmRHU0RYY1FGL3IzbUphTDFRb080d1dzdU02UmpJbDFZWThxZz09DQo9
YkhGaw0KLS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQ0K
-----------------------ffcce7ff781007f48dbb7f9e2302ea97--

-----------------------55050e29e22741b4d52ac32e13f1feb6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsBcBAEBCAAGBQJd77oYAAoJEOkOOiDqa67Mck8IAJH7079MiwRwRugCbXpX
1rUXusBFCKx7JpJ6oiPWX8eACxMhIr7cXi3OmNfM2BuGFftXjHfLQiRgamSw
NvBT+na7RqpnOkrInBZWdLzXEGa79G0biEYmXxmtDqRkmTCundwcfydtytib
3lC0wI2AfMZwtXaxYaPxa3v2UC4ZZsD/ODmhpmOscjZt78qXe5fapRSHAigg
rHQmCOZtYGAygMo5eXbYVwfZvz++5mfsHmhCVA/0oBzFIq9OPrMDk0JPG8Gl
jVOnnd9CVC+96ydOs2o8dptcueh/yZ90vc3ew6gfMT0H4qiWjF0jtjGd3rLm
H4XjLPs8IWwZ2T5xn6HCrkg=
=tr+d
-----END PGP SIGNATURE-----


-----------------------55050e29e22741b4d52ac32e13f1feb6--


--===============1985542277144951428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1985542277144951428==--

