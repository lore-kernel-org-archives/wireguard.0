Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6238EB64DA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Jul 2023 01:35:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dbd12429;
	Mon, 3 Jul 2023 01:34:10 +0000 (UTC)
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 970911ac
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Jul 2023 01:34:08 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-765a5d31d0aso334658585a.2
 for <wireguard@lists.zx2c4.com>; Sun, 02 Jul 2023 18:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688348047; x=1690940047;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j+DQp1aToFjJn6ibYm/4PN8jG7y+qtLc+dd9jn1u2OI=;
 b=E247jHIts6Coz6hmPu1O7nST/fEOvOmX8+WSIt8dvPOLEXWrHnbxR8/wZMD7eWOQfA
 VWuEOxQiDxZX2TGM1v1cJTzENETOZ1RTwXjXhPbfHKBlDZERMQ0MzLWQBG2sf45cWvf5
 TKh5cRMAl5Q29jZMz0JhPRozzhHoZodIsIBQ91yhE+QLdGmpjzDzt89AC7M/S72qzn2a
 AVlnBgqkZNvWnvJSs9VW+FNOJHBQusF4u/9r8z7R5++3JVQb0cb5EZNZXAolt3W62II7
 yhCabHg/iIHSZWmXZ+U6AnsKqOzUSbouWdcIm+VutWFROc2Cc1OuWBmxckNnX9zLZA1S
 rJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688348047; x=1690940047;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j+DQp1aToFjJn6ibYm/4PN8jG7y+qtLc+dd9jn1u2OI=;
 b=jFyUxPFiqcHVtl+jfTBjMu9WJjXe3lYNHEm5vki5nSZ1tWGCrF5QZVLoFU2Q27MEbM
 QOfx/ZX4llRN6ZhskEMHISC868tU/K+VH1FRnY7+Iz/f/FZqNwB7aPYp0UNi9E1N8S3T
 KnoJwgVVSEGqyMo6y/gXulFXNogKQF0nmiDEUI7Nzr+HhBDYTDgojEQ9PI1ma4KPZnUs
 wOP1HVaJ/yeooFj3zPvl2JtxbGqWIcy5KrF+vNzkW6S6AqByWgmmRlFXTsRpnsA4SODP
 +n5wuq5fj3BGo9ciHVXQz2uXGwcuK4Slw5mdz8IcNQPpCQZeXrxjFyKp9ioHnbuRoPhQ
 A0iQ==
X-Gm-Message-State: ABy/qLYNkJgggqA7w1cEhsSqcCrlv/2g0etWFEVi/E5TbHNb8p2Y5sPh
 uBCr2AWUF9u5e0VsFolDmT4=
X-Google-Smtp-Source: APBJJlH92Kk5anUzz/btdHsFS1h2wIq4UMijxUHmrjYT7HeyyIRo0qQnTuby7k7tSS0XXQYnB3Oa/Q==
X-Received: by 2002:a05:620a:2547:b0:763:9f31:1588 with SMTP id
 s7-20020a05620a254700b007639f311588mr10579466qko.70.1688348047293; 
 Sun, 02 Jul 2023 18:34:07 -0700 (PDT)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 c184-20020a621cc1000000b0066875f17266sm3492941pfc.135.2023.07.02.18.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 18:34:06 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 73EA181BD580; Mon,  3 Jul 2023 08:34:02 +0700 (WIB)
Date: Mon, 3 Jul 2023 08:34:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Eric DeVolder <eric.devolder@oracle.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, David R <david@unsolicited.net>,
 Boris Ostrovsky <boris.ovstrosky@oracle.com>,
 Miguel Luis <miguel.luis@oracle.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 Jay Vosburgh <j.vosburgh@gmail.com>, Andy Gospodarek <andy@greyhouse.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux RCU <rcu@vger.kernel.org>,
 Wireguard Mailing List <wireguard@lists.zx2c4.com>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 Manuel 'satmd' Leiner <manuel.leiner@gmx.de>
Subject: Re: Fwd: RCU stalls with wireguard over bonding over igb on Linux
 6.3.0+
Message-ID: <ZKIlibX5wCgWlonq@debian.me>
References: <e5b76a4f-81ae-5b09-535f-114149be5069@gmail.com>
 <79196679-fb65-e5ad-e836-2c43447cfacd@gmail.com>
 <10f2a5ee-91e2-1241-9e3b-932c493e61b6@leemhuis.info>
 <CAHmME9onMWdJVUerf86V0kpmNKByt+VC=SUfys+GFryGq1ziHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iSZj5c+AXivxuOj4"
Content-Disposition: inline
In-Reply-To: <CAHmME9onMWdJVUerf86V0kpmNKByt+VC=SUfys+GFryGq1ziHQ@mail.gmail.com>
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


--iSZj5c+AXivxuOj4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 02, 2023 at 03:46:38PM +0200, Jason A. Donenfeld wrote:
> I've got an overdue patch that I still need to submit to netdev, which
> I suspect might actually fix this.
>=20
> Can you let me know if
> https://git.zx2c4.com/wireguard-linux/patch/?id=3D54d5e4329efe0d1dba8b4a5=
8720d29493926bed0
> solves the problem?

The reporter on Bugzilla [1] said it fixed the regression, so telling
regzbot:

#regzbot fix: 54d5e4329efe0d

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217620#c6

--=20
An old man doll... just what I always wanted! - Clara

--iSZj5c+AXivxuOj4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZKIlfgAKCRD2uYlJVVFO
o4VvAQC1HOL3pBDT4GLVcFv6vo9unyPwADyfbTt7FItp8GNDGwD/S1k8ndaOLk2I
CQNHucPSMLNR09jmYdkOaFrGjSpluAQ=
=tRvy
-----END PGP SIGNATURE-----

--iSZj5c+AXivxuOj4--
