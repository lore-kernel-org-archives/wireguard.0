Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA52EC28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 17:57:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43CD4206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 17:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43CD4206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64a62400;
	Wed, 6 May 2020 17:43:40 +0000 (UTC)
Received: from telperion.info (telperion.info [66.160.141.240])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3b509d78
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 17:43:37 +0000 (UTC)
Received: from [192.168.127.224] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77]) (AUTH: LOGIN pallas, )
 by telperion.info with ESMTPSA
 id 0000000000044049.000000005EB2FA96.0000234E; Wed, 06 May 2020 10:57:38 -0700
Subject: Re: WireGuard over WireGuard
To: wireguard@lists.zx2c4.com
References: <CAKmhVkoE_fL59VJqqXoGHX_S3E9+h=KwyNchWSBrEfPHrpNyoQ@mail.gmail.com>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Message-ID: <71c12e22-c7b6-9753-cc44-aac0f51592ff@pallas.us>
Date: Wed, 6 May 2020 10:54:42 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAKmhVkoE_fL59VJqqXoGHX_S3E9+h=KwyNchWSBrEfPHrpNyoQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Have you checked your MTUs? ~Derrick


On 5/6/20 9:57 AM, Mo Balaa wrote:
> We are running WireGuard over WireGuard. It appears to work well;
> however I am noticing some applications struggle to work reliably.
> Lots of failed page loadss / timeouts. Any pointers on how I could go
> about debugging these issues?
>
> Any general pointers on running WireGuard over WireGuard? One note
> about my deployment is that it uses socat to transparently proxy the
> inner tunnel between devices.
>
> The setup looks something like this:
> tunnel 1 (iOS) -> socat -> tunnel 0 -> Linux (tunnel 0) -> (tunnel 1)
>
> Thanks for the feedback.
