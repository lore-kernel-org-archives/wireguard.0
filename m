Return-Path: <SRS0=l6+B=MO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76357C43143
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 03:07:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1688F2083F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 03:07:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="G9lo+alD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1688F2083F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66e4a78c;
	Tue, 2 Oct 2018 03:07:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 426bc7f3
 for <wireguard@lists.zx2c4.com>; Tue, 2 Oct 2018 03:07:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec401cc4
 for <wireguard@lists.zx2c4.com>; Tue, 2 Oct 2018 03:07:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab907acb
 for <wireguard@lists.zx2c4.com>; Tue, 2 Oct 2018 03:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=OV3bglJLg6ganls6PkVGW92OnGE=; b=G9lo+a
 lDzhAepCWrvmk8p5+ulahINRCFJZuSwS1zzOEFIAElBQOdR1gAt3l+QZ080qZrMb
 nVJ5NdXEvb5iZ7+bL+zJsrpY6uQgQxC77Y9cMowx5K7wkJbYmt9Zw0XtJW9GFADb
 2JhEcID1M0gWY3dQ5tqtmORjALho4fVGwI/WID1rVhISrOVMfPRIsUpS3SQl964j
 HWxUHSGLua/WhpqlmUCDT6y9BcVnayzAGOVDfhS1lO5MOl3sZ25FamPnq3Ouny5p
 Noy6blxGH5qQJloxsdxHtkHviytqxBvr9FwG2cI1kCY7Y3wgHbGekxZJaIWE7M+M
 cHLAlkf7ccOgBGPA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9584d3af
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 Oct 2018 03:07:12 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id o13-v6so489110otl.4
 for <wireguard@lists.zx2c4.com>; Mon, 01 Oct 2018 20:07:12 -0700 (PDT)
X-Gm-Message-State: ABuFfogXgW27SMRStrKcRK4jonOLOHzjdmnX4kHInasaDmwwo3wdf5X/
 bizMvlsd9cBmkL4pOMYjG3PLL+vyT2BjJdf3iSs=
X-Google-Smtp-Source: ACcGV61ykhH+zJ+a1z9rjJt6+/p4AeoZO39TPacu/jOD8x7CJrBDCBUCMskek3lkFhe5Eqetuw+yq6TfsB44Iv7Ydz4=
X-Received: by 2002:a9d:48ac:: with SMTP id
 d41-v6mr7885717otf.144.1538449632355; 
 Mon, 01 Oct 2018 20:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <D6gJBvvJiEjhD6sGH1nVqTjK0phGs51GwYC8Fv6emeVhbYQzru65w-G3uCH7osm1EK1I2t_rsYDfaKJ4EO_8Tm9c6_T8ujEp0bWdVk8Jv2I=@protonmail.com>
 <CAHmME9p1VH0Hmqqi0ZAFMsy4Jj2BWY6x0Ng3csN1fwgOqhKrrw@mail.gmail.com>
 <EHYEPfkFpkfKvezFkP0dpmtlpyl6SuHLqMvOWl8PMZhUJZxGjQTmfbL8YqhxxC4NsvFm7p4N6OFTmfURdPerP5quN0wgmhTSDSBgac-GvS0=@protonmail.com>
 <qKu5swioFkO6-GRUyzeclQ3H7fOed-Uf0Xd4QZRw0pwywVTaZZop9zTIGQ8EBAGGXhSJeTgu3_XSLYgFNaokCvVDSNdkvMr6Y6QiDHme-io=@protonmail.com>
 <CAHmME9pMGSL+w21n6FFTY+SHse=vVhYroBxaOE+q4VNCsJ7rRw@mail.gmail.com>
 <yZN05e4mYXQs69yJc0eznZPyvvnuUoIekRECdcz0CfbIgD2bzTaiSitq02pVphUqV5WYvBk4vn413gDeZq-70EjVYo5VfMhtCCWsPpZp8sI=@protonmail.com>
In-Reply-To: <yZN05e4mYXQs69yJc0eznZPyvvnuUoIekRECdcz0CfbIgD2bzTaiSitq02pVphUqV5WYvBk4vn413gDeZq-70EjVYo5VfMhtCCWsPpZp8sI=@protonmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 2 Oct 2018 05:07:01 +0200
X-Gmail-Original-Message-ID: <CAHmME9qnSv7QwYwvPt5EGKabxmnSD-H4bVX6Zjd4nT_37tw1YA@mail.gmail.com>
Message-ID: <CAHmME9qnSv7QwYwvPt5EGKabxmnSD-H4bVX6Zjd4nT_37tw1YA@mail.gmail.com>
Subject: Re: Connection issues with Google Fi
To: Lane Russell <lanerussell@protonmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Lane,

The fix should be released. Let me know if that actually does the job.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
