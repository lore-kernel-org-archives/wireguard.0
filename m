Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C0FC433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:03:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B269E2073E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:03:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="doIot533"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B269E2073E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58f201dd;
	Wed, 17 Jun 2020 07:29:38 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ec970815
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 07:29:36 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5637476
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 07:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=gK+xxWCztGSG3fuaC/lwMMM/Fqg=; b=doIot5
 33B5aXVJd5Q8lmp9r1Yl7LuYWRQT6YbNVBPVKxyl7EOTYSyQo1/YtE/TLq78so4D
 a6wSOlLXaAik68Iu8z29q6VQFgVUSgOxTdXVmm2N40FZf0MLQSoF59DeKg3v0mAL
 X8IpskTZ+3AP3DKHyaPZGS7Q+UBkYX+9oBFpGDci1qxWz5iWiTfsQxlJBjH/3t6S
 Egu3SJOcEiC4JY8QFEL4scHnQ5DiRD742pj6ehEsZVQTqyA1VIGkHauD+64IJw7U
 hOBR6evLUq9ROJHYnaFymhGxcmmILZovpucIUa87J4t585BN1IdrER/2Sce2jRFb
 R0NQ0HUZyClpc0aA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7ec9e951
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 07:29:35 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id l6so1252621ilo.2
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 00:47:39 -0700 (PDT)
X-Gm-Message-State: AOAM532Dp6D2i/QvwNRtCMB0dwt+BtCKQ1NvuCFZd4hnt4D/J1cTgqF4
 btB5jXQvZjKg9O4xoADjTrRUsDHcz5URQb2idOE=
X-Google-Smtp-Source: ABdhPJy24lbjYWDt4XZqSIkcI1VdQAMfrsC2MZ0t8KxKAVEpt6aX5rDSv2vLcJPsXZxKt28YF0U++Iq2NVjgJbNM/qU=
X-Received: by 2002:a92:2515:: with SMTP id l21mr6773240ill.64.1592380058725; 
 Wed, 17 Jun 2020 00:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200528184510.51675-1-contact@garrit.xyz>
In-Reply-To: <20200528184510.51675-1-contact@garrit.xyz>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Jun 2020 01:47:27 -0600
X-Gmail-Original-Message-ID: <CAHmME9pt7itFsXQnU=9LeRrcT5Yh7gd97bghOA-5a-nCvo85UQ@mail.gmail.com>
Message-ID: <CAHmME9pt7itFsXQnU=9LeRrcT5Yh7gd97bghOA-5a-nCvo85UQ@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: add restart command
To: Garrit Franke <contact@garrit.xyz>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Luis Ressel <aranea@aixah.de>
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

Thanks for the patchset. I'm wondering what the intended use case of
this is. When do you need to set the interface down and then
immediately up again? Most changes to the config file can be reflected
with a more simple:

wg syncconf wg0 <(wg-quick strip wg0)
