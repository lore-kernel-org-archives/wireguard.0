Return-Path: <SRS0=hP/g=5B=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B368C0044D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 19:31:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7018620674
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 19:30:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lBDAeO2Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7018620674
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 304528a0;
	Mon, 16 Mar 2020 19:24:24 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9ad10a1c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Mar 2020 19:24:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a890c0eb
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Mar 2020 19:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=U2GTgDtESgMUaZUrD8ykJjCcFYQ=; b=lBDAeO
 2Y9ra0Cl20FFGQpa4PVHWHdc+BJC4vypef/YfofXx4roMq3/kYM2zJViq6UgAR0A
 ajAdj8PWEx4OYLUTL6KGof6lYUWHQFYluTk4vcrqOId939FhnWYi1Ea9SNcvfvuw
 WljWqggFUNqTy+vXNVBE4SQbL5QfrQA6Gl4GJdMLvYWcv7308jrMCS0Z/bzd3x3d
 DLrwXdbbGtDCsv4ZvdARWgEh1PA9ya2dqv20L1LKtiBFpVgx2SICAULr7KAqNMzH
 pu49nJZBbj9U4d+/o+kmbK8Us72DEpHiqm1tH2TzRVXyWEQ3oACGdjlz8UZEdFSJ
 S2cmfmwiOdV2SYxw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id da1fba21
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Mar 2020 19:24:21 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id d14so17186539ilq.10
 for <wireguard@lists.zx2c4.com>; Mon, 16 Mar 2020 12:30:29 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2yWRKJo/u15MIV3HaGEVcaq5rV0I/9dMNfZY2RMjUqrkzq8Fnu
 xMX5pIxjRftavbjuOSDlcB/f79EgHF+qVlbO0MQ=
X-Google-Smtp-Source: ADFU+vtvP+4VYvQbyUYIVa+zrlycRZOBGvcj1xjtpYez4SRfyaJj8VXLP4MZ8YwYvJTD0pkmKokIVQlLb++pRDnSLrI=
X-Received: by 2002:a92:7f04:: with SMTP id a4mr1337824ild.64.1584387028534;
 Mon, 16 Mar 2020 12:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200315141659.771e0088@opal.com>
In-Reply-To: <20200315141659.771e0088@opal.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 16 Mar 2020 13:30:17 -0600
X-Gmail-Original-Message-ID: <CAHmME9onNwD9+hw2LgzZg_OqN21mOPEyQ9wAsFGjTA6=mK7xgA@mail.gmail.com>
Message-ID: <CAHmME9onNwD9+hw2LgzZg_OqN21mOPEyQ9wAsFGjTA6=mK7xgA@mail.gmail.com>
Subject: Re: Logging
To: "J.R. Oldroyd" <wgrd@opal.com>
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

Hi JR,

Adding direct syslog support might make sense. I'll look into
integrating those files you sent, though, perhaps it'd be better if
you submitted those as a patch to the mailing list with a proper
Signed-off-by line? (Or even to Github?)

I'm curious to know: is there a reason why you prefer this to something like:

`LOG_LEVEL=debug wireguard-go -f wg0 2>&1 | logger &`

Jason
