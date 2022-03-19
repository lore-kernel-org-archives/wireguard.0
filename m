Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3059C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Mar 2022 00:52:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3681ef86;
	Sat, 19 Mar 2022 00:50:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id afb74457
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Mar 2022 00:50:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7AEB961735
 for <wireguard@lists.zx2c4.com>; Sat, 19 Mar 2022 00:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F92C340ED
 for <wireguard@lists.zx2c4.com>; Sat, 19 Mar 2022 00:50:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="np3jgBd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1647651021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Dxn0GUYQuQUf+SN3o7RzjEhopyWr5bx4GCJ4F+11gA=;
 b=np3jgBd3TIOs8tYmcH7lBIjusJwNC7A8PXtgRMI4GCPh/KTwILKGf09ZX26UivQMf9GFhk
 nLXVfR2+WRG2L2IOl1PoZChWAcZLJ69JOaR5ZHs2cQf5ifB1YKLk8An9w+eP3XowYcRC7j
 yUzHWRduSSUNVpXWou5eUgZQ3B2CnxE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c347e6cd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Mar 2022 00:50:21 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id y142so18593483ybe.11
 for <wireguard@lists.zx2c4.com>; Fri, 18 Mar 2022 17:50:20 -0700 (PDT)
X-Gm-Message-State: AOAM531gvDjYiwCNNNRuHjLhU7qpJPpOCaeBUnHAILSdil18OxSsb7EJ
 2gAlB2OP5aa/p9kq5g5ccVweGFg1SZZF0/+PX/M=
X-Google-Smtp-Source: ABdhPJzL4A9+JkaFqFi/vZdoGr6znBdnHu5K5+nIAwvIFmo7bFzaB7fod9A1VbejNa3P2CICYALEOJ72XCEpZbk0JRU=
X-Received: by 2002:a25:4cd:0:b0:633:c9af:1af2 with SMTP id
 196-20020a2504cd000000b00633c9af1af2mr3255451ybe.271.1647651019781; Fri, 18
 Mar 2022 17:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220319004738.1068685-1-Jason@zx2c4.com>
In-Reply-To: <20220319004738.1068685-1-Jason@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 18 Mar 2022 18:50:08 -0600
X-Gmail-Original-Message-ID: <CAHmME9rUrWE=AtBhTo95GfCeQCMoRh_KMSOKfpTVpq-7LywMzw@mail.gmail.com>
Message-ID: <CAHmME9rUrWE=AtBhTo95GfCeQCMoRh_KMSOKfpTVpq-7LywMzw@mail.gmail.com>
Subject: Re: [PATCH] net: remove lockdep asserts from ____napi_schedule()
To: Netdev <netdev@vger.kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Saeed Mahameed <saeed@kernel.org>, 
 Eric Dumazet <edumazet@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>
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

Hi Jakub,

Er, I forgot to mark this as net-next, but as it's connected to the
discussion we were just having, I think you get the idea. :)

Jason
