Return-Path: <SRS0=4XTf=PR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12FAC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Oct 2021 14:27:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F10F61175
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Oct 2021 14:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F10F61175
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ab271e0;
	Fri, 29 Oct 2021 14:27:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c0f2ab19
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Oct 2021 14:27:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5960660FC0
 for <wireguard@lists.zx2c4.com>; Fri, 29 Oct 2021 14:27:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="h5pbQNL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1635517650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QnWkyN6KGUfNiy5qk93ywFf1HQovAYF4w85+8oNqIOw=;
 b=h5pbQNL/W0oxByC5nvKmb9PSHqsXw1BVkB3Vy7zcnlpyiayS4KdCQHCK08qaZkRGeHRh35
 JperHsXpJ0gcLgexSqp5qMRq9SjEGACqdoeE2kTKivTsvwh5mZ6hZPtTJI2H36ao4oSwuJ
 b6PcKfJzQcKenUpetv/UoUr1xG23Cko=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 94030090
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Oct 2021 14:27:29 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id a129so11545771yba.10
 for <wireguard@lists.zx2c4.com>; Fri, 29 Oct 2021 07:27:29 -0700 (PDT)
X-Gm-Message-State: AOAM533p66Z3mfb3R7ffKya89fVYTlGPfPR5F35o5N9YCp2ly05K67I4
 UlwaEurVgJpPvnp2pguU8hyqYloLM5UORui17Jw=
X-Google-Smtp-Source: ABdhPJzppDmksYWOAYQDlFsf24rGw4CsBIkDXLIIUOvgUCnYvBmovuZkegEbO8TM7O5PotQ+r833GzYmOzoln94qAhc=
X-Received: by 2002:a25:ba0f:: with SMTP id t15mr12765514ybg.62.1635517648595; 
 Fri, 29 Oct 2021 07:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <1635469664-1708957-1-git-send-email-jiasheng@iscas.ac.cn>
In-Reply-To: <1635469664-1708957-1-git-send-email-jiasheng@iscas.ac.cn>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 29 Oct 2021 16:27:17 +0200
X-Gmail-Original-Message-ID: <CAHmME9p9EA0qCw2ha_X9HR7NWSt1Zam4+srYHCs=-U4LvQiJdA@mail.gmail.com>
Message-ID: <CAHmME9p9EA0qCw2ha_X9HR7NWSt1Zam4+srYHCs=-U4LvQiJdA@mail.gmail.com>
Subject: Re: [PATCH] wireguard: queueing: Fix implicit type conversion
To: jiasheng@iscas.ac.cn
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
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

On Fri, Oct 29, 2021 at 3:08 AM Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
> It is universally accepted that the implicit type conversion is
> terrible.

I'm not so sure about this, but either way, I think this needs a bit
more justification and analysis to merge. cpumask_weight returns an
unsigned, for example, and is used as a modulo operand later in the
function. It looks like nr_cpumask_bits is also unsigned. And so on.
So you're really trading one implicit type conversion package for
another. If you're swapping these around, why? It can't be because,
"it is universally accepted that the implicit type conversion is
terrible," since you're adding more of it in a different form. Is your
set of implicit type conversions semantically more proper? If so,
please describe that. Alternatively, is there a way to harmonize
everything into one type? Is there a minimal set of casts that enables
that?

Jason
