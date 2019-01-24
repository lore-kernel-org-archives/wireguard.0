Return-Path: <SRS0=u0A/=QA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7591C282C3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 21:50:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC7520856
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 21:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CC7520856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8256aca;
	Thu, 24 Jan 2019 21:44:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb2b43be
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 21:16:51 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61eae020
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 21:16:51 +0000 (UTC)
Received: from [209.204.163.5] (209-204-163-5.vpn.sonic.net
 [::ffff:209.204.163.5])
 (AUTH: LOGIN pallas, SSL: TLS1.2,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
 by telperion.info with ESMTPSA; Thu, 24 Jan 2019 13:23:33 -0800
 id 0000000000049044.000000005C4A2CD5.00006493
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Subject: Long outage when changing private key
Message-ID: <8ae75832-91dd-428e-9b04-a48cec019bf6@pallas.us>
Date: Thu, 24 Jan 2019 13:22:04 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Thu, 24 Jan 2019 22:44:45 +0100
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

With two peers, A with persistent keepalive & B without, I am trying to 
change the private key on peer A. First I update the public key for A at 
B, then `wg set wg0 private-key XXXX` on A. It takes roughly the length 
of the persistent keepalive to reestablish pings from B to A.

If instead I update the public key for A at B, remove peer B at A, 
change A's private key, and then re-add peer B at A, I am able to 
reestablish pings almost immediately.

My guess was that there was a timer that needed to be reset when 
wg_set_device processes WGDEVICE_A_PRIVATE_KEY, but an attempt to reset 
timers was unsuccessful. I am new to this code and could use some 
pointers/advice on where to look next.

~Derrick


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
