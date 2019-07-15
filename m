Return-Path: <SRS0=3VIe=VM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24ACFC76191
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Jul 2019 17:18:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 943C02081C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Jul 2019 17:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 943C02081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a3ace2d;
	Mon, 15 Jul 2019 17:17:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38f7f701
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Jul 2019 17:17:42 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3ffe164
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Jul 2019 17:17:42 +0000 (UTC)
Received: from [209.204.163.7] (209-204-163-7.vpn.sonic.net
 [::ffff:209.204.163.7]) (AUTH: LOGIN pallas, )
 by telperion.info with ESMTPSA
 id 000000000009E12C.000000005D2CB564.00006328; Mon, 15 Jul 2019 10:18:27 -0700
Subject: Re: [PATCH 2/2] netdev: reset peer keys when changing private key
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20190125015339.27684-1-derrick@pallas.us>
 <20190125015339.27684-2-derrick@pallas.us>
 <CAHmME9ojt0rmJQ8xMBYMax0ZeZ2N9juBOkFhP2-gczAZ9ck5FA@mail.gmail.com>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Message-ID: <459d49e3-cc6b-9fa0-ff63-740996dd57fd@pallas.us>
Date: Mon, 15 Jul 2019 10:17:38 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAHmME9ojt0rmJQ8xMBYMax0ZeZ2N9juBOkFhP2-gczAZ9ck5FA@mail.gmail.com>
Content-Language: en-US
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On 7/11/19 8:37 AM, Jason A. Donenfeld wrote:

> Can you let me know if these work for you?
>
> https://git.zx2c4.com/WireGuard/commit/?id=fffe613427d70a7470d34b6dedcab9ffb8b6b667
> https://git.zx2c4.com/wireguard-go/commit/?id=a961aacc9f4dff9e617197c6433f8c9628928132

I don't have a Go setup and so didn't test that patch but the kernel 
patch fixed the issue. Thanks, ~Derrick


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
