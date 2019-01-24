Return-Path: <SRS0=u0A/=QA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26579C282C3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 23:25:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E4F7218A2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 23:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E4F7218A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da62d551;
	Thu, 24 Jan 2019 23:20:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b087191
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 23:20:14 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df64b8e1
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 23:20:14 +0000 (UTC)
Received: from [209.204.163.1] (209-204-163-1.vpn.sonic.net
 [::ffff:209.204.163.1])
 (AUTH: LOGIN pallas, SSL: TLS1.2,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
 by telperion.info with ESMTPSA; Thu, 24 Jan 2019 15:26:57 -0800
 id 0000000000049044.000000005C4A49C1.00002435
Subject: Re: Long outage when changing private key
To: wireguard@lists.zx2c4.com
References: <8ae75832-91dd-428e-9b04-a48cec019bf6@pallas.us>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Message-ID: <ca5e0871-c55a-c8cd-eac1-4cf4603f7c48@pallas.us>
Date: Thu, 24 Jan 2019 15:25:27 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <8ae75832-91dd-428e-9b04-a48cec019bf6@pallas.us>
Content-Language: en-US
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

I believe I found a solution to this problem. Will submit a patch once 
I've done a bit more testing. ~Derrick

On 1/24/19 1:22 PM, Derrick Lyndon Pallas wrote:

> [snip]

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
