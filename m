Return-Path: <SRS0=SvU/=TP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43FBC04E53
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 May 2019 11:35:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 720642053B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 May 2019 11:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 720642053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18872a59;
	Wed, 15 May 2019 11:35:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4a5600f
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 May 2019 11:35:53 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 6c152b76
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 May 2019 11:35:53 +0000 (UTC)
Received: (qmail 13103 invoked by uid 500); 15 May 2019 11:33:25 -0000
Date: Wed, 15 May 2019 06:33:25 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Working on change for: genetlink: make policy common to family
Message-ID: <20190515113325.GA13034@wolff.to>
References: <20190513195213.GA30315@wolff.to> <20190513202453.GA30656@wolff.to>
 <20190513212110.GA31106@wolff.to> <20190514205016.GA920@wolff.to>
 <20190515105014.GA12390@wolff.to> <20190515110636.GA12769@wolff.to>
 <20190515111830.GB12769@wolff.to>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <20190515111830.GB12769@wolff.to>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, May 15, 2019 at 06:18:30 -0500,
  Bruno Wolff III <bruno@wolff.to> wrote:
>Now I'm looking at: f6ad55a6a184ebdf3d98a90eab0895f73ce9797e Merge 
>branch 'nla_nest_start', which looks like it might also cause a 
>problem.

Changing nla_nest_start to nla_nest_start_noflag didn't seem to help.

In case anyone else is working on getting wireguard to work with 5.2, 
I'm attaching my latest test diff.

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="test.diff"

diff --git a/src/netlink.c b/src/netlink.c
index b179b3184725..dd46487e0888 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -74,7 +74,7 @@ static int get_allowedips(struct sk_buff *skb, const u8 *ip, u8 cidr,
 {
 	struct nlattr *allowedip_nest;
 
-	allowedip_nest = nla_nest_start(skb, 0);
+	allowedip_nest = nla_nest_start_noflag(skb, 0);
 	if (!allowedip_nest)
 		return -EMSGSIZE;
 
@@ -94,7 +94,7 @@ static int
 get_peer(struct wg_peer *peer, struct allowedips_node **next_allowedips_node,
 	 u64 *allowedips_seq, struct sk_buff *skb)
 {
-	struct nlattr *allowedips_nest, *peer_nest = nla_nest_start(skb, 0);
+	struct nlattr *allowedips_nest, *peer_nest = nla_nest_start_noflag(skb, 0);
 	struct allowedips_node *allowedips_node = *next_allowedips_node;
 	bool fail;
 
@@ -156,7 +156,7 @@ get_peer(struct wg_peer *peer, struct allowedips_node **next_allowedips_node,
 	else if (*allowedips_seq != peer->device->peer_allowedips.seq)
 		goto no_allowedips;
 
-	allowedips_nest = nla_nest_start(skb, WGPEER_A_ALLOWEDIPS);
+	allowedips_nest = nla_nest_start_noflag(skb, WGPEER_A_ALLOWEDIPS);
 	if (!allowedips_nest)
 		goto err;
 
@@ -190,7 +190,7 @@ static int wg_get_device_start(struct netlink_callback *cb)
 	struct wg_device *wg;
 	int ret;
 
-	ret = nlmsg_parse(cb->nlh, GENL_HDRLEN + genl_family.hdrsize, attrs,
+	ret = nlmsg_parse_deprecated(cb->nlh, GENL_HDRLEN + genl_family.hdrsize, attrs,
 			  genl_family.maxattr, device_policy, NULL);
 	if (ret < 0)
 		return ret;
@@ -247,7 +247,7 @@ static int wg_get_device_dump(struct sk_buff *skb, struct netlink_callback *cb)
 		up_read(&wg->static_identity.lock);
 	}
 
-	peers_nest = nla_nest_start(skb, WGDEVICE_A_PEERS);
+	peers_nest = nla_nest_start_noflag(skb, WGDEVICE_A_PEERS);
 	if (!peers_nest)
 		goto out;
 	ret = 0;
@@ -450,7 +450,7 @@ static int set_peer(struct wg_device *wg, struct nlattr **attrs)
 		int rem;
 
 		nla_for_each_nested(attr, attrs[WGPEER_A_ALLOWEDIPS], rem) {
-			ret = nla_parse_nested(allowedip, WGALLOWEDIP_A_MAX,
+			ret = nla_parse_nested_deprecated(allowedip, WGALLOWEDIP_A_MAX,
 					       attr, allowedip_policy, NULL);
 			if (ret < 0)
 				goto out;
@@ -561,7 +561,7 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 		int rem;
 
 		nla_for_each_nested(attr, info->attrs[WGDEVICE_A_PEERS], rem) {
-			ret = nla_parse_nested(peer, WGPEER_A_MAX, attr,
+			ret = nla_parse_nested_deprecated(peer, WGPEER_A_MAX, attr,
 					       peer_policy, NULL);
 			if (ret < 0)
 				goto out;
@@ -596,12 +596,10 @@ struct genl_ops genl_ops[] = {
 #endif
 		.dumpit = wg_get_device_dump,
 		.done = wg_get_device_done,
-		.policy = device_policy,
 		.flags = GENL_UNS_ADMIN_PERM
 	}, {
 		.cmd = WG_CMD_SET_DEVICE,
 		.doit = wg_set_device,
-		.policy = device_policy,
 		.flags = GENL_UNS_ADMIN_PERM
 	}
 };
@@ -617,6 +615,7 @@ __ro_after_init = {
 	.name = WG_GENL_NAME,
 	.version = WG_GENL_VERSION,
 	.maxattr = WGDEVICE_A_MAX,
+	.policy = device_policy,
 	.module = THIS_MODULE,
 	.netnsok = true
 };

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--rwEMma7ioTxnRzrJ--
