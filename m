Return-Path: <SRS0=pWoz=ET=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C7FC2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Nov 2020 02:16:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 912D920936
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Nov 2020 02:16:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="LgWofYA3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 912D920936
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f59ef270;
	Fri, 13 Nov 2020 02:12:22 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 13f74e2b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Nov 2020 02:12:19 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13a5ef82
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Nov 2020 02:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=OjLN259BHYX9+3B1a0XvyHiMCp0=; b=LgWofY
 A3v+678KrF6GPHnFeGcHUoarkBfeIYaWYTSIdsezF1S3OXJqr7jEPNXTygMYsHed
 cvPEFPH0E3LmKG0KNJRLg+IT5Os4L0pYb+QxbeLmeWZCxch1UBRJyO5u2JwdF1Vi
 dK51+K2lzBC4TDqPoKd5vIxzxddp/pp1lq8ULMVBFwsoilsjQFS/A3kLCzkptAQx
 HNC3D1pSMSY5uBrKKPHrtLN3+iMi8tbdfn4edyKikyxg7kgKWTdlFyCJD3RXizj5
 yRhvhenpbOhzlHaJSRqkIo1yomOFI8eML6fBOFTNc9mnqjHLXtmdyI72qQaNFNIB
 Oo3NniqAXb82uu8Q==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a0866f33
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Nov 2020 02:13:04 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id k65so7322704ybk.5
 for <wireguard@lists.zx2c4.com>; Thu, 12 Nov 2020 18:16:20 -0800 (PST)
X-Gm-Message-State: AOAM531WungC1bTyARxm30r0ocvbsLjWNpFvykEEHnJ0EmM8ZgjuQpP4
 p/o+iFHCV41hwpGdjpnicdjfjOpM8pUTNl2SO2g=
X-Google-Smtp-Source: ABdhPJzfbzli7Ml/JUouLw7Hyv+Johg+il3QWRs9o0hAtMtd3003cePtbYG/wz9rbYm5xtFQpB6Z1u/NuCcelLaA6AE=
X-Received: by 2002:a25:6f83:: with SMTP id k125mr3573560ybc.123.1605233779511; 
 Thu, 12 Nov 2020 18:16:19 -0800 (PST)
MIME-Version: 1.0
References: <3415567b-5441-f3b1-7a38-f0bae3a14cfc@werehub.org>
In-Reply-To: <3415567b-5441-f3b1-7a38-f0bae3a14cfc@werehub.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 13 Nov 2020 03:16:08 +0100
X-Gmail-Original-Message-ID: <CAHmME9p6FoUsFou0LkeUZt4Ba1K4ycuA6f8X4c6Kt8-jzkAH7A@mail.gmail.com>
Message-ID: <CAHmME9p6FoUsFou0LkeUZt4Ba1K4ycuA6f8X4c6Kt8-jzkAH7A@mail.gmail.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: vh217@werehub.org
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Viktor,

I am actually interested in solving this. I took an initial stab at it
here, but I'm not super comfortable with the implementation or the
security implications:
https://git.zx2c4.com/wireguard-windows/commit/?h=jd/unprivd-knob

Aside from doing this from within our existing UI, the general
solution using the service-based building blocks is to simply allow
users to start and stop services that begin with "WireGuardTunnel$".
So the flow is something like:

1. wireguard /installtunnelservice  path\to\sometunnel.conf.
2. Change the ACLs on WireGuardTunnel$sometunnel to fit your user.
3. Have the user use `net start` and `net stop`, or similar, to
control whether the service is up or down.

That's not super pretty, but it should work, and it is automatable.
Meanwhile, I'll keep thinking about various ways to do this in a more
"first-party" way.

Jason
