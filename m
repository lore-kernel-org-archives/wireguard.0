Return-Path: <SRS0=23NU=3L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5EBC2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:59:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB0321835
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB0321835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9dcb0c9c;
	Wed, 22 Jan 2020 19:58:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99bf1e4b
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jan 2020 19:58:27 +0000 (UTC)
Received: from telperion.info (telperion.info [66.160.141.240])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d71c51f
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jan 2020 19:52:04 +0000 (UTC)
Received: from [192.168.128.7] (softdnserr [::ffff:12.1.37.210])
 (AUTH: LOGIN pallas, ) by telperion.info with ESMTPSA
 id 000000000004A363.000000005E28A826.00006E30; Wed, 22 Jan 2020 11:53:09 -0800
Subject: Re: [PATCH] fix: make wireguard compatible with android TV
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Revath S Kumar <rsk@revathskumar.com>
References: <20200122194156.14049-1-rsk@revathskumar.com>
 <CAHmME9oQqAUcA8CAbhcj1cj5L5DxZr8aw7+9nun14M+C3e5pKw@mail.gmail.com>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Message-ID: <b55e0dd5-0ddf-b2c7-59a3-fa7f44ca1e6a@pallas.us>
Date: Wed, 22 Jan 2020 11:51:11 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9oQqAUcA8CAbhcj1cj5L5DxZr8aw7+9nun14M+C3e5pKw@mail.gmail.com>
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

It allows it to work for hardware devices that emulate or simply do not 
provide a real touchscreen, e.g. Android TVs. The feature requirement 
for a real touchscreen is default enabled and must be explicitly 
disabled. ~D


On 1/22/20 11:44 AM, Jason A. Donenfeld wrote:
> Thanks for this.
>
> On Wed, Jan 22, 2020 at 8:42 PM Revath S Kumar <rsk@revathskumar.com> wrote:
>> +    <uses-feature android:name="android.hardware.touchscreen" android:required="false"/>
> I understand the other flag you've added, thanks to the documentation
> link you provided, but what's this line here do?
>
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
