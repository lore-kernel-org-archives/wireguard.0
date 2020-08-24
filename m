Return-Path: <SRS0=D3OD=CF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2716DC433E5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 08:28:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C936E20738
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 08:28:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="piApsE1D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C936E20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e648f6ef;
	Thu, 27 Aug 2020 08:00:24 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 944480ff
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Aug 2020 19:12:05 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id u20so5431632pfn.0
 for <wireguard@lists.zx2c4.com>; Mon, 24 Aug 2020 12:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=+i3FtRX2to4A2pxrZjdi/aGRCoKLGSY0gT1bwdjRnXI=;
 b=piApsE1DvIC74oaLM5t5gJ4AetZ4YHvogc35HV2Syg5GUAFw1F+hqVuC9TKmUB2lO2
 vgz/13am9a818nSc7NPlevs/BdkNoLqoIdKQvXCHNQ772w9JeOn6UxF9odNNq2Kl7q3N
 uGyHpSiMTAA7ppyOc2MLjd6YfN4YtMqnZTjdywBFGYXdf7fDNcLg3MAt/pZ8as+JapN6
 8wB4QSwxoJtk75MdvR2OOywrq/gV1UNwnb+ZsYwbmK3ObdFh+MFdeQyYOSiNhVznlp+j
 4DugEviDSjnuC3YiFyEIlAAqi6kJrXIk5fwUk8g2NjF060CvKv7kKdEszNBvqvIFg9hz
 Cnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=+i3FtRX2to4A2pxrZjdi/aGRCoKLGSY0gT1bwdjRnXI=;
 b=uERc6D/qDuj3/Cy6ePiDYMfbYx4Cj74IOZvUn7jS0To7A1sT/026p3P4swMg5t+4/i
 jPq0Nbc97fm5oN2oT87eZwJMU3S95sTS1hdFRT9GGGGlXxAshs9VFoBHoBkyuIyvqVzS
 nDOdaZLllq7usVuBafAxqHS+VwO4FE46hNL9kab716gFmOpupv6Lf6p+vLyBL0YZj3Do
 3Ae83gNcyFCUasY3HWil5Nf99bWxpVuH4LpbwTWGCKQYnFx2V1IkF5WKOR5aZQ7pOPUA
 CSW9a7pd9cc7DdHbte2EqSX8YlSrgDDDJMz8t8HsttY3GQciDEgC4+N0MCfY4tEqkhWl
 eefw==
X-Gm-Message-State: AOAM532Fqr2jA8OhkVt9DxI0iWfQVzMsNBCzzo74AjukzAB5hd0w42AI
 2VWI1yA9r2XGnN/hhcP/+NBJB5OpkljmDUWOv/8=
X-Google-Smtp-Source: ABdhPJy704NclXj8VSrUl+qKoNmyJpa4OVCUQP8SoAqRkkdm8s+8Tq6cY7cjbNzAWbdixnRbOG0sCqrn4t1001QfysM=
X-Received: by 2002:a17:902:b115:: with SMTP id
 q21mr4700962plr.191.1598297943646; 
 Mon, 24 Aug 2020 12:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAF-5xiCzvHFLtLFpw5FNOR5w7=bEBNjDtVgedRjGNzBigk4cZw@mail.gmail.com>
 <CAM3m09TFa3Aaorn17mWyx-zB7WfpGqwyP18Z0Qk+NDXodJEXyg@mail.gmail.com>
 <CAKmhVko10JYo__SfNGujkeVV_YCPVLtBkLzcXoMfo7X3qjD5pA@mail.gmail.com>
In-Reply-To: <CAKmhVko10JYo__SfNGujkeVV_YCPVLtBkLzcXoMfo7X3qjD5pA@mail.gmail.com>
From: Mo Balaa <buddybalaa@gmail.com>
Date: Mon, 24 Aug 2020 14:38:52 -0500
Message-ID: <CAKmhVko5aED=b6Gx2yU5QVcEGyWbc3zWt2yAjUtAbaFNLr6nTQ@mail.gmail.com>
Subject: Re: Python Wrapper for wireguard-tools
To: Ryan Whelan <rcwhelan@gmail.com>
Cc: Andrew Roth <andrew@andrewjroth.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 27 Aug 2020 10:00:21 +0200
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
Reply-To: buddybalaa@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

We also wrap wg command and provide a high level config interface via
Python for our personal networking framework, Noteworthy.

See https://github.com/decentralabs/noteworthy/blob/master/plugins/wireguard/noteworthy/wireguard/wg.py

On Mon, Aug 24, 2020 at 2:35 PM Mo Balaa <buddybalaa@gmail.com> wrote:
>
> We also wrap wg command and provide a high level config interface via Python for our personal networking framework Noteworthy.
>
> https://github.com/decentralabs/noteworthy/blob/master/plugins/wireguard/noteworthy/wireguard/wg.py
>
>
> On Mon, Aug 24, 2020 at 14:00 Ryan Whelan <rcwhelan@gmail.com> wrote:
>>
>> At this point, it's very old and not in use, but I once worked on a
>>
>> project that would wrap the `wg` command in python.
>>
>>
>>
>> If helpful, I posted it here:
>>
>> https://gist.github.com/rwhelan/f46d1f6f07df71f1bd1786eda447b97f
>>
>>
>>
>> I don't think its feature complete as it was only used internally for
>>
>> a project that took another direction. But in case it's helpful...
>>
>>
>>
>>
>>
>> On Sat, Aug 22, 2020 at 3:03 PM Andrew Roth <andrew@andrewjroth.com> wrote:
>>
>> >
>>
>> > Hello,
>>
>> >
>>
>> > Recently joined the list, but reviewed the archives as best I could.
>>
>> > I figured before I get too far in writing this, I should ask here.
>>
>> >
>>
>> > I'm looking for a way to create and configure WireGaurd interfaces
>>
>> > programmatically using Python.  Has anyone created a Python wrapper
>>
>> > for the wireguard-tools?  If not, could I try my hand at it?
>>
>> >
>>
>> > In my research, I was not able to find any true libraries supporting
>>
>> > configuring a WireGuard implementation.  Since wireguard-tools [1] is
>>
>> > cross-platform, and Python is cross-platform, I wanted a
>>
>> > cross-platform library to configure WireGuard interfaces.  This would
>>
>> > help application programmers or tool developers who want to utilize
>>
>> > WireGuard as part of the application or tool written in Python,
>>
>> > potentially cross-platform.
>>
>> >
>>
>> > I did see wgnlpy [2], but don't think it is a fit since it relies on
>>
>> > Netlink (Linux kernel interface), so it's not cross-platform.  I also
>>
>> > found a few other packages on Pypi, but none of them seemed to
>>
>> > interface with the WireGuard module interfaces.
>>
>> >
>>
>> > In the wireguard-tools repository, I noticed the embeddable-wg-library
>>
>> > [3] with C source and header.  Python (using CFFI) supports creating
>>
>> > an extension module that is compiled from C sources to directly invoke
>>
>> > the target C function [4].  It claims to be fast, simple, and
>>
>> > platform-agnostic (by that, I mean it can be compiled for any
>>
>> > platform).  I am planning on writing a python module to expose the C
>>
>> > functions from the embeddable-wg-library using CFFI.
>>
>> >
>>
>> > Does this make sense?  Any comments, gotchas, or limitations?
>>
>> >
>>
>> > Thanks for your time,
>>
>> > Andrew
>>
>> >
>>
>> > [1]:  https://git.zx2c4.com/wireguard-tools/about/
>>
>> > [2]:  https://github.com/ArgosyLabs/wgnlpy
>>
>> > [3]:  https://git.zx2c4.com/wireguard-tools/tree/contrib/embeddable-wg-library
>>
>> > [4]:  https://cffi.readthedocs.io/en/latest/overview.html#api-mode-calling-c-sources-instead-of-a-compiled-library
>>
>> >
>>
>> > --
>>
>> >
>>
>> > ~Andrew Roth
>>
>> > http://www.andrewjroth.com
>>
>> >
>>
>> > "Our greatest glory is not in never falling, but in getting up every
>>
>> > time we do." -Confucius
>>
