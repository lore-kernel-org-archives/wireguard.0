Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DB9C54E49
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 23:55:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C0692078C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 23:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="p6/2aws+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C0692078C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 544bf31b;
	Wed, 6 May 2020 23:42:09 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 344ab933
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 23:42:07 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef23028f
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 23:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=D/usW8grq1MrPqcLErnIvyCjXQc=; b=p6/2aw
 s+oXJ9MKC7oXGC1PYd/Dx0zpSmjM6H62u7NjbTQvhT/RfDtsyd02doCnvQZC4ZRt
 wQzilwg4ixYyJCqf999GBJn6YNZhEA47nzKf6ryNjbryK94tkIlsny16jsw8ygJB
 /reJ4rXBKbPqlrysi12tsdlBY6k7BeJdDKk9XhxOWVTMJb4UAmexns0kAKIXUHdQ
 1YqABUbx0ip5bD2beLIjdGJ8ldg8wG6Sz7LcKUQLQv6oVHnkFaDWvC2TMXUu1Avj
 Ysb4mX6wOa22ElWAbeXGIPev9Dn+Ilo4EVfyRkrycdBf2Exah/Ab0DchucPfZo7m
 t9nHRw5Q03zTGwTg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b876d978
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 23:42:07 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id u11so4260822iow.4
 for <wireguard@lists.zx2c4.com>; Wed, 06 May 2020 16:54:51 -0700 (PDT)
X-Gm-Message-State: AGi0PuZVgo2WysJHOIOodCGAt8qcwRtlB7BbSWFD6EYtYZn8e2Pzk09t
 PpDlKWOhZhy/wWi4HAGy7wfNGQOdzEgeD2eCgWs=
X-Google-Smtp-Source: APiQypIrHau4vDYPkMtxGIARRQRZt7+gK2Al5MPAwTteLhIrg0M4FVTrQEE5q6OaAcV7AOuKjXy/GiObtOkH9MyUMA4=
X-Received: by 2002:a05:6602:21d3:: with SMTP id
 c19mr10904745ioc.29.1588809290827; 
 Wed, 06 May 2020 16:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmhVkoE_fL59VJqqXoGHX_S3E9+h=KwyNchWSBrEfPHrpNyoQ@mail.gmail.com>
 <71c12e22-c7b6-9753-cc44-aac0f51592ff@pallas.us>
 <CAKmhVkrRbb_KncDjhM6gMcJRpCrK6WcB1Ed=WfVhScDHw96Gjw@mail.gmail.com>
 <CAHmME9qv2R1CBFAQ1xqM3eOtegLaZi=f7cfA26JS=8bGTLpPFg@mail.gmail.com>
 <9c64d009-4c24-425f-9126-ba93279c208e@www.fastmail.com>
 <CAHmME9rbKP4zB5nWG-9vf+2ZepXm+Gqii=qjQ8cnG0O+Dhu2tQ@mail.gmail.com>
 <CADGd2Dq3-EMBqA6bSKbR=C-pTZToPxv1xkM4BvYGh910T_e1Tg@mail.gmail.com>
In-Reply-To: <CADGd2Dq3-EMBqA6bSKbR=C-pTZToPxv1xkM4BvYGh910T_e1Tg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 6 May 2020 17:54:39 -0600
X-Gmail-Original-Message-ID: <CAHmME9q0mr_nF7rsWfFmNtAr6+6uv1yA=j6oJAoKZVXamH--zw@mail.gmail.com>
Message-ID: <CAHmME9q0mr_nF7rsWfFmNtAr6+6uv1yA=j6oJAoKZVXamH--zw@mail.gmail.com>
Subject: Re: WireGuard over WireGuard
To: John Lauro <johnalauro@gmail.com>
Cc: Justin Kilpatrick <justin@althea.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Wed, May 6, 2020 at 5:28 PM John Lauro <johnalauro@gmail.com> wrote:
>
> Wireguard is defaulting to 1420 MTU, the ethernet adapter is 1500 MTU,
> and I have IPv6 completely disabled.
>
> Can/should the MTU of wireguard be bumped to 1440?

You could if you wanted. But if you don't do it perfectly on all sides
with total uniformity and clearheadedness about your network design,
you'll run into subtle problems.
