Return-Path: <SRS0=uw9z=NF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD5FC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Aug 2021 11:04:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95E3760E52
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Aug 2021 11:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95E3760E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7b5568d;
	Sat, 14 Aug 2021 11:04:02 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8685e9b9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Aug 2021 11:03:59 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id g30so24948269lfv.4
 for <wireguard@lists.zx2c4.com>; Sat, 14 Aug 2021 04:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+TdwWqcX/9Ms+T9auI7qaJFKBuzNUFBbKGaNThQPHTE=;
 b=phLFfEOnhFwFI4X966YblZe27f0IIeWca+c4PrctdajMXiygSmgfvqlJ0bgI+dSIW/
 SXkbmZZUilK0Muwdk/DTY13Gz6JRQGbKWPW3Sp8/g1rKmpAiIlEMsDIXlxnfgCYGAWxz
 gydSVXu34OOZ+zEDaRyIZXdf9RgYzNjlH1difdunS+ABC1YbolSgteOc55XjzCKXs57b
 4tc3X+oiVcIEWF/cLOCp1gofLp6MfRWksKr1/4NerjCm4XOZYI/Ny/BX2vx/j6kGWxiR
 1PHvEzKbtGlVKzhbeNXYuXoHaDv3Tjfa+0us1q8YXKVaqk9EFOY1ZPryluiAJKlj2bib
 h5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+TdwWqcX/9Ms+T9auI7qaJFKBuzNUFBbKGaNThQPHTE=;
 b=bUvQsrE1ykO8ZvpVZNRnzwy7UycfFYQV+iA8uOXMguXeYVTSZblCtdbz6CqNL6c6C+
 afjUrs1phfN/zCpYrlr7f0iAMnPyCdTXebuAEx0xIYorJvEGbibqZSLuSQrpRwyP5i+K
 Wda+Xz3luG6y3RFv/XkcwMAWJMN2ZlILK1MY1v7S1TLiD2lzSOKNiF7jPBWeigX0bKRI
 ohNySG+6NqZ49gsHHlFN5lmFglHWViMR9YjZRUWgBdIvUgwZaWYoNYLloDLK19gsuxLV
 C64q/hQtWP8iYuPaEzqQWJFNc73bHFogE5e/00YiKiAg/XZeSYy74rkbn0z7RCRkpHvm
 1flQ==
X-Gm-Message-State: AOAM531zjO5VgxY6RqP7n5iuIDABo95HLnaRTuKoWi+O2L+GXVnknDnL
 1mU2UfTYaUs0chHVXARWWVHM4cbTNnUKzhAvrfv7X+DKm/s=
X-Google-Smtp-Source: ABdhPJyi+scM5KQ/+5RiSBlIi9Xmwyc1RzS9KyN6Txpw3nvDWvj5Sywb7Th/KhbM+qW2ZoinlK0nano/+NMCVpfwptQ=
X-Received: by 2002:a05:6512:3f90:: with SMTP id
 x16mr4811507lfa.518.1628939038593; 
 Sat, 14 Aug 2021 04:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <YQgrCfqIL2SWfF6G@zx2c4.com>
 <CAHmME9p8WLAzd=W+Z6MKtke5PYb_T6iMbvBFirmCeUQzxycRwQ@mail.gmail.com>
In-Reply-To: <CAHmME9p8WLAzd=W+Z6MKtke5PYb_T6iMbvBFirmCeUQzxycRwQ@mail.gmail.com>
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Sat, 14 Aug 2021 13:03:28 +0200
Message-ID: <CABtXGiAQHaRNZuTKiAFpZ9UpMV+gxchNTa3u7mVBXbeeL5vbYw@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuardNT, a high-performance WireGuard
 implementation for the Windows kernel
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

I've been testing the experimental driver since the first announcement
but no issues to date.



On Fri, 13 Aug 2021 at 13:57, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi everyone,
>
> On Mon, Aug 2, 2021 at 7:28 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > Nonetheless, experimental or not, we still need people to test this and help
> > shake out issues. To that end, WireGuardNT is now available in the ordinary
> > WireGuard for Windows client -- https://www.wireguard.com/install/ -- with the
> > 0.4.z series, in addition to having full support of the venerable wg(8)
> > utility, but currently (August 2021; if you're reading this in the future this
> > might not apply) it is behind a manually set registry knob. There will be
> > three phases of the 0.4.z series:
> >
> >   Phase 1) WireGuardNT is hidden behind the "ExperimentalKernelDriver"
> >            registry knob. If you don't manually tinker around to enable it,
> >            the client will continue to use wireguard-go/Wintun like before.
>
> After the first few days, bug reports for WireGuardNT have died down
> considerably. It's hard to tell whether that's a sign that the
> software is stable or that nobody is using it. So, we're still in
> phase 1. However, with version 0.4.5 of the client, I've added a
> checkbox below the "activate" button in order to make the experimental
> testing more discoverable. I dislike such knobs, but I'd rather have
> more testing than less, before turning it on by default. Hopefully
> this will make it easier for alpha testers to give it a spin and
> report findings. If you have been testing the driver, and it's been
> working well for you, please write in to say so, simply as a signal
> that it is being tested. If things stay as quiet as they are now on
> the bug reporting front, we'll likely move into phase 2 -- enabling
> WireGuardNT by default, with a registry key to revert to the legacy
> implementation -- in 2 to 3 weeks.
>
> Jason



-- 
Phillip McMahon

https://flowcrypt.com/me/phillipmcmahon
OpenPGP: EA04 83D4 C864 AA7C 1099 4BE6 A11E 70AD FDA6 0CF9
