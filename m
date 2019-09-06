Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5269C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 21:23:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A3502070C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 21:23:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=astrogeo.va.it header.i=@astrogeo.va.it header.b="mH+0pQ/s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A3502070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=astrogeo.va.it
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b424636;
	Fri, 6 Sep 2019 21:22:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4a6181e
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 21:22:37 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbd40f71
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 21:22:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id n10so8552399wmj.0
 for <wireguard@lists.zx2c4.com>; Fri, 06 Sep 2019 14:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astrogeo.va.it; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Jc9kQ7OpBHk3jZjGBx+4zVsDlX5N5/hqlkPCerxv5Uw=;
 b=mH+0pQ/s2nlN7Odd22vMfBRbwPcM5OOnAc3FJO5Q0W9nVRT7lzu+is0F/X2bwyPYOh
 FaQN5jABv8J/h95H5F/DlEWeglqT6LEbXUTnzRdzZuA0Wjgvujxl38R0FxZ3gf/FovSz
 K6JZcdLtmKsKJ9GxtZCeu4gxdjyJrJThoBqIoyUw4RAt36KuNKx0kARyl0h2P0zGl3r1
 JzCmdBoAVgcfKHfxwHgZmiSGn+Zefqh8gWFvsso9GrAVvtV0w9gF7giIq4aLrZ0H9QT3
 UYVsXEyHWx9+bPi3B/ktPqAOZ72zlTSHYUmW04j99pBFvOLrqoTgw2qA/nkW12fZYsCC
 UI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Jc9kQ7OpBHk3jZjGBx+4zVsDlX5N5/hqlkPCerxv5Uw=;
 b=LsH3yJAYiT22jB8Ujy1XlPt9eAM4shrVTiFzUbKeYYU8m8HihpuM1ReVnc3p2o7rzF
 R3mc4g9XPx/FMHqyPBSJJoQz7jUWhMrCG9xY9dvlBYSybdOsXzfKXIvsxbfDfSPtSn+L
 tiZTm3rCoQf9OWKXfQybcf9BlR0F1jMQLmNMr3enwF3jDaZl3tlgxfV7mdhmsT/GbdUg
 V+MBrXYU/Vkx43QqoMO0if86ryIEy1wGL5wgtwifNV/a0Rr6mOwaMfaj1yCITtjqE/2G
 NP0YtDEZhb7nxPNfEQFvIYhNYWJRROsPxQljHb241gpVQj75MBTrbzIMRevfOmFvxn0o
 9jYg==
X-Gm-Message-State: APjAAAUCMDU8uyhG+G1KAICZ0WtLBRRrmlA+f5VDMZLWnhYeZzNdxZRN
 T5wp9WPuf9IZe+x8DuCmKkD5rflV3OQ=
X-Google-Smtp-Source: APXvYqxRZrI3yWb4QolguWSDxaHY4/ERB3TMgYTzLmu/HlAWtU5U2MaQVhPNNx8cDb112yNBFlkzZA==
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr9476387wmd.14.1567804955859; 
 Fri, 06 Sep 2019 14:22:35 -0700 (PDT)
Received: from [192.168.2.58] (78-134-57-223.v4.ngi.it. [78.134.57.223])
 by smtp.gmail.com with ESMTPSA id q19sm9429347wra.89.2019.09.06.14.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2019 14:22:35 -0700 (PDT)
Subject: Re: WireGuard fails to build on CentOS 7.1908
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAMKRnFh4XvqYzPDVjy_NOpeHY+KgsRfEuHfEjWy9N1wfY9MwTg@mail.gmail.com>
 <CAHmME9oC+rYCVqv21-nGw_vyxzY5VhTHoa0mrnbOEShcczBN-g@mail.gmail.com>
From: Dario Pilori <dario.pilori@astrogeo.va.it>
Message-ID: <816bb8ff-101f-2719-4b75-1d194c519aef@astrogeo.va.it>
Date: Fri, 6 Sep 2019 23:23:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9oC+rYCVqv21-nGw_vyxzY5VhTHoa0mrnbOEShcczBN-g@mail.gmail.com>
Content-Language: en-US
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello Jason,

On 06/09/2019 21:17, Jason A. Donenfeld wrote:
> Hi Dario,
>
> Are you running the latest el7 kernel? Or are there RHEL updates you
> haven't yet applied? Can you provide more info about versions?

The CentOS 7 machine is fully-updated from the Continuous Release (CR) 
repository, which is derived from the recently released RHEL 7.7 
(https://wiki.centos.org/Manuals/ReleaseNotes/CentOS7.1908). If needed, 
I can send the full output of yum list installed.

To summarize:

* Latest "official" CentOS 7 (CentOS 7.1804, derived from RHEL 7.6), 
kernel 3.10.0-957.27.2.el7: WireGuard compiles.

* CentOS 7 with CR repo (will be released as CentOS 7.1908), kernel 
3.10.0-1062.el7: WireGuard does not compile.

The changelog from version 3.10.0-957.27.2.el7 to 3.10.0-1062.el7 is 
shown here: https://access.redhat.com/errata/RHSA-2019:2029

Unfortunately, I cannot replicate this error on other machines since I 
have only one test machine. However, the same bug has been reported e.g. 
in 
https://www.reddit.com/r/WireGuard/comments/cy8nk0/wireguard_module_not_loading_with_centos_7_kernel/

As soon as the CentOS RPM repo will be upgraded to v0.0.20190610, I will 
also test that version.

Cheers,

Dario

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
