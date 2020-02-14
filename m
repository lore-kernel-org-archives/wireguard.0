Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADD2C2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 10:12:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B625020873
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 10:12:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="Frh4XKA2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B625020873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7050996;
	Fri, 14 Feb 2020 10:09:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a248e15
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 10:09:55 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f9cd874
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 10:09:55 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id A4E9D2400FE
 for <wireguard@lists.zx2c4.com>; Fri, 14 Feb 2020 11:11:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1581675119; bh=WoJKqf5gNatQlxnDdZce2Qh7UBw5jhqYBsBFkL/de+c=;
 h=Subject:To:From:Date:Autocrypt:OpenPGP:From;
 b=Frh4XKA2LHHFOw42b75lXjWS6+1KIq0POpRMLl8QuL6Bn3r/4l/Q2FIhPYwY3V53X
 rkCpn2W3mJwwm4/qKPZ1f0jtn2xa6gUbOxbCI0XcPfhMGzEZtldcwArfcQSEsWOBEQ
 5FKr6bwssJBYkvfn1KLBumHi7mVLa9YM2YDG+tOEbA12wIUjFC8eCha2uhGnvJZS5B
 /rjChFOJ94Y8hp9alWjhYZJ5iUgEIu8XQa2PvsMLIt74t3Klg8gIUcN8dF1Sj/eDTS
 j5iTXFMw8VOcXcbvPutdlZ7o5dDLVCXNvqBxZZFcTlWICJa+5pU9KSxsWBamBRvYa+
 SMXxk8H/+nqDw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 48Jq1B0M2Qz9rxZ
 for <wireguard@lists.zx2c4.com>; Fri, 14 Feb 2020 11:11:57 +0100 (CET)
Subject: Re: [PATCH net] wireguard: device: provide sane limits for mtu setting
To: wireguard@lists.zx2c4.com
References: <20200214063814.229451-1-edumazet@google.com>
 <ae2626ad-772e-985a-4cd0-90462269b978@posteo.net>
 <E4D4DA63-F22C-47B4-A039-D787D70007A2@samirnassar.com>
From: Quan Zhou <quan@posteo.net>
Message-ID: <daa4be50-7883-a4ea-4b8e-3a32698ea0a9@posteo.net>
Date: Fri, 14 Feb 2020 18:11:54 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:73.0)
 Gecko/20100101 Thunderbird/73.0
MIME-Version: 1.0
In-Reply-To: <E4D4DA63-F22C-47B4-A039-D787D70007A2@samirnassar.com>
Content-Language: en-US
Autocrypt: addr=quan@posteo.net;
 keydata=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
OpenPGP: url=https://posteo.de/keys/quan@posteo.net.asc
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

Hi Samir,

I didn't realize this. You convinced me on this one. Thanks!

On 2/14/20 15:11, Samir Nassar wrote:
> Hello,
>
> from https://github.com/google/syzkaller/blob/master/docs/syzbot.md
>
> "syzbot system continuously fuzzes main Linux kernel branches and automatically reports found bugs to kernel mailing lists."
>
> As I understand it, fuzzing is applying changes to inputs to see what breaks and, in this case, fix it.
>
> It doesn't make sense to set an MTU to 0 so why allow the program to crash on setting the MTU to zero instead of giving back a useful error or preventing the crash in other ways.
>
> Providing dev->min_mtu and dev->max_mtu bounds is a nice thing to do.
>
> Samir
>
> On February 14, 2020 7:40:23 AM GMT+01:00, Quan Zhou <quan@posteo.net> wrote:
>> I'm just curious, under what circumstances would people set mtu to
>> zero?
>>
>> On 2/14/20 14:38, Eric Dumazet wrote:
>>> If wireguard device mtu is set to zero, a divide by zero
>>> crash happens in calculate_skb_padding().
>>>
>>> This patch provides dev->min_mtu and dev->max_mtu bounds.
>>>
>>> Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
>>> Signed-off-by: Eric Dumazet <edumazet@google.com>
>>> Reported-by: syzbot <syzkaller@googlegroups.com>
>>> Cc: Jason A. Donenfeld <Jason@zx2c4.com>
>>> Cc: wireguard@lists.zx2c4.com
>>> ---
>>>    drivers/net/wireguard/device.c | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/net/wireguard/device.c
>> b/drivers/net/wireguard/device.c
>>> index
>> 43db442b1373073eaf5e805cfe6cfee15875437a..c02b84cca122d92ee8a81c5efdcf67aada2554d6
>> 100644
>>> --- a/drivers/net/wireguard/device.c
>>> +++ b/drivers/net/wireguard/device.c
>>> @@ -271,9 +271,14 @@ static void wg_setup(struct net_device *dev)
>>>    	dev->features |= WG_NETDEV_FEATURES;
>>>    	dev->hw_features |= WG_NETDEV_FEATURES;
>>>    	dev->hw_enc_features |= WG_NETDEV_FEATURES;
>>> +
>>>    	dev->mtu = ETH_DATA_LEN - MESSAGE_MINIMUM_LENGTH -
>>>    		   sizeof(struct udphdr) -
>>>    		   max(sizeof(struct ipv6hdr), sizeof(struct iphdr));
>>> +	dev->min_mtu = MESSAGE_PADDING_MULTIPLE;
>>> +	dev->max_mtu = ETH_MAX_MTU - MESSAGE_MINIMUM_LENGTH -
>>> +		       sizeof(struct udphdr) -
>>> +		       max(sizeof(struct ipv6hdr), sizeof(struct iphdr));
>>>    
>>>    	SET_NETDEV_DEVTYPE(dev, &device_type);
>>>    
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
