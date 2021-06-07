Return-Path: <SRS0=3dEh=LB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A0EC47095
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 11:06:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C11D60FDA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 11:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C11D60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6282788f;
	Mon, 7 Jun 2021 11:05:59 +0000 (UTC)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4d44d575
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jun 2021 11:05:58 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id o9so10701369pgd.2
 for <wireguard@lists.zx2c4.com>; Mon, 07 Jun 2021 04:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+TCV/j6GVZ5u/e0Rn3WRfnrnOJQ7UD5owgqaYmoS6Qs=;
 b=MLEYaGzSEWobbMSfUbLevHx0PnMd3iA9iX4LntvH+gC9TuEincU9uzqPJYWhA9xTkd
 K27idKdZk81aC1reSP1xMr1N1tPgXWTzpL/IbzIe56d96LSiK1bgtCjp1puPWWALsf7r
 Is9Vd5rPMeD2hCgfy/OhRPwOvJPZ4kC9LQRWpRCA+inIz9me2lxuRdQqi5PrBNRXQCoy
 gxhqoj1HYaElA6cva/+VQ7EE+f2uzuenK+4NNAi+oSoT2LNKTJ8YrRV7cnW/9mJHQzBJ
 g5QdlYtMhEb4IwLQtiT94HKthNcA+JSn866D4booUjtiXWd/h4VXNS6b85WMTfGO/gml
 K5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+TCV/j6GVZ5u/e0Rn3WRfnrnOJQ7UD5owgqaYmoS6Qs=;
 b=WCWxw5rp/r/8Gw0FeNBgOMWz8UjRwOkk9/DIZ8zJJZvHBsPgJSUroWPJwas9RB40vp
 oqP6H3MSRLyMnAaOSD4cWqSwlSt8JhgaQbZU7VRL2IaQEm9UsinHUrCfFAA6OJTFjeEI
 syyagK2FUBSP7q93IWo4CM1ZsU7GOKwe0AMtcEV0lAk9BO5PvMhvX1k9tWlr5w/jMb5t
 d+1vb+D0z8Jh4p05oOBK/OrqF2b903voclIbpp1q6Ext2+5So2YA1b902914cL9XXAiP
 pCiK8R5bKHDoA8Vc8hD/XWYkb2Kt6mNGotSYNpaN0lM2DZ/FNO1kc/Syv2r5w3W0P1hA
 YsAQ==
X-Gm-Message-State: AOAM531IWrYeeNOsXklBjuhdQwnmVmmTzuw9s1v210zVNcGqc0FXmHxb
 axmyyYeWYbkO94ppdYU+r0gkLWEkGnNW4f6qiSujuyugFlI=
X-Google-Smtp-Source: ABdhPJwgPSSQ5Pu+XEJc1wc3ZmpkiIwMB88jBo6HtNmmfN1J8N/svJdHy/t5W8MjVAMw8TvBHwKoRAydpQUY0FBJfjE=
X-Received: by 2002:a63:5f4e:: with SMTP id t75mr17178518pgb.75.1623063956090; 
 Mon, 07 Jun 2021 04:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <CADTMz0+OmW5n1JSD6pLA-_2=aRHeuhYLdQ6BCwjHg07vrPc+vA@mail.gmail.com>
 <CAHmME9poc+xPG_WfX1vYTSc9JPrSkMpWGR=rTGspOVsKyYfCpA@mail.gmail.com>
 <CADTMz0KSq7Kj6SzTptTt=Uy5EEGkCRhbZXzZfPeeJ6Vu8134uQ@mail.gmail.com>
 <CAHmME9qK7xwQgcxvj4PquxUxk0jh_cejsrGMtnn70o1FDof2ig@mail.gmail.com>
In-Reply-To: <CAHmME9qK7xwQgcxvj4PquxUxk0jh_cejsrGMtnn70o1FDof2ig@mail.gmail.com>
From: Christian McDonald <rcmcdonald91@gmail.com>
Date: Mon, 7 Jun 2021 07:05:43 -0400
Message-ID: <CADTMz0Jo+oOhhK60ug=agXyWL3SRA1oOyXJh49bor5-EG2ibqg@mail.gmail.com>
Subject: Re: Certain private keys being mangled by wg on FreeBSD
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

Ah that makes sense. I spent some quality time playing with the bit
arithmetic and I see what you mean now. Thanks for that snippet and
direction. One byproduct of this exercise was some code that I whipped
up that can at least detect a clamped vs unclamped key. This might
prove useful for informing a user of what is going on and thus
eliminating this class of erroneous bug report entirely. I'm really
not sure hiding the private keys entirely in the UI is the right thing
to do, especially if it seems that key generators should really be
pre-clamping keys (thanks for reaching out to Mullvad btw) and not
dishing out unclamped keys to begin with.


On Sun, Jun 6, 2021 at 12:21 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On 6/6/21, Christian McDonald <rcmcdonald91@gmail.com> wrote:
> > Would it not be better for wg to just fail outright instead of
> > transforming a poorly generated key entered by a user, regardless of
> > where the key came from? Especially if that problematic key passes the
> > regex validation that was provided in another thread in this email
> > list?
>
> No, it would not be better. There is nothing wrong with using those
> keys. They're not "poorly generated" or "problematic" or dangerous in
> the least. This is only a concern with your UI.
>
> The kernel is doing the correct thing -- clamping keys -- and
> displaying an unambiguous identifier to the user: the key that it will
> actually be using.
>
> I suspect the best thing to do for your UI would be to hide private
> (and preshared) keys, and only show public keys, unless explicitly
> exported into a config file. This not only reduces potential confusion
> with this issue, but mitigates another potential footgun down the
> line. It's also what wg(8)'s show command does by default (while
> showconf will export all).



-- 
R. Christian McDonald
M: (616) 856-9291
E: rcmcdonald91@gmail.com
