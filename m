Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1B4C76195
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:49:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2658121872
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:49:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="fff4Ln2l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2658121872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ef382cc;
	Wed, 17 Jul 2019 20:44:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77461a46
 for <wireguard@lists.zx2c4.com>; Tue, 2 Jul 2019 09:12:16 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a488b358
 for <wireguard@lists.zx2c4.com>; Tue, 2 Jul 2019 09:12:16 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id c85so7957614pfc.1
 for <wireguard@lists.zx2c4.com>; Tue, 02 Jul 2019 02:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=VgWfifiHCD/phmqwLS5k745THafqkI9vQ0B5GBipJog=;
 b=fff4Ln2l108LfuB5KwCAk7Gc/2HadLCzNqBpMFKMbkvIbBFgRACrY9aLIdzxvpmLpB
 37OaAnLohzdoZ6R4a3VoU0/hmMqfIYBoUuRchmTT9KQL+GtlAcEKqfq/HF+kSGwf8dcg
 6UBnnrMewpgIg+KHK3Q8wULNM8Jc0qvTxVMKdWjGY8HvHJKziJyzYg6wtNqrYDSabOMp
 QCHm3FQNHQFVa7ZTwUNEcalyVU6TkePdSGLoO9d5hXWtr4RyIOOuOHZC9BnXRl3/0TTN
 5wqHAv1ixTSOAX72RgWhxqsPPKjlO1et11HQ2BYJe9mbK7jsLXw7dJQc67YscSOkiN0O
 YHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=VgWfifiHCD/phmqwLS5k745THafqkI9vQ0B5GBipJog=;
 b=VgsJ13iLUM7+AbeBOVm71nIhvYXVd1UfsPVTZ/ffuGMI8YSMo3rALB+LZuxxiKKN/u
 n0BN4zm29+zd6+Mn0b45mckXFJwyfPitneNd8IN8eFlwnnQg59hz4n207I7hKTVHZqL8
 l3VZxOkCGMAAQXwG8F/6eIliuUp2nyYBZge6ohbGKJHqzNliWekmm5zbya56N3Lxo1rR
 oqhLE1nQSfCqT49qjYIYzrXMjV+YWDA4whf4hZPHgOMXMvn2dwlprp43SFzPVwcRop/6
 Hrv0e/zgNtZxO3moiqPx+8gxpdaOdbPL8JEF5KLgBd5MtzSCxk6rFpdYylpi6gZY0jG2
 2Q0Q==
X-Gm-Message-State: APjAAAW4k/UIT3JElzZfm+W99TSAle5C9xh+E/rj7aCJtz9FSQG4CPRI
 sUHnTsB2WlVCZ8ydENWvzNQ/TTgmd1rVwQ==
X-Google-Smtp-Source: APXvYqzqDl1LQlB7NVnA/Hfu5qEDRxdGWPoiSfp2+s8VHPGpj4PDSL5+eRrkc+bo9utfAeg++DANBA==
X-Received: by 2002:a17:90a:3688:: with SMTP id
 t8mr4259873pjb.35.1562058735689; 
 Tue, 02 Jul 2019 02:12:15 -0700 (PDT)
Received: from bogon.bytedance.net ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id j16sm1520406pjz.31.2019.07.02.02.12.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 02 Jul 2019 02:12:14 -0700 (PDT)
Message-ID: <5d1b1fee.1c69fb81.3719e.5260@mx.google.com>
X-Google-Original-Message-ID: <20190702091205.32716-1-liuhaichao>
From: liuhaichao@bytedance.com
X-Google-Original-From: liuhaichao
To: wireguard@lists.zx2c4.com
Subject: [PATCH] rwcancel: error should be provided by Unix function
Date: Tue,  2 Jul 2019 17:12:05 +0800
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jul 2019 22:44:56 +0200
Cc: liuhaichao <liuhaichao@bytedance.com>
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

From: liuhaichao <liuhaichao@bytedance.com>

Change-Id: I7df1f9e0ce43dbe9c415e834757385dad2398707
---
 rwcancel/rwcancel.go | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rwcancel/rwcancel.go b/rwcancel/rwcancel.go
index 62397c2..3abfd0a 100644
--- a/rwcancel/rwcancel.go
+++ b/rwcancel/rwcancel.go
@@ -92,7 +92,7 @@ func (rw *RWCancel) Read(p []byte) (n int, err error) {
 			return n, err
 		}
 		if !rw.ReadyRead() {
-			return 0, errors.New("fd closed")
+			continue
 		}
 	}
 }
@@ -104,7 +104,7 @@ func (rw *RWCancel) Write(p []byte) (n int, err error) {
 			return n, err
 		}
 		if !rw.ReadyWrite() {
-			return 0, errors.New("fd closed")
+			continue
 		}
 	}
 }
-- 
2.19.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
