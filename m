Return-Path: <SRS0=pvJ2=KM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72014C43611
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 15:22:00 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9E646109F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 15:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9E646109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e741e3f8;
	Mon, 17 May 2021 15:21:58 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5723c72c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 May 2021 03:35:55 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id k19so4026894pfu.5
 for <wireguard@lists.zx2c4.com>; Sun, 16 May 2021 20:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JPVXV5rkpmusT9GGUEjwOzn8WfiRWJBQO/NMGCKWpME=;
 b=FcGmcVBYBBkg9wxMVkJrGGaL1G1g5gMJPKx2hnvlioi3xhQa/NsGOzvJVx9Z4l4O5I
 J80TWbbdS8O1nNj3Q68vQnIsuYoeZ+sSYArmCD7QJOXxPKvhFGbS4BeWVfig6hN4RNw0
 y9q3w+Q8AZhsvpnZ24JSFb3yR0y+PoO9IPP87jMRO7GgUgLLIB8Y0pno/aGwvqJ77Fj7
 K1GwvcBanT7brOXQQQtt/faI56SJQQ89y3hfwCkFqdWioR/k3x5eOqStzaMN6w3IESH1
 DGfCSTLkYtFydb8ZbPvgbvL0pTfuTdNqZsz+T0nL5WxHVpLvD6t2aKFzVNuOC2zpAfLs
 mkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JPVXV5rkpmusT9GGUEjwOzn8WfiRWJBQO/NMGCKWpME=;
 b=uK1hNXcOZq+gz4B5SZdDnQw8CMwzDs7rpUdOJ05N8RrJ2FvAHb5Zjw+fxmrJA+QmiD
 bYh/93R+IilElXHeLDoB0oKt4jUdqSJXr5aKvaH6kU6eLrGDDkKOjRudI5MwZyikTLYZ
 gAbThHgP8a5NgjKX37FCi6DR9+jh1nESJ6o4T+YDJaNf4/agCHAqXt7H+A0nV1rE3RXu
 IpGot6HkTT3MslGLK8XQfdeg3LlDhthR+TVB/f/Uy2mmGWLrQUsnPze6HxjL2bC9/vWW
 gtURlT2akl3TJI6GajW0WgRmB+mBTmscNxjWoTXjAsw9IC7jPyKNU6RPMBc6cNtmUJI6
 0kGQ==
X-Gm-Message-State: AOAM5329uspWiXTmr+QsScidjIHldRfdhYtH6NtO+qJvnz2hwkludkWo
 3dnysIhc8YDk9ZUuB0tuGgrYt5iP/ia9MA==
X-Google-Smtp-Source: ABdhPJyxqal6QUUO+MNMOzaUq1tOgPCm/ygR9XqPXKQsczFUggHILYHqH5VYKXutAX8hg1cNG2toTg==
X-Received: by 2002:a17:902:b713:b029:ef:b031:2a9c with SMTP id
 d19-20020a170902b713b02900efb0312a9cmr16533964pls.22.1621222176860; 
 Sun, 16 May 2021 20:29:36 -0700 (PDT)
Received: from Leo-laptop-t470s.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id k9sm9463649pgq.27.2021.05.16.20.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 20:29:36 -0700 (PDT)
From: Hangbin Liu <liuhangbin@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCH] contrib/launchd: fix xml syntax error
Date: Mon, 17 May 2021 11:29:23 +0800
Message-Id: <20210517032923.786658-1-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 May 2021 15:21:51 +0000
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

The current plist xml gets error "DOCTYPE improperly terminated" with xml
syntax checker[1]. The example in apple doc[2] also doesn't have semicolon
at the end of DOCTYPE line.

[1] https://www.w3schools.com/xml/xml_validator.asp
[2] https://opensource.apple.com/source/launchd/launchd-257/launchd/doc/HOWTO.html

Fixes: b30e74b5956a ("wg-quick: darwin: support being called from launchd")
Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
---
 contrib/launchd/com.wireguard.wg0.plist | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/launchd/com.wireguard.wg0.plist b/contrib/launchd/com.wireguard.wg0.plist
index 9fc0141..ea1eab6 100644
--- a/contrib/launchd/com.wireguard.wg0.plist
+++ b/contrib/launchd/com.wireguard.wg0.plist
@@ -1,5 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
-<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd";>
+<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
 <dict>
   <key>Label</key>
-- 
2.26.3

