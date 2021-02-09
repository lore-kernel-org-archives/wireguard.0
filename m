Return-Path: <SRS0=cVUX=HL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA4AC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Feb 2021 16:20:19 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BECB364EAA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Feb 2021 16:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BECB364EAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 700b9255;
	Tue, 9 Feb 2021 16:20:15 +0000 (UTC)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [2607:f8b0:4864:20::82b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bc7f8335
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Feb 2021 16:20:14 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id d3so1237642qtr.10
 for <wireguard@lists.zx2c4.com>; Tue, 09 Feb 2021 08:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9V2FtT2eTXYV365zG9VOfKxznyfb8XkrdcMOI36IhvM=;
 b=gmq5lbsZZmOyIcI6B9+hKGuiDI5VGs/Hd/OhD903o2xeeG8x2uEbXGiHpeX4zMJvi9
 T7Og/kTsPK9FAQEc4X2d5GhAOYeKYP9vItIKP1SmBwqBvIEgn3g7s2EGylHRTe9ybZYa
 or6KM0ArROVCufpX0MVhGZekAd0rKOqmJU4lZEkwgeryvqz9hjmSlVaGrbEVmQoPxt+d
 /UcgJF1kXw0CuSBkgnRO7EWIb3QcP7c7Gv6eaNMxaNSmcusV+rVA6QQoRZgd4QqapUoG
 Xhil6y+2FBYKp1gF5sTsbRIVs/xdqrINjwNgZsEQJpb7p6PoZ8pMAQq+G1XVfCj8cDFT
 lPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9V2FtT2eTXYV365zG9VOfKxznyfb8XkrdcMOI36IhvM=;
 b=Q+47M3e/Y/AFyF5Yxtys8SWMpAsmeIWtyBcsTG6IQX4NvenKg8REIPT0qGQc3/54oh
 gZ8/Ya/llRQUZwsKXz7tIn5gjzDwJDIsL3Sgxbji/U+7UKMFyI+mPmjOo5G9NiMg1LZb
 A3SJ/0WthGCO3xtl+/JTlGzq1BM9hQdeBc46BFZiReZiakTS+HkKtUJNJGN1bS50M7kZ
 8AePNyHxa/nD7p7STjJOFECq0fhnFqfbEM2/mvqDLFkD7NFTdqxlWMX4QiQ5fVKRkY05
 RPKjLtv3oH/AHzwLdDCLPfgeI5kEpNywiOyMN6xbUbZrkO3p6M2vTaNciZeb4iwmdW1F
 /0hA==
X-Gm-Message-State: AOAM533POFOuWm9zjYB77qsBVf8CjTVdhWpmcehxr68R+qZsfhvt8M9U
 Mh3b9X/3A6VuJzcZSf+E3b12t7sA6rMXX48TR5pQZ2VBjqkMew==
X-Google-Smtp-Source: ABdhPJw2lWxqzFhZkOOIjqwg43lPzbB+/dPX9qjRcYJHhaI6kaRa9w4bWE7iCNadiibAVCc94xBLUd2H5HrvBspLLks=
X-Received: by 2002:ac8:66c9:: with SMTP id m9mr19933713qtp.43.1612887613163; 
 Tue, 09 Feb 2021 08:20:13 -0800 (PST)
MIME-Version: 1.0
References: <20210208133816.45333-1-Jason@zx2c4.com>
 <CACT4Y+ZhwdjNAOhT7zgfe2OtNhtfxAzwcWRxGy8SRe+B4c=q7A@mail.gmail.com>
 <CAHmME9pc==7a3vw-bv7TTDPv6XXAba_uwOHhBJvvJHZpH7hqAg@mail.gmail.com>
In-Reply-To: <CAHmME9pc==7a3vw-bv7TTDPv6XXAba_uwOHhBJvvJHZpH7hqAg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 9 Feb 2021 17:20:01 +0100
Message-ID: <CACT4Y+YM9d6nN7Sjy=Z=Rw++r333RtFOXJgNU7WfrJk4V+nofw@mail.gmail.com>
Subject: Re: [PATCH RFC v1] wireguard: queueing: get rid of per-peer ring
 buffers
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

On Tue, Feb 9, 2021 at 4:44 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Dmitry,
>
> Thanks for the review.
>
> On Tue, Feb 9, 2021 at 9:24 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> > Strictly saying, 0.15% is for delaying the newly added item only. This
> > is not a problem, we can just consider that push has not finished yet
> > in this case. You can get this with any queue. It's just that consumer
> > has peeked on producer that it started enqueue but has not finished
> > yet. In a mutex-protected queue consumers just don't have the
> > opportunity to peek, they just block until enqueue has completed.
> > The problem is only when a partially queued item blocks subsequent
> > completely queued items. That should be some small fraction of 0.15%.
>
> Ah right. I'll make that clear in the commit message.
>
> > We could try to cheat a bit here.
> > We could split the counter into:
> >
> > atomic_t enqueued;
> > unsigned dequeued;
> >
> > then, consumer will do just dequeued++.
> > Producers can do (depending on how precise you want them to be):
> >
> > if ((int)(atomic_read(&enqueued) - dequeued) >= MAX)
> >     return false;
> > atomic_add(&enqueued, 1);
> >
> > or, for more precise counting we could do a CAS loop on enqueued.
>
> I guess the CAS case would look like `if
> (!atomic_add_unless(&enqueued, 1, MAX + dequeued))` or similar, though
> >= might be safer than ==, so writing out the loop manually wouldn't
> be a bad idea.

What I had in mind is:

int e = READ_ONCE(q->enqueued);
for (;;) {
  int d = READ_ONCE(q->dequeued);
  if (e - d >= MAX)
    return false;
  int x = CAS(&q->enqueued, e, e+1);
  if (x == e)
    break;
  e = x;
}
