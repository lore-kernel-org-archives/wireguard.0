Return-Path: <SRS0=EM+o=NB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846F8ECDE44
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Oct 2018 13:01:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A634C20869
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Oct 2018 13:01:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=york.ac.uk header.i=@york.ac.uk header.b="Jse3HFM8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A634C20869
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=york.ac.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c8ccbc3;
	Sun, 21 Oct 2018 12:59:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c60a3a6
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Oct 2018 12:59:08 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2722c603
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Oct 2018 12:59:08 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id i4-v6so3239910wrr.13
 for <wireguard@lists.zx2c4.com>; Sun, 21 Oct 2018 06:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=york.ac.uk; s=20160523.google;
 h=subject:to:references:from:openpgp:autocrypt:organization
 :message-id:disposition-notification-to:date:user-agent:mime-version
 :in-reply-to; bh=3Tfn9XP1bSEegC9CpPjHlrKj7M/kryyPmG0X3ZlhQQ4=;
 b=Jse3HFM8r8qvH3PCmeDOrt7Dtf+vopLN0pzDrOcJ8lCtvzUHJBXtOkQIiKeo7Z78Vd
 bL7gy3R4B+K3UnBns5JPA407GM09Fn3ItXfzbUzBWpb6vd5P+v2elva21Uy/GaS2rfDq
 cRjUp79tRpbbuIV6XxV0CplnYnmFHz4ncdGmIcKGVn+UvlekXkS0Z/STz9F0nsWGrTsS
 BaN3V/bCgQ2PXzmZtvMwzuzqYGTF3GTTRAfmS5u/rR1jymyufK0Ft/aTvAk5PZx4zvXC
 VIeoF/vKxp1/4696T+tZJqrCmuY753fMzu4pQe+vJFTJjYIZp+kNxKRlVZDwjEJc9KmK
 46DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :organization:message-id:disposition-notification-to:date:user-agent
 :mime-version:in-reply-to;
 bh=3Tfn9XP1bSEegC9CpPjHlrKj7M/kryyPmG0X3ZlhQQ4=;
 b=AZO1MzVT32TuS767q0WsGIOhhHTg1xzeRGNIoufbpFFI8m9T6Ul1Y6mxXw0IQRJlRj
 BDpQEIfunt/9gJ2p5UXSH280sEDIZywaCo3qdq4Downyb4nVMEkIR2QsSo1r9+7ht0km
 UrRKPcM6/+rnGOf2RZi058whcG3ypswxH34Mc1j2pGWWwQI9UJOXiRotCe9lYP5eLKpw
 nf8VILk6uVgxYpZy0ab4gI3E5rXDrR0NV8po6jDZK/sHSXJGOR2W43KpwCdlRX5Lehzw
 PZs9WV76z9LuVfupq2Gcv7+h3FTKCDDtpnZ79iFNrVNVb6MCY9IpO8NU+kHXxRcCiEnd
 R5Vw==
X-Gm-Message-State: AGRZ1gIb/h3GEnj142sD2q040U7rTyQhjnSRCfpw1EklsiZVIOYXvGmP
 D33Ln3V5CNraHcJl4EAq+TarVhxKs1k=
X-Google-Smtp-Source: AJdET5czOMZGuTC8YWTsE24E/4J1/+Wo+VtwTf6S1NAupPMS3AW85RMYHSLtErtl0OnscAaf1dxToQ==
X-Received: by 2002:a5d:524f:: with SMTP id
 p15-v6mr10792055wrv.192.1540126887683; 
 Sun, 21 Oct 2018 06:01:27 -0700 (PDT)
Received: from [192.168.0.52] (uk.webcrumb.net. [176.126.241.16])
 by smtp.googlemail.com with ESMTPSA id
 l67-v6sm25172329wma.20.2018.10.21.06.01.25
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Oct 2018 06:01:26 -0700 (PDT)
Subject: Re: wireguard dkms systemd
To: wireguard@lists.zx2c4.com
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=jonathon.fernyhough@york.ac.uk; prefer-encrypt=mutual; keydata=
 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
 D/KkZGsDFJv2i8NhYOQUwA==
Organization: University of York
Message-ID: <aed470f2-c20c-ce66-a154-b5b4bf977249@york.ac.uk>
Date: Sun, 21 Oct 2018 14:01:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
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
Content-Type: multipart/mixed; boundary="===============4716321482503510871=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4716321482503510871==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uXCcDNG9bzQQBNgrytsRAewMDfqar6MXB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uXCcDNG9bzQQBNgrytsRAewMDfqar6MXB
Content-Type: multipart/mixed; boundary="VhpT99YbgsJjGKVsweEyDgnTE5kjdMgkX";
 protected-headers="v1"
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
To: wireguard@lists.zx2c4.com
Message-ID: <aed470f2-c20c-ce66-a154-b5b4bf977249@york.ac.uk>
Subject: Re: wireguard dkms systemd
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
In-Reply-To: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>

--VhpT99YbgsJjGKVsweEyDgnTE5kjdMgkX
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 20/10/2018 21:59, Lucian Cristian wrote:
> updating the wireguard module on systemd based linux=20

How are you updating Wireguard, and on which Linux distro?

> gives
>=20
> Warning: The unit file, source configuration file or drop-ins of
> wg-quick@wg0.service changed on disk. Run 'systemctl daemon-reload' to
> reload units.
> Sleeping 3 seconds...
>=20
> can this be fixed int the restart script ?
>=20

This sounds more like a packaging/system administration issue rather
than a Wireguard or systemd issue.



--VhpT99YbgsJjGKVsweEyDgnTE5kjdMgkX--

--uXCcDNG9bzQQBNgrytsRAewMDfqar6MXB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUzSNjhumunvu6bYD4DBDgow/9LsFAlvMeKQACgkQ4DBDgow/
9LtvTw/9GYlVkRXCvGBJ9+R5QZ3EZ/TZv69zyArtMKJf1wT6a08zIcTaZUXLaEhf
e806HrDujbsRZ3yz7TfBnT0CEGv8pKLIlxRlsVQ7RmPTB9eJiWCPLM3aeJjowWal
uz425Aqp1l8UI0UHlR/aUp/5u+8ncv4oUc4RCiEDgHBKemgxGQOw2F2PGwyJyBNW
+7uJq1C+XH/W/64W/vdmah5nQmEfnFUbWVkGOvNZj+jaV3OM2OQKJvbWnkvb/hg9
fd3kVHTH7sCqvKYLz6CYwj5iu85Sw0v38ITKkrz539Kx8CpPRvGxT4eGeI3d1gys
hMKdB7yWbeOKLmtAfj61Amt5tpUG8Ky1PAPLeCFlfXoYbLHJ1yBTSwDQl/LhZCiV
O3Q3K0Zh5/J22iggPuvUS+FqC4oiE2P0OaXTiK1jviedQdaQSH2YVQFdK9cpnqFD
UE248DpHoYFEpDHhvUXZNiQsZv1GOPInXurrVXnXRTY3Q1A+xzjEfp6ZzXJbMsSn
8DFq4n+8JjpfyrLZwlr2PsElDOWuIb8DFUZQuJBgYAqqE+mcvgIzWkABLizgBMRo
0f1AuY/kU/Ecjy13HLRbgbpEN5jcJXE+G+oU/BCbcNPzEPVRCoLUrpmjyzDnkFNu
ldJR3vofsNNLEWQN1vaT8ldvXmXissZwgZV8JB4H3bnP+o31nsw=
=lVfW
-----END PGP SIGNATURE-----

--uXCcDNG9bzQQBNgrytsRAewMDfqar6MXB--

--===============4716321482503510871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4716321482503510871==--
