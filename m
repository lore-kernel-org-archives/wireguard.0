Return-Path: <SRS0=ZLx+=WB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5557FC0650F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 18:57:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8418216F4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 18:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8418216F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f047734a;
	Mon, 5 Aug 2019 18:57:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aabe2016
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jul 2019 16:02:03 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5aac855
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jul 2019 16:02:03 +0000 (UTC)
Received: from fwd29.aul.t-online.de (fwd29.aul.t-online.de [172.20.26.134])
 by mailout03.t-online.de (Postfix) with SMTP id 5DED6425C353
 for <wireguard@lists.zx2c4.com>; Sat, 27 Jul 2019 18:02:01 +0200 (CEST)
Received: from majestix.boerner.local
 (bVUPS6ZLrh+W4xNAB6i0iJZiRQEWOY+GGHBImjWFakWHZTBoqUHTXYv4keSr9dVg+k@[46.86.20.157])
 by fwd29.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1hrP8v-1lg2Qi0; Sat, 27 Jul 2019 18:01:57 +0200
From: boerner@t-online.de
To: wireguard@lists.zx2c4.com
Subject: Wireguard command line tools for Android
Date: Sat, 27 Jul 2019 18:01:56 +0200
Message-ID: <5549622.se0SCevcK7@majestix.boerner.local>
MIME-Version: 1.0
X-ID: bVUPS6ZLrh+W4xNAB6i0iJZiRQEWOY+GGHBImjWFakWHZTBoqUHTXYv4keSr9dVg+k
X-TOI-MSGID: b1f7d902-5d4d-485a-b197-5f61d84c526e
X-Mailman-Approved-At: Mon, 05 Aug 2019 20:57:13 +0200
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

Hey all,

I've recently set up my private VPN with Wireguard. I am running my local server behind a DSL router with a variable public IP address, accessible via dyndns and NAT, and several mobile clients (Android, Notebooks). 
Everything is working fine so far, except of one issue that I would like discuss here: 
Roaming doesn't work reliably when a device leaves or re-enters the home LAN, nor when the public IP address is changed by my ISP. The reason seems clear to me: In these cases both peers change their IP address simultaneously whereas the Wireguard protocol relies on only one address changing at a time.

My approach would be to shut down Wireguard on the clients as long as they are connected to their home network locally and to bring up the tunnel only when they leave the home network. Besides the roaming issue it  would be desirable to use the local connection when it is available rather than to take the detour over the internet. And it  should be done automatically so users need not remember to switch on/off VPN all the time.
My idea was to use Tasker to perform something like wg-quick up|down tun1 accordingly, but the Wireguard command line tools wg and wg-quick don't seem to be available (anymore). In older forum posts I've seen that you can install them from the app settings, but in my version (v0.0.20190708) this option is not available.

Does anybody know about another solution? Or, as a question to the developers, would it be a big deal to bring back the command line feature?

Thanks, Tom




_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
