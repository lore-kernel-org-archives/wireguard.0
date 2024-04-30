Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAC4D49220
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:24:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc4262ab;
	Mon, 18 Nov 2024 12:38:24 +0000 (UTC)
Received: from wfout3-smtp.messagingengine.com
 (wfout3-smtp.messagingengine.com [64.147.123.146])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 966de530
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Apr 2024 12:26:29 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.west.internal (Postfix) with ESMTP id DDDD81C00122
 for <wireguard@lists.zx2c4.com>; Tue, 30 Apr 2024 08:26:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 30 Apr 2024 08:26:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dotat.at; h=cc
 :content-type:content-type:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
 t=1714479987; x=1714566387; bh=OPIj1KLYErAt0piASgN2IgRauf0tRcAz
 WO6thJc5EmU=; b=PUb7Bih9RPAxQ6wQi4lzz8YEyeZrMZRTX8Be9VhG+sgalbLn
 Z9qGagrelJgdezh7NVCS3KFyMuoSBbn8xA0vSa7MWa0rsPcEQmJBAsAcSQPR/53v
 HxT6p9oaHOI3wktE2AFJoDqIyWapjA/gh8k84k8dDiHSex5FA6RXwI8BTZFuW9YJ
 l9o69uhbWOAeHY72fPzqACnLrkrvzjQfmyVKFzwDmSCOXarxQ9vH0HrznPJ0/YRI
 vPn0uJr7hxmIfa5YCC8ZEUnnFgxTsbub3Uua6SO5Ad2TGiRmJNcFGrHvLX/7X1qZ
 zH5wrhW9pGtZlnmnWM1jty39IYOg3DI+QEeSRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1714479987; x=1714566387; bh=OPIj1KLYErAt0piASgN2IgRauf0tRcAzWO6
 thJc5EmU=; b=BXelG8H7H5oIMMdsVsWLFwpAkPYI1Tl2l1UFklAf0Htgzbq7lVD
 uATMspObTOWZnRazJoeZHE7J3eACNEg0kSx+Fjpwx1GRqNtqr/TYBDNmceLFZ4Fx
 9zTQglSDnpcmg5eE2jxnjCnulbnndjaOyz1YE4eXlCWC/tJxCB+EizEjvLAyTgxe
 cv14f9X6GBhWMfd9RCFdLZDIGODM2dOymaRy7PK/lIe255oNs6oIYekSD6Oqo2fX
 yQMJyrDjZS2qL9KpADXA3DZB6O69maGVHG7dRZ1qPZKKVCSQskeK+PZBse5mLg3h
 CyveoKKvogIBQsHd9IPGOWa92c2OWNn87EQ==
X-ME-Sender: <xms:c-MwZpjbZxuhOKygL257amWK1dk0q3JUtIGSiTvmeZ4tvxXBN6fcnw>
 <xme:c-MwZuArmYJ8TJtqsNmXCDfrao-ouprsvMTF3K88goYTIclw8gCZMnviO8QMotElZ
 wAeIOoJ49oRSb8>
X-ME-Received: <xmr:c-MwZpFGg-JUunJYkZHL4G_NF9ou-mrdhDqQfwC7tAs0SqvH2pnsmknRhG-G3cEQcc1RXaWgqyB4X2YjhyUH3ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddufedghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtsehttdertddttd
 dvnecuhfhrohhmpefvohhnhicuhfhinhgthhcuoeguohhtseguohhtrghtrdgrtheqnecu
 ggftrfgrthhtvghrnhepheelvedttdfgjeekfeevtdfgheeuteduffffhffgtedvkeejke
 ffuddttddtieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepughothesughothgrthdrrght
X-ME-Proxy: <xmx:c-MwZuS92nO5FhBnDZjxWC17VvrKEgsLhTiI3btWIthfcHazB_259A>
 <xmx:c-MwZmx2Md1MXJ5ZUKQPLzzhSzazX0q0xCkwvJBp8qTrjWpo42oP7w>
 <xmx:c-MwZk4Q6_IhQ68pUCfeM1R0WmNOdAz8PoBWG_xK-YNBQZfA2aFYtg>
 <xmx:c-MwZryWQb0I2HlEGnSXqwupzU6f-ob58eB8kixrj6k6sZXGo-WfTw>
 <xmx:c-MwZrohbvTI_VQdDvGhO3wiCu9IQjQk8A_YswcGxV7mgq7xDxXsv7aA>
Feedback-ID: i7158435c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <wireguard@lists.zx2c4.com>; Tue, 30 Apr 2024 08:26:26 -0400 (EDT)
Date: Tue, 30 Apr 2024 13:26:25 +0100
From: Tony Finch <dot@dotat.at>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] wg: add PrivateKeyFile and PresharedKeyFile configuration
 options
Message-ID: <61a421de-e431-cae1-fc8b-259c89be509e@dotat.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:38:13 +0000
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

The command line and config file usages can be more consistent when
they refer to the private key in the same way. Separate key files
allow an operator to view and edit the configuration file without
exposing secrets. It becomes much easier to share configurations when
they don't need to be redacted. Secrets can be kept encrypted at rest
without also encrypting non-secret parts of the config or resorting to
templating hacks.

Signed-off-by: Tony Finch <dot@dotat.at>
---
 src/config.c |  8 ++++++++
 src/man/wg.8 | 13 ++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git src/config.c src/config.c
index 9f15477..6e18129 100644
--- src/config.c
+++ src/config.c
@@ -450,6 +450,10 @@ static bool process_line(struct config_ctx *ctx, const char *line)
 			ret = parse_key(ctx->device->private_key, value);
 			if (ret)
 				ctx->device->flags |= WGDEVICE_HAS_PRIVATE_KEY;
+		} else if (key_match("PrivateKeyFile")) {
+			ret = parse_keyfile(ctx->device->private_key, value);
+			if (ret)
+				ctx->device->flags |= WGDEVICE_HAS_PRIVATE_KEY;
 		} else
 			goto error;
 	} else if (ctx->is_peer_section) {
@@ -467,6 +471,10 @@ static bool process_line(struct config_ctx *ctx, const char *line)
 			ret = parse_key(ctx->last_peer->preshared_key, value);
 			if (ret)
 				ctx->last_peer->flags |= WGPEER_HAS_PRESHARED_KEY;
+		} else if (key_match("PresharedKeyFile")) {
+			ret = parse_keyfile(ctx->last_peer->preshared_key, value);
+			if (ret)
+				ctx->last_peer->flags |= WGPEER_HAS_PRESHARED_KEY;
 		} else
 			goto error;
 	} else
diff --git src/man/wg.8 src/man/wg.8
index 7984539..f1a8d6e 100644
--- src/man/wg.8
+++ src/man/wg.8
@@ -132,7 +132,11 @@ only one \fIInterface\fP section may be specified.
 .P
 The \fIInterface\fP section may contain the following fields:
 .IP \(bu
-PrivateKey \(em a base64 private key generated by \fIwg genkey\fP. Required.
+PrivateKey \(em a base64 private key generated by \fIwg genkey\fP.
+.IP \(bu
+PrivateKeyFile \(em name of a file containing a private key.
+.IP
+Either PrivateKey or PrivateKeyFile are required.
 .IP \(bu
 ListenPort \(em a 16-bit port for listening. Optional; if not specified, chosen
 randomly.
@@ -146,11 +150,14 @@ PublicKey \(em a base64 public key calculated by \fIwg pubkey\fP from a
 private key, and usually transmitted out of band to the author of the
 configuration file. Required.
 .IP \(bu
-PresharedKey \(em a base64 preshared key generated by \fIwg genpsk\fP. Optional,
-and may be omitted. This option adds an additional layer of symmetric-key
+PresharedKey \(em a base64 preshared key generated by \fIwg genpsk\fP. Optional.
+This option adds an additional layer of symmetric-key
 cryptography to be mixed into the already existing public-key cryptography,
 for post-quantum resistance.
 .IP \(bu
+PresharedKeyFile \(em name of a file containing a preshared key.
+Optional alternative to PresharedKey.
+.IP \(bu
 AllowedIPs \(em a comma-separated list of IP (v4 or v6) addresses with
 CIDR masks from which incoming traffic for this peer is allowed and to
 which outgoing traffic for this peer is directed. The catch-all
-- 
2.39.2

