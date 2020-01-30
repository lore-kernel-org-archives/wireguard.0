Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B779C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 17:32:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B18AC20674
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 17:32:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTO9ga0v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B18AC20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04997e2f;
	Thu, 30 Jan 2020 17:31:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6caa69a1
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 17:31:47 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe2ba462
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 17:31:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j104so5110842wrj.7
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jan 2020 09:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=oVDaJmWlEt70yoo+FstZGQRfVf3lpzoFJE9+WItLgJI=;
 b=TTO9ga0vdA/+b3GMxPqSIqLEwIfr8CX5x8yOG9fTbh/0zbCuRgcW8o9ik5XiG+RJck
 Qc1e36nxdVL8LsQZ2hNIIfBHV7uomHpWPrqWmkzusdMqUG2UyM8S+8UGhHxR87bOx1SS
 lrmiP33pRmpcWlX81+YimGAeECKDHeVpJueRLMgEBfaOX0WQ7qh6QAv20hik1DnL09kC
 LWh0q3MKK0U0pQQEpMihkWY3F4QI1tUxfuQNwsaJm3kRakGpdpDGy9Bh1XvjHWXNpFE2
 FQ2j6qMAzBDHkmy+6SK+skSyKPalBUGtelvVlmDNq7I7ZDZ03kcWCC1vrXnR2UU9E40V
 UE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oVDaJmWlEt70yoo+FstZGQRfVf3lpzoFJE9+WItLgJI=;
 b=GQqqbNh38Pot4k4v3x4ORxhBVKFoK3fPQt9e/M5W/186KsoJulUuaZo8nNu9j+oNPk
 YkzF0SiuuUry+Q4LImSEXmubIqazQbdGkS3LwIo+pEBxFAHY/NLwdl+B7meuJRx6I3/g
 4SmpT7Nz7LjyoXPmqvqdvtWzBsNTLziKWoTRu4CDfEtqLmhUe2mARF1gkEF48qsKubp4
 cCfSsw0A2a8s4QtJuEjIMc2OdfnZwO1ouvYU5Ad2nKZf9O2uXIx8KQATaEvnD1fGwqzZ
 1/hLwL+CQUd5c18d46Nc1+mIG6fou13QcznHZxpMYRjLYKZaZx/l6A3OnipTr1yWVGLo
 orkQ==
X-Gm-Message-State: APjAAAV1L6E/+9dq+9MewOouWwpCIE5YYF35grim0q0ha62Z0/+yyvE1
 Aqn2MZv2EbUIXa0CNGgVgmQD4GVM
X-Google-Smtp-Source: APXvYqwUcfzrgTWpabFDGpGHEeFhTAy1q6mrq0RA7ZhL/COrX4Yylx1REOKU+AfB3y5RIFR4G+OFQw==
X-Received: by 2002:a5d:62d1:: with SMTP id o17mr6942957wrv.9.1580405514973;
 Thu, 30 Jan 2020 09:31:54 -0800 (PST)
Received: from [192.168.1.100]
 (host154-183-dynamic.252-95-r.retail.telecomitalia.it. [95.252.183.154])
 by smtp.googlemail.com with ESMTPSA id s16sm8419973wrn.78.2020.01.30.09.31.54
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 09:31:54 -0800 (PST)
Subject: Re: Wireguard is now in Linus' tree
To: wireguard@lists.zx2c4.com
References: <20200129002159.GA9104@wolff.to>
From: Germano Massullo <germano.massullo@gmail.com>
Autocrypt: addr=germano.massullo@gmail.com; prefer-encrypt=mutual; keydata=
 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
 YljxTJc=
Message-ID: <b8cf1c3b-e9e6-2141-4b63-3cf11f0adaec@gmail.com>
Date: Thu, 30 Jan 2020 18:31:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200129002159.GA9104@wolff.to>
Content-Language: en-US
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

Thank you guys for your work, this is an amazing news!
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
