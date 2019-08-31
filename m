Return-Path: <SRS0=7TlJ=W3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE91C3A5A6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 31 Aug 2019 16:35:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B872A22D37
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 31 Aug 2019 16:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B872A22D37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f34a372;
	Sat, 31 Aug 2019 16:35:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef973534
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Aug 2019 16:35:19 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30719a99
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Aug 2019 16:35:19 +0000 (UTC)
Received: from [192.168.127.6] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77]) (AUTH: LOGIN pallas, )
 by telperion.info with ESMTPSA
 id 00000000000463A0.000000005D6AA276.00000C89; Sat, 31 Aug 2019 09:38:13 -0700
Subject: Re: Remark: src/tools/show.c
To: Markus Grundmann <markus@activezone.de>,
  wireguard@lists.zx2c4.com
References: <484b9ad8-5e45-86ee-ea11-2c8a81f6da45@activezone.de>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Message-ID: <becd57f5-4c36-ac33-f616-f359c7221186@pallas.us>
Date: Sat, 31 Aug 2019 09:34:45 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <484b9ad8-5e45-86ee-ea11-2c8a81f6da45@activezone.de>
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

Forcing later callers to assume state about a buffer is not better. Re: 
strncpy, the explicit termination *is* required, since the destination 
will not be null terminated if the source is the same size. Also, 
doesn't this patch remove the "ago" response? ~Derrick


On 8/31/19 3:41 AM, Markus Grundmann wrote:
> I think the explicit termination (buf[] = '\0') is not needed. Personaly
> I would prefer memset() to clean up the buffer. strncopy() reduced by
> two instead of a single chars protects the last string terminator. But
> we will not die when it not was changed
>
> [src/tools/show.c]
> ==> endpoint() <==
> 122,123c122
> - 		strncpy(buf, gai_strerror(ret), sizeof(buf) - 1);
> - 		buf[sizeof(buf) - 1] = '\0';
> ---
> + 		strncpy(buf, gai_strerror(ret), sizeof(buf) - 2);
> 162a162
> + 	memset(buf, 0, sizeof(buf));
> 164c164
> - 		strncpy(buf, "Now", sizeof(buf) - 1);
> ---
> + 		strncpy(buf, "Now", sizeof(buf) - 2);
>
> ==> ago() <==
> 166c166
> - 		strncpy(buf, "(" TERMINAL_FG_RED "System clock wound backward;
> connection problems may ensue." TERMINAL_RESET ")", sizeof(buf) - 1);
> ---
> + 		strncpy(buf, "(" TERMINAL_FG_RED "System clock wound backward;
> connection problems may ensue." TERMINAL_RESET ")", sizeof(buf) - 2);
> 169c169
> - 		strncpy(buf + offset, " ago", sizeof(buf) - offset - 1);
> ---
> - 		strncpy(buf + offset, " ago", sizeof(buf) - offset - 2);
> 171d170
> - 	buf[sizeof(buf) - 1] = '\0';
>
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
