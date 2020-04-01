Return-Path: <SRS0=FpfO=5R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46DEC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Apr 2020 19:12:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86BDE206F6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Apr 2020 19:12:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="idU6slmv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86BDE206F6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 546673ca;
	Wed, 1 Apr 2020 19:03:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 784d2759
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Apr 2020 19:03:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b82165a7
 for <wireguard@lists.zx2c4.com>; Wed, 1 Apr 2020 19:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ovvprIaFlTXTOigsLENoXFt7sZw=; b=idU6sl
 mvKas7eBbQNI9zP0K+R4U4aJUEz4xJi0OEGHO6weJRCwDwoD/YoWUGLggycut+9C
 E24zh6JCKdFdkSNbNC/8Gb5qhNbFsRk3rfJIjNrAl8KLQeWxnewJ1nZaUigP525P
 RcIzQelzrtVc1VPrbwQ0jrT0gH6FYONMB2jbeCbxtbuWPJnu2+7JlL8nrV9zwf6U
 jyAeOuTFcTrEDod+Hw4PlULqfdxvtRXKvMovfeFfTz1eH0Y1ydOiNOUQLQ5CzqgM
 fkCq4xEJmw+rjDxYptgZGqPlmWNskQzpPrurfTn5iMbuka4ASDpv96sS21mhRxxR
 SClSjgLt4R4wL3Cg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5df7ecbb
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Apr 2020 19:03:37 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id r5so1106936ilq.6
 for <wireguard@lists.zx2c4.com>; Wed, 01 Apr 2020 12:11:48 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0OS36R48If3NPTF7UUD2gy18SqViDwK0v0XFki3uMBAMnEVJ2v
 XWY4i7cQ8ruRzzRhtAd5ZbeehjJVrOkSb0Jwogw=
X-Google-Smtp-Source: ADFU+vtx06KWc1qBuWN5SZDZMZfp69kGssAiG1+e+/mZuHaHvHJTP8MhIvkH6+d7uihE9/yR2cqcSWAuTZC7gEgVqkc=
X-Received: by 2002:a92:cece:: with SMTP id z14mr23736848ilq.38.1585768307904; 
 Wed, 01 Apr 2020 12:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200401163232.154754-1-list@eworm.de>
In-Reply-To: <20200401163232.154754-1-list@eworm.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 1 Apr 2020 13:11:36 -0600
X-Gmail-Original-Message-ID: <CAHmME9pimpm-MYur0vA6BCTSkWUwdMtOwEcPHPRc-puE=CBVww@mail.gmail.com>
Message-ID: <CAHmME9pimpm-MYur0vA6BCTSkWUwdMtOwEcPHPRc-puE=CBVww@mail.gmail.com>
Subject: Re: [PATCH 1/1] queueing: skb_reset_redirect change has been
 backported to 5.[45]
To: Christian Hesse <list@eworm.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Christian Hesse <mail@eworm.de>
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

Applied and released, thanks.
