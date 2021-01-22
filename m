Return-Path: <SRS0=FNV9=G3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4424C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 16:30:53 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA779206BE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 16:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA779206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mcint.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ee4ad00;
	Sun, 24 Jan 2021 16:24:25 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 59f57729
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jan 2021 07:06:13 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id BEA0B58050D;
 Fri, 22 Jan 2021 01:59:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 22 Jan 2021 01:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mcint.io; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=TYtk3PuukxNEJ
 g6bSNd3ybM+Q9F2axBHCQoKJ0+QKm8=; b=cODmBEu9/57bmgtaYayHWdBudIu5t
 dP1gzqKXD2dh5eXmgqOOSjalKAoGUNQRhOZWg8dbfiYQHjFUxRLKXBykvLN0YQPF
 PA6wXVHH7KqeA8tybcDsX+JzgaNLLdvfJLr5927Yn/+ES4qYzW528sc5pz+aFigi
 mqoRZjv8LMl2WToMbzHKFhfT9ZY/8s8ZwNWPALbhA5MDzX6Pu8aN+01M+XA2RKi3
 v/CXFao2a/0YqHmDBvnuUpCiuArqgNRRjzImX1F1j24uc4v05DCxDCzzn1ReiGff
 5IEkWwHuV4E/PLdP7zERBVGr/Sol5uXLUvEy7hL1W6I2GaZ4ntXNJtB8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=TYtk3PuukxNEJg6bSNd3ybM+Q9F2axBHCQoKJ0+QKm8=; b=sACC2daq
 1bZL5F4vWPqDeZPXnS5EJ17hGjVJxuwvyq556lgQHfdCzngZ42xZ7rVdM3IJ9gdR
 rbG7xSVL8cVqNUbtmd8aVVOJ05jZgdIkcayR2z2WMbfcpWM/i7KGx3QnziqrDlmZ
 ma/F3adnl66RROssRlirzfhjugOOBT4KWcMf/N8ldC/DxQURIqTHOAsexkw8J/9F
 q9SymMJCDyiw6BTSWCy3rL6pwE7hqcj2uKPhEPTTOP4jFyxnGaudoQfM6vG5NUNS
 eMMRBddvXBksU4OJRo/Z2rPzTUiYLus/XBTTX53Cm+sfyiFLviqb3io2wBUes3sZ
 kd0WYwvFpX+fJA==
X-ME-Sender: <xms:xHcKYPb2GLfKvzNaS4Ihb3M8rMMaNnnQkrlUcDMixuF6iqD1TSKZ3Q>
 <xme:xHcKYOZGQKo5nepwRmWO6gdExtDbJkAVM-1olsBpIW5J52VKe7mN-sHVnQJXejkXR
 AyMqp9jn1UJNggIu00>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgorfhhihhshhhinhhgqdfkphfpvghtfihorhhkuc
 dlfedttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhm
 pefnohhrvghnucfotgfknhhthihrvgcuoehlohhrvghnsehmtghinhhtrdhioheqnecugg
 ftrfgrthhtvghrnhepgfffkedutedutdefieegledvhfeukedtffefffdtueevudehheei
 ffffveekvddvnecukfhppedugeefrdduuddtrddvvdelrddvuddunecurfhhihhshhhinh
 hgkfhppfgvthifohhrkhepudegfedruddutddrvddvledrvdduudenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlohhrvghnsehmtghinhhtrd
 hioh
X-ME-Proxy: <xmx:xHcKYB8seQQFVFjtTqx49qxBJOtvZULD4hVHm35XReU51M1ux-bn0w>
 <xmx:xHcKYFoPs5hkjG8m71RAAHn09CeO0Vl4pE3gEc2jjPwHR6HeVmnldw>
 <xmx:xHcKYKopRFMgYRuZfj1hmSb5n_DWNQCfneVcl_aIvgSzcRUYD19jsQ>
 <xmx:xHcKYIEwVGcTGE2HH84CWEYyqEGU869LY7iTFlhZh4_vvWMCqqGdUw>
Received: from localhost.localdomain (unknown [143.110.229.211])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3BC241080063;
 Fri, 22 Jan 2021 01:59:16 -0500 (EST)
From: Loren McIntyre <loren@mcint.io>
To: wireguard@lists.zx2c4.com
Cc: Loren McIntyre <loren@mcint.io>
Subject: [PATCH 2/2] wg-quick: darwin: handle disabled interface
Date: Thu, 21 Jan 2021 22:58:58 -0800
Message-Id: <20210122065858.41605-2-loren@mcint.io>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122065858.41605-1-loren@mcint.io>
References: <7a51e0ee-73f8-441a-9cdd-3aa305832c85@www.fastmail.com>
 <20210122065858.41605-1-loren@mcint.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 24 Jan 2021 16:24:12 +0000
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
 src/wg-quick/darwin.bash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/wg-quick/darwin.bash b/src/wg-quick/darwin.bash
index 9c92f87..e9bdfea 100755
--- a/src/wg-quick/darwin.bash
+++ b/src/wg-quick/darwin.bash
@@ -296,7 +296,7 @@ set_dns() {
 	local service response
 	for service in "${!SERVICE_DNS[@]}"; do
 		while read -r response; do
-			[[ $response == *Error* ]] && echo "$response" >&2
+			[[ $response == *Error* || $response == *"disabled)" ]] && echo "$response" >&2
 		done < <(
 			cmd networksetup -setdnsservers "$service" "${DNS[@]}"
 			if [[ ${#DNS_SEARCH[@]} -eq 0 ]]; then
@@ -312,7 +312,7 @@ del_dns() {
 	local service response
 	for service in "${!SERVICE_DNS[@]}"; do
 		while read -r response; do
-			[[ $response == *Error* ]] && echo "$response" >&2
+			[[ $response == *Error* || $response == *"disabled)" ]] && echo "$response" >&2
 		done < <(
 			cmd networksetup -setdnsservers "$service" ${SERVICE_DNS["$service"]} || true
 			cmd networksetup -setsearchdomains "$service" ${SERVICE_DNS_SEARCH["$service"]} || true
-- 
2.29.2

