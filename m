Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415BEC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 16:23:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69798650F3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 16:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69798650F3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fcbfe374;
	Sun, 7 Mar 2021 16:21:34 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 742600dc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Mar 2021 16:21:33 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id jt13so15298574ejb.0
 for <wireguard@lists.zx2c4.com>; Sun, 07 Mar 2021 08:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OtFkax3dv3qIpThBbsNCV+tELe98R6D47ESd88qk9Lk=;
 b=I9uqNhir23nfPV/looSRyzd2ze4JLBUB9n/46kuTtwklygxrPMe8yqlGCMYjbVopPq
 06hAJwTMt6c8Drap6lr5/N1V/N2SwtYRl0EIjuLq9hPYCp9AeAKSd3CY55KYSmhSR9lJ
 hYZu75wGmgFsXpcLRMzDSccMpiEiIysbZw9ryhW3LZ5ubIBMGfbw49KJaJd/TDBlC8/l
 0UiVuMzsUfDoq0OTxedGHoiOXA7WvFFagpZPDIwGHVt7rQFAItl4n5Z7iw3LCZqWHHYV
 JCriMolcCC2MZKEbCIaO7X4dCZRW+Hz0+XMp3YY+BfI+PAHdnA7kgvZ2CbYd5Gci0WYr
 /odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OtFkax3dv3qIpThBbsNCV+tELe98R6D47ESd88qk9Lk=;
 b=dZZar/7/mUCcS9HWrkdaThQUlu3DLabkgR6MoUtR0wNVQ2FT5hdkxlihw2PIoG32ar
 0OHRJ4oNA4khJ6DA+vsklzGNlSihn92dg1bF6JE/br13eOHRsm/EHM3LOKgVwfHuDU35
 p7FKYPfS3PqkE874pRWv1wCOAW6D/mYniy9PL91sVagf5ijKF0CG/4A7a9MMqixQz/kT
 qRVTsSwFRWLY3DUaAW9AF5fQIyyPWSe4NY00BONoQ40/oas6gz2MHxFYlc2S80+u7kqh
 ZWqbpmC970TBKxy3SWhrnhmXFW3Ak2SqQdkxU94pH0pLg7bRO/QnCqZWzn04nFEYNf9x
 8FDQ==
X-Gm-Message-State: AOAM53080SKMOHdJt5nRcIjNqCLVvBHIxbjV3fzCXVT0aeuUYJaGD6Dw
 25d8p/u0p34oAqwqjCK9bMWkLhHbJsY=
X-Google-Smtp-Source: ABdhPJyomJr/3B+O6aKazOaYYP+b1UhE7HJQtwzblkKaSldux4DJ/8IfCGeYeRo8VOUj//JVZrqsRA==
X-Received: by 2002:a17:906:1448:: with SMTP id
 q8mr11267907ejc.449.1615134092826; 
 Sun, 07 Mar 2021 08:21:32 -0800 (PST)
Received: from kay-hp.lan ([79.140.120.198])
 by smtp.gmail.com with ESMTPSA id v9sm5084249ejd.92.2021.03.07.08.21.32
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 08:21:32 -0800 (PST)
From: kayrus <kay.diam@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] FreeBSD default tun name patch
Date: Sun,  7 Mar 2021 17:21:31 +0100
Message-Id: <20210307162131.1153348-1-kay.diam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306094705.1037746-1-kay.diam@gmail.com>
References: <20210306094705.1037746-1-kay.diam@gmail.com>
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

This change allows to omit the tun interface name setting in FreeBSD. When name
is not set, kernel automatically picks up the tun name and index.

Signed-off-by: kayrus <kay.diam@gmail.com>
---
 tun/tun_freebsd.go | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/tun/tun_freebsd.go b/tun/tun_freebsd.go
index 12b44da..1883aad 100644
--- a/tun/tun_freebsd.go
+++ b/tun/tun_freebsd.go
@@ -346,22 +346,24 @@ func CreateTUN(name string, mtu int) (Device, error) {
 		return nil, fmt.Errorf("Unable to set nd6 flags for %s: %w", assignedName, errno)
 	}
 
-	// Rename the interface
-	var newnp [unix.IFNAMSIZ]byte
-	copy(newnp[:], name)
-	var ifr ifreq_ptr
-	copy(ifr.Name[:], assignedName)
-	ifr.Data = uintptr(unsafe.Pointer(&newnp[0]))
-	_, _, errno = unix.Syscall(
-		unix.SYS_IOCTL,
-		uintptr(confd),
-		uintptr(unix.SIOCSIFNAME),
-		uintptr(unsafe.Pointer(&ifr)),
-	)
-	if errno != 0 {
-		tunFile.Close()
-		tunDestroy(assignedName)
-		return nil, fmt.Errorf("Failed to rename %s to %s: %w", assignedName, name, errno)
+	if name != "" {
+		// Rename the interface
+		var newnp [unix.IFNAMSIZ]byte
+		copy(newnp[:], name)
+		var ifr ifreq_ptr
+		copy(ifr.Name[:], assignedName)
+		ifr.Data = uintptr(unsafe.Pointer(&newnp[0]))
+		_, _, errno = unix.Syscall(
+			unix.SYS_IOCTL,
+			uintptr(confd),
+			uintptr(unix.SIOCSIFNAME),
+			uintptr(unsafe.Pointer(&ifr)),
+		)
+		if errno != 0 {
+			tunFile.Close()
+			tunDestroy(assignedName)
+			return nil, fmt.Errorf("Failed to rename %s to %s: %w", assignedName, name, errno)
+		}
 	}
 
 	return CreateTUNFromFile(tunFile, mtu)
-- 
2.25.1

