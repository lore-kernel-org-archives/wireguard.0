Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B4DC55191
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 23:44:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F8C020728
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 23:44:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRnixPbM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F8C020728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6eb788a1;
	Fri, 24 Apr 2020 23:33:10 +0000 (UTC)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [2607:f8b0:4864:20::442])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fee1b12c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 23:33:07 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 18so4356419pfv.8
 for <wireguard@lists.zx2c4.com>; Fri, 24 Apr 2020 16:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dttjFQhtohQv3ufNyBYBjeZI29KrUeZD7P3aBNz3P58=;
 b=aRnixPbMtfxX7zIBvw0sgi3JomLhIDB6hNiQ+c50H74RUWOCeUDG+Wy40Bo0ACDH6+
 t+qNdTZqXSltA9+E6dsZAjpdwYzw3/vLBie/MqEW+RJcrK1TCXoMEwPRmgMjMKI/S7ll
 Huwkr0ogkF+hA6SZAlZg+8auIdY+ycucdqN4WYxPIcBal+drs3RveAKcE4YoPcOWpymd
 RkZs5U39a/tqaW4WTpQ0JfP56szh/VlD5WhnFjSRkMfYqoDc3bTOW0H9O0SQ5Zr3LruX
 HgNZSa+t+ucwbGxuE1qSmytenTBR80OKXs5bXs+jKhW233n4meVaevVG9CjBmZKww728
 KOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dttjFQhtohQv3ufNyBYBjeZI29KrUeZD7P3aBNz3P58=;
 b=eBhC1F8aYeuikSb2ppLFJBsKDnJrQpPiUnDj8i8zBzE9Ls/MLUxwQlOPEXXfXEbeAv
 so9m+g/+3pbkftfhZkZvAk/jpgnUVzkxuqFc+7tbTb5XWOBZG1U9/E0xTpB+r5FOiHIl
 mpVQ+lhbNs7K/g3obYKDrxJM4z4TK5m0O5LpP6ciQidHavF0hIP9Ugk9CtCTQEGnQ6Sl
 PSDqhYeVLGACqcY2+alyHzIoeKWQP6vlPF/sgdc04PvX4UJ4vJrywdcGEvjiol8xJvUF
 i/PitpOAVe97Mc1BlgywjSr0dG6kozSRN73Kdcue7dJmrWcJFfXJ8sdrI/RzyMK2UelQ
 lF2g==
X-Gm-Message-State: AGi0Puat8xq0u4ytZTdn1xJpDOKr784IpwLZTh4cLK5LVPkqSS5YUrhu
 dUr8MMeB7iI/bG3gWz+WpSoJ99mx
X-Google-Smtp-Source: APiQypJIXik8Ct3BVikASNRliZHGOhi+1i2em1LzH/PL1DVNgUGiRkY++5VWvCmbhz6a60SPbAaLaA==
X-Received: by 2002:a62:4e88:: with SMTP id
 c130mr12734117pfb.122.1587771856976; 
 Fri, 24 Apr 2020 16:44:16 -0700 (PDT)
Received: from localhost.localdomain ([98.203.142.101])
 by smtp.gmail.com with ESMTPSA id u13sm5583535pjb.45.2020.04.24.16.44.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 16:44:16 -0700 (PDT)
From: Shawn Hoffman <godisgovernment@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Shawn Hoffman <godisgovernment@gmail.com>
Subject: [PATCH 3/3] use RtlSubAuthoritySid instead of directly poking SID
Date: Fri, 24 Apr 2020 16:43:27 -0700
Message-Id: <20200424234327.1814-3-godisgovernment@gmail.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20200424234327.1814-1-godisgovernment@gmail.com>
References: <20200424234327.1814-1-godisgovernment@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Signed-off-by: Shawn Hoffman <godisgovernment@gmail.com>
---
 wintun.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/wintun.c b/wintun.c
index 00ac378..a6a0e16 100644
--- a/wintun.c
+++ b/wintun.c
@@ -788,7 +788,7 @@ static NTSTATUS TunInitializeDispatchSecurityDescriptor(VOID)
     SID LocalSystem = { 0 };
     if (!NT_SUCCESS(Status = RtlInitializeSid(&LocalSystem, &NtAuthority, 1)))
         return Status;
-    LocalSystem.SubAuthority[0] = 18;
+    *RtlSubAuthoritySid(&LocalSystem, 0) = SECURITY_LOCAL_SYSTEM_RID;
     struct
     {
         ACL Dacl;
-- 
2.26.2.windows.1

