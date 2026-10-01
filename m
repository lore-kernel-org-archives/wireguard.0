Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AB5CA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 12:51:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2a075731;
	Mon, 5 Oct 2026 07:00:48 +0000 (UTC)
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch
 [185.70.43.167])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8e93f219
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2026 04:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=gh3pqark3rcv5lqt3bz5wyuwwu.protonmail2; t=1790827778;
 x=1791086978; bh=ERqDzcymGJXI6u/SZz6Hyk2IgmEXqPAEJAvYFm6EvX0=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=rCpb9TphcaOYGg9g2WPc8t1xuUZK6feiykj8psNtfpDeDcrqCfPX7lxsp04ou+ci6
 QaxjfOHc4wcTcVFo5yvssVUQbg+GGZz2Pz8ON6RryENdgOJL0NkmJ1FEZJRCVCXpWs
 YvFw0+RmM6n64BdJkp9JN1w9Me1bXcZCJM0GIgrSSj9UNl7pz0F3Ju04mtLZBSvw+C
 NjpPrYuIcVbnBDkyztyIrXs0lWhnJzEEFQnzYIJnhQO3CVbO8C8ewyc6XtWO4NhbV5
 ytp3SCjaPw8wg7INzJvHHJddC1XdNKEkjS1bC2tcPlSq7DK4SwjjUytpEVrIe1v/2H
 tt3fEA+Z93kPg==
Date: Thu, 01 Oct 2026 04:09:34 +0000
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: quantumvoid <quantumvoid0@proton.me>
Cc: "Jason@zx2c4.com" <Jason@zx2c4.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: [PATCH] wireguard: allowedips: prevent stack overflow without DEBUG
Message-ID: <TaZxFNfdnpo-3szeC-LoWZBxj-6XGhXkdEqnQi6yyaOHXp8cw4Xtksw07sYrIpludwvJQrukFoCGw3r9rXDcInkdB5QD2EswKPNsXMU3qMQ=@proton.me>
Feedback-ID: 175132216:user:proton
X-Pm-Message-ID: cc0681d692d98fbcf4d094f51eb55190625dd138
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

push_rcu() only bounds-checked the traversal stack when
DEBUG is defined. In production the check is compiled out,
leaving an unchecked stack[129] write.

Always check len >=3D MAX_ALLOWEDIPS_DEPTH and only gate the
WARN splat on DEBUG.

Signed-off-by: quantumvoid0 <quantumvoid0@proton.me>
---
 drivers/net/wireguard/allowedips.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/all=
owedips.c
index 5ece9ac..dc383f5 100644
--- a/drivers/net/wireguard/allowedips.c
+++ b/drivers/net/wireguard/allowedips.c
@@ -42,8 +42,10 @@ static void push_rcu(struct allowedips_node **stack,
 =09=09     struct allowedips_node __rcu *p, unsigned int *len)
 {
 =09if (rcu_access_pointer(p)) {
-=09=09if (WARN_ON(IS_ENABLED(DEBUG) && *len >=3D MAX_ALLOWEDIPS_DEPTH))
+=09=09if (unlikely(*len >=3D MAX_ALLOWEDIPS_DEPTH)) {
+=09=09=09WARN_ON(IS_ENABLED(DEBUG));
 =09=09=09return;
+=09=09}
 =09=09stack[(*len)++] =3D rcu_dereference_raw(p);
 =09}
 }
--
2.55.0
