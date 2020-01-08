Return-Path: <SRS0=e2pA=3E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A92C32771
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Jan 2020 18:13:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 799742187F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Jan 2020 18:13:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0PcIuK4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 799742187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2b41bd3;
	Wed, 15 Jan 2020 18:13:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0873a16d
 for <wireguard@lists.zx2c4.com>; Wed, 8 Jan 2020 08:16:19 +0000 (UTC)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7a5d560
 for <wireguard@lists.zx2c4.com>; Wed, 8 Jan 2020 08:16:19 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id x8so1185165pgk.8
 for <wireguard@lists.zx2c4.com>; Wed, 08 Jan 2020 00:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :to; bh=Z3Ed0MznphfjkW/7NsDwNd7zPU7DyCLIEbdvYkSu8rw=;
 b=H0PcIuK4TwHe8k/PacG8JImg114Ntvl8meoaRH66oMEH55AaDDEwVCKuaW/QJQ1iJz
 mffRZwLgNKNhlDvXMaoIywbp44FKawUzsgea8fRCQBKAF6kzptCV2MXrFXX37u3aCkGq
 9pBBh4rqfo00cWPkMK5I1SqiOypvgI8fkOibuVpQMoAS+BVjk0ps8/RUG9TmjUPdahGi
 r9Z4cuulIpltjtC9KQaEh00Ibr8QjMHMpATcWjUxBWFX0MBNXXD5wpeRe8lU5CReFDKA
 feML3aubD7dwzieseMRqrabzL0dJe3jMoTnHkKdNAuFproXA7BUA7dpYe4cOoOsy6txG
 CnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to;
 bh=Z3Ed0MznphfjkW/7NsDwNd7zPU7DyCLIEbdvYkSu8rw=;
 b=KmZ3EkLRWPjDSjWoG2g9JkBVUda4AukCkXpQQHkOL/+vhrAu04DMP1KUKBlOCQxgRn
 QwdM3fWf4KnuhR9MFVp8IomTw3JjUhCkGNntvg/PxPfcwOlkBNRI6jDhJOGRO+7ifycW
 T9MnV5enImvUh02x/r/mdagMEN+sz2lQX8nnkuPiAf9rTkCuLGZ5C0cbS63yjL5div7y
 e4EAZCOHwLBeIrYUVNnzuM+zPzXb6iAD53K8r3rl4ANX1xO6hRaht2PlhuVjg9zQe4SC
 y56xXHyzpw0FPlye/oyEAw0pdiK8UOxh5mI9RACN/IUcCysSvamGtyN+BUwiWXWsh/5l
 tsEA==
X-Gm-Message-State: APjAAAWI+/VtAnEHJrMxTxMuiOooXUNqUGIKgXvghxCde/yn5iTrJiBP
 t01TPTQF0CZ+T0madl9iAoCup15S
X-Google-Smtp-Source: APXvYqxqEqP+xxsxhBpWrS7O6Wdbn32FzjZGc6sOUZpdxT1XLyNLA55AEPSHbqgTA4aXK/ePIV9/zQ==
X-Received: by 2002:a63:358a:: with SMTP id c132mr4094722pga.286.1578471377589; 
 Wed, 08 Jan 2020 00:16:17 -0800 (PST)
Received: from [192.168.8.100] ([1.200.35.123])
 by smtp.gmail.com with ESMTPSA id x197sm2415012pfc.1.2020.01.08.00.16.16
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2020 00:16:16 -0800 (PST)
From: Birdman Hsu <birdman.hsu@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 8 Jan 2020 16:16:14 +0800
Subject: Supporting Trad. Chinese for WG clients of Windows and Android devices
Message-Id: <054A2AA7-65E6-4CBF-8051-B64855290234@gmail.com>
To: wireguard@lists.zx2c4.com
X-Mailer: iPad Mail (17C54)
X-Mailman-Approved-At: Wed, 15 Jan 2020 19:12:59 +0100
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

Hi!

Kindly add the support for Trad. Chinese in the future releases of WG Windows and Android clients.

Thanks/Br, 

Birdman Hsu 

Sent from my iPad Pro 10.5!
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
