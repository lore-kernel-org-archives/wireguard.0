Return-Path: <SRS0=V78u=MZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96E7C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 14:02:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 254716023B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 14:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 254716023B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa82656b;
	Mon, 2 Aug 2021 14:02:22 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 66a59c26
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 2 Aug 2021 14:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1627912936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RaczUVob41F4/U6HLPbNVzJd9SkD6xaTgAQ0+dhbing=;
 b=ECq/X+aKZcZxGklthijgdNnX+5LruWvNkekULJEsi1sNXo3ixlvYlwAp6NhCkzEpBoAtE3
 AzlS6jbKv4v1bMEWFqdvW5C3nl628fY29dDX6Uwt/zY4GL2IcYPeEcUPvebKtrVPP8NO0a
 o3IlJn0OTmDWc2RUd9e668FPrlZFJO0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 74f6601b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 2 Aug 2021 14:02:16 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id p145so14004862ybg.6
 for <wireguard@lists.zx2c4.com>; Mon, 02 Aug 2021 07:02:16 -0700 (PDT)
X-Gm-Message-State: AOAM532F4m/p9Lo6jQAUE+osZd1Is0DsU8B7s0nGFQPapSrnyHLlwFjK
 AW/HnIXMqe+E2vGPLq+IBGNegWlTQsfAJClWwsE=
X-Google-Smtp-Source: ABdhPJw5K396WJ03J52dzRQx0IzpaMkhTdx4atLSm/GNibRqw5MVfrZmC6HjzZ//tb006mHLOr8hJCnx0F9j41Yeau8=
X-Received: by 2002:a25:694a:: with SMTP id e71mr21293792ybc.49.1627912935764; 
 Mon, 02 Aug 2021 07:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <DS7PR07MB7591F166B9EC0B30DB10D5B0CF189@DS7PR07MB7591.namprd07.prod.outlook.com>
 <DS7PR07MB759127E1827ED9A3CBB69D43CF189@DS7PR07MB7591.namprd07.prod.outlook.com>
In-Reply-To: <DS7PR07MB759127E1827ED9A3CBB69D43CF189@DS7PR07MB7591.namprd07.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 2 Aug 2021 16:02:04 +0200
X-Gmail-Original-Message-ID: <CAHmME9ou1pO-FUm-nVjj-D+cnj-Ut=XSTkXoVRX0aa=zaR0JHA@mail.gmail.com>
Message-ID: <CAHmME9ou1pO-FUm-nVjj-D+cnj-Ut=XSTkXoVRX0aa=zaR0JHA@mail.gmail.com>
Subject: Re: wireguard command line, dumplog and GUI pop-up in 0.3.16
To: matt spaethe <mspaethe@outlook.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

wireguard.exe /dumplog > log.txt per the documentation:

https://git.zx2c4.com/wireguard-windows/about/docs/enterprise.md#diagnostic-logs
