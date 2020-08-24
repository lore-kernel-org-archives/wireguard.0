Return-Path: <SRS0=mjoF=CC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C326C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Aug 2020 18:57:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20CB5206BE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Aug 2020 18:57:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dF7cq9z3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20CB5206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cecfb224;
	Mon, 24 Aug 2020 18:30:59 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cc417c61
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Aug 2020 18:30:56 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id j25so4100743ejk.9
 for <wireguard@lists.zx2c4.com>; Mon, 24 Aug 2020 11:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QNhYi68yBtO3DKzjbp1QigjtpEo6+EITtqQPtRP609w=;
 b=dF7cq9z3LiZUedvsNhRSlfFG5ryz6/y4iumPXK9ZSm8iDDIESE7iJ2wfnjgpQ7JJae
 6Kb5xMhZW9kMbPATbl+H+IMOc8ZgKwqGXxuQNEPbVMAqivr77+RzTa8dtf5kBNeUwKfq
 LGWVSrQwUHnIUs614VLtWwzV8IOZaoHU7OVlyx7VRYe6AlksdmmuGXRp2apbmfLackhk
 gqOawK31JG6SKE9fWt5lY6veABOYK9o4F0Ue/rkkky8mhAhGn04RrAnITUPjURiPd5rC
 5lbuZKHOnEC8zHazVdJLN6j3ccCCYiDlawNfuzJ227kcSGwwQNqBknFzMXQ8kzmvGH9E
 wcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QNhYi68yBtO3DKzjbp1QigjtpEo6+EITtqQPtRP609w=;
 b=Qim6WFZ5MxJ9gBCsAJ89Zvy7rwr1Pa1b/ouAzQhMWR2VLgTzqgkfBbxdu041fPZ9jh
 O+cbW35jKN1L167sOaGZ57ELXlTBtAapYX6cYXyIMH7EXgmO/h05BNf/xNHrIJKIGvu9
 YQ3NbYqCgmpUj/2jamJSI4I3C2mVkyztmmQjqDfr7Dil4MblculEP7N0u1W2o+9h/Pbs
 SuWzd4OJSJfYlbF/WRmsHwF68dOT+WU/4UO/zV9/MWbigB9wRrSywRA3VOeyFpRuHV8P
 nDagHN12iI4o5jnyXPtu5r9yge7j6zEqf214WtBuz3FsHTI6JvTpYDE5PQ81zn4kg1n6
 yABg==
X-Gm-Message-State: AOAM532MVXBBBaBPfdYZSt8yxWkF6pAtIP7s3caxVXh0eCG+QVVAU9OM
 O9rDjwYygMPfGRk2KSL7bJakzE6uSRSKlBeuoEkIbq0Lzjg=
X-Google-Smtp-Source: ABdhPJzOniKtsbiuoncP0oNKpyBD+IdLdiC9XwYLRkab1SrYBr4KfbHi9fblwII4KNJH9VEVkzbljeDFzuOvEDWEyRM=
X-Received: by 2002:a17:906:7d16:: with SMTP id
 u22mr6773821ejo.176.1598295474226; 
 Mon, 24 Aug 2020 11:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAF-5xiCzvHFLtLFpw5FNOR5w7=bEBNjDtVgedRjGNzBigk4cZw@mail.gmail.com>
In-Reply-To: <CAF-5xiCzvHFLtLFpw5FNOR5w7=bEBNjDtVgedRjGNzBigk4cZw@mail.gmail.com>
From: Ryan Whelan <rcwhelan@gmail.com>
Date: Mon, 24 Aug 2020 14:57:43 -0400
Message-ID: <CAM3m09TFa3Aaorn17mWyx-zB7WfpGqwyP18Z0Qk+NDXodJEXyg@mail.gmail.com>
Subject: Re: Python Wrapper for wireguard-tools
To: Andrew Roth <andrew@andrewjroth.com>
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

At this point, it's very old and not in use, but I once worked on a
project that would wrap the `wg` command in python.

If helpful, I posted it here:
https://gist.github.com/rwhelan/f46d1f6f07df71f1bd1786eda447b97f

I don't think its feature complete as it was only used internally for
a project that took another direction. But in case it's helpful...


On Sat, Aug 22, 2020 at 3:03 PM Andrew Roth <andrew@andrewjroth.com> wrote:
>
> Hello,
>
> Recently joined the list, but reviewed the archives as best I could.
> I figured before I get too far in writing this, I should ask here.
>
> I'm looking for a way to create and configure WireGaurd interfaces
> programmatically using Python.  Has anyone created a Python wrapper
> for the wireguard-tools?  If not, could I try my hand at it?
>
> In my research, I was not able to find any true libraries supporting
> configuring a WireGuard implementation.  Since wireguard-tools [1] is
> cross-platform, and Python is cross-platform, I wanted a
> cross-platform library to configure WireGuard interfaces.  This would
> help application programmers or tool developers who want to utilize
> WireGuard as part of the application or tool written in Python,
> potentially cross-platform.
>
> I did see wgnlpy [2], but don't think it is a fit since it relies on
> Netlink (Linux kernel interface), so it's not cross-platform.  I also
> found a few other packages on Pypi, but none of them seemed to
> interface with the WireGuard module interfaces.
>
> In the wireguard-tools repository, I noticed the embeddable-wg-library
> [3] with C source and header.  Python (using CFFI) supports creating
> an extension module that is compiled from C sources to directly invoke
> the target C function [4].  It claims to be fast, simple, and
> platform-agnostic (by that, I mean it can be compiled for any
> platform).  I am planning on writing a python module to expose the C
> functions from the embeddable-wg-library using CFFI.
>
> Does this make sense?  Any comments, gotchas, or limitations?
>
> Thanks for your time,
> Andrew
>
> [1]:  https://git.zx2c4.com/wireguard-tools/about/
> [2]:  https://github.com/ArgosyLabs/wgnlpy
> [3]:  https://git.zx2c4.com/wireguard-tools/tree/contrib/embeddable-wg-library
> [4]:  https://cffi.readthedocs.io/en/latest/overview.html#api-mode-calling-c-sources-instead-of-a-compiled-library
>
> --
>
> ~Andrew Roth
> http://www.andrewjroth.com
>
> "Our greatest glory is not in never falling, but in getting up every
> time we do." -Confucius
