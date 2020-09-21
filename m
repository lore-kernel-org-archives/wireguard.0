Return-Path: <SRS0=UBEJ=C6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBDCC43465
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 15:17:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DD1220756
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 15:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DD1220756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f24c5d81;
	Mon, 21 Sep 2020 14:46:18 +0000 (UTC)
Received: from telperion.info (<unknown> [2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ecfd84a2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Sep 2020 14:46:14 +0000 (UTC)
Received: from [192.168.127.224] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77]) (AUTH: LOGIN pallas, )
 by telperion.info with ESMTPSA
 id 00000000000441E4.000000005F68C400.00006AE7; Mon, 21 Sep 2020 08:17:17 -0700
Subject: Re: Interest in adding multicast support to Wireguard?
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <9b4ba85a-633a-04ed-ca15-eb29d476cd57@pallas.us>
 <878sd3qwp3.fsf@toke.dk>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Message-ID: <2484a842-2fe9-8941-2e58-a12689afcc7a@pallas.us>
Date: Mon, 21 Sep 2020 08:16:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <878sd3qwp3.fsf@toke.dk>
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

Toke, good to hear from you again!

Thanks for the pointer to ohybridproxy. Unicast conversion was on the 
list of things to check out. Unfortunately, it appears to take manual 
intervention on some platforms (e.g. MacOS) and does not work for 
auto-discovery on others (e.g. iPhone). If I controlled the application 
on both ends, I think this would have been a genuinely useful 
alternative approach. Unfortunately, I do not control the application.

~Derrick

