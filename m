Return-Path: <SRS0=3VIe=VM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D1DC76191
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Jul 2019 20:00:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF9472171F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Jul 2019 20:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ZVnRIUQ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF9472171F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 401f6555;
	Mon, 15 Jul 2019 20:00:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1d8d9a6
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Jul 2019 20:00:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f8f21a6
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Jul 2019 20:00:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d8bd675
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Jul 2019 19:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=93+2rmSDY1MauT58KEGDJ8vctU4=; b=ZVnRIU
 Q2anM5kaPCrIpOVObUTiNwnT25aiL37WX1sMXFk8csxZeGbXQd86+075MlYQI8uN
 CVizxZydMxE9ko4qIWsWX6swRfyrYWgJFTczv0aTV+vQuYupuT88UA6Muqgo9CBT
 q6QQRICj4vi6K/CQXy181Dk8nmW4YJDRuV35ocWV2Gzpbjr/YSpv52b6nWZ4CKoF
 mHSY+KoVBVvfIBZ0KYerMuI4L/sjoeRG5/nhF3uF62immeo/AIP6OM0jjRE9BYEe
 fqman2GgNew5v5pqDe8xXYuOx2Xz6dztKc6uqpEfDVrgeq4aORb7GJ+rJsScv00y
 UCMlm/czloZsAb3Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4b228dd7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Jul 2019 19:23:41 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id o101so18376582ota.8
 for <wireguard@lists.zx2c4.com>; Mon, 15 Jul 2019 13:00:12 -0700 (PDT)
X-Gm-Message-State: APjAAAXxUVbqN6KPLWuIVUECH/ybY0k6UAsX6owMAnECWgREQ28iT2nv
 Rt119GR8doyao++kaupsL4YFqy0M+/amX5HK5y4=
X-Google-Smtp-Source: APXvYqw0cssN0WBhYmE4D8AO8SSOH7HrPzbvPbSTVfB9R03oUcX7G/m7V6zIqvq29dD2inhUDzOU0H0iHcGF0xTdZIU=
X-Received: by 2002:a9d:7a82:: with SMTP id l2mr21686638otn.120.1563220812214; 
 Mon, 15 Jul 2019 13:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190125015339.27684-1-derrick@pallas.us>
 <20190125015339.27684-2-derrick@pallas.us>
 <CAHmME9ojt0rmJQ8xMBYMax0ZeZ2N9juBOkFhP2-gczAZ9ck5FA@mail.gmail.com>
 <459d49e3-cc6b-9fa0-ff63-740996dd57fd@pallas.us>
In-Reply-To: <459d49e3-cc6b-9fa0-ff63-740996dd57fd@pallas.us>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 15 Jul 2019 22:00:01 +0200
X-Gmail-Original-Message-ID: <CAHmME9rXc=ujbpu34y35ZG6JP3ttptnLT+mcx9pZO8u8xoh+gA@mail.gmail.com>
Message-ID: <CAHmME9rXc=ujbpu34y35ZG6JP3ttptnLT+mcx9pZO8u8xoh+gA@mail.gmail.com>
Subject: Re: [PATCH 2/2] netdev: reset peer keys when changing private key
To: Derrick Lyndon Pallas <derrick@pallas.us>
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

On Mon, Jul 15, 2019 at 7:17 PM Derrick Lyndon Pallas <derrick@pallas.us> wrote:
>
> On 7/11/19 8:37 AM, Jason A. Donenfeld wrote:
>
> > Can you let me know if these work for you?
> >
> > https://git.zx2c4.com/WireGuard/commit/?id=fffe613427d70a7470d34b6dedcab9ffb8b6b667
> > https://git.zx2c4.com/wireguard-go/commit/?id=a961aacc9f4dff9e617197c6433f8c9628928132
>
> I don't have a Go setup and so didn't test that patch but the kernel
> patch fixed the issue. Thanks, ~Derrick


Super, thanks.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
