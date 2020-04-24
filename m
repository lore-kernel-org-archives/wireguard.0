Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F54C54FCB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:48:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3674720704
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:48:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUsofbb9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3674720704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22f53845;
	Fri, 24 Apr 2020 20:36:36 +0000 (UTC)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [2607:f8b0:4864:20::442])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 84d4d735
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 18:56:58 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id v63so5223782pfb.10
 for <wireguard@lists.zx2c4.com>; Fri, 24 Apr 2020 12:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J5FAp8AV1Z72E9fyOxK5RAQ8iwRIc5sE38zP0A1MbeU=;
 b=AUsofbb9WBPDiQCOW5mHZN5GDJm4ynC+GlQ5SPmSIBuX0j1U42m6B7Vi9MyCWGNxgf
 D4eMEeUy4AwBpHHTwT7JqU9WJLREK/mbMxuQzSEdGBG+09OkoUp+jZCm5a22D+cVcKXt
 IlNrKjF5Gw57ajxm4YWepsUvQHkfr+UaNuwtEmULnQk5SQp6ML2JfmgNDO2Bwbu9LA8Q
 ojd8BQPXBmfb+aMpBSkS1OK0MDCPBpYF0RGIy3ca/1WeV9pB/59XchicfxJ6wZKaose9
 EJbxR30gVLsbFf9P9pmEDZ7+snv2QbupTTL7FFyFeL4k3pXZ4XORRK99RitxKk1hw8ZM
 IOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J5FAp8AV1Z72E9fyOxK5RAQ8iwRIc5sE38zP0A1MbeU=;
 b=MIX0PzKVPf0LITp+ByyUQS/M5AR1ZAAXR8hJjhNFrmTDfbVH12LZtDiHRhgVyDkVDf
 Q0F7lHh/HPOiwzYRdBeua9h7xPjKzw1a7EJQYtJGgkMKODl/RiyOkCpto+G+wUJcjAh+
 5YBt/tjd8nB8PlUmDHLJm7dBDks49D9bbT1JAvI9z3aqQDDt4BF06PBV4ADJxBChW5Ew
 Wdi1KXpIbrFDvkXJ4NErIrJ8s9/haC3H4ei+HnurtUgreseRejbUchSCUXYxovftrbKw
 IoJ07nMerPZR6l3ijMmuX7d8KhO29RNtJ93DLgzygFqmBeL0vpJYbA9CW1ahQr14XDVd
 3Smw==
X-Gm-Message-State: AGi0PuYA9c2+UN2Gepkqu3nLtRQeENxTI8TmvAbl3RbvCskjo0bxzil+
 jkBtKQ3XjtwK2Kaqn9NI+STTPPtl
X-Google-Smtp-Source: APiQypLgOEU7gE0D6pKwVzQoPYyZfz4HuJ9DWnhd0CcZAYRcMWL2FhSolCSyPJ4AoINqXBP7LQ0jzw==
X-Received: by 2002:a63:1854:: with SMTP id 20mr11050707pgy.257.1587754817170; 
 Fri, 24 Apr 2020 12:00:17 -0700 (PDT)
Received: from goliath.corp.microsoft.com ([98.203.142.101])
 by smtp.gmail.com with ESMTPSA id i11sm5003187pgi.1.2020.04.24.12.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 12:00:16 -0700 (PDT)
From: Shawn Hoffman <godisgovernment@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Shawn Hoffman <godisgovernment@gmail.com>
Subject: [PATCH 3/3] use RtlSubAuthoritySid instead of directly poking SID
Date: Fri, 24 Apr 2020 11:59:25 -0700
Message-Id: <20200424185925.31971-4-godisgovernment@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424185925.31971-1-godisgovernment@gmail.com>
References: <20200424185925.31971-1-godisgovernment@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Apr 2020 22:36:30 +0200
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
2.25.0.windows.1

