Return-Path: <SRS0=Sa1Q=NN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFE3C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 12:10:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B06A2204FD
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 12:10:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q0ea5/AU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B06A2204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5bd219f3;
	Fri, 2 Nov 2018 12:06:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa6439d3
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 12:06:56 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f51ea69a
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 12:06:56 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id e22-v6so946594pfn.8
 for <wireguard@lists.zx2c4.com>; Fri, 02 Nov 2018 05:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=w+8G4JUVybL5dWM17yV+iNIxoLcqXUdEKaUtzMpOIAI=;
 b=q0ea5/AUhi4fdX8PAAqhHyw+DTHVMLAVVDUmLkha4a9d7UJzHAvyAIzLgBI8N9iTy1
 uFXiLPSuCG/LZtrNrwfS3AzybSnnYLGlMVZVD7cgOLAnZXbc121+u3chDeyLCO2QwP4x
 C7qGBvkKxex6BYyJAFlX+CJHtHsAiUYhhSmB6oewz7yrS6PW8eHUuz96HzGywmLAqFY2
 knlNeSpEizj5imggLk3Q4fpD0NMCvgJZR8YlLGbmCQjbWC0UsxEaVZjlFTYgE6K24rpb
 NNxWIGYF2pnvBRV0PQIIQwcjdkpwldSQHdpYa8hCFTlXiS6UczT/cz9+u4UmbSpTx3V0
 q7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=w+8G4JUVybL5dWM17yV+iNIxoLcqXUdEKaUtzMpOIAI=;
 b=YPV/B/7U44JdkVvvH70K+URR99sQ8IyygW6DjrK+jc+D83YTamIg+FJoOedB8TYuIC
 JJpy63REx1XPFQz0w5beA+BTNLxEDo7qg8cE6Phm/czU40WfM3ZT3EmYLJPOMm3bxgzE
 RYh3jRfK3Js6y5tn1s/MriYohy+6vR8scblScF8eLyKKZ8PVgcQoKl50qj+FGQ2KqZzc
 ID4NiPGpxv4l9IB5S03W4cbgrA74kbwt3pIdw+jYWMLl6YmxSzTiOIPYH+AR7Hwl1GM4
 hfaX33cBSJwqVHAsIz5+6l+jP8rCRdioBe1cw06yUvmY/IyW5cUqgNPcxljUkyBWweMc
 5hpw==
X-Gm-Message-State: AGRZ1gJKBZeCEB1L0NgXOaEOYAja2Zgde2oicSiLHjnxQmmgWCRH+qEM
 50ytxgcSmDF67YVhDdsZFQ8=
X-Google-Smtp-Source: AJdET5fh4eAlDXW1hfKAtuFqeGxuSf6H6oB97l4rCBY+GWCL25g6n+U+sPQ9de/1UNmLBjr7Zzbzgw==
X-Received: by 2002:a63:ee4c:: with SMTP id n12mr10385969pgk.21.1541160645948; 
 Fri, 02 Nov 2018 05:10:45 -0700 (PDT)
Received: from sita-dell (static.133.162.46.78.clients.your-server.de.
 [78.46.162.133])
 by smtp.gmail.com with ESMTPSA id p15-v6sm28168547pfj.72.2018.11.02.05.10.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 02 Nov 2018 05:10:45 -0700 (PDT)
Date: Fri, 2 Nov 2018 17:40:36 +0530
From: Sitaram Chamarty <sitaramc@gmail.com>
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Subject: Re: F Droid build 0.0.20181031 broken
Message-ID: <20181102121036.GA29314@sita-dell>
References: <CANcuY=qyERAxMcREiBJutdYbGX-tJPMhUdmxN_=TwQHiamiaNw@mail.gmail.com>
 <CAKXLc7ctgDjAKSyB-DaET8spbgnF9hpf4uBKbRwZY_jVb4YZvg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKXLc7ctgDjAKSyB-DaET8spbgnF9hpf4uBKbRwZY_jVb4YZvg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Fri, Nov 02, 2018 at 08:39:28AM +0100, Kalin KOZHUHAROV wrote:
> On Fri, Nov 2, 2018 at 8:26 AM Laszlo KERTESZ <laszlo.kertesz@gmail.com> wrote:
> > The current FDroid build (version 0.0.20181031) is broken. The Gui starts but it states "Unknown userspace Go version" and the tunnel activation action results in an error.
> >
> Hmm... just installed (1st time) and started it, seems fine (haven't
> configured it yet).
> What is your configuration?
> 
> Here: stock (no root) Android-8.1.0 (3.18.71-perf-gd0e0d1a kernel) on
> XT1905 phone.

I can confirm the problem, though the error I see is different:

    Error bringing up tunnel: No implementation found for java.lang.String
    com.wireguard.android.backend.GoBackend.wgVersion() (tried Java_com_wireguard_android...

(I'm sorry I have n o idea how to expand that message to its
full text, whatever it may have been)
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
