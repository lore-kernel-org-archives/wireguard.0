Return-Path: <SRS0=V78u=MZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAF5C4320E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:18:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFA0160F6D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFA0160F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grsecurity.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0980bf51;
	Mon, 2 Aug 2021 13:14:15 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9e5dac2e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jul 2021 13:33:11 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id t3so28023106edc.7
 for <wireguard@lists.zx2c4.com>; Tue, 06 Jul 2021 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=irKfGX2RsT4taB2Ay2ruxMgjZ2hQB9SZeYO2LZqVSQs=;
 b=TwNnu4GVXNl0Y+Qrr+XDscc4QzKbip2fqQ7L9p9DCkTjRvjKyljCTwto26eIYw45WX
 vOQ1yO2czccT78BNRxEBMV9sRRBzlCXOvaI1pNuKUQdWYBpNtveZZjho0o+NRuph0GMt
 2OJj+0U9HeMglU0OGkhXX5t7rQQNkGrk0lqMojUqjz44q4kOvVl6ifWegPBN6wN+O12N
 r2Im/sADWAsz4BOlsII0WbhZVm4Hu5zUXqharC6PbMj9akW71/aGKUnC/nP+W3UZN0CY
 /z7+LyKIXQQI+/cUNMV5mqGBEaAktwOMiEeOBrrIo9ONGijix8AFasx2/NKfvj7rOKLY
 tgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=irKfGX2RsT4taB2Ay2ruxMgjZ2hQB9SZeYO2LZqVSQs=;
 b=LvrTnQBj/pf3HAn4eyDWKdb+SqQPxZIa2clV2t2DlJIM0dN3df7af1GQGUZk3D7Ams
 yQh3IcRwHE84l6nNL6Tt5SREMAByvRJ5G2M3pQP8FyJXc18c8w8rTVB2Kz90qVRdJfdE
 pXYFWlMJJY/5x3ND1C0SAp557Wx2GqLpXG6oX4c7IcqlrC+rXd8ZIX/Jxdh0mmj9AXF/
 fS7ckMiYueVbIveYK4a6PtfIusdQ5lI+n7NO1j8Wwts3p89a+pP3PhW+GkyOk6SQd2DW
 l5svR9SgzPJfo2ySDvYJSIdSEESVfYJnFAZ/L2y5BrSvw6Rt6qzSWPS3CRJ1X/61Iap2
 YhHw==
X-Gm-Message-State: AOAM533VXr15n7GjiZL5SzdEGZvUWmeqQncO9JVgFYzqDISnmZqUoqdi
 4LBNYV6LFd0M24KIIL+HqbVUSMKPsjWqRSlsV1k=
X-Google-Smtp-Source: ABdhPJz4y/XKjfqvWKFqAflxkMHZChaDsJ4Lb0uTE9UmQQzMDWPEdxTcnp/I2Eeuo1/Jya0uAyF+oQ==
X-Received: by 2002:a5d:4d04:: with SMTP id z4mr21748086wrt.133.1625578038947; 
 Tue, 06 Jul 2021 06:27:18 -0700 (PDT)
Received: from bell.fritz.box
 (p200300f6af0ea300f5eebaf01242eb9f.dip0.t-ipconnect.de.
 [2003:f6:af0e:a300:f5ee:baf0:1242:eb9f])
 by smtp.gmail.com with ESMTPSA id c7sm16927769wrs.23.2021.07.06.06.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 06:27:18 -0700 (PDT)
From: Mathias Krause <minipli@grsecurity.net>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	Mathias Krause <minipli@grsecurity.net>
Subject: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
Date: Tue,  6 Jul 2021 15:27:12 +0200
Message-Id: <20210706132714.8220-1-minipli@grsecurity.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Aug 2021 13:14:07 +0000
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

Hi Jason,

this mini series enhances compatibility of the wireguard-linux-compat
repo with grsecurity. I noticed some build breakage on our 4.14 kernel
which the following patches take care of.

Please apply!

Thanks,
Mathias


Mathias Krause (2):
  compat: better grsecurity compatibility
  curve25519-x86_64: solve register constraints with reserved registers

 src/compat/compat-asm.h                        | 4 ++--
 src/compat/compat.h                            | 4 ++--
 src/crypto/zinc/curve25519/curve25519-x86_64.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.20.1

