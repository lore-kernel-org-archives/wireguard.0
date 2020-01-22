Return-Path: <SRS0=23NU=3L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3797DC2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:44:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FBAC24655
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:44:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="sOvIHydE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FBAC24655
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb027037;
	Wed, 22 Jan 2020 19:44:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca6038ad
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jan 2020 19:44:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13be7378
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jan 2020 19:44:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1efe18e4
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jan 2020 18:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=JHBN5AV8QEJDmToo7Of0xCOR8Vg=; b=sOvIHy
 dElrk8Kb/unctZfCcXWn8wZad1gmR+7idVwDeBmT9swIh0J5d8ZNqnWLcGd6AF95
 /9/2EkL6YUjBZzI2WthGFT+PtLC0Fixxcaznf0T4n/oEnJR5FdVjlDHjC5UgKbs0
 RpNHriZLW9nqobNTMHtCH7gtXAzDb+KQxfxuCYbcbivdihA7Gpdc2C+o+A5N9ATG
 6vObhv9lZyBnF1Qan3vONYNjckFm8+JF44m9+A4fhIet9u5gDXc+hCcLTDCkZBeZ
 8xfALCci+rkCF2NBuaEpx/zC96XjLN10TAh33UGSNkEzePcp573PDo6nKBkqHq67
 aagJ8XHtuXCNr64Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c9bb21d1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jan 2020 18:43:20 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id z2so560440oih.6
 for <wireguard@lists.zx2c4.com>; Wed, 22 Jan 2020 11:44:27 -0800 (PST)
X-Gm-Message-State: APjAAAXdJfDGWf625YbI7WKmv4E2XXJHTYyq41lQ4IqbHFQhYaZX/75H
 E61Zjr/0jp10EEFaF2UC38xEtUzXpxdJFnEmbhA=
X-Google-Smtp-Source: APXvYqyTQmiXhtB1fmu0kZby9cNIfy0LCmBqDnaH6NMUXMdzUqJaTwf1FtW1ChJZiHr5jqHWALn2Wj1NktqnSc4JL4M=
X-Received: by 2002:a05:6808:a8a:: with SMTP id
 q10mr7629597oij.66.1579722266462; 
 Wed, 22 Jan 2020 11:44:26 -0800 (PST)
MIME-Version: 1.0
References: <20200122194156.14049-1-rsk@revathskumar.com>
In-Reply-To: <20200122194156.14049-1-rsk@revathskumar.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Jan 2020 20:44:15 +0100
X-Gmail-Original-Message-ID: <CAHmME9oQqAUcA8CAbhcj1cj5L5DxZr8aw7+9nun14M+C3e5pKw@mail.gmail.com>
Message-ID: <CAHmME9oQqAUcA8CAbhcj1cj5L5DxZr8aw7+9nun14M+C3e5pKw@mail.gmail.com>
Subject: Re: [PATCH] fix: make wireguard compatible with android TV
To: Revath S Kumar <rsk@revathskumar.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Thanks for this.

On Wed, Jan 22, 2020 at 8:42 PM Revath S Kumar <rsk@revathskumar.com> wrote:
> +    <uses-feature android:name="android.hardware.touchscreen" android:required="false"/>

I understand the other flag you've added, thanks to the documentation
link you provided, but what's this line here do?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
