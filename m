Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE32C64E69
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 20:59:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F4AE24181
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 20:59:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="fpojHyRg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F4AE24181
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34a68800;
	Tue, 17 Nov 2020 20:54:39 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7b43a470
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 20:54:37 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e219570a
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 20:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=u0cL9NhxzU5JUzmS4WVFQ7ffZTM=; b=fpojHy
 Rg+KU1IkxnlAVqMtyXjzaHREAh/FUNNOJItK+bj9rZz/0XiRNBHSxdZ5bCFEAB5p
 ON6yMVMHoZKrEL2+/SmaMSnHo013we7vB1PNTCBFQcIsqoDZHJ2HKK7A90ngSKB7
 iTG6kTAzobmSCBaNjxfxL6DX027ejkMTMRgIZUzGTrMOaW3x1Tlrs2saoRpy8QmM
 AqmpufHsbQUYwFUcc9Wo7JNjQuiZokbzUvmV9PpO6YcgnQi65Rrk2mZ3zBQzMcyV
 RI7f8fFW+SafkUEk2+ToWGsYbmLYjiXDm48QuLta2RaPVJPwCDNcDKcWLiHnKHHg
 HmNTWOwhbDkr7UBw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 89d8935f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 20:55:23 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id t33so20329986ybd.0
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 12:59:16 -0800 (PST)
X-Gm-Message-State: AOAM532CcZRru370E7jo5HT1Njgo03ijEtqsvNotEHJqCnhZfygxJpuc
 0FpH8nSDMnnuiyfnKMuNK8RoOyzTMcQLaL0VM4Q=
X-Google-Smtp-Source: ABdhPJyXz5wb/1d2uKQkHeo6yyPHB0+FA9br7A1fQi8wL29srwlIMAoJ2Vzr6PcOUIkQuScHAG7X6hzHQ+qmTVfOR2w=
X-Received: by 2002:a25:df05:: with SMTP id w5mr2893165ybg.20.1605646755833;
 Tue, 17 Nov 2020 12:59:15 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuvDgxsr99R2qiOrXM20btnvnaiyAx7197jfcTauOt5CTA@mail.gmail.com>
In-Reply-To: <CALaUSuvDgxsr99R2qiOrXM20btnvnaiyAx7197jfcTauOt5CTA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 17 Nov 2020 21:59:05 +0100
X-Gmail-Original-Message-ID: <CAHmME9oeZc7cruN2fayu+F+8BO0RiwGuA+dqzQRr5spnvhY6GA@mail.gmail.com>
Message-ID: <CAHmME9oeZc7cruN2fayu+F+8BO0RiwGuA+dqzQRr5spnvhY6GA@mail.gmail.com>
Subject: Re: WireGuard for Windows failed to start after update to v0.2.1
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>
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

Hi Joshua,

Does your subsequent email obsolete this one? Trying to keep track of what's up.

Jason
