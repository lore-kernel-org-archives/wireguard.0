Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB35C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 15:46:33 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 789DB65004
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 15:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 789DB65004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 896a57ce;
	Sun, 7 Mar 2021 15:43:36 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 639fdfcd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Mar 2021 09:47:07 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b13so6402693edx.1
 for <wireguard@lists.zx2c4.com>; Sat, 06 Mar 2021 01:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U63Vp920Bh3uo6tnq0WBpsnIDcvEyG76ePo9AFUjVbw=;
 b=rqXgoAy3Jsz1zohdqG23lVEBWNsKKH0Nf6Ja4ZPlOtUrbXeRwQlvTBdQcn1W5TKADs
 N7T+OkuYXpE+kbzG1rXJozW6d8q4KMftrG/C0Q+AxPBUUTYUbmslFViAHdVwzWO0SsZV
 icMv9vJ60sEObU7njyOUAVlLcwjvJ4lGE1a3Zt8hB5iK5FFPEbrxOpZZmdJuAgLCrFsR
 MSYopizSUrCOjREUf6zuVNfYsO7qsuHtdybyyjzflSLiRubRYWpILkq18HLBN/MUcq7l
 HYYl+e9A15hfqW2Bql3wGhl+CvES9XBQBLMb29mGF8cVqNGMRLIgkVbRAxz8peRRa0Tq
 cDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U63Vp920Bh3uo6tnq0WBpsnIDcvEyG76ePo9AFUjVbw=;
 b=lIDFEyz1jlImmpQFtevaGnLkY5fabXduY1nc3s/NDN3fyr+NtiPSJ5rb+figFuoWDW
 Esu96qSl0NQF2IJG2yBEOqeVo+at1+L4srAZk2EKqxzVxCNSCtGw6B9vQ87DbEn7kur5
 QcjH1nEbiGzoEDYU8LUglT3VC/ywUsMs2EZcwztjE4cXWmDt1jfktmPYsifci5SgqyWW
 oRSPWm8SVdOlUw1NdxUIhBom4FhvX+0wFZHfOqRrUQht7ab27NoOf+izMt4q/ShazFRq
 Q/SNDjEzuETnYGLRofwspifVab8Nyqbv5zYGOyVA4yen4YPcDTuBngbDpwbx1SG3ROgo
 41MQ==
X-Gm-Message-State: AOAM531N5FK+NDLhnV7DTZBxqoBy+Jx6aH+YuljKnV1ERzNWZJgS5x65
 rLAtD3JaE+qdwua91wp0hpSkSCg62H8=
X-Google-Smtp-Source: ABdhPJy6SQ46dlDfruuXiwwk+Jr3wpVU024N108ZQeJ4Y7AoOMM4sXB+o/O/xZSJaGi8+EFz47i01Q==
X-Received: by 2002:a05:6402:168c:: with SMTP id
 a12mr9318618edv.344.1615024026886; 
 Sat, 06 Mar 2021 01:47:06 -0800 (PST)
Received: from kay-hp.lan ([79.140.115.19])
 by smtp.gmail.com with ESMTPSA id bz20sm2945464ejc.28.2021.03.06.01.47.06
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 01:47:06 -0800 (PST)
From: kayrus <kay.diam@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] FreeBSD default tun name patch
Date: Sat,  6 Mar 2021 10:47:05 +0100
Message-Id: <20210306094705.1037746-1-kay.diam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 07 Mar 2021 15:43:28 +0000
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

