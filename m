Return-Path: <SRS0=yrS1=SY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD7DC10F11
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Apr 2019 23:48:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 141E52075A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Apr 2019 23:48:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyK/mcQO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 141E52075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55f6d655;
	Mon, 22 Apr 2019 23:48:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03ce8253
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Apr 2019 23:48:16 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c3aa633
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Apr 2019 23:48:16 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id z11so16418616wmi.0
 for <wireguard@lists.zx2c4.com>; Mon, 22 Apr 2019 16:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cUND9o8N3OrOosL4DrrHrr3VxN75znpRl6CdbA/JA+c=;
 b=QyK/mcQO6iwM0qD1u0Orp1m8czvkdVUjZrmtSxlK4HS8xuH2dOMSkOOi6UZpPQ3i0V
 ZJfR9xWv+gdySleRcjuWFuibZ25+P9RFruFIj/LymkVg8NpDrigeyrpcJnwyy7sTZypx
 T2nQ9pNBntWw6ne3rJY1JBitEgkzrIIdbItXEGe+4RvHp9cgX/bYCrcrqfLRRLTUo1Hh
 835Cucd+jSLWE7iItO1nVvBzp70G8z80wLcCHNYJ9kBen0mDIcpFpVX16A+m8f5Ca/6C
 YgJu+yy+rM/RKWLbvbty/Tq49d4SpWZRKleCFoI/Ui+sZ4pm6tnsz6+mvEr1SYl5EWhM
 iXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cUND9o8N3OrOosL4DrrHrr3VxN75znpRl6CdbA/JA+c=;
 b=CrIeJPCo/X5/1nZIW7S6fVQGCSOLwrvnwo9Jz/WibpnspvwkzRCVw+r2Hc1x5GjEmI
 liGKulW24/pF76/+zIX3lR2IqZl5ypHf0KLEm7cTBs21pi6oTMHiUhmA9S6m4PYA2KGG
 rzD80CJNzdD66XGUHHclojXWvR0/N5+w1+ntMDPnXewwRUH2NGgPG3r10dhCOdkKJtbV
 xUvJhk0WSwXi3YXhSUc9MNOpwD47XRRGmBJGmTYZeJhWT74+tu/R38WApht3qzLYA36p
 GhNxEWp69Q3S05GFa+T/oXsEvfiwJuEBZHA5kxAJPBTei9PF47LQkUOvfCIJbk1EQnti
 YQDw==
X-Gm-Message-State: APjAAAU3Jn7DB3NECijtnXauicGrFa/1p9aDOHAo9Cu94JL9geffrLRb
 /Cv3U5dmmAknQpb9DQxNbOE=
X-Google-Smtp-Source: APXvYqyERHi9wk8c0DwfTtz1lQ+KlFRZn7LhUjy10iCd6fp2lWXvQFZn+DN9wdRFagO99KowYcXZSQ==
X-Received: by 2002:a7b:cd07:: with SMTP id f7mr440141wmj.43.1555976895659;
 Mon, 22 Apr 2019 16:48:15 -0700 (PDT)
Received: from localhost (h082218221220.host.wavenet.at. [82.218.221.220])
 by smtp.gmail.com with ESMTPSA id o16sm9635430wrw.10.2019.04.22.16.48.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Apr 2019 16:48:14 -0700 (PDT)
Date: Tue, 23 Apr 2019 01:48:13 +0200
From: Tharre <tharre3@gmail.com>
To: Ryan Whelan <rcwhelan@gmail.com>
Subject: Re: Use of __kernel_timespec in userspace genetlink API
Message-ID: <20190422234813.GA19861@xultrabook.lan>
References: <f87c87a0-c5b4-9ee8-ba28-9ff575987f72@gmail.com>
 <20190422181350.GA26003@xultrabook>
 <CAM3m09SB7mhS2jqPaDWPZXg1qm65=xh=yOGQQKqx9Th833QeWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM3m09SB7mhS2jqPaDWPZXg1qm65=xh=yOGQQKqx9Th833QeWQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: Matt Layher <mdlayher@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============1628902833741307413=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============1628902833741307413==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04/22, Ryan Whelan wrote:
> Sorry to be dense, but given commit c870c7a; the timespec struct will be =
16
> bytes in size, regardless of the arch? 32/64bit x86 and 32/64bit ARM?

Yes, that is correct.

--=20
PGP fingerprint: 42CE 7698 D6A0 6129 AA16  EF5C 5431 BDE2 C8F0 B2F4

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEsuhqARgBY035sVClY1a5mXdUZMYFAly+UrsACgkQY1a5mXdU
ZMYObwf8DcAR7aRCowkE3QOGhMkhmdqZohIlINXcHgsC11O4azEYE2NMuUJ6G/3x
c0RM88I+PgDUTlxkkfJ+gpEZkQgTxiHsbdSXp0h9rc3S8Zz4Ijnu+5r2JwOvt/XT
jykxcc23kiz/cyFvJHppTZUAm4gjy7mF8HqKFSP/zt+OQE18rvvfLXQhWVxTnAyw
rbd5aRSXdk+GGvxmUdKqsBsJ6mmtyC4joWi7S4TPzlRwPiOQTxpXHCie8ru7i8UT
vNin4boyG2c6O2/eShraHZkNZ+W4ubyuDtAtNdvBB6co7ULVuS3aKAiiEYbJQg6e
FvDl82IBvM8vQIwjpvULZI2I/6lBkg==
=uL07
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--

--===============1628902833741307413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1628902833741307413==--
