Return-Path: <SRS0=PVz2=BK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C79A3C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Jul 2020 14:19:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E565206DA
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Jul 2020 14:19:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rqm6ZQ3M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E565206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2374485;
	Fri, 31 Jul 2020 13:51:32 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cc878c9a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jul 2020 16:03:44 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id v22so9614648edy.0
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jul 2020 09:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tSYu0EDRgdF/ZhnSctSy10Vn0b/Cy7y1HFpDqy8LgSc=;
 b=rqm6ZQ3MjwytfLTwwnIOdvK7ap3nZvRE7wlXl5E5uBsNZyTrWa/i/mprlbwd0DzM5d
 p2mdUwrUaNiC34MheVkukGUU3cTt8ylw7VgZYxfmTaHnBMzt6bFapu+jJK00U0T09jZj
 jpcrcI7shTyCnSpOeSvapmwSPRaXp3X68TJDbeyHh3uVkopQ1px0nps66Deyyb9io2Ob
 nAXfDWFSctpPo8JsyuDe9G0pLJwACCYl7Cm/qdOOt60rFAHmtb0XpubVl9RDL0E3ecVT
 XdQZSV3zVs8cU0fNEXZzyxlD1y4KQQgLoj1r1PvD/nyjNu/o6+iup1daNtivyHiOwmL7
 o2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tSYu0EDRgdF/ZhnSctSy10Vn0b/Cy7y1HFpDqy8LgSc=;
 b=KMlC06TgXBjsx/+dRX3zCCA/O7IMq89Jg3kxVTDXnwyKBktiR76/FM5bJt/cy6ZTtx
 VaSjlY0UVhigFhhLyXoBflONWIbaczQivS6dIEsUZ+LrEIEGvzzbOpt8QOjSSsTwsu5r
 YGOG1W2O2YJSJcM4cx3tbFYMktuXckU9L9xWd+6Ya4IGkEAfEWMrEb5oY15CJsEIb9CA
 XS7KEW754PTX4NgBjPZpVmlsUfAVn/lbbO+a3zWyLG0r+AUePZjFXQPEuZJ85i5oOhGG
 5ObTHj15zrFhbA8JGAVhnAqAO2lf5wtJCLLSDAAtzihAUmx9PJc2Q7EMreVAvmPIaUnu
 1ApA==
X-Gm-Message-State: AOAM53229MBcvaYBiTUjzYdyuFlUJJUiOXlz3LSwyagKfmh4yx81chtU
 P1YfkbHqcb89w7AaNSeB34A45NsHziGAcg==
X-Google-Smtp-Source: ABdhPJyc9slY3gp1fRfTBuNH63aN1KhjbQcVFcmaKh7jZ0LRBQWfgUAmf6JKTzeEAvdOnXUT+tEVQg==
X-Received: by 2002:a50:e719:: with SMTP id a25mr3277127edn.15.1596126091246; 
 Thu, 30 Jul 2020 09:21:31 -0700 (PDT)
Received: from localhost.localdomain (ip113.ip-51-68-219.eu. [51.68.219.113])
 by smtp.gmail.com with ESMTPSA id
 y7sm6839337ejd.73.2020.07.30.09.21.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jul 2020 09:21:29 -0700 (PDT)
From: Sina Siadat <siadat@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Sina Siadat <siadat@gmail.com>
Subject: [PATCH] device ping test: get free port when testing
Date: Thu, 30 Jul 2020 20:50:49 +0430
Message-Id: <20200730162049.2869-1-siadat@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 31 Jul 2020 15:51:20 +0200
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

Signed-off-by: Sina Siadat <siadat@gmail.com>
---
 device/device_test.go | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/device/device_test.go b/device/device_test.go
index 5ea5410..016a0ca 100644
--- a/device/device_test.go
+++ b/device/device_test.go
@@ -8,6 +8,7 @@ package device
 import (
 	"bufio"
 	"bytes"
+	"fmt"
 	"net"
 	"strings"
 	"testing"
@@ -16,16 +17,30 @@ import (
 	"golang.zx2c4.com/wireguard/tun/tuntest"
 )
 
+func getFreePort(t *testing.T) string {
+	l, err := net.ListenPacket("udp", "localhost:0")
+	if err != nil {
+		t.Fatal(err)
+	}
+	defer l.Close()
+	return fmt.Sprintf("%d", l.LocalAddr().(*net.UDPAddr).Port)
+}
+
 func TestTwoDevicePing(t *testing.T) {
-	// TODO(crawshaw): pick unused ports on localhost
+	port1 := getFreePort(t)
+	port2 := getFreePort(t)
+
 	cfg1 := `private_key=481eb0d8113a4a5da532d2c3e9c14b53c8454b34ab109676f6b58c2245e37b58
-listen_port=53511
+listen_port={{PORT1}}
 replace_peers=true
 public_key=f70dbb6b1b92a1dde1c783b297016af3f572fef13b0abb16a2623d89a58e9725
 protocol_version=1
 replace_allowed_ips=true
 allowed_ip=1.0.0.2/32
-endpoint=127.0.0.1:53512`
+endpoint=127.0.0.1:{{PORT2}}`
+	cfg1 = strings.ReplaceAll(cfg1, "{{PORT1}}", port1)
+	cfg1 = strings.ReplaceAll(cfg1, "{{PORT2}}", port2)
+
 	tun1 := tuntest.NewChannelTUN()
 	dev1 := NewDevice(tun1.TUN(), NewLogger(LogLevelDebug, "dev1: "))
 	dev1.Up()
@@ -35,13 +50,16 @@ endpoint=127.0.0.1:53512`
 	}
 
 	cfg2 := `private_key=98c7989b1661a0d64fd6af3502000f87716b7c4bbcf00d04fc6073aa7b539768
-listen_port=53512
+listen_port={{PORT2}}
 replace_peers=true
 public_key=49e80929259cebdda4f322d6d2b1a6fad819d603acd26fd5d845e7a123036427
 protocol_version=1
 replace_allowed_ips=true
 allowed_ip=1.0.0.1/32
-endpoint=127.0.0.1:53511`
+endpoint=127.0.0.1:{{PORT1}}`
+	cfg2 = strings.ReplaceAll(cfg2, "{{PORT1}}", port1)
+	cfg2 = strings.ReplaceAll(cfg2, "{{PORT2}}", port2)
+
 	tun2 := tuntest.NewChannelTUN()
 	dev2 := NewDevice(tun2.TUN(), NewLogger(LogLevelDebug, "dev2: "))
 	dev2.Up()
-- 
2.24.3 (Apple Git-128)

