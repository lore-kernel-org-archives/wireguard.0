Return-Path: <SRS0=5LHB=JY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA78CC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Apr 2021 01:57:34 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8E56610FA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Apr 2021 01:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8E56610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25cab75d;
	Tue, 27 Apr 2021 01:57:32 +0000 (UTC)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [2607:f8b0:4864:20::131])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 016246bd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Apr 2021 13:33:49 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id p15so7236246iln.3
 for <wireguard@lists.zx2c4.com>; Sat, 24 Apr 2021 06:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=LJlCW5CSjFKs+Kra+T7r8X64Ju6UU+xt6ley9DORVQ8=;
 b=lxfjwmiWiGlDP0sj3ZzD5kisBNmPW1r5PYPL4QPjUXYZcQSt3QZKAiiRO2NCa0dUGv
 yXbdbnvsbJa8YB0NQOe+hKGiL32U1N/WGUiFxLd5fefiM4wZVKdi32KgZH8PRcptkxk8
 Grypv2wwClXxzfERlZJ3XKKkevkFsEDB9nxXTJuJs6vzEgx+b7DN3PXksi4QWpQ91CwK
 yStOYpU3XGcVhbjCat+SvOm86JTz0k1QUNE5sKBffmDjco6JL+0uaELZW+ER3AD4Nbn1
 gqsA2gnx3fSQz6PPVEKc1F/OMTyXL/YT03SkqUq4w2j2ld3IOnYIFwXj4EVVGbd5akdT
 cOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=LJlCW5CSjFKs+Kra+T7r8X64Ju6UU+xt6ley9DORVQ8=;
 b=mZ66LTX0X1poUK10aI88FQEcVUyZr4HsRvUC2nrCU4P6yzJRU1uQon8KrcP6BOKq2K
 huED88uKhQqnhDAjwqSS0vZFrNVkdhrpwVG9r/j1xzG2Bs6i6/4drhDwiNa2i2Flfe4V
 rfuXNcB9R/MJKt84E/x2yi9kOB38wTDLo4v/xt6ninj7foMzHWeo+6cgQ39Fkm3dPqWP
 XOIJeIlZIGbgYAdj3HOIt/5F/XhulSjwtnTTrLN+U5Ffa9foWohtf1az0MwzYpVCisqr
 qig0nY9bG+syVVbzOfIeBJTQ2sXgic6DH258z+t8Wb7h16Pl3KvpjtHtHQbfnCkBClDN
 hOnQ==
X-Gm-Message-State: AOAM530vYsAHtfvXhffPFrdSjSXx0mdeFjPjv9GX6xCB40JnQII6kD8G
 AJA+WghvF9MFrlI0kvSfuFRPTHDP/QCOqQAuzXA7o7GUkRvM
X-Google-Smtp-Source: ABdhPJzL4haTPO6MKBBur0lYyQS4TSzzudYC2aQxALTaaff20Nnlzfw6fL7DklraEWZQA5w5Hd2hOtro9KT7lrO5pes=
X-Received: by 2002:a05:6e02:4c4:: with SMTP id
 f4mr6845547ils.272.1619271227603; 
 Sat, 24 Apr 2021 06:33:47 -0700 (PDT)
MIME-Version: 1.0
From: Sascha Dierberg <sascha.dierberg@gmail.com>
Date: Sat, 24 Apr 2021 15:33:32 +0200
Message-ID: <CAGYZcps=qdWvwsed+kRY90W-7d9N09tiACRFj9yMy6OMXe9znQ@mail.gmail.com>
Subject: [PATCH] Windows Bindings: handler for WSAEMSGSIZE added to avoid stop
 receiving data
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 27 Apr 2021 01:57:30 +0000
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
Reply-To: sascha@dierberg.de
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

From: Sascha Dierberg <dierberg@dresearch-fe.de>

Signed-off-by: Sascha Dierberg <dierberg@dresearch-fe.de>
---
 conn/bind_windows.go | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/conn/bind_windows.go b/conn/bind_windows.go
index fdd1c24..e78bef9 100644
--- a/conn/bind_windows.go
+++ b/conn/bind_windows.go
@@ -389,6 +389,10 @@ func (bind *afWinRingBind) Receive(buf []byte,
isOpen *uint32) (int, Endpoint, e
  if err != nil {
  return 0, nil, err
  }
+ // WSAEMSGSIZE message too long error on Winsock2
+ if results[0].Status == 10040 {
+ return 0, nil, nil
+ }
  if results[0].Status != 0 {
  return 0, nil, windows.Errno(results[0].Status)
  }
-- 
2.31.1
