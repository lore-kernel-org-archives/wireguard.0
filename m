Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609CEC432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:28:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0F612068E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:28:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="hn3vAuz3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0F612068E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1df105c5;
	Wed, 27 Nov 2019 12:26:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91d26d1c
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:26:29 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7ecb145
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:26:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75a607c1
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=UukKy0Trb1ue43r4ROHh+wiaAA4=; b=hn3vAu
 z31o+AlQuh7rLqtHUreU8FyqpNabf3RxZKC4lTSMEJZh74WGaPY2shRwC1AMVSxp
 7TsxNoKieJ53Aj3fata34LvmKpkLgAT0kdgteDgWcGSm/hs3m5F90wXW3YfvvK7q
 1jsBGrhgfh8GF4MjYUz5giucPhkzhMtC1xCfQwhxJG8/voJ97bnAfXFjHggX5NN8
 9FEw/wUHj9Q5/PnBPLSGadGhiNUX5vPxaVB8MsBBIHAXKcLdHZuZ9m+cql5X+Ual
 OwTIi+261kEyRsD0AnBHCxOm2ImN+hNvdqJVReAIwfgtanmpvAq/NP2xeD28hTn8
 JNjtbLBo7u5YfSIw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e876c24c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:32:38 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id r27so4376209otc.8
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 04:26:28 -0800 (PST)
X-Gm-Message-State: APjAAAUsQxgb2v/ZOVsv/n4zagMtznXzyz9qGYXVu8jlfKEWo5eiKRpf
 50dbyKveIUluoWjXK9Hq3GqVaSCGuuAoElMQ528=
X-Google-Smtp-Source: APXvYqxxYjQoAtte97U1qziXMmCnE/xC7AZ+c6H7DD6NsAhMVm9Q+tEK1/7OmSzKmmOqJHfWIqTXZFS4rARq5GyF8UA=
X-Received: by 2002:a9d:66d:: with SMTP id 100mr3411793otn.179.1574857588223; 
 Wed, 27 Nov 2019 04:26:28 -0800 (PST)
MIME-Version: 1.0
References: <CADWmdDc8o3Wuidwbk5-acTVGAWShHjMUm5nizBmrY=zpEHnq6w@mail.gmail.com>
In-Reply-To: <CADWmdDc8o3Wuidwbk5-acTVGAWShHjMUm5nizBmrY=zpEHnq6w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Nov 2019 13:26:17 +0100
X-Gmail-Original-Message-ID: <CAHmME9o9MpKH9nCpuf=McJzAxJh_eNony7Jht_aew=auM04HUg@mail.gmail.com>
Message-ID: <CAHmME9o9MpKH9nCpuf=McJzAxJh_eNony7Jht_aew=auM04HUg@mail.gmail.com>
Subject: Re: Wireguard iOS: runtime hardening prevents simulator builds from
 running
To: =?UTF-8?B?RnLDqWTDqXJpYyBTYWduZXM=?= <frederic.sagnes@gmail.com>
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

Don't we want hardening on iOS though? Or does this setting result in
a no-op there? If the latter, can you compare binaries to be certain?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
