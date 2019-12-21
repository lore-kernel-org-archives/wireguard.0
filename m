Return-Path: <SRS0=7eHk=2Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF970C2D0DC
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 15:36:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81FE8206A4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 15:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81FE8206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a7a8ab6;
	Thu, 26 Dec 2019 15:36:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb5aea57
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Dec 2019 13:22:48 +0000 (UTC)
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c32efc2f
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Dec 2019 13:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 6A7913F398;
 Sat, 21 Dec 2019 14:22:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sp5ByboSAAaU; Sat, 21 Dec 2019 14:22:46 +0100 (CET)
Received: from balder.ecksun.com (unknown [212.85.91.90])
 (Authenticated sender: mb471877)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id D255D3F2A3;
 Sat, 21 Dec 2019 14:22:46 +0100 (CET)
Received: from dagr.ecksun.com ([192.168.1.158])
 by balder.ecksun.com with esmtp (Exim 4.92)
 (envelope-from <xun@ecksun.com>)
 id 1iieiU-0007Xv-7G; Sat, 21 Dec 2019 14:22:46 +0100
Received: from xun by dagr.ecksun.com with local (Exim 4.92)
 (envelope-from <xun@ecksun.com>)
 id 1iieiU-00076u-5U; Sat, 21 Dec 2019 14:22:46 +0100
From: Linus Wallgren <linus.wallgren@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] reresolve-dns: Add systemd-networkd support
Date: Sat, 21 Dec 2019 14:22:44 +0100
Message-Id: <20191221132244.27255-1-linus.wallgren@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Dec 2019 16:36:40 +0100
Cc: Linus Wallgren <linus.wallgren@gmail.com>
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

Signed-off-by: Linus Wallgren <linus.wallgren@gmail.com>
---

I have never contributed to projects using `git-send-email` before, I
hope I didn't mess anything up :)

 contrib/examples/reresolve-dns/reresolve-dns.sh | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/contrib/examples/reresolve-dns/reresolve-dns.sh b/contrib/examples/reresolve-dns/reresolve-dns.sh
index 8ab3635..c844b22 100755
--- a/contrib/examples/reresolve-dns/reresolve-dns.sh
+++ b/contrib/examples/reresolve-dns/reresolve-dns.sh
@@ -10,8 +10,13 @@ export LC_ALL=C
 
 CONFIG_FILE="$1"
 [[ $CONFIG_FILE =~ ^[a-zA-Z0-9_=+.-]{1,15}$ ]] && CONFIG_FILE="/etc/wireguard/$CONFIG_FILE.conf"
-[[ $CONFIG_FILE =~ /?([a-zA-Z0-9_=+.-]{1,15})\.conf$ ]]
-INTERFACE="${BASH_REMATCH[1]}"
+
+if [[ $CONFIG_FILE == /etc/wireguard/* ]]; then
+	[[ $CONFIG_FILE =~ /?([a-zA-Z0-9_=+.-]{1,15})\.conf$ ]]
+	INTERFACE="${BASH_REMATCH[1]}"
+elif [[ $CONFIG_FILE =~ systemd ]]; then
+	INTERFACE=$(awk '/^Name=/ { print substr($0, 6) }' "$CONFIG_FILE")
+fi
 
 process_peer() {
 	[[ $PEER_SECTION -ne 1 || -z $PUBLIC_KEY || -z $ENDPOINT ]] && return 0
@@ -34,6 +39,7 @@ while read -r line || [[ -n $line ]]; do
 	value="${stripped#*=}"; value="${value##*([[:space:]])}"; value="${value%%*([[:space:]])}"
 	[[ $key == "["* ]] && { process_peer; reset_peer_section; }
 	[[ $key == "[Peer]" ]] && PEER_SECTION=1
+	[[ $key == "[WireGuardPeer]" ]] && PEER_SECTION=1
 	if [[ $PEER_SECTION -eq 1 ]]; then
 		case "$key" in
 		PublicKey) PUBLIC_KEY="$value"; continue ;;
-- 
2.20.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
