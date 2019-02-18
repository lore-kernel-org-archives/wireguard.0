Return-Path: <SRS0=e3Y3=QZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEFBC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 05:10:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 032F7218B0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 05:10:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="mUhHKZpW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 032F7218B0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52d03656;
	Mon, 18 Feb 2019 05:01:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a26ac3fb
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Feb 2019 05:01:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8bdf7001
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Feb 2019 05:01:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf4a0611
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Feb 2019 04:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=i69ISpo9zCoJXzDeX+XiTdAE5+g=; b=mUhHKZ
 pWUZiFOka6+ysGsJJUB6G83CwsC+bXoOGOiWNvp2N589ZDeZSVSTUfQLB1TV0Wgy
 AInqpYFzP1A/lwURD0sI4lcHykuQFvIdsCUvWFTojNQ9PHS3kfdemmdasjDK7Xf6
 NdRcMDE2gayGlFG1v96yNK1rLkiyqSK/06bPoJxhjyqZy1Xaji4WcSJ4VXNJwzSD
 BlGpfCMF10u90tdzpY6ajXHYlQokw7UmhMWFqRDHFUPPsS8lN/BtQQSgVIIZgqbY
 aQCN39QJqn3gjbc/Cbrztn0VQeD0HwejUnS7yGr/kAAwKM7w3pfLfAcfPjciuWrq
 7JNLLTFRj83JokiA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d60496b1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Feb 2019 04:52:26 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id i5so26209490oto.9
 for <wireguard@lists.zx2c4.com>; Sun, 17 Feb 2019 21:10:02 -0800 (PST)
X-Gm-Message-State: AHQUAuaNnY33wknY682X14LFEGXs1y94/jiuLdiva5AGPiqKILE4Oc4A
 Yg8b8b7xifqQ78T5KjrPm8AtFpCT+b4qusvCSYc=
X-Google-Smtp-Source: AHgI3IZEgb40ApGnxiBd8Bigh/4X+oKD8G5KPjBVweSS7962L5SulWRF0XWPtEqwKN8cNEUNrXz974ve/+2ququE+i0=
X-Received: by 2002:aca:4506:: with SMTP id s6mr13485629oia.115.1550466602081; 
 Sun, 17 Feb 2019 21:10:02 -0800 (PST)
MIME-Version: 1.0
References: <CAM3m09Qfi3a+zZ6KKxxT0q7rDopUYhYFX9JT-wSgsLvQCELY7A@mail.gmail.com>
In-Reply-To: <CAM3m09Qfi3a+zZ6KKxxT0q7rDopUYhYFX9JT-wSgsLvQCELY7A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 18 Feb 2019 06:09:50 +0100
X-Gmail-Original-Message-ID: <CAHmME9qu81sEp9Vg+dVLdbxbCrNU1XijqFZLkMx06-E_iZ7GGQ@mail.gmail.com>
Message-ID: <CAHmME9qu81sEp9Vg+dVLdbxbCrNU1XijqFZLkMx06-E_iZ7GGQ@mail.gmail.com>
Subject: Re: Netlink Protocol
To: Ryan Whelan <rcwhelan@gmail.com>
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

https://git.zx2c4.com/WireGuard/tree/src/uapi/wireguard.h
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
