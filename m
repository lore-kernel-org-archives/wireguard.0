Return-Path: <SRS0=gQ6O=UF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FFAC04AB5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:33:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E65720684
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:33:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haP3bWVo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E65720684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27e0b9c1;
	Thu, 6 Jun 2019 09:32:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14875b20
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2019 08:17:16 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a74ab430
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2019 08:17:15 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id f10so2046986wre.7
 for <wireguard@lists.zx2c4.com>; Tue, 21 May 2019 01:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SIvK64mzJmkjLVKweBoIWn0jdSnjkKyWfHoMIfwCAEE=;
 b=haP3bWVonPk7vIH5ceEEbvQ9re2nCGG80/o7hpjHChLkRlp8tSYypdWyKW5jfIYw67
 97D/xXs9QlucfH/ymq1c18iA5SiB16lXV7bhjz9kkw5/toBpEbNcPki3j6typqAOT3V7
 CSQpbZRk3kMfNArg/I5TSJUf/AotH9c9rZw3eBLFkQi9i1rIRj77tD5GDMNviHw0DZ1m
 HBKeusSdk/d8tYf0XY/9O0pq1loTV4zPE3wUJDBNAFJOeNg6JOCqMxBad6juoW/D5eyF
 FpD6Yldr2zg6FerYO/ZJUtN3fKTbY7lvhy74Y3EGEFBte3suSZTOS/HMs/NGCRx3fu8X
 ENCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SIvK64mzJmkjLVKweBoIWn0jdSnjkKyWfHoMIfwCAEE=;
 b=Swqum8RLxSNOvspXZddV+76zlk2ODsu7zuoxmPIDeoWGT3Xo5yMEitJzYhEOB/Mpx4
 shBK6QZOvBioo+AvBTKZtZm66p1wBwXznnjKUPq372rvN+sCSk93EpfByA4bi2WrRc9K
 D/If1HtubH8rsgtlV/SFTPBN+vlHTUtiv92rfCjjA2tZEIA/fq69JstENBJ0dK82AxhK
 Xx9lz3FX5Ssk2hrOOGV/pd1+QvE9OoHrS5HCCAJ7hvJDBE5FzaBWXlD8KUYEtikwhDUf
 HqvktapMXve1RLDA2j7ukbJGN5JGA9TXSB01N+QHswr9R7yhfZji6e8D8pvWF/XEBLwi
 9MUQ==
X-Gm-Message-State: APjAAAUO+vXswbyCSvpD93MiTWsBO7H8UXwNgWdjvLSlmL2lnKfoVtCX
 q4Oue9SYox0VqD2SmCvHEXP64RS7Rdc=
X-Google-Smtp-Source: APXvYqz7d+h9t6b0S53tX++n+28TSwffNEXdflT1LW/YJBLkzYy0HmUg86seUlybR8Wu5qjH4fAgJQ==
X-Received: by 2002:a5d:51d0:: with SMTP id n16mr36722428wrv.167.1558426634320; 
 Tue, 21 May 2019 01:17:14 -0700 (PDT)
Received: from localhost.localdomain (5-12-113-143.residential.rdsnet.ro.
 [5.12.113.143])
 by smtp.gmail.com with ESMTPSA id x187sm2535613wmg.11.2019.05.21.01.17.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 01:17:13 -0700 (PDT)
From: jwriteclub@gmail.com
To: wireguard@lists.zx2c4.com
Subject: [PATCH 2/2] Bubble up the error in attempting to delete the interface
 after attempting to set the interface name has failed.
Date: Tue, 21 May 2019 11:16:48 +0300
Message-Id: <20190521081648.12160-2-jwriteclub@gmail.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20190521081648.12160-1-jwriteclub@gmail.com>
References: <20190521081648.12160-1-jwriteclub@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Jun 2019 11:32:41 +0200
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

From: Christopher O'Connell <jwriteclub@gmail.com>

---
 tun/tun_windows.go | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tun/tun_windows.go b/tun/tun_windows.go
index c1c7de7..6d79ba9 100644
--- a/tun/tun_windows.go
+++ b/tun/tun_windows.go
@@ -79,7 +79,10 @@ func CreateTUN(ifname string) (TUNDevice, error) {
 
 	err = wt.SetInterfaceName(ifname)
 	if err != nil {
-		wt.DeleteInterface(0)
+		_, _, err2 := wt.DeleteInterface(0)
+		if err2 != nil {
+			return nil,fmt.Errorf("Unable to delete Wintun interface after failing to set name: %v: %v", err2, err)
+		}
 		return nil, fmt.Errorf("Unable to set name of Wintun interface: %v", err)
 	}
 
-- 
2.21.0.windows.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
