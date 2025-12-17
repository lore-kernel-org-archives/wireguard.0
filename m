Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38509EF06EA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:13:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3deba636;
	Sun, 8 Feb 2026 17:13:05 +0000 (UTC)
Received: from mx1.net9.cf (mx1.net9.cf [2a04:dd00:23:4::10])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b461a0a8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Dec 2025 19:02:55 +0000 (UTC)
Received: from u34 by mx1.net9.cf with local (@Mail Server)
 (envelope-from <u34@net9.cf>) id 1vVwnX-00000000SGY-0Y3U
 for wireguard@lists.zx2c4.com; Wed, 17 Dec 2025 19:02:55 +0000
Date: Wed, 17 Dec 2025 19:02:55 +0000
To: wireguard@lists.zx2c4.com
Subject: A minor patch for wg.8 manual page
User-Agent: s-nail v14.9.25
Message-Id: <E1vVwnX-00000000SGY-0Y3U@mx1.net9.cf>
From: u34@net9.cf
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:12:58 +0000
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

The wg.8 manual page CONFIGURATION FILE FORMAT EXAMPLE section has a comment
about comments in the configuration file.
Since
1. I think such a comment belong to the CONFIGURATION FILE FORMAT section.
2. The example in the CONFIGURATION FILE FORMAT EXAMPLE section has no comments 
I propose
--- a/wg.8	2025-12-17 18:34:56.023484459 +0000
+++ b/wg.8	2025-12-17 18:51:04.271960383 +0000
@@ -132,6 +132,7 @@
 The configuration file format is based on \fIINI\fP. There are two top level sections
 -- \fIInterface\fP and \fIPeer\fP. Multiple \fIPeer\fP sections may be specified, but
 only one \fIInterface\fP section may be specified.
+Characters after and including a '#' are considered comments and are thus ignored.
 
 .P
 The \fIInterface\fP section may contain the following fields:
@@ -177,17 +178,20 @@
 
 .SH CONFIGURATION FILE FORMAT EXAMPLE
 This example may be used as a model for writing configuration files, following an
-INI-like syntax. Characters after and including a '#' are considered comments and
-are thus ignored.
+INI-like syntax. 
 
     [Interface]
 .br
+    # A comment: only one [Interface] section may be specified.
+.br
     PrivateKey = yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=
 .br
     ListenPort = 51820
 .br
     
 .br
+    # A comment: multiple [Peer] sections may be specified.
+.br
     [Peer]
 .br
     PublicKey = xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=
