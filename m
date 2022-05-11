Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9977C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 May 2022 23:31:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d9ce4885;
	Fri, 13 May 2022 23:31:31 +0000 (UTC)
Received: from dtvax.dynatron.me (dtvax.dynatron.me [67.207.87.243])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 89706170
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 May 2022 13:51:21 +0000 (UTC)
Received: from home.dynatron.me ([10.68.82.1])
 by dtvax.dynatron.me (8.16.1/8.16.1) with ESMTPS id 24BDmnGb017849
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
 Wed, 11 May 2022 09:48:49 -0400 (EDT)
 (envelope-from dponte@dynatron.me)
Received: from farwarl.theamigan.net (farwarl [127.0.0.1])
 by home.dynatron.me (8.16.1/8.16.1) with ESMTPS id 24BDmhLq081789
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 11 May 2022 09:48:43 -0400 (EDT)
 (envelope-from dponte@farwarl.theamigan.net)
Received: (from dponte@localhost)
 by farwarl.theamigan.net (8.16.1/8.16.1/Submit) id 24BDmcrQ081788;
 Wed, 11 May 2022 09:48:38 -0400 (EDT) (envelope-from dponte)
From: Dan Ponte <amigan@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Dan Ponte <amigan@gmail.com>
Subject: [PATCH] wg-quick: freebsd: save mask of interface in save_config
Date: Wed, 11 May 2022 09:48:28 -0400
Message-Id: <20220511134827.81778-1-amigan@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 May 2022 23:31:24 +0000
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

Other than the obvious benefits, this prevents "ifconfig: WARNING: setting interface
address without mask is deprecated, default mask may not be correct." from appearing
on the next start after save.

Signed-off-by: Dan Ponte <amigan@gmail.com>
---
 src/wg-quick/freebsd.bash | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/src/wg-quick/freebsd.bash b/src/wg-quick/freebsd.bash
index b529ab2..5864a17 100755
--- a/src/wg-quick/freebsd.bash
+++ b/src/wg-quick/freebsd.bash
@@ -341,13 +341,15 @@ set_config() {
 }
 
 save_config() {
-	local old_umask new_config current_config address cmd
+	local old_umask new_config current_config network cidr address cmd
 	new_config=$'[Interface]\n'
-	{ read -r _; while read -r _ _ _ address _; do
-		new_config+="Address = $address"$'\n'
+	{ read -r _; while read -r _ _ network address _; do
+		cidr=(${network//\// })
+		new_config+="Address = $address/${cidr[1]}"$'\n'
 	done } < <(netstat -I "$INTERFACE" -n -W -f inet)
-	{ read -r _; while read -r _ _ _ address _; do
-		new_config+="Address = $address"$'\n'
+	{ read -r _; while read -r _ _ network address _; do
+		cidr=(${network//\// })
+		new_config+="Address = $address/${cidr[1]}"$'\n'
 	done } < <(netstat -I "$INTERFACE" -n -W -f inet6)
 	while read -r address; do
 		[[ $address =~ ^nameserver\ ([a-zA-Z0-9_=+:%.-]+)$ ]] && new_config+="DNS = ${BASH_REMATCH[1]}"$'\n'
-- 
2.36.0

