Return-Path: <SRS0=tdjr=OT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA75C07E85
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 00:52:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE9D22081F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 00:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Qm3Vg9rh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE9D22081F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id adad0644;
	Mon, 10 Dec 2018 00:43:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 064c02b9
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 00:43:38 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f5b7fec
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 00:43:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ab075c4
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 00:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=rowO+/bXvRo0uiho5+kZVS+TRQw=; b=Qm3Vg9
 rh4v0HDj5TL8T79uU0Y08Omhg/mOjcJA0W/78yX19D69C9npQPDyfvmNmzIk2fCV
 GJAxTygUJW6bdV8c2agd7b0+742wCdB3QTzonE23aypiyRoPdbVm2WWWyNwx5pAG
 chUb+FEm4auVl2wPRhcXYL7BIWAMvdk2VdRevNtrxhE2RWP7UIVwt/pkO/jsKWXc
 jsk0zNiYiB17jWgbm2sOnDw5ihF4wrZkCZp9rXSpupxdL18vwJ6dscNJkOzTalV5
 amTimHaVCVIFNGYznV0CeQdWwT98bIUCxiGm0ufxgchKszWRjUiePQ7P6ODeNxmU
 SSYlI6njx+7BHg9g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c584d002
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 00:43:38 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id x202so7652476oif.13
 for <wireguard@lists.zx2c4.com>; Sun, 09 Dec 2018 16:52:14 -0800 (PST)
X-Gm-Message-State: AA+aEWbc2F1HOD5A6TUcEHjyKp9TX2yF7TtmQbmn7v/g9c9rEOO1JB/G
 PE78pnZFF2OPUix3TH6+608iLrSBe2BKXl+Bv0s=
X-Google-Smtp-Source: AFSGD/UUOUQO+S2Qyz6YUPB6zMM25nJsTcnMq8ksyT4+aANYAjT93KZdy6XeTz8y+fViG3T4d8rch44GFrYT69gPBV0=
X-Received: by 2002:aca:c003:: with SMTP id q3mr5856666oif.119.1544403133795; 
 Sun, 09 Dec 2018 16:52:13 -0800 (PST)
MIME-Version: 1.0
References: <CALv=V9Gv6apdWJ9P-80zf9bgByd=c3QqPhRHuw6o0_OaH0=W6g@mail.gmail.com>
In-Reply-To: <CALv=V9Gv6apdWJ9P-80zf9bgByd=c3QqPhRHuw6o0_OaH0=W6g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 10 Dec 2018 01:52:02 +0100
X-Gmail-Original-Message-ID: <CAHmME9rQPtrSuqHmtRVTGj4N38P806Sph0=q8vXRF8tu8uruiQ@mail.gmail.com>
Message-ID: <CAHmME9rQPtrSuqHmtRVTGj4N38P806Sph0=q8vXRF8tu8uruiQ@mail.gmail.com>
Subject: Re: wireguard-go on android crashes due seccomp enforcement of
 sys_inotify_init
To: bdd@mindcast.org
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

Thanks. I filed a bug upstream with the Go people.

https://go-review.googlesource.com/c/sys/+/153318

I can work around it locally in builds, but usually they patch these
pretty quickly.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
