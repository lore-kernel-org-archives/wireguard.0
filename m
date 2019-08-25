Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFB7C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 09:25:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84092217D7
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 09:25:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="QPgOxK8N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84092217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 688d5e26;
	Sun, 25 Aug 2019 09:25:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0d25318
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 09:25:53 +0000 (UTC)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 090a7131
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 09:25:53 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id i18so8550854pgl.11
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 02:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=w80nHxqC26qVz9EeMB+0Sgfl0h2qqUb0fBtVANmubVI=;
 b=QPgOxK8NLb24ok2xbpQEJJht9otDuVMh16R3/MVsoLzDDKzUhiU6VKR2mpTu7AIfxY
 Ctadrk6sf0Zx0ZnKiZiZeY7K6xn1I25Tqh2AM+ij6HtiG7zJd1Jud1WsI7wFQIS8a/3F
 Fsv1dRFdha+lIKI0bglG6hlbqzYJJvsgYOAf+NJJTSBAmMYpEG8zsJs2gDhfWwWH3Ehs
 xAJ8FZl+iOoWjhaiVoA/UprmRch0SP00LwhihBczVMHKwJzfcsD9s7f8ar6Fo/ToHcNn
 qlweDixTAV87+1tUDrQZ8QLiUMhdOL+JYC0sQ/cuyWONbhOJaT6OCgXvLitcE9TUO8T7
 iiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=w80nHxqC26qVz9EeMB+0Sgfl0h2qqUb0fBtVANmubVI=;
 b=Zg65N5JZVgyvSArZ+hWSMxhys4xovwgefymXSjXwSrbZpdh610BYF6a7OadYnva35t
 I7irqZl28jWVM2RKtI9ImACLEgiJBQ25EtDJOT5FTBkJ2nBil5HASYVMrj4G0ZC4XnZi
 iYFNgWH5INrxWBy3PByCf3e25xkiyY6igugEipENbmXvhzQ37SnFZJENR2VZhgm2S9uw
 5U6Ul8W333qDbUblKDdVOYhGjGI7queukJ6BU9XW6l4YBtyXLKW6gh76sinO24vMx/ya
 d33/caE49LyLn/UQpNgzq9ZN1P4dQ501HZ4RYq3Nr7IQ+UnCd9OpHOl7qav4JxW+4Y65
 UDpw==
X-Gm-Message-State: APjAAAVFzkMVArKoz0+mkmkNWMtNPA8CqOqy3O5gaWAy3b9THBt/MY5H
 PbVQBBzeywBNz3AtOyO/cqLY6ArRNAk/Jw==
X-Google-Smtp-Source: APXvYqz8FUQCotqbj9Q++j5L7KH5v9F4jqOflZnYwIFpfsTWpHo1i4JrokBWM49MaB1RhTE8oG/DjQ==
X-Received: by 2002:a63:f13:: with SMTP id e19mr11461033pgl.132.1566725152754; 
 Sun, 25 Aug 2019 02:25:52 -0700 (PDT)
Received: from bogon.bytedance.net ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id e26sm8372907pfd.14.2019.08.25.02.25.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 25 Aug 2019 02:25:52 -0700 (PDT)
Message-ID: <5d625420.1c69fb81.9f8e7.70a4@mx.google.com>
X-Google-Original-Message-ID: <20190825092531.55962-1-liuhaichao>
From: liuhaichao@bytedance.com
X-Google-Original-From: liuhaichao
To: wireguard@lists.zx2c4.com
Subject: [PATCH] tun: darwin: fix panic: close of closed channel
Date: Sun, 25 Aug 2019 17:25:31 +0800
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
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

Change-Id: Idd77fef05316f817e03a0f905ac5e6d53a6865f7
---
 tun/tun_darwin.go | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tun/tun_darwin.go b/tun/tun_darwin.go
index 0815495..07abc6b 100644
--- a/tun/tun_darwin.go
+++ b/tun/tun_darwin.go
@@ -296,8 +296,6 @@ func (tun *NativeTun) Close() error {
 	if tun.routeSocket != -1 {
 		unix.Shutdown(tun.routeSocket, unix.SHUT_RDWR)
 		err2 = unix.Close(tun.routeSocket)
-	} else if tun.events != nil {
-		close(tun.events)
 	}
 	if err1 != nil {
 		return err1
-- 
2.19.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
