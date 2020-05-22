Return-Path: <SRS0=143r=7E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6B0C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 May 2020 08:05:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F48F20812
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 May 2020 08:05:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="eM+PqLl6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F48F20812
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd19ea28;
	Fri, 22 May 2020 07:50:30 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8afb0083
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 May 2020 07:50:27 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aea31c3c
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 May 2020 07:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=lMyZpw
 4LSYGRGfbTD21euzStWJs=; b=eM+PqLl6QmrvvJ+ypzPzSRxh8011G8Hkmvbq0q
 hljufxTZth3qiwN/WcdPVAUeP32/aifg9vHSpeRpxv6dW6M+LS6mS/XvvvUnTD2i
 mK23yvV+hsaZuW61YHpOVEJjGEoKSjHwS+NUwhXLBLoXr72acdEoG/l+bcw1xXG/
 DFPSuzpoUOjO13uZTT2sYxMlcf0GueG4jbvajSxcVPa7hyOGljZuxne8IvUl8o/6
 6QmOLedyCjZBix2+0Qr2AW5C9YcJOKyDda6GFsbhTGFz6WnYETfy+sFHV+AxRb4W
 F1oBxDofGiDnckDOggbotbZf2gDawiLuWnX2vJedZfNwdZRg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0a492f24
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 May 2020 07:50:27 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id c20so9877058ilk.6
 for <wireguard@lists.zx2c4.com>; Fri, 22 May 2020 01:05:10 -0700 (PDT)
X-Gm-Message-State: AOAM531ltHlzfYMwCiDxnFQl65Mtdaso6kccl3VYK1zJaPoG3yq9AzDF
 7NjSae/XQ41rYh6YEHcWs/mwHV/uMp3+0mPITXE=
X-Google-Smtp-Source: ABdhPJzGhAuTd3O75kxoNKKQe/MnJNMwljQPsoWFMGif5hN1KXbRj1b47CqnPSvfzc30tazfBklN55j37XeHV8Ez3GI=
X-Received: by 2002:a92:5f46:: with SMTP id t67mr11512126ilb.64.1590134709178; 
 Fri, 22 May 2020 01:05:09 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 May 2020 02:04:58 -0600
X-Gmail-Original-Message-ID: <CAHmME9oX+8HoK_wAoc5oR9rWenYz4ki8EK+NebQEV2ALZDSrdg@mail.gmail.com>
Message-ID: <CAHmME9oX+8HoK_wAoc5oR9rWenYz4ki8EK+NebQEV2ALZDSrdg@mail.gmail.com>
Subject: Adding Debian, Ubuntu, OpenSUSE, RHEL, CentOS kernels to WireGuard
 CI: Seeking URLs
To: unit193@ubuntu.com, Daniel Kahn Gillmor <dkg@fifthhorseman.net>, 
 Andy Whitcroft <apw@canonical.com>,
 Ubuntu Kernel Team <kernel-team@lists.ubuntu.com>, 
 Martin Hauke <mardnh@gmx.de>, Joe Doss <joe@solidadmin.com>, 
 Neal Gompa <ngompa@fedoraproject.org>, 
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

Hi distro kernel maintainers,

I currently have build.wireguard.com churning away at every new kernel
release between 3.10 and 5.5 for each and every wireguard-linux-compat
commit, making sure that we don't break anything. It's a pretty CPU
intensive, but it means we don't break mainline kernels ever when
releasing. Scroll down to the bottom to see what I mean.

This is not the case, however, with distro kernels, which differ
notoriously from mainline in surprising ways. There's been some
breakage, and unless we do something about it, I imagine there will
continue to be much breakage. Because so many users use Linux via your
kernels, it seems imperative that we support these well. And with
distros like Ubuntu now supporting WireGuard directly through
wireguard-linux-compat, it seems ever more important that we minimize
breakage so as to not create release delays downstream of us.

At the moment, wireguard-linux-compat supports:
- Debian oldoldstable (8), oldstable (9), stable (10), testing (11), sid
- Ubuntu 14.04, 16.04, 18.04, 19.04, 19.10, 20.04
- OpenSUSE 42, 15, 15.2 (leap)
- RHEL 7.8, 8.2
- CentOS 8.1

The logic here is that we support the latest single kernel for each
major supported release of these distros. For example, on Debian
stable, we support 4.19.0-9 but not 4.19.0-8 anymore.

I'd like to put these on build.wireguard.com to mitigate breakage. In
order to make this happen, I'll need two things:
- A URL I can scape that will give me the latest kernel versions for
relevant distros.
- A URL I can construct using a selected version to download a boring
kernel source tarball.
I would prefer to not involve git, if possible, and for these URLs to
point to the sources for actual kernels that are shipping as the
standard latest-kernel for each of the above releases.

If you can provide those pieces of information for my CI scripts, it
seems likely that we can drastically reduce breakage for your
distribution frankenkernels. If you cannot provide that, but other
distros can, I will probably naturally prioritize support for those
other distros that make maintenance easier, simply as a matter of
habit rather than something intentional.

Let me know if this is something that interests you. I'm happy to get
creative on what sorts of pages we scrape for this info.

Thanks,
Jason
