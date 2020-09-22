Return-Path: <SRS0=tp6W=C7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA88C2D0E2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Sep 2020 20:26:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EBD6206C9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Sep 2020 20:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EBD6206C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a65e49f5;
	Tue, 22 Sep 2020 19:55:52 +0000 (UTC)
Received: from telperion.info (<unknown> [2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 55f7993a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Sep 2020 19:55:50 +0000 (UTC)
Received: from [192.168.127.224] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77]) (AUTH: LOGIN pallas, )
 by telperion.info with ESMTPSA
 id 0000000000046534.000000005F6A5E1D.0000719C; Tue, 22 Sep 2020 13:27:09 -0700
Subject: Re: Interest in adding multicast support to Wireguard?
To: Reid Rankin <reidrankin@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <9b4ba85a-633a-04ed-ca15-eb29d476cd57@pallas.us>
 <CAHmME9rU3AhppjN+6OM8vYHHbpK1Fxj2chVCCyHQBL-XvKk2uA@mail.gmail.com>
 <CAMaqUZ2B3H1Fa3=TFh6_PoV_Thz4javkKFHyeGPpdsma_GC0QQ@mail.gmail.com>
 <f3ec618d-3244-899b-f6bf-d7c988009acd@pallas.us>
 <f344814f-034e-4e37-06f5-85e74a0ba582@pallas.us>
 <CAMaqUZ0pUO-UBbJn3jED4HG-t5HiR3MLRBDrkSMz3fv_qpVsNg@mail.gmail.com>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Message-ID: <0f0a03ee-9f3b-0722-831e-2cbf61825246@pallas.us>
Date: Tue, 22 Sep 2020 13:26:01 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAMaqUZ0pUO-UBbJn3jED4HG-t5HiR3MLRBDrkSMz3fv_qpVsNg@mail.gmail.com>
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

On 9/22/20 12:38 PM, Reid Rankin wrote:

> While I'm all for multicast support, I don't think this is it. TunSafe
> only has that option to allow you to turn off an extra anti-multicast
> filter that's on by default and drops anything incoming from ff00::/8
> or 224.0.0./3, even if it's from a peer with those ranges in its
> AllowedIPs. (Actually, 224.0.0.0/3 is technically the wrong range for
> IPv4 multicast; that's 224.0.0.0/4. The upper half of that space,
> 240.0.0.0/4, has been "reserved for future addressing modes" since
> 1989.)
Yes, I also agree that all-or-nothing is not the right answer. I'm only 
pointing out that multicast has been implemented in at least one client. 
~Derrick
