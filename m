Return-Path: <SRS0=38ps=PI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0692C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 31 Dec 2018 17:06:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03DC72133F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 31 Dec 2018 17:06:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="lCdqffKD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03DC72133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0973f4a;
	Mon, 31 Dec 2018 17:03:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aded9243
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Dec 2018 16:09:33 +0000 (UTC)
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8971908c
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Dec 2018 16:09:33 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id a11so23656620otr.10
 for <wireguard@lists.zx2c4.com>; Mon, 31 Dec 2018 08:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/jpzr6qJV6VTWSnVPRfVmMkEiRcGvaCxQ30JzwFJ88Y=;
 b=lCdqffKDUeKwEFs2hLSgmJNS6gf+tfeqo1c4D9ApTvDFzGgxoajxlBNeUWgMSQZjNx
 q95oC3MyYw98Nfq5gGx5dJUFvoYsoMNOQbzc/J/BkEEuSSwIJEW16O6n14P+uZ8luuL0
 QkjYddw4NBIaDFVjjculnK3ddva0PsYIt7S/9iC2mhvik3LewUI3hxUZVgButQtNc6yo
 kw98Hb7gmZTKWysYosEaRun8uMRob/FlMoX7p9MSVrLAFwwP4wDJ60ot3Dyqig+gTgen
 5SeW/QS8hVuWgdPHeZUX2oF3pv6j8pSx1uRHHeiCA6h4UOVtAoJO6FCj2ptcT2BrJjUb
 xOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/jpzr6qJV6VTWSnVPRfVmMkEiRcGvaCxQ30JzwFJ88Y=;
 b=lsLEC25jaS/gEl+dLtRvgiw/pUM5/8nqT7/hzDzbzqFji+t8c0nnDUfQLfEsGmvqGk
 WK1Ed//3msxazV4xpEgh1trZxByW8DHWQdP1IkzaaQfVQQk2WCT7lGiGSKwv40gktBJJ
 w5CV+ZOYUC2yDIBjcYyMMmskf60zsvO6Y/ZzpZmFKfDS0n0gB6wmO3T6IMsE0s/CRZhs
 b2xyb3VAYFruTynU3okDAkQNf1znQaf8Gv3zqFRN3R01iOHJ02jPR1zhAgXzD1WHsg8z
 x0VqQLoL9Lh0a1bD1o8q6eGTmPuVTAdNg9pepVpPwroXkhgkIbP4fsevsuhqf/4bw/v0
 yfMQ==
X-Gm-Message-State: AJcUukfJRKMkSEOxt+BpC9b8Gk5SO8yM2Al2t1gHe+wUUc8mX/6wA21e
 3Fpl4iJaihOzdrGALabCE4NaTpxFImwalnc2NnsbPQ==
X-Google-Smtp-Source: ALg8bN5RM0Tay5kXFxzx/uDSdRp5IujIWYm4SkY62DmTvJp7OP9/licXy52BrlfRx6lCixBN8wjobCI1M49nuQL1f54=
X-Received: by 2002:a9d:2666:: with SMTP id a93mr25160244otb.235.1546272700733; 
 Mon, 31 Dec 2018 08:11:40 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9pvcrTnbzSvAS3Q1CbPRdZMctuyBmuCyxX0wa_k+A-0tw@mail.gmail.com>
 <CAMp63jVKAeieefottP=EwYMeo0daD5GDxwpT1PiPPOZQkQ6gSA@mail.gmail.com>
In-Reply-To: <CAMp63jVKAeieefottP=EwYMeo0daD5GDxwpT1PiPPOZQkQ6gSA@mail.gmail.com>
From: John <graysky@archlinux.us>
Date: Mon, 31 Dec 2018 11:11:30 -0500
Message-ID: <CAO_nJAYw_zbNBsxtaKbR=kxp-+E4d2VkzUfrWtnSn26ZVkuEMw@mail.gmail.com>
Subject: Re: binary module for arch?
To: Davide Depau <davide@depau.eu>
X-Mailman-Approved-At: Mon, 31 Dec 2018 18:03:48 +0100
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Our package manager, pacman, will display optional dependencies to
users/most known to inspect the output.

My recommendation is to change the wording under the command on your
install page to something like: "Users of the distro provided kernels
(linux and linux-lts) may download the requisite corresponding
precompiled wireguard module. Users of custom kernels will require the
wireguard-dkms package and corresponding kernel headers to compile the
module."

For your info, example pacman output that most Arch users will be
accustom to reading upon installation of the wireguard-tools package:

% sudo pacman -S wireguard-tools
resolving dependencies...
looking for conflicting packages...

Packages (1) wireguard-tools-0.0.20181218-2

Total Installed Size:  0.21 MiB

:: Proceed with installation? [Y/n]
(1/1) checking keys in keyring
[#############################] 100%
(1/1) checking package integrity
[#############################] 100%
(1/1) loading package files
[#############################] 100%
(1/1) checking for file conflicts
[#############################] 100%
:: Processing package changes...
(1/1) installing wireguard-tools
[#############################] 100%
Optional dependencies for wireguard-tools
    openresolv: for DNS functionality [installed]
    wireguard-dkms: wireguard module, built by dkms
    wireguard-arch: wireguard module for linux
    wireguard-lts: wireguard module for linux-lts
:: Running post-transaction hooks...
(1/2) Reloading system manager configuration...
(2/2) Arming ConditionNeedsUpdate...


On Sun, Dec 30, 2018 at 8:50 PM Davide Depau <davide@depau.eu> wrote:
>
> Hi Jason,
> sorry for sneaking into the conversation but I'm currently using wireguard-dkms. I think deprecating it would be a bad idea: anyone who uses a custom kernel cannot use the binary modules.
> I'm currently using linux-hardened on my server (yeah, I run Arch Linux on my personal server lol) and rely on the dkms package for the wireguard module.
> Binary packages should probably be preferred for those who use the default kernels, however not everyone does.
> That being said I really hope WireGuard makes it to mainline soon ;)
>
> Regards,
> Davide
>
> On Mon, Dec 31, 2018, 1:59 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> Hey Christian,
>>
>> I noticed there are now two distro-built packages for wireguard for
>> arch -- wireguard-lts and wireguard-arch. These seem probably more
>> convenient for most people than the dkms one. What would you recommend
>> in terms of updating wireguard.com/install/ ? And do you plan on
>> depreciating the dkms one at some point, or do you think it will
>> remain useful for certain users?
>>
>> Regards,
>> Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
