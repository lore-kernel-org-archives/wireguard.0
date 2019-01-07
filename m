Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554B1C43612
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:03:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5C9E20665
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s1ZpyHl/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5C9E20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15315338;
	Tue, 8 Jan 2019 02:00:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3ffe237
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jan 2019 10:54:30 +0000 (UTC)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 003d5f84
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jan 2019 10:54:30 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j2so42834189wrw.1
 for <wireguard@lists.zx2c4.com>; Mon, 07 Jan 2019 02:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=AZHEvQRR0enlQ9zitU6/9TWtpIlSgKGZgx0tcSL+GBs=;
 b=s1ZpyHl/i2wovKlEC/EgrcXENrcUtJf0s6aggD+4UNckU/S1r+88BIji9uBSQu+aat
 Sx7s56olFy9ZopBu+Jhd03oa6RuUTpgixiKl/PqDS7ScLssmJft51T23V/GTUlEyZCR0
 UygKb3lAm2sLkEjOsXOU7RlNgkouwQXlWIIheb00uGd39itV0ujtSwkBJKMpOHzuN27P
 pxxS4pjAhmLlGWdcTxHOalu1eOiuduS03VcvSzJ4dtxoNtZ1fcntxQmSdBwq2cIdsWfR
 Wdx89Z43njz4a0Z/0XMI77ZnX5XYzAnBFFOF7jPvGKLiw54ugQgbZ+puFUuGL10EuhHj
 FYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=AZHEvQRR0enlQ9zitU6/9TWtpIlSgKGZgx0tcSL+GBs=;
 b=p/ChHOd4sL/sUQJ3GRhKI43TK35AOIUCpp8WEEVLZTBTUcMA3cPjfBpH4QBIBANOy4
 UYajKxhre+AmSnPlKIj/3qmJzqlypbTlQXYE1gGsYO/yPJcvaxReSs4g1UmLpFKZKvK4
 8B6olbyQzMD9lcBDk+qBdk8YUQTHH/ul4QZKnTMLeN8Acaz50l3HeWi36irD+1nFHHM2
 UUmY36rDOh38ynXEzGN0d1sJYlJPw1Mzh4M53CSEXmeInBOvdA8hbOfcNOwcvbUfhbDo
 XQXPdSY21qdYFRGFuIxuWuRBXjdfM1SwMbwSTVpgI5pPblzzq4wL8WTBn/VYeIR0h/J/
 hE+Q==
X-Gm-Message-State: AJcUukdXhJ6t7pLOkiQAjqFp+aRXhlkzdusWn8Zx+9c8aO2e2+Q3bB1s
 wh69bwcrYW6ITPMe4KwJlJ6qISAg
X-Google-Smtp-Source: ALg8bN6sx7SQAeuffiKN/twsbIuRDC0xTRiLxD9a/ztyQSLnFIElWfx//Qe/hcV0OGB9pMxx4TrDlA==
X-Received: by 2002:adf:9422:: with SMTP id 31mr54805976wrq.106.1546858649438; 
 Mon, 07 Jan 2019 02:57:29 -0800 (PST)
Received: from gmail.com (cpc1-cmbg19-2-0-cust946.5-4.cable.virginm.net.
 [82.27.183.179])
 by smtp.gmail.com with ESMTPSA id c13sm52277961wrb.38.2019.01.07.02.57.28
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 07 Jan 2019 02:57:28 -0800 (PST)
Date: Mon, 7 Jan 2019 10:57:27 +0000
From: Raf Czlonka <rczlonka@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: Correct capitalisation of IPsec
Message-ID: <20190107105727.GH51930@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Mailman-Approved-At: Tue, 08 Jan 2019 03:00:05 +0100
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

Hi all,

A quick diff to correct the capitalisation of IPsec in the main Git
repository[0].

Capitalisation on the website itself[1], will also need changing.

[0] https://git.zx2c4.com/WireGuard/
[1] https://www.wireguard.com/

Regards,

Raf

diff --git a/README.md b/README.md
index 08f8827..b8301e2 100644
--- a/README.md
+++ b/README.md
@@ -1,7 +1,7 @@
 # WireGuard &mdash; fast, modern, secure kernel VPN tunnel
 #### by [Jason A. Donenfeld](mailto:Jason@zx2c4.com) of [Edge Security](https://www.edgesecurity.com/)
 
-WireGuard is a novel VPN that runs inside the Linux Kernel and utilizes **state-of-the-art cryptography**. It aims to be faster, simpler, leaner, and more useful than IPSec, while avoiding the massive headache. It intends to be considerably more performant than OpenVPN. WireGuard is designed as a general purpose VPN for running on embedded interfaces and super computers alike, fit for many different circumstances. It runs over UDP.
+WireGuard is a novel VPN that runs inside the Linux Kernel and utilizes **state-of-the-art cryptography**. It aims to be faster, simpler, leaner, and more useful than IPsec, while avoiding the massive headache. It intends to be considerably more performant than OpenVPN. WireGuard is designed as a general purpose VPN for running on embedded interfaces and super computers alike, fit for many different circumstances. It runs over UDP.
 
 **More information may be found at [WireGuard.com](https://www.wireguard.com/).**
 
diff --git a/src/Kconfig b/src/Kconfig
index cc2ba9f..3a68884 100644
--- a/src/Kconfig
+++ b/src/Kconfig
@@ -11,7 +11,7 @@ config WIREGUARD
 	select KERNEL_MODE_NEON if CPU_V7
 	default m
 	help
-	  WireGuard is a secure, fast, and easy to use replacement for IPSec
+	  WireGuard is a secure, fast, and easy to use replacement for IPsec
 	  that uses modern cryptography and clever networking tricks. It's
 	  designed to be fairly general purpose and abstract enough to fit most
 	  use cases, while at the same time remaining extremely simple to
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
