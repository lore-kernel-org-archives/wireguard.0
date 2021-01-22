Return-Path: <SRS0=FNV9=G3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00522C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 16:30:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F05D3206BE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 16:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F05D3206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mcint.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14235c7d;
	Sun, 24 Jan 2021 16:24:27 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c53f5712
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jan 2021 07:06:13 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6648A580504;
 Fri, 22 Jan 2021 01:59:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 22 Jan 2021 01:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mcint.io; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=E4TyBO6FOy9PS
 JPUFbYjxCyLyM0v+JavwOalDtB6BPs=; b=N5x+eqcRBPee1wb1+T4Q/gLsRaweu
 1olPRwJv9vxsbqZr1PePgKw9qUrnedkHnyRPqSu0X78EyNiTP4yXLo7/lUDNewY+
 0YOHTwY2ZKxuaiztUq7RXUZuGXjOn6ImuhHO6vsAh1M1mUkxoskXXbwBH/VHz5SM
 mQMsBe9NZuMcfnKPTMNzJGVAW+TBbq9Wha3E2i5O+pPiKYQmIYtbno2vvUHKph8v
 FhKWV/xPxCNrAbnz8Ck6C7XjHh2Yez9+taoQcBicoHiPkuuKrBiyjMFxY2SzHpeL
 DCZv/qSHjKBjIOOWEFqDciuKNuDkpKLLdd0CzN3RK47HJPvKZzLZR/KBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=E4TyBO6FOy9PSJPUFbYjxCyLyM0v+JavwOalDtB6BPs=; b=E/CnwLUe
 2gfItx+JAZ+/LlDyFZHsc0OujvcvgxArgYh1exHtlyAyreMLGn+FGeEhIXTKXzfv
 oyhZyp9feS0uq54QRUb2bKmfKlnp9QrLHsRS6Efsci6LHESPtJR4NK7jBQNCj84Q
 +1XpN3rXhrdVZGhZjY007rBqS3krPREHNeyGujxyXHSL0dJ9sggPoIUBxyYpc+v2
 rSb/YoZVaHKZWAS8uL1eAYoTaFS+eWnAX24A0lAHr6UI0/xEgiKKHqGo2FtklnAe
 7orx85fwLE2MB+w0+W9tYf8zoxQO3tlAvYsGMi10aebKWEFVLdCxinjWANXj6nJZ
 a2+VO8eQ2OKATQ==
X-ME-Sender: <xms:w3cKYELtyfEs6_Sz9HP8MlwO7XGUiD6m9hs0jZ4KPO0dAgYdcn3CgQ>
 <xme:w3cKYEJt8ZrgEDG-9OUWSUeZxIVdK5SBz6ovA8lQJOtzVMrBmGneNHTGI-uLaE0u-
 v4IasjnqwpCPjn9rLc>
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
X-ME-Proxy: <xmx:w3cKYEspLc3CQr3TjkVEhpmAkYzPoZdQiBgWSnJby3xeNUuo2l-Srg>
 <xmx:w3cKYBZjW08v85aE7owB5wDGpiyVf9cGgYVfU9YkNxabZ2zWWvu_ZQ>
 <xmx:w3cKYLa4eo0sLDtD0P22dnIwBH-UCSs1eRs1bOId0o8ivpiRAQX0BA>
 <xmx:xHcKYF1GSSQ118MFiK3OSStiVd8-zO0nGDp8N8GEK9RAs3hN-YnuCA>
Received: from localhost.localdomain (unknown [143.110.229.211])
 by mail.messagingengine.com (Postfix) with ESMTPA id 921AF108005B;
 Fri, 22 Jan 2021 01:59:15 -0500 (EST)
From: Loren McIntyre <loren@mcint.io>
To: wireguard@lists.zx2c4.com
Cc: Loren McIntyre <loren@mcint.io>
Subject: [PATCH 1/2] wg-quick: darwin: restore original dns settings on failed
 up
Date: Thu, 21 Jan 2021 22:58:57 -0800
Message-Id: <20210122065858.41605-1-loren@mcint.io>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7a51e0ee-73f8-441a-9cdd-3aa305832c85@www.fastmail.com>
References: <7a51e0ee-73f8-441a-9cdd-3aa305832c85@www.fastmail.com>
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
 src/wg-quick/darwin.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/wg-quick/darwin.bash b/src/wg-quick/darwin.bash
index cde1b54..9c92f87 100755
--- a/src/wg-quick/darwin.bash
+++ b/src/wg-quick/darwin.bash
@@ -449,7 +449,7 @@ cmd_usage() {
 cmd_up() {
 	local i
 	get_real_interface && die "\`$INTERFACE' already exists as \`$REAL_INTERFACE'"
-	trap 'del_if; del_routes; exit' INT TERM EXIT
+	trap 'del_if; del_routes; del_dns; exit' INT TERM EXIT
 	execute_hooks "${PRE_UP[@]}"
 	add_if
 	set_config
-- 
2.29.2

