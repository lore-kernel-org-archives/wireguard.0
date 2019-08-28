Return-Path: <SRS0=H7Gu=WY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924FDC3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 02:25:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 388F5214DA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 02:25:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8r19Si4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 388F5214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10198203;
	Wed, 28 Aug 2019 02:25:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d772f912
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 01:43:36 +0000 (UTC)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99a6933e
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 01:43:35 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id d85so584078pfd.2
 for <wireguard@lists.zx2c4.com>; Tue, 27 Aug 2019 18:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aGp0Pgt6+R2qR8Ue3rAURKzIWxwvSxIJIxb5jCZu3v4=;
 b=Z8r19Si4/Qq+zpP/RJzP0OmQlwknWAyYnYds5wVRC2ZN4xd9kczOXI/ljXqRY92ec0
 acDQTTowG9VXQfa6sAFTAtGND5GfNMMbUxeEz1cF45C3puuqUbtXo5pvWJdlKv9IwkII
 s9iCg8UpsWTgu/3uxCYdaAX65xvyOy+k+tlRTCLsRnIvDQkXxBf1Lfha7zxKDbo2nz7p
 nvmr/CZxukHJg/eAkLGKXf5Vvg9fxIdnZE8VLwfWYMZDXZlGNnjhQDc4kS/3t98PLPQn
 n6YDs4aOEtcJOuWzZ5HlD+95UcURh2BIgHGGBzi5oEdx5fgO4xCFpNRV9vvWzbX7COpP
 C7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aGp0Pgt6+R2qR8Ue3rAURKzIWxwvSxIJIxb5jCZu3v4=;
 b=pgKP5J01AQ2nw2WOouLf+GJQbdg6RH2GPX/K2sfhUkpoGGsyQrZc+ExrP6rorBxmaa
 FN6FbD5V3tCFYO1utCSbrxGxC6gbvOavI8uh8a+nrxaism953o7xouNlZOV8tI6tx42Z
 GKf0GtQa/+lzlG1BnJ62dux9mhvtuQ4TBT1XmqW4T277TY80egxhiqmEfwXHju7AYA7j
 2hTHqYpsBYkxA1D+kxk5aD9QF25Q2WtM4ODSxN83Z9yu7xJFAHeyUT3N2knWvognKGef
 Eh+2kcoKWvS7sEacHfO92AUJoBxCZJ0DmUZ6IprRoxVFP3vyJLQamLOS4CFdmsM+QWsw
 bPCg==
X-Gm-Message-State: APjAAAXRkS2lhd61rrEDYmw/rc1TgnjSuveMJ3sYWfarpx3/Kb1ddwxs
 rNJ0YKsf9KDcCikJbM2QJr6PA5o=
X-Google-Smtp-Source: APXvYqxJlBNiuzEQhQRELiK+hSZwU3WeeGDvOmiWnOZD6w2JZ3DX5FUfSmVk+G1s03ZzgdlxWzWDPA==
X-Received: by 2002:a17:90a:9bc3:: with SMTP id
 b3mr1708149pjw.103.1566956614255; 
 Tue, 27 Aug 2019 18:43:34 -0700 (PDT)
Received: from rxps.home ([2600:8800:1e00:97d:e051:bc7e:83c5:63ad])
 by smtp.gmail.com with ESMTPSA id j187sm627874pfg.178.2019.08.27.18.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 18:43:33 -0700 (PDT)
From: Ronan Pigott <rpigott314@gmail.com>
X-Google-Original-From: Ronan Pigott
To: wireguard@lists.zx2c4.com
Subject: [PATCH v2] wg-quick: linux: Don't fail systemd service when using
 systemd-resolved
Date: Tue, 27 Aug 2019 18:42:14 -0700
Message-Id: <20190828014214.12289-1-rpigott@berkeley.edu>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Aug 2019 04:25:08 +0200
Cc: Ronan Pigott <rpigott@berkeley.edu>
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

From: Ronan Pigott <rpigott@berkeley.edu>

v2 patch for systemd-resolved support.

systemd-resolved has a compatibility interface for use with resolvconf
scripts when resolvectl is called from a symlink from resolvconf.
However, when tearing down the interface, cmd_down calls del_if and
then unset_dns. In the case of systemd-resolved, deleting the interface
also removes the systemd-resolved entry and causes resolvconf -d to fail
when resolvconf really is a symlink to resolvectl. This causes
`wg-quick down` and 'wg-quick@.service' to exit with failure.

This version uses the resolvconf '-f' flag to ignore non existent
interfaces, supported by both openresolv and sd-resolved resolvconf.

See v1 for the symlink test method and discussion.

Signed-off-by: Ronan Pigott <rpigott@berkeley.edu>
---
 src/tools/wg-quick/linux.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tools/wg-quick/linux.bash b/src/tools/wg-quick/linux.bash
index 2f36dee..e218be2 100755
--- a/src/tools/wg-quick/linux.bash
+++ b/src/tools/wg-quick/linux.bash
@@ -155,7 +155,7 @@ set_dns() {
 
 unset_dns() {
 	[[ ${#DNS[@]} -gt 0 ]] || return 0
-	cmd resolvconf -d "$(resolvconf_iface_prefix)$INTERFACE"
+	cmd resolvconf -fd "$(resolvconf_iface_prefix)$INTERFACE"
 }
 
 add_route() {
-- 
2.23.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
