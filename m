Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66071C00454
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 11:08:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E443C2077B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 11:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E443C2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5ccf8e6;
	Mon, 9 Dec 2019 11:08:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9826b98
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 21:58:24 +0000 (UTC)
Received: from www119.your-server.de (www119.your-server.de [88.198.193.7])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb4ce582
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 21:58:24 +0000 (UTC)
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www119.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <knupps@gmx.de>) id 1iaRnr-0006nj-OP
 for wireguard@lists.zx2c4.com; Thu, 28 Nov 2019 22:58:23 +0100
Received: from [84.58.68.28] (helo=polaris.naturlan.loc)
 by sslproxy06.your-server.de with esmtpsa
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <knupps@gmx.de>) id 1iaRnr-000SCJ-KT
 for wireguard@lists.zx2c4.com; Thu, 28 Nov 2019 22:58:23 +0100
Received: from triton.naturlan.loc ([192.168.0.10])
 by polaris.naturlan.loc with esmtp (Exim 4.90_1)
 (envelope-from <knupps@gmx.de>) id 1iaRnr-0004eX-5R
 for wireguard@lists.zx2c4.com; Thu, 28 Nov 2019 22:58:23 +0100
To: wireguard@lists.zx2c4.com
From: Mark Schmidt <knupps@gmx.de>
Subject: Windows client: PostUp/PreDown possible?
Message-ID: <04a38f45-1043-0db5-6c76-2ee573fd71cf@malte-wetz.de>
Date: Thu, 28 Nov 2019 22:58:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-GB
X-Transferred-By: mail.naturlan.loc
X-Authenticated-Sender: info@naturlan.de
X-Virus-Scanned: Clear (ClamAV 0.101.4/25647/Thu Nov 28 10:49:14 2019)
X-Mailman-Approved-At: Mon, 09 Dec 2019 12:07:58 +0100
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello!

I hope I'm in the right place to ask this.

I'm trying to familiarise myself with Wireguard, and I like it so far. 
One issue though: The Linux version has PostUp and PreDown options in 
its configuration files.

Is there something similar available for the Windows client?

When I try to add something like "PostUp = somescript.cmd" to the 
interface section in the WG config, the Windows client complains that 
the key is invalid.

I'm currently assuming that there is a way and I'm just too stupid to 
figure it out. Google didn't yield anything useful, however.

I want to use those options to automatically map a network share to a 
drive letter after successfully activating the tunnel. And then 
disconnect it (giving Windows an opportunity to empty its cache) before 
the tunnel gets deactivated again.


Best regards!

PS: No need to CC me, I subscribed to the list.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
