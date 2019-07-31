Return-Path: <SRS0=EGLd=WR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B23EC3A59E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 Aug 2019 15:43:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED7CE22DA7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 Aug 2019 15:43:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="n+yXov5n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED7CE22DA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 067ff480;
	Wed, 21 Aug 2019 15:43:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca558f10
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 Jul 2019 02:57:35 +0000 (UTC)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e8f9e6f
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 Jul 2019 02:57:34 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id l21so31123141pgm.3
 for <wireguard@lists.zx2c4.com>; Tue, 30 Jul 2019 19:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=gLpJ/WZuoj1qSxdokKMqzDRbzyzPE9nOJLFNDqrM1Ts=;
 b=n+yXov5nAoaUcVe5O+/GjEB/CDzn55zbEHoTM0NPSBDj+ZtBpStvslITbu0Co9nr5U
 4+nNv87ZIqnvtHn0jJP2xxiPBgoE3ycGSCqDfcMurjSGyEd0ORbkcSQugEm5j/ne/1QZ
 MfTZMxwzVOGOigLXe8fXvVZKUVjZ+g5aqPNGUN9j59nRw3Ec0E/tMVbWsTrTcGQWn/jZ
 IOAlbJdfJFrVxgros9N6C/vGPdIYJCykci3Meisqs4uLjyPBP+lVxgMCfyhMiEYii5aO
 FgKxZbl6II2DK44RNvdemuF8gXzwjMM3InpoWBpvV/flTAjbIpodqWXwrt3+gxMh+hxj
 w4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=gLpJ/WZuoj1qSxdokKMqzDRbzyzPE9nOJLFNDqrM1Ts=;
 b=qUJ7kswOueXFl4IKQ/iP2cMkaKo1cu9IQWo7V1B09X5hW0YZlCNob/gcQMi1uInhLr
 A85ME8No3riWPd339pr3aWdOGWLsvJqnOhbCNd7jwRvivlPf17inh0Sd1ARbxMJeWixU
 A/zBpESdytqAGGfUDffMNCaI4iF7vyYhdfepiBcJZfJjsxmNSu5ZSWkd0hhn7pQNZk2j
 LOuVrGyTXkJ9zCKGeCSNCbaGNGzWo6itvAqNVb77fl1DIQa1Pr9CtptRdEkupuS3MCs+
 Ouhco64jZ1y3cSRS8ana1RDxbtU3fdF7zt6cBAQ0kq7n8gCHdsGXcqprHDKs+053rT6E
 cJFQ==
X-Gm-Message-State: APjAAAUpz/1609nPxuxzqcAtb3+CLDU3t5IX83/bo5kpefQDyv6beGZf
 nmfNv8QbGWs8fT29+F1fcjdemyQOHCGs/Q==
X-Google-Smtp-Source: APXvYqxt4fCXitlE+3ibtH96bjGUxrzS+TwnqkEviiA2OOaFsSJP1N7Ha5ELYw+nzbdxTpgAVxqzwA==
X-Received: by 2002:a63:f857:: with SMTP id v23mr86671243pgj.228.1564541853744; 
 Tue, 30 Jul 2019 19:57:33 -0700 (PDT)
Received: from bogon.bytedance.net ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id f6sm68174368pga.50.2019.07.30.19.57.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 30 Jul 2019 19:57:33 -0700 (PDT)
Message-ID: <5d41039d.1c69fb81.343ad.3704@mx.google.com>
X-Google-Original-Message-ID: <20190731025716.19532-1-liuhaichao>
From: liuhaichao@bytedance.com
X-Google-Original-From: liuhaichao
To: wireguard@lists.zx2c4.com
Subject: [PATCH] device: make locks more efficient
Date: Wed, 31 Jul 2019 10:57:16 +0800
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Aug 2019 17:43:05 +0200
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

Change-Id: I515c38e9911d4baeb4c2a45249c18a371864f8e1
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
