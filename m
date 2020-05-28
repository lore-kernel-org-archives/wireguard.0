Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28009C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:45:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C75DE208B3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:45:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=garrit.xyz header.i=@garrit.xyz header.b="Kol7SH8C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C75DE208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garrit.xyz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d54ed28;
	Wed, 17 Jun 2020 07:26:39 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.23])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 933169ef
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 May 2020 18:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590691875;
 s=strato-dkim-0002; d=garrit.xyz;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=2jW7ioPM2Be3tieFJO5DgwIOuUl6Vp8WpLzR2Ck877U=;
 b=Kol7SH8Ct4qVwjt/qWvo1CEIlH+asMtotRN23kShwS15CqNa3zAZM6DwUQ1UbZ80L+
 KC3kSIdV6ZdEw3JGsUsAim1X7iaXIeE22C0BQ0IutR0XgTRmzQoQQ+w8VJ36EbRKG2tg
 oZcT2Ma+/9e1+D9B8PfMZmigMEJIXn9Q4Elf4PIwBMM1PbZ25BTH1KpjGknqR5OJkxsq
 CUNeL9va2KuT5iC6FZhClIKW2rD2chmUkk1YWJKmS2a9wITatPp0U1IQEvFHRW17mJjS
 4VWvOJ0gGUAmovJ9aaCeVMnxBxd8ju+fYT3lljaHmam0uT0ZLJMvF5UJh6Vl9wft3dl3
 rg5Q==
X-RZG-AUTH: ":L2MKYUGrb9+g6Yo/9DacaXP5UKUF1pzQZq8rlTFv9/FqKkfMj7DG0ltwUYiU2bdoyq/9lSg="
X-RZG-CLASS-ID: mo00
Received: from CKC-BS-N0240.fritz.box by smtp.strato.de (RZmta 46.9.0 AUTH)
 with ESMTPSA id k0b835w4SIjZ4YI
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 28 May 2020 20:45:35 +0200 (CEST)
From: Garrit Franke <contact@garrit.xyz>
To: wireguard@lists.zx2c4.com
Cc: Garrit Franke <contact@garrit.xyz>
Subject: [PATCH 3/6] wg-quick: freebsd: add restart command
Date: Thu, 28 May 2020 20:45:07 +0200
Message-Id: <20200528184510.51675-4-contact@garrit.xyz>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20200528184510.51675-1-contact@garrit.xyz>
References: <20200528184510.51675-1-contact@garrit.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 Jun 2020 09:26:34 +0200
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

---
 src/wg-quick/freebsd.bash | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/src/wg-quick/freebsd.bash b/src/wg-quick/freebsd.bash
index e1ee67f..81c341b 100755
--- a/src/wg-quick/freebsd.bash
+++ b/src/wg-quick/freebsd.bash
@@ -387,7 +387,7 @@ execute_hooks() {
 
 cmd_usage() {
 	cat >&2 <<-_EOF
-	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
+	Usage: $PROGRAM [ up | down | restart | save | strip ] [ CONFIG_FILE | INTERFACE ]
 
 	  CONFIG_FILE is a configuration file, whose filename is the interface name
 	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
@@ -445,6 +445,12 @@ cmd_down() {
 	execute_hooks "${POST_DOWN[@]}"
 }
 
+cmd_restart() {
+	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
+	cmd_down
+	cmd_up
+}
+
 cmd_save() {
 	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
 	save_config
@@ -469,6 +475,10 @@ elif [[ $# -eq 2 && $1 == down ]]; then
 	auto_su
 	parse_options "$2"
 	cmd_down
+elif [[ $# -eq 2 && $1 == restart ]]; then
+	auto_su
+	parse_options "$2"
+	cmd_restart
 elif [[ $# -eq 2 && $1 == save ]]; then
 	auto_su
 	parse_options "$2"
-- 
2.24.3 (Apple Git-128)

