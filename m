Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB167C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:38:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5801020673
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s16M1E8X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5801020673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae15c0bd;
	Sun, 25 Aug 2019 15:37:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d3ff038
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Aug 2019 07:19:45 +0000 (UTC)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d335498c
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Aug 2019 07:19:45 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id n4so7159387pgv.2
 for <wireguard@lists.zx2c4.com>; Sat, 24 Aug 2019 00:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Faz621AFc3eXa+2THerJhI0jVT2ZuWBt+y+gaU7wnLA=;
 b=s16M1E8XP6ScfZ3tDUn9QjpnjHP6/J0m6cUYFG5KRJWKY4jKDC1O8fLQeUqr0VOZ09
 5k+9HcBejxNyWKL4nkuwLAcCoc6l+lvXfMe9liXKX50GmPKxMuupfrAYtS52X1vGSjf8
 v6v+UdiT1j19UmiyJvj44G1N/soCvDeZ31Y1arsALbHm2eEx3pOnj19jQ9oD88d4GJTa
 B98RIh+dp8FTlCAVG8g/v5VE2XiUKSqZKtZUdc2kiHQt9NsuFyLym7E28QYkm+FDXJ3a
 jNKvGa892L6ZG3nqnIGOinMTjo0OnAEI7ZT9VZDaWP2o4rIg8g7KwqPua6M+r32gKzsV
 +RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Faz621AFc3eXa+2THerJhI0jVT2ZuWBt+y+gaU7wnLA=;
 b=lG2z2p3fbTmroh5Q54Dq0VD2EEE15r7BM57b2bJSORQuiYJHftd4eoTBtWMxIU/OmC
 INy2I5pjzBJXSV9vayjHWOJvwTzEzRIbXn+0l6bKggqtgEfvdwJqReMsdp1FlOeE7Ilf
 Oc44MX8DLpJExqDXdsuIqMk6HiiKmdkXtzm0qPH6OlYi2hibDVXfzpQSKXKPFmemfvIy
 2/8/kNlf6b7DwryxCkagP5mdj80PUy/yVjhJLQiW29i7+hJwKIzFgQ87wkHMsjW5NFcV
 2oMi3OPyVKVESLvuCemKn0HN8amUCKGH5I1VJ8+teZ2qD87ujt0t6KgaIObbhItBQm/N
 cHuQ==
X-Gm-Message-State: APjAAAVVlLMRCLm7+Xi9bWXEH5DSCF7v1Jg0kEPRs+Fs8tOPkKFpaEL1
 NmX+EQPZ6oNw2aNjlfj7m8HpYhgR0w==
X-Google-Smtp-Source: APXvYqwObkHkBZYklu6pwKAVAAuACTESvM0w5+0QN1zJM+krO3y3GLtV48lQ+JTBE0ngodWRsQthZw==
X-Received: by 2002:a63:6d6:: with SMTP id 205mr7431789pgg.262.1566631184193; 
 Sat, 24 Aug 2019 00:19:44 -0700 (PDT)
Received: from rxps.home ([2600:8800:1e00:242:e440:629c:9de5:9ce0])
 by smtp.gmail.com with ESMTPSA id n70sm4847245pjc.3.2019.08.24.00.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2019 00:19:43 -0700 (PDT)
From: Ronan Pigott <rpigott314@gmail.com>
X-Google-Original-From: Ronan Pigott
To: wireguard@lists.zx2c4.com
Subject: [PATCH] wg-quick: linux: Don't fail systemd service when using
 systemd-resolved
Date: Sat, 24 Aug 2019 00:14:51 -0700
Message-Id: <20190824071451.5297-1-rpigott@berkeley.edu>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:37:24 +0200
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

systemd-resolved has a compatibility interface for use with resolvconf
scripts when resolvectl is called from a symlink from resolvconf.
However, when tearing down the interface, cmd_down calls del_if and
then unset_dns. In the case of systemd-resolved, deleting the interface
also removes the systemd-resolved entry and causes resolvconf -d to fail
when resolvconf really is a symlink to resolvectl.

The failure is harmless, as the dns entries have already been
effectively removed, but the nonzero exit code causes the systemd
service in 'systemctl stop wg-quick@ifname' to exit with failure.

Adding real sysemd-resolved support might involve checking if resolved
is running through dbus and such, but I think thats generally beyond the
scope of the wg-quick tool. Instead, the intent of this patch is basically:

"Let users off the hook for failure in resolvconf this one time if it's
really just a symlink to resolvectl"

---
 src/tools/wg-quick/linux.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tools/wg-quick/linux.bash b/src/tools/wg-quick/linux.bash
index 2f36dee..63ef781 100755
--- a/src/tools/wg-quick/linux.bash
+++ b/src/tools/wg-quick/linux.bash
@@ -300,7 +300,7 @@ cmd_down() {
 	execute_hooks "${PRE_DOWN[@]}"
 	[[ $SAVE_CONFIG -eq 0 ]] || save_config
 	del_if
-	unset_dns
+	unset_dns || [[ "$(type -P resolvconf)" -ef "$(type -P resolvectl)" ]]
 	execute_hooks "${POST_DOWN[@]}"
 }
 
-- 
2.23.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
