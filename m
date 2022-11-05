Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15409C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Nov 2022 11:45:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22ef325b;
	Sun, 6 Nov 2022 11:42:04 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a5f9057c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 5 Nov 2022 22:20:14 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id i3so7452332pfc.11
 for <wireguard@lists.zx2c4.com>; Sat, 05 Nov 2022 15:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=w84VEGN7CVaO9+LhV2pLQestYmHb+MFQVnRskbq7peE=;
 b=pBg5XxIOnNL2kSJ6bKzBF8a8DBOoVt12ndaoozNYjhewMkSPYujaFUgT9Tntnff8xG
 AfN3chika9+Ivzqv63qgangYZquqDlGi0ig9XAJeh5EE0d83v8iTyMMGiqU4GXhf+rJV
 8fj40JJCv83OJzUYIkxVam7SMEzjNF6gq22CZlQwVX4hiu3om4M9rgxVNa4ZiGlZyAu1
 JxTcayjZjpR02sVQR7sEskDhWGJ5B5oMeM25b7VGZE9Fc40LVmw0QSok7paxECGrXRt0
 mIDjSUvskirRauO5ia96LAJbcUq+9Hv73u9GYIT3yQn08KutNgG/pcHvXhZd2hHABPri
 9MIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w84VEGN7CVaO9+LhV2pLQestYmHb+MFQVnRskbq7peE=;
 b=P9dDFf3ANVxvHGrxdRW2eSq+SaSJvQS9dbjPaA+ojLSrCM22NQT03tzJsoOdoM3Z8x
 7TtUGAvRIDEAB2nLU6OgD+op3ag0oXfIhx27SH/ntsbId7QafJlOqBXdEMtjOFY7r4A0
 rE+rjwbUyF5HTsVu4CFPXte1EPcmgeJwMcX+l1U6REOqWL5wdwOvgDz32oT7wEBIo2Ib
 m6ZKftIAzW2btJhnQS/hZesefjBjoHfLqOx/XTrYB9virC5MKbNBrem0zNOnS6q1UgVI
 JkPlCzxdpB3OKZpUHHLmcaqYXUK1bjdZxQ7AxT43VaLiVL/fiXpWm2mDG9khXNfO2uoG
 faOA==
X-Gm-Message-State: ACrzQf0Y1+RXdWcQcvBECGyX8rvgf4mP7xG40nbyS0p85IsTnLex0xd0
 oIVys999KU4427uRmHADlH0AGJCIurToouubYyUz77OBxGwMBpBn
X-Google-Smtp-Source: AMsMyM5QmNg5NDK/g4MeAHp1jk7QXOKqAg9ola6Ck83OIrPrq15iIGMxRpQVNSVzLiNGKmEI2lUS4bKiEnV2o/jW3po=
X-Received: by 2002:a63:6f89:0:b0:45e:cbb1:732 with SMTP id
 k131-20020a636f89000000b0045ecbb10732mr35750777pgc.162.1667686812828; Sat, 05
 Nov 2022 15:20:12 -0700 (PDT)
MIME-Version: 1.0
From: Omkhar Arasaratnam <omkhar@gmail.com>
Date: Sat, 5 Nov 2022 18:20:01 -0400
Message-ID: <CAHx9mse-qPN6L4F7wKRA31J0rHQ9_g533KPS-OTAnTeRHF11ag@mail.gmail.com>
Subject: Wireguard - no logs iOS 16.1
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 06 Nov 2022 11:42:03 +0000
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

Wireguard 1.0.15 (26)
Wireguard Go backend 2ef39d47

I am unable to view logs. Clicking on the view log button momentarily
renders text, then it goes blank. Tried this on two different phones
(iPhone 11 pro max, iPhone 13 Pro)

--oa
