Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53446C00140
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Jul 2022 23:52:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6432bd7b;
	Thu, 28 Jul 2022 23:52:18 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id df67864f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jul 2022 23:52:16 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id e15so4021285edj.2
 for <wireguard@lists.zx2c4.com>; Thu, 28 Jul 2022 16:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc;
 bh=MhNclnUwgrtOtIUrzDNVm59H4zAKqhgMtgZG0gHRlEM=;
 b=K0clLuEZSVAZqnultEysRyYP5K+K0eSqA/4Pxk6VdaUfVpUi/htnmqgZzlOls+M0D5
 HFgthENYcZD5DFEpyqZPJHM9om3xn02q8F+fLefdLig6wXddtZyDOBkuISLpSiHN7M3D
 JyKV6eUQVHpdrKli27q/DXJfcjQjPKTSswHY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc;
 bh=MhNclnUwgrtOtIUrzDNVm59H4zAKqhgMtgZG0gHRlEM=;
 b=I0Muj/5s4a1PfW/SRA00791JuRFZ+QRaZJNdMHIIqRLD4VdQJiwqqFtdKKscDW1jgf
 2DRVWrrris3gdh0zHx12ww1gtcIplw/lGJkjgUbvkoEgGQgGRp+3imSI+eb3Y+AL7hh0
 AzJSc16hBcKkCofDEZegz0ijVXz9kTZmW/BkpAzWYruDAVbruothY4OfW3aU8jdC0eQT
 RT4tX0r6p1crBJJV052aPMpHUrg4pDoJoQ7bo2R0sjGBRxouNyo+gjpxyBbPTOj4RUrA
 s8HoCtYWf3F+nVgnA1EZfQZAeUBJE3i5/S0rK+ILWgW5Jx7m6txWlANfLRPeAgSlSj1o
 a+BQ==
X-Gm-Message-State: AJIora+cfoKzGX8djFHNXM5z6PVSzbex3rZJWbh2ooGCo65OhVtqjcKv
 GYezwxkdzGLMYq9S63sOS3R8tMTGCxRuNAJb
X-Google-Smtp-Source: AGRyM1tTxr/4iNy2RU72tjfqRDnXbtlB5W620ZZoyUqBHgbrrFScbuHLLo+h2Z199iA4x3JqMefjkA==
X-Received: by 2002:a05:6402:4516:b0:43b:c806:6346 with SMTP id
 ez22-20020a056402451600b0043bc8066346mr1258017edb.52.1659052335379; 
 Thu, 28 Jul 2022 16:52:15 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 x25-20020aa7d6d9000000b0043bc4b28464sm1505857edr.34.2022.07.28.16.52.14
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 16:52:15 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id b26so4137830wrc.2
 for <wireguard@lists.zx2c4.com>; Thu, 28 Jul 2022 16:52:14 -0700 (PDT)
X-Received: by 2002:a5d:59a4:0:b0:21e:8704:ea35 with SMTP id
 p4-20020a5d59a4000000b0021e8704ea35mr660596wrr.442.1659052334307; Thu, 28 Jul
 2022 16:52:14 -0700 (PDT)
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 28 Jul 2022 16:51:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjJZGA6w_DxA+k7Ejbqsq+uGK==koPai3sqdsfJqemvag@mail.gmail.com>
Message-ID: <CAHk-=wjJZGA6w_DxA+k7Ejbqsq+uGK==koPai3sqdsfJqemvag@mail.gmail.com>
Subject: Random arrays on kernel stack..
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

So I finally have an arm64 laptop that I'm playing with, and as a
result building the kernel the way I usually do - with warnings as
errors.

And I get this:

  drivers/net/wireguard/allowedips.c: In function =E2=80=98root_remove_peer=
_lists=E2=80=99:
  drivers/net/wireguard/allowedips.c:77:1: error: the frame size of
1040 bytes is larger than 1024 bytes [-Werror=3Dframe-larger-than=3D]
     77 | }
        | ^
  drivers/net/wireguard/allowedips.c: In function =E2=80=98root_free_rcu=E2=
=80=99:
  drivers/net/wireguard/allowedips.c:64:1: error: the frame size of
1040 bytes is larger than 1024 bytes [-Werror=3Dframe-larger-than=3D]
     64 | }
        | ^

and clearly it only happens for me because it turns out Asahi has for
some odd reason picked that low CONFIG_FRAME_WARN of just 1kB.

So the fix for the warning was just to update my .config file, no biggie.

But when I look at the code that generates that warning, it just
worries me. It has that magical constant 128.

Sure, that same constant is also in push_rcu().

And there it is randomly as a warning, and then it will happily
overflow the stack frame.

That's not ok.

I think that

 (a) that constant should be a bit lower, so that we *can* use a 1kB
stack frame warning on 64-bit architectures

 (b) it should be documented some way as a #define

 (c) push_rcu() should damn well not "warn and corrupt the stack". It
should warn-and-not-corrupt the stack, even if that then means that
the thing isn't pushed at all.

Hmm?

                 Linus
