Return-Path: <SRS0=h/53=5C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE78C1975A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 17:23:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0979F20663
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 17:23:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=opal.com header.i=@opal.com header.b="fv462qyi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0979F20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=opal.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fd012d3;
	Tue, 17 Mar 2020 17:17:05 +0000 (UTC)
Received: from mail.opal.com (tunnel103479-pt.tunnel.tserv4.nyc4.ipv6.he.net
 [2001:470:1f06:113d::2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 64108795
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Mar 2020 10:27:27 +0000 (UTC)
Received: from susauq.opal.com (vpn-2.opal.com [IPv6:2001:470:8cb8:4:0:0:0:2])
 (authenticated bits=0)
 by mail.opal.com (8.15.2/8.15.2) with ESMTPSA id 02HABEAb061469
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Mar 2020 06:11:15 -0400 (EDT) (envelope-from jr@opal.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opal.com; s=mail;
 t=1584439876; bh=dY9bhi/kEFLue3o/guIMG2FP5djfFSWPPUcVzEJzszQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fv462qyiae+KqP8JWVHNXp37Ftxv4m5uWhwIhLbcpjX4oAjKV/TY3l6KS1rQKC+uE
 Ul9dQF6GP7V49WDU5q7LgcWhvaMbcwvYkjq107Gmp6eiXaEApAffj93ApkDXMT9wLq
 HQuAACKwMn9n0yexMxQCKTIs81zPPiVwvG+DCEbU=
Received: from susauq.opal.com (localhost [127.0.0.1])
 by susauq.opal.com (8.15.2/8.15.2) with ESMTPS id 02HABDrW074005
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 17 Mar 2020 11:11:14 +0100 (CET) (envelope-from jr@opal.com)
Received: (from jr@localhost)
 by susauq.opal.com (8.15.2/8.15.2/Submit) id 02HABDHt074004;
 Tue, 17 Mar 2020 11:11:13 +0100 (CET) (envelope-from jr)
From: "J.R. Oldroyd" <wgrd@opal.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: "J.R. Oldroyd" <wgrd@opal.com>
Subject: [PATCH 1/1] Add support for logging to syslog(3) on operating systems
 that support it (i.e., non-Windows, non-Plan9).
Date: Tue, 17 Mar 2020 11:09:57 +0100
Message-Id: <20200317100956.73928-2-wgrd@opal.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <CAHmME9onNwD9+hw2LgzZg_OqN21mOPEyQ9wAsFGjTA6=mK7xgA@mail.gmail.com>
References: <CAHmME9onNwD9+hw2LgzZg_OqN21mOPEyQ9wAsFGjTA6=mK7xgA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.opal.com [IPv6:2001:470:8cb8:2:0:0:0:1]);
 Tue, 17 Mar 2020 06:11:16 -0400 (EDT)
X-Mailman-Approved-At: Tue, 17 Mar 2020 18:17:01 +0100
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

Signed-off-by: J.R. Oldroyd <wgrd@opal.com>
---
 device/logger.go        |  45 ++++++----------
 device/logger_syslog.go | 112 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 129 insertions(+), 28 deletions(-)
 create mode 100644 device/logger_syslog.go

diff --git a/device/logger.go b/device/logger.go
index 7c8b704..8095b3d 100644
--- a/device/logger.go
+++ b/device/logger.go
@@ -1,3 +1,5 @@
+// +build windows,plan9
+
 /* SPDX-License-Identifier: MIT
  *
  * Copyright (C) 2017-2019 WireGuard LLC. All Rights Reserved.
@@ -6,7 +8,6 @@
 package device
 
 import (
-	"io"
 	"io/ioutil"
 	"log"
 	"os"
@@ -26,34 +27,22 @@ type Logger struct {
 }
 
 func NewLogger(level int, prepend string) *Logger {
-	output := os.Stdout
 	logger := new(Logger)
 
-	logErr, logInfo, logDebug := func() (io.Writer, io.Writer, io.Writer) {
-		if level >= LogLevelDebug {
-			return output, output, output
-		}
-		if level >= LogLevelInfo {
-			return output, output, ioutil.Discard
-		}
-		if level >= LogLevelError {
-			return output, ioutil.Discard, ioutil.Discard
-		}
-		return ioutil.Discard, ioutil.Discard, ioutil.Discard
-	}()
-
-	logger.Debug = log.New(logDebug,
-		"DEBUG: "+prepend,
-		log.Ldate|log.Ltime,
-	)
-
-	logger.Info = log.New(logInfo,
-		"INFO: "+prepend,
-		log.Ldate|log.Ltime,
-	)
-	logger.Error = log.New(logErr,
-		"ERROR: "+prepend,
-		log.Ldate|log.Ltime,
-	)
+	nullLog := log.New(ioutil.Discard, "", 0)
+	logger.Debug = nullLog
+	logger.Info  = nullLog
+	logger.Error = nullLog
+
+	if level >= LogLevelDebug {
+		logger.Debug = log.New(os.Stdout, "DEBUG: "+prepend, log.Ldate|log.Ltime)
+	}
+	if level >= LogLevelInfo {
+		logger.Info = log.New(os.Stdout, "INFO: "+prepend, log.Ldate|log.Ltime)
+	}
+	if level >= LogLevelError {
+		logger.Error = log.New(os.Stdout, "ERROR: "+prepend, log.Ldate|log.Ltime)
+	}
+
 	return logger
 }
diff --git a/device/logger_syslog.go b/device/logger_syslog.go
new file mode 100644
index 0000000..1271155
--- /dev/null
+++ b/device/logger_syslog.go
@@ -0,0 +1,112 @@
+// +build !windows,!plan9
+
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (C) 2017-2019 WireGuard LLC. All Rights Reserved.
+ */
+
+package device
+
+import (
+	"io/ioutil"
+	"log"
+	"log/syslog"
+	"os"
+	"strings"
+)
+
+const (
+	LogLevelSilent = iota
+	LogLevelError
+	LogLevelInfo
+	LogLevelDebug
+)
+
+type Logger struct {
+	Debug *log.Logger
+	Info  *log.Logger
+	Error *log.Logger
+}
+
+func NewLogger(level int, prepend string) *Logger {
+	logger := new(Logger)
+
+	nullLog := log.New(ioutil.Discard, "", 0)
+	logger.Debug = nullLog
+	logger.Info  = nullLog
+	logger.Error = nullLog
+
+	logdest := os.Getenv("WG_LOG_DEST")
+
+	logfacility := syslog.LOG_DAEMON
+	if logdest == "syslog" {
+		facility := os.Getenv("WG_LOG_FACILITY")
+		facility = strings.ToLower(facility)
+		facility = strings.TrimPrefix(facility, "log_")
+		// the commented-out ones exist on BSD but not in Go
+		switch facility {
+		case "auth":		logfacility = syslog.LOG_AUTH
+		case "authpriv":	logfacility = syslog.LOG_AUTHPRIV
+		//case "console":		logfacility = syslog.LOG_CONSOLE
+		case "cron":		logfacility = syslog.LOG_CRON
+		case "daemon":		logfacility = syslog.LOG_DAEMON
+		case "ftp":		logfacility = syslog.LOG_FTP
+		case "kern":		logfacility = syslog.LOG_KERN
+		case "local0":		logfacility = syslog.LOG_LOCAL0
+		case "local1":		logfacility = syslog.LOG_LOCAL1
+		case "local2":		logfacility = syslog.LOG_LOCAL2
+		case "local3":		logfacility = syslog.LOG_LOCAL3
+		case "local4":		logfacility = syslog.LOG_LOCAL4
+		case "local5":		logfacility = syslog.LOG_LOCAL5
+		case "local6":		logfacility = syslog.LOG_LOCAL6
+		case "local7":		logfacility = syslog.LOG_LOCAL7
+		case "lpr":		logfacility = syslog.LOG_LPR
+		case "mail":		logfacility = syslog.LOG_MAIL
+		//case "ntp":		logfacility = syslog.LOG_NTP
+		case "news":		logfacility = syslog.LOG_NEWS
+		//case "security":	logfacility = syslog.LOG_SECURITY
+		case "syslog":		logfacility = syslog.LOG_SYSLOG
+		case "user":		logfacility = syslog.LOG_USER
+		case "uucp":		logfacility = syslog.LOG_UUCP
+		}
+	}
+
+	if level >= LogLevelDebug {
+		if logdest == "syslog" {
+			sysLog, err := syslog.NewLogger(logfacility | syslog.LOG_DEBUG, 0)
+			if err == nil {
+				logger.Debug = sysLog
+			} else {
+				logger.Debug = log.New(os.Stdout, "DEBUG: "+prepend, log.Ldate|log.Ltime)
+			}
+		} else {
+			logger.Debug = log.New(os.Stdout, "DEBUG: "+prepend, log.Ldate|log.Ltime)
+		}
+	}
+	if level >= LogLevelInfo {
+		if logdest == "syslog" {
+			sysLog, err := syslog.NewLogger(logfacility | syslog.LOG_INFO, 0)
+			if err == nil {
+				logger.Info = sysLog
+			} else {
+				logger.Info = log.New(os.Stdout, "INFO: "+prepend, log.Ldate|log.Ltime)
+			}
+		} else {
+			logger.Info = log.New(os.Stdout, "INFO: "+prepend, log.Ldate|log.Ltime)
+		}
+	}
+	if level >= LogLevelError {
+		if logdest == "syslog" {
+			sysLog, err := syslog.NewLogger(logfacility | syslog.LOG_ERR, 0)
+			if err == nil {
+				logger.Error = sysLog
+			} else {
+				logger.Error = log.New(os.Stdout, "ERROR: "+prepend, log.Ldate|log.Ltime)
+			}
+		} else {
+			logger.Error = log.New(os.Stdout, "ERROR: "+prepend, log.Ldate|log.Ltime)
+		}
+	}
+
+	return logger
+}
-- 
2.24.0

