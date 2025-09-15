Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BA9CF34C1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 14:47:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40baa311;
	Tue, 18 Nov 2025 17:32:20 +0000 (UTC)
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch
 [109.224.244.22])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 05567f90
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Sep 2025 11:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tcarey.uk;
 s=protonmail; t=1757937518; x=1758196718;
 bh=n9NDKjcJnS8ZyenWeoSequo4p01+vgPSe2A2lsLaNMU=;
 h=Date:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=uLQav3OhCSeIaLIbej5hQbagiONKHlR5f7BBDTQbn6lUmecS9VPeS17vy96s/clAD
 uogqxQ0SfnG4kLCup5UUjg4L8K3beJ9952JwgR+OnXn3x8GPBeVwmUxt/agpJ+sO0B
 r4kwbfcVhDi0PIhvEJ68r0I+T/7s50ZLiOSeYgOLa9PMfWSwJLYrjxtMn9O3TNQWtb
 uVnu/+Km8MjXJ2SN3KklswH2Vt23NqHaqbF1DEMXO12YlwUKO2ape0n2FVBBh1sIlT
 f0eSykoWf+HEozUVMoqOKFSrF5ttW2hrKTEKPbV0Ne+JupMzW1zt+ZrhvbRnL0bTsd
 G2YMwjlV96nGA==
Date: Mon, 15 Sep 2025 11:58:34 +0000
From: Torin Carey <torin@tcarey.uk>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org
Subject: [PATCH] wireguard: do not use sin6_scope_id if not needed
Message-ID: <aMf_ZORMji8eiHpH@omega.tcarey.uk>
Feedback-ID: 43460779:user:proton
X-Pm-Message-ID: d7cdfb9e0fdac2cd82cf4244fd72ce05e77958fb
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:16 +0000
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

sin6_scope_id should only be used if the address is link-local and
otherwise ignored.

Currently send6 uses the sin6_scope_id for flowi6_oif without a check of
whether this is needed, so this can cause non-link local endpoints to
use an incorrect device.

Signed-off-by: Torin Carey <torin@tcarey.uk>
---
 drivers/net/wireguard/netlink.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlin=
k.c
index 67f962eb8b46..738041f72c2b 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -453,6 +453,8 @@ static int set_peer(struct wg_device *wg, struct nlattr=
 **attrs)
 =09=09=09wg_socket_set_peer_endpoint(peer, &endpoint);
 =09=09} else if (len =3D=3D sizeof(struct sockaddr_in6) && addr->sa_family=
 =3D=3D AF_INET6) {
 =09=09=09endpoint.addr6 =3D *(struct sockaddr_in6 *)addr;
+=09=09=09if (!__ipv6_addr_needs_scope_id(ipv6_addr_type(&endpoint.addr6.si=
n6_addr)))
+=09=09=09=09endpoint.addr6.sin6_scope_id =3D 0;
 =09=09=09wg_socket_set_peer_endpoint(peer, &endpoint);
 =09=09}
 =09}

base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
--=20
2.48.1


