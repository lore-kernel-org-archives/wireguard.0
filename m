Return-Path: <SRS0=uQE/=WZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9C5C3A59F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 29 Aug 2019 04:13:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6935E2173E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 29 Aug 2019 04:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="T5uyMRAC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6935E2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26e2f437;
	Thu, 29 Aug 2019 04:13:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9408ec0d
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Aug 2019 04:13:30 +0000 (UTC)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbafc2b4
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Aug 2019 04:13:30 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id b24so1172640pfp.1
 for <wireguard@lists.zx2c4.com>; Wed, 28 Aug 2019 21:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google;
 h=message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=R9RlH8yYjDgjxNsPU/x1Y0axK/NhANeQ1a0dHTnmXkw=;
 b=T5uyMRACfL4r4Dh+THxBJluLNUiyHrNYOxQ/j6tYM8oDaSERGKmxXA1dz5uBhDkC9u
 SXewx1RHg2mQEn8BO3/N2pfttc9+Kzs8++vHoUheRJuFZ75VbzctJIw+9/U4DeHC8VG1
 b6VYz4hLgcNuuT8FL52g5mIRH8rVs6tMias0k/Nzta2JDDJ9EJdKvX6rstdz6pnx45v+
 BsqexcSevGZXAho2XNojSiPO6NDWOdjLetGxeRhr0gmC09rLZh3b1mumSzxwTqOYn4NZ
 LYdeA8H2r+DtchVBglYwVnt8c5ZvN0Ohi08jbB118kV96VObe+46PjjwHDVijZ/p0/hZ
 Y9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=R9RlH8yYjDgjxNsPU/x1Y0axK/NhANeQ1a0dHTnmXkw=;
 b=ePEOlPikuXrm8KLpJs23ti8jFAZ2q6kTLyqLiMOMUIFUVt9xQrtRFsrxqMxLwgjgny
 jPa/aAH+D+8k95yQsFKwMbGqvRuHCrkP/epG5xAmVRAvkrPLD/YbD+DLv/j+/QIzRpGG
 CvyulRwin/csfF/WpctvKL2mvcxYCkgwfIPjFntlVMio3L8oNeQPTMG3BTJHcI/T1z26
 3FrWERQdvtfpYw2RDd938IHUt+RldZv9BzSfYTZ73B2Hz7jMFQPrwd9eAODUiNBlY1Tg
 p2+RVNkKPxHkJLVEmj1W6n55Wd79WgGEGWmgbV6F7yP9WjzykAV8FD5p05HT9P2VzuAG
 8k5w==
X-Gm-Message-State: APjAAAXIlB8j7cLj9/lpUWFBjd9dxC0nr2OjHEpSH8cVqIL+wk6aiMgt
 49pA4M22FVe/19buAxZl1BatcWVNsU+Vtg==
X-Google-Smtp-Source: APXvYqzlFjlb9CLsz/iyL8KBE+1SKt4uzRVJxd31KqWxoVlR/yTny0U/7Wnt/AbJFWLIqWQWgJiDKg==
X-Received: by 2002:a63:755e:: with SMTP id f30mr6514980pgn.246.1567052009595; 
 Wed, 28 Aug 2019 21:13:29 -0700 (PDT)
Received: from bogon.bytedance.net ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id g23sm1071080pfo.2.2019.08.28.21.13.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 28 Aug 2019 21:13:29 -0700 (PDT)
Message-ID: <5d6750e9.1c69fb81.3ce5f.44e5@mx.google.com>
X-Google-Original-Message-ID: <20190829041316.15961-1-liuhaichao>
From: liuhaichao@bytedance.com
X-Google-Original-From: liuhaichao
To: wireguard@lists.zx2c4.com
Subject: [PATCH] device: make locks more efficient
Date: Thu, 29 Aug 2019 12:13:16 +0800
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Haichao Liu <liuhaichao@bytedance.com>
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

From: Haichao Liu <liuhaichao@bytedance.com>

Change-Id: I515c38e9911d4baeb4c2a45249c18a371864f8e1
Signed-off-by: Haichao Liu <liuhaichao@bytedance.com>
---
 device/uapi.go | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/device/uapi.go b/device/uapi.go
index 99cb421..c8499e2 100644
--- a/device/uapi.go
+++ b/device/uapi.go
@@ -283,12 +283,12 @@ func (device *Device) IpcSetOperation(socket *bufio.Reader) *IPCError {
 				logDebug.Println(peer, "- UAPI: Updating endpoint")
 
 				err := func() error {
-					peer.Lock()
-					defer peer.Unlock()
 					endpoint, err := CreateEndpoint(value)
 					if err != nil {
 						return err
 					}
+					peer.Lock()
+					defer peer.Unlock()
 					peer.endpoint = endpoint
 					return nil
 				}()
-- 
2.19.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
