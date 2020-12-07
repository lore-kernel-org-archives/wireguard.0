Return-Path: <SRS0=iyUg=FL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA7FC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Dec 2020 15:13:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BACD2370D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Dec 2020 15:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BACD2370D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 327f39d9;
	Mon, 7 Dec 2020 15:06:02 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d50bb430
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Dec 2020 15:05:59 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6938a0c3
 for <wireguard@lists.zx2c4.com>; Mon, 7 Dec 2020 15:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=BU1Z1hY0yNQgJfCwTwnSVi2iDOk=; b=lA/oLR
 wfvGs2p0iTcy74x4FzBCXLXRCFioO+EMJ5qzWl1Niz98/YbeB6kAApFBPk/Otq3M
 68P1sFO82hiTQZMR5izeCUPao/SG6zJT9QFlX9AkLCxqqc9SZg7/O4suQKL4Fvm8
 WfaG6vJVuxKN7sea1CQr+cRF2m/G1Y686DQWzkPzIhk+9rK2ekLKtLza52s+8rP1
 qyUOLnvAfh9QxD0B+7LMuyE2lJuurSIPbkJCXev1eBIzvxQgjxqhoQrtggv87fUu
 Owya4/Y+G+k4BLpTBpdPUGz29f2Rc3zcowUGguCmnrmbkIvg6HK7LWUjsCd8eCN1
 KPtGna79Ad9YjnAg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 34823b53
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Dec 2020 15:06:45 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id t33so13292645ybd.0
 for <wireguard@lists.zx2c4.com>; Mon, 07 Dec 2020 07:13:12 -0800 (PST)
X-Gm-Message-State: AOAM530I9LLoAfUv5xhjhUIgbJmev2G0lvoIkEB2tfTarREUtWuL+3ZT
 MyR92Hz9CZ7hWF8C8vezVBx9dEQJKGSGTeTNCfc=
X-Google-Smtp-Source: ABdhPJyRiBGDGMRUhknqxoT/r6SKtwPuI6LJDmHrx/vKF2aZ0P8bp/DaE+arGt09qytLJZ2tJOAZm/RehwSpUXw+2VI=
X-Received: by 2002:a25:4744:: with SMTP id u65mr16200468yba.239.1607353992076; 
 Mon, 07 Dec 2020 07:13:12 -0800 (PST)
MIME-Version: 1.0
References: <bc1cd9b4-daac-4877-65a6-3fcf2ceeb980@53c70r.de>
In-Reply-To: <bc1cd9b4-daac-4877-65a6-3fcf2ceeb980@53c70r.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 7 Dec 2020 16:13:01 +0100
X-Gmail-Original-Message-ID: <CAHmME9rYpMx4g5R4Z5hwzdmCshNBVkLQEedWEd82Jot5nJw2pQ@mail.gmail.com>
Message-ID: <CAHmME9rYpMx4g5R4Z5hwzdmCshNBVkLQEedWEd82Jot5nJw2pQ@mail.gmail.com>
Subject: Re: Progress on resolvectl DNS fail
To: Silvan Nagl <mail@53c70r.de>
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

Looks like this is now fixed:
https://bodhi.fedoraproject.org/updates/FEDORA-2020-7851982ff6
