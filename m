Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9679EC00144
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Jul 2022 17:57:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 83d15ec6;
	Fri, 29 Jul 2022 17:57:02 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 40df00ba
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Jul 2022 17:57:01 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id bx8so3550681ljb.3
 for <wireguard@lists.zx2c4.com>; Fri, 29 Jul 2022 10:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=mtbJI3BfmPmaqMfRhM4dg2FAE3KGVxCoTZ81hDc+/c0=;
 b=CzlLpDkhwSO+V3LZbkmpxVSCoQThsP/QfPteXgoWXEh9dcVIeGObKqK+3+otenlvFk
 Uw2iXYQnDRHNFxSYJeXSMREZiGuOs4lFWZwPNjjqZryGBmIG0OfjntKXGqLGAZ+0TGyD
 xtec1bfPr+Zwi743gUoGmiAo7PqfUj96LjPDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=mtbJI3BfmPmaqMfRhM4dg2FAE3KGVxCoTZ81hDc+/c0=;
 b=K2WrFG0Q8Y9YPD7nQqTKglvlRZpeLc3BRLl1QFPW1DGW6wL6oP0WG6U1uUKDyi8sss
 /IPGGgpRqv6UmQOb2IRFQ88IUuq9EnpkOfT6ZBXIyINf0M8h+caETn1yeQocpumY+vaS
 U8Cu/j82ba3ZbAJojd9Hmi7zWWRWPHSVkXj3MBWtraRmZB5c8U9OQqyPB0sJPJ4lu3Cx
 RnJ8VNUZLiFaNgKIYe3fUMlg7zze33pY+4xdytRJqAuTUB3UDg4FmFnqyOReYaD/d/CB
 fwckfr+5EIUZqSkVdomooY8FAJyrpxSVahiVb0tsSzzoVrPdbWyugkzvQ9ZqdouMg0Fw
 hFcg==
X-Gm-Message-State: AJIora/JV04xmMuHSIq86/WKd1m0OocUdOVpWHA/uLfCL5dMntCgokzM
 0VndiqsA/CX087F0uFMdXj+LAIUAMEdzEQA6
X-Google-Smtp-Source: AGRyM1u7kXc97WWV0kJ0HHD6+EAW8v/9nY0NTeQ+inJ9yKYJ5BrC46X+2Ut3T6iKRuKQfifL+ULznA==
X-Received: by 2002:a17:906:d54b:b0:72e:ece1:2956 with SMTP id
 cr11-20020a170906d54b00b0072eece12956mr3710206ejc.156.1659117409446; 
 Fri, 29 Jul 2022 10:56:49 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 k6-20020a17090632c600b0072f42ca2934sm1957711ejk.148.2022.07.29.10.56.48
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 10:56:48 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso4485531wma.2
 for <wireguard@lists.zx2c4.com>; Fri, 29 Jul 2022 10:56:48 -0700 (PDT)
X-Received: by 2002:a05:600c:3553:b0:3a3:2b65:299e with SMTP id
 i19-20020a05600c355300b003a32b65299emr3494032wmq.145.1659117408359; Fri, 29
 Jul 2022 10:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wjJZGA6w_DxA+k7Ejbqsq+uGK==koPai3sqdsfJqemvag@mail.gmail.com>
 <YuQU8H0UCGTt5C0I@zx2c4.com>
In-Reply-To: <YuQU8H0UCGTt5C0I@zx2c4.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 29 Jul 2022 10:56:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wheoU5mkht1xk_4Tyw78oa-8iGvGE9nBdUmGqCykgo1xw@mail.gmail.com>
Message-ID: <CAHk-=wheoU5mkht1xk_4Tyw78oa-8iGvGE9nBdUmGqCykgo1xw@mail.gmail.com>
Subject: Re: Random arrays on kernel stack..
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, arnd@arndb.de
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

On Fri, Jul 29, 2022 at 10:12 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> That's a good point. Though note that the current WARN_ON is also
> dependent on DEBUG being set.

Sure. And I think that's ok.

> >  (a) that constant should be a bit lower, so that we *can* use a 1kB
> > stack frame warning on 64-bit architectures
>
> That's not so much possible. This needs to do a DFS traversal of the
> trie, which means it can be 128 nodes deep since IPv6 addresses have
> 128 bits.

Ahh. Ok. That at least explains where the constant comes from. That
would be a good thing to have somewhere in that definition of the
value ;)

And I agree that malloc() isn't a great choice.

I don't really worry about the stack frame warning (I just raised it
to the same 2k limit I have on my x86-64 box), so doing that 1k
allocation is fine.

And with that constant 128 explained, I don't think it's wrong to not
even test for overflow. We don't test for things that can't happen.

But *if* you test for it for debug purposes, then at that point I
think you need to just do the "warn and don't corrupt stack".

                     Linus
