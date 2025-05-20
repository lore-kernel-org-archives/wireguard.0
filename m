Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413ADC54E71
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 23:11:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79e5a951;
	Tue, 20 May 2025 22:00:10 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 104a1538
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 May 2025 22:00:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9640F614B8;
 Tue, 20 May 2025 22:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3135C4CEE9;
 Tue, 20 May 2025 22:00:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="W/qhqyL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1747778403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hxbM0kES0op3KAnd4+qfiYzc3gghdR4qokMBOHpYeyA=;
 b=W/qhqyL0UW0b4zswpATwJRVWGgaW6Q+io8viV5DKG1KK8l3V6eikZRPqgB28ImghZUMc3Y
 l8+49Ty4Gsppj5dSN0kbsd65poVqizQkMe78WVXEJ8xIZH9u0p1xblc+qUbaZswS1dWHNr
 anCev7hF2hpm4iog/Wxlx4LFfI3tqdg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d9bd13f2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 20 May 2025 22:00:02 +0000 (UTC)
Date: Wed, 21 May 2025 00:00:00 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jordan Rife <jordan@jrife.io>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [RESEND PATCH v3 net-next] wireguard: allowedips: Add
 WGALLOWEDIP_F_REMOVE_ME flag
Message-ID: <aCz7YEp5-Viktx7W@zx2c4.com>
References: <20250517192955.594735-1-jordan@jrife.io>
 <20250517192955.594735-2-jordan@jrife.io>
 <aCz4jK9i-N6e5xk-@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aCz4jK9i-N6e5xk-@zx2c4.com>
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

On Tue, May 20, 2025 at 11:47:56PM +0200, Jason A. Donenfeld wrote:
> Hi Jakub, Jordan,
> 
> On Sat, May 17, 2025 at 12:29:52PM -0700, Jordan Rife wrote:
> > * Use NLA_POLICY_MASK for WGALLOWEDIP_A_FLAGS validation (Jakub).
> [...]
> > +	[WGALLOWEDIP_A_FLAGS]		= NLA_POLICY_MASK(NLA_U32, __WGALLOWEDIP_F_ALL),
> 
> I wonder... Can we update, in a separate patch, these to also use
> NLA_POLICY_MASK?
> 
>    ...
>         [WGDEVICE_A_FLAGS]              = { .type = NLA_U32 },
>    ...
>         [WGPEER_A_FLAGS]                = { .type = NLA_U32 },
>    ...
> 
> Some consistency would be nice.

Perhaps I'll commit something like this?

From 22b6d15ad2a2e38bc80ebf65694106ff554b572f Mon Sep 17 00:00:00 2001
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 20 May 2025 23:56:18 +0200
Subject: [PATCH] wireguard: netlink: use NLA_POLICY_MASK where possible

Rather than manually validating flags against the various __ALL_*
constants, put this in the netlink policy description and have the upper
layer machinery check it for us.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/net/wireguard/netlink.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index f7055180ba4a..b82266da949a 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -24,7 +24,7 @@ static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
 	[WGDEVICE_A_IFNAME]		= { .type = NLA_NUL_STRING, .len = IFNAMSIZ - 1 },
 	[WGDEVICE_A_PRIVATE_KEY]	= NLA_POLICY_EXACT_LEN(NOISE_PUBLIC_KEY_LEN),
 	[WGDEVICE_A_PUBLIC_KEY]		= NLA_POLICY_EXACT_LEN(NOISE_PUBLIC_KEY_LEN),
-	[WGDEVICE_A_FLAGS]		= { .type = NLA_U32 },
+	[WGDEVICE_A_FLAGS]		= { .type = NLA_POLICY_MASK(NLA_U32, __WGDEVICE_F_ALL) },
 	[WGDEVICE_A_LISTEN_PORT]	= { .type = NLA_U16 },
 	[WGDEVICE_A_FWMARK]		= { .type = NLA_U32 },
 	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED }
@@ -33,7 +33,7 @@ static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
 static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
 	[WGPEER_A_PUBLIC_KEY]				= NLA_POLICY_EXACT_LEN(NOISE_PUBLIC_KEY_LEN),
 	[WGPEER_A_PRESHARED_KEY]			= NLA_POLICY_EXACT_LEN(NOISE_SYMMETRIC_KEY_LEN),
-	[WGPEER_A_FLAGS]				= { .type = NLA_U32 },
+	[WGPEER_A_FLAGS]				= { .type = NLA_POLICY_MASK(NLA_U32, __WGPEER_F_ALL) },
 	[WGPEER_A_ENDPOINT]				= NLA_POLICY_MIN_LEN(sizeof(struct sockaddr)),
 	[WGPEER_A_PERSISTENT_KEEPALIVE_INTERVAL]	= { .type = NLA_U16 },
 	[WGPEER_A_LAST_HANDSHAKE_TIME]			= NLA_POLICY_EXACT_LEN(sizeof(struct __kernel_timespec)),
@@ -373,9 +373,6 @@ static int set_peer(struct wg_device *wg, struct nlattr **attrs)

 	if (attrs[WGPEER_A_FLAGS])
 		flags = nla_get_u32(attrs[WGPEER_A_FLAGS]);
-	ret = -EOPNOTSUPP;
-	if (flags & ~__WGPEER_F_ALL)
-		goto out;

 	ret = -EPFNOSUPPORT;
 	if (attrs[WGPEER_A_PROTOCOL_VERSION]) {
@@ -506,9 +503,6 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)

 	if (info->attrs[WGDEVICE_A_FLAGS])
 		flags = nla_get_u32(info->attrs[WGDEVICE_A_FLAGS]);
-	ret = -EOPNOTSUPP;
-	if (flags & ~__WGDEVICE_F_ALL)
-		goto out;

 	if (info->attrs[WGDEVICE_A_LISTEN_PORT] || info->attrs[WGDEVICE_A_FWMARK]) {
 		struct net *net;
--
2.48.1
