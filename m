Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31629C00449
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 15:55:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC432087D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 15:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpE7vs9A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABC432087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07a2a46e;
	Sun, 7 Oct 2018 15:55:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fa3ad61
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 15:55:05 +0000 (UTC)
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21bc25a1
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 15:55:05 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 63-v6so18150359wra.11
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 08:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C+GncDw3ZoHV4RIwIy6jPUmEhupM96NBK8Y9tLW73QI=;
 b=CpE7vs9AAlCyTY8IEPcc70h3AhPqha1yU5fZ3oi4ZFXIcWrFVv9kc/M6C7lak1Ucvz
 QiEGoz+SxMLC+5IcZOuILdTyv8cdudizmBuay6ekXuso4vmtwFTcv/8q2Z7whiLt9+m7
 ff6gaFCoxHEvq+uv6xh3Twdbd2jaRu4ZSgr68iGXFkyyZ5OMav4aCHvbD7aV5z+f/uQD
 LipyFfYgEVAvLZqxGlp1sW/AJIYipq9QO4b7x0BdGQoj90H2L2WA+GZ0jvD2Zewqkd7r
 5VoVUGKdZJP0KngDU3DXGVfBjMrJ0zGX+SnQq/WQTq6ng374fIcmgpvoRKgwvbV9tHKQ
 ooDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C+GncDw3ZoHV4RIwIy6jPUmEhupM96NBK8Y9tLW73QI=;
 b=SaPeTfhNK2elY5ua6qUR01258hSfCX0cBalnrBswIV09Y2ecJe2SDH+0ru4V9v4gG1
 4JlwdKNQiAFk1PMLrmzaapuF7gwbnb4JQBru7J3WKg4qdxUX4BVcIgtOyJdIzee9O2un
 lGBdjaaIvSjCcJfP3i6NrDIoe1T4hpOWXHZzVbspSqw6bHPzp6h66Sm+HTZLn+6ugSEm
 lbXUipiORGnmcusbgqEhpWXtjQOBKyfROa8FBmVjrrqsgcIBfq6XPX0uTiIZOh802qq4
 wr+wVpwfgpPnEj7m3q91PV++KwibSEHSHc9McVM9s+7ZRJmC5uqDFR9t1Ntg8/dncrV/
 NqRQ==
X-Gm-Message-State: ABuFfogcsSC2vurquUTxoErVBtlRF1aKGi2aJQJuHRyhwCbimfA8DuIh
 Il4DVt3IWHGek96RI4yZjgZF4jX1
X-Google-Smtp-Source: ACcGV61o5Ow06XSKd4mQqc41TbW9RF8mkBvnBKVGPI04iZJN1ubzS735AHtFex/oVLEpm5FOuZQF8A==
X-Received: by 2002:adf:b593:: with SMTP id
 c19-v6mr12436193wre.223.1538927743896; 
 Sun, 07 Oct 2018 08:55:43 -0700 (PDT)
Received: from ?IPv6:2003:c5:5f2a:9600:2289:84ff:fe70:d494?
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.googlemail.com with ESMTPSA id
 90-v6sm16695866wrg.86.2018.10.07.08.55.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Oct 2018 08:55:43 -0700 (PDT)
Subject: Re: [PATCH v4 01/12] device: protect socket_init with
 device_update_lock
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20181007141139.26310-1-ju.orth@gmail.com>
 <20181007141139.26310-2-ju.orth@gmail.com>
 <CAHmME9oNpVomYDhh=fdYFKLEALWB=9zgCXJX0_9Y8pzH=L1Z_A@mail.gmail.com>
From: Julian Orth <ju.orth@gmail.com>
Message-ID: <dfc13e1a-e2f8-a3cb-0146-8a94c95187e9@gmail.com>
Date: Sun, 7 Oct 2018 17:55:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9oNpVomYDhh=fdYFKLEALWB=9zgCXJX0_9Y8pzH=L1Z_A@mail.gmail.com>
Content-Language: en-US
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

On 10/7/18 5:48 PM, Jason A. Donenfeld wrote:
> set_device takes rtnl_lock(), and ndo_open is called while holding the
> rtnl lock too.  (Try adding `BUG_ON(!rtnl_is_locked());` there.)

I've confirmed this and will remove this patch from the next version.

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
