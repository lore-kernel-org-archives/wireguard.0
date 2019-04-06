Return-Path: <SRS0=0s16=S3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A345AC43219
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Apr 2019 15:19:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FBA12067D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Apr 2019 15:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FBA12067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lists.m7n.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bab14d0e;
	Thu, 25 Apr 2019 15:19:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89db6532
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 18:58:53 +0000 (UTC)
Received: from bond.m7n.se (bond.m7n.se [46.246.28.121])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bd343a5
 for <wireguard@lists.zx2c4.com>; Sat, 6 Apr 2019 18:58:53 +0000 (UTC)
Received: from [IPv6:2001:470:de6f:1301::83b] (unknown
 [IPv6:2001:470:de6f:1301::83b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by bond.m7n.se (Postfix) with ESMTPSA id 4947B60098C2;
 Sat,  6 Apr 2019 19:01:21 +0000 (UTC)
Subject: Re: Crashes in wg_allowedips_insert_X
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <505e458e-4df9-8fbe-9891-83bdc8933260@m7n.se>
 <CAHmME9o=2FVbqH0Sn6oD6ss-edsnJHNMKsXHehEAwDqv1juQEg@mail.gmail.com>
 <CAHmME9qh7vQuFNmS_QYK=neBPvrOvpSu0O=P86cWoRuVGqONPQ@mail.gmail.com>
From: Mikma <mikma.wg@lists.m7n.se>
Message-ID: <2c260b12-1f65-c5d3-c0eb-89c6afb872b5@m7n.se>
Date: Sat, 6 Apr 2019 21:01:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9qh7vQuFNmS_QYK=neBPvrOvpSu0O=P86cWoRuVGqONPQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 25 Apr 2019 17:19:27 +0200
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

On 2019-04-06 12:28, Jason A. Donenfeld wrote:
> Let me know if this fixes it for you:
> https://git.zx2c4.com/WireGuard/commit/?id=fdfdd38cceebcd62df60785e8523e068b84f7076
> 
> Thanks again for the bug report. I'll have a new snapshot out fairly
> soon containing this important fix.

I have tested it now, and it solves the problems for me. Thanks for the fix.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
