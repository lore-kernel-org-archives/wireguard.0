Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC6CC4BA0A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 23:12:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E232176D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 23:12:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fgv6.net header.i=@fgv6.net header.b="aS668gKQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E232176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fgv6.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e153cab;
	Tue, 25 Feb 2020 23:08:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8aef37b4
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 22:37:39 +0000 (UTC)
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44946431
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 22:37:39 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id f7so264240uaa.8
 for <wireguard@lists.zx2c4.com>; Tue, 25 Feb 2020 14:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fgv6.net; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=Gib2q92T0toHAG9KQili/X9oVEz8Ess9X2dVGXBye2I=;
 b=aS668gKQp1qrcEUMuZxFPLTX4xDr6bE34i/ZBhwqmVutZvWABftoNc52Qj0hzN/rh0
 m/Yu/OtZKIANj9F7BU4sJ4XBzxEqZOuFKjJ3JFknH8GMHiU120jZOhvChOopbtEkEkN/
 O6LW2IMZ4P/wqI5JblplZpY2DMhHMFWS0gmzQOJwjo+RUv41+Bmagu4qEWt1Aywru5cv
 thvi1Oyyi2dQN+LCfiNb2ZdRTLc9fNyJyRNr0yAI8QIvZ8cXF6EpaU3OEGiCD30AH3hI
 P8CFFoiZXd4fXkrXqN+pmOtRK0POC550xmXdMMJSS47cAhFq8iwV1+pUzjCt095lLzhI
 wkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Gib2q92T0toHAG9KQili/X9oVEz8Ess9X2dVGXBye2I=;
 b=nxeEPBMfZY1ET8DDTfPt0QKgWqDVEo6xHrY4xvLUKPVzpfr3XwQhb8M4xJeRmnUbxA
 dK6PRRQGtOz4s6bXQOs4H3aH5HGlcK/kxGMvXMl2FHMc8V9f0rydlKAEIIFym85Zx29Z
 uyOmIp0+PcKxTsSMxCNtHuthjz80BlU+mEuLjDtrSLkEEZXzmBqsqN/yjkq+E3K8jW4x
 SMXA7FcD5skVrnyX3ToIBHuHbOf51TWcyvojq76jIt4VgphvLK8OUYFpdak1V2FBLpFO
 lenUz8Ll1/UeRN/YYpj08IW5JEbKHpz57jBIycqt6ELZRE5XFH++FMUOvOeg2cw5vRDF
 V02Q==
X-Gm-Message-State: APjAAAX0kiqSjUAj0UyPBn7thrST3tTb7SWGfOGFutWvO+RXyMdEkMbO
 PkrukIet9SW+R3bg+XHTfQoY4DCenuDrdQlwrIEkIyLIbGM8Hw==
X-Google-Smtp-Source: APXvYqxV3BlikZ67wOcXNG6UgH/hckl3R9wE5HkDbKdO9xjdFpBo+wgYQGoGhjYsvEiJlH/BZKKAC9oOkzvVowiI/vw=
X-Received: by 2002:ab0:2252:: with SMTP id z18mr1353827uan.60.1582670473223; 
 Tue, 25 Feb 2020 14:41:13 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Fran=C3=A7ois_Guerraz?= <kubrick@fgv6.net>
Date: Tue, 25 Feb 2020 17:41:00 -0500
Message-ID: <CA+zF5m=eFUxsg+7nQCjYEmM-6rGdsOnov3a5VkC+me6iM7Y+yQ@mail.gmail.com>
Subject: [PATCH][wireguard-android] fix formatBytes to be able to display
 gibibytes
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 26 Feb 2020 00:08:45 +0100
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

The default type for literal numerals is int, not long it, therefore
1024*1024*1024*1024
overflows and
    bytes < 1024*1024*1024*1024
is always false.
Therefore, GiBi is never displayed and switches to TiBi immediately.
---
diff --git a/app/src/main/java/com/wireguard/android/fragment/TunnelDetailFragment.java
b/app/src/main/java/com/wireguard/android/fragment/TunnelDetailFragment.java
index 57e0d8e..bc0726a 100644
--- a/app/src/main/java/com/wireguard/android/fragment/TunnelDetailFragment.java
+++ b/app/src/main/java/com/wireguard/android/fragment/TunnelDetailFragment.java
@@ -115,7 +115,7 @@ public class TunnelDetailFragment extends BaseFragment {
             return
getContext().getString(R.string.transfer_kibibytes, bytes/1024.0);
         else if (bytes < 1024*1024*1024)
             return
getContext().getString(R.string.transfer_mibibytes,
bytes/(1024.0*1024.0));
-        else if (bytes < 1024*1024*1024*1024)
+        else if (bytes < 1024*1024*1024*1024L)
             return
getContext().getString(R.string.transfer_gibibytes,
bytes/(1024.0*1024.0*1024.0));
         return getContext().getString(R.string.transfer_tibibytes,
bytes/(1024.0*1024.0*1024.0)/1024.0);
     }
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
