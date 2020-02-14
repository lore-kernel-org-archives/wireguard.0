Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_DISCARD,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B9DC2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 07:12:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0EA22082F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 07:12:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=samirnassar.com header.i=@samirnassar.com header.b="R9jXwn/7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0EA22082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=samirnassar.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 688a25f6;
	Fri, 14 Feb 2020 07:09:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62152900
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 07:09:47 +0000 (UTC)
Received: from mail.myriapolis.net (mail.myriapolis.net [5.9.94.73])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01f530fa
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 07:09:47 +0000 (UTC)
Date: Fri, 14 Feb 2020 08:11:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samirnassar.com;
 s=2018; t=1581664308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RmJScd4zk949NgGYxg+u6Be2UtQ+tutshN+gTT1dFUA=;
 b=R9jXwn/7TVFkp3H042yx5GApH00XjYuodaphupzUXXZAj9hGYiN8p3ubGe9HTUNe2CIOKX
 2dLDFe0FcVZJ8gC0krqkiGCntfgEd2wTA8HLaV4iLUuI8oW+B2dYbiKOEfnvt3k7P5jWG+
 cVITnci+bv5S3YvYBp4ghbbp3GI34yR+Y/ErdvG1T+cFdFgYwGbowlAklQ0JnAuFGTmgVB
 FZ6CHZQCCyK/UZ3Zlcg3O3qjA8wD58gCnX7b5D8pLSSw65Q1YVu0xAo+njcJSsSbiZRQv1
 9b4TDo6hjUqFxZGe2a3UkHrvtzmUPp1ZLJd4XMlGpxozoGLkQLVY1g/uei0OIw==
In-Reply-To: <ae2626ad-772e-985a-4cd0-90462269b978@posteo.net>
References: <20200214063814.229451-1-edumazet@google.com>
 <ae2626ad-772e-985a-4cd0-90462269b978@posteo.net>
MIME-Version: 1.0
Subject: Re: [PATCH net] wireguard: device: provide sane limits for mtu setting
To: wireguard@lists.zx2c4.com
From: Samir Nassar <samir@samirnassar.com>
Message-ID: <E4D4DA63-F22C-47B4-A039-D787D70007A2@samirnassar.com>
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=samir@samirnassar.com smtp.mailfrom=samir@samirnassar.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

from https://github.com/google/syzkaller/blob/master/docs/syzbot.md

"syzbot system continuously fuzzes main Linux kernel branches and automatically reports found bugs to kernel mailing lists."

As I understand it, fuzzing is applying changes to inputs to see what breaks and, in this case, fix it.

It doesn't make sense to set an MTU to 0 so why allow the program to crash on setting the MTU to zero instead of giving back a useful error or preventing the crash in other ways.

Providing dev->min_mtu and dev->max_mtu bounds is a nice thing to do.

Samir

On February 14, 2020 7:40:23 AM GMT+01:00, Quan Zhou <quan@posteo.net> wrote:
>I'm just curious, under what circumstances would people set mtu to
>zero?
>
>On 2/14/20 14:38, Eric Dumazet wrote:
>> If wireguard device mtu is set to zero, a divide by zero
>> crash happens in calculate_skb_padding().
>>
>> This patch provides dev->min_mtu and dev->max_mtu bounds.
>>
>> Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
>> Signed-off-by: Eric Dumazet <edumazet@google.com>
>> Reported-by: syzbot <syzkaller@googlegroups.com>
>> Cc: Jason A. Donenfeld <Jason@zx2c4.com>
>> Cc: wireguard@lists.zx2c4.com
>> ---
>>   drivers/net/wireguard/device.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/net/wireguard/device.c
>b/drivers/net/wireguard/device.c
>> index
>43db442b1373073eaf5e805cfe6cfee15875437a..c02b84cca122d92ee8a81c5efdcf67aada2554d6
>100644
>> --- a/drivers/net/wireguard/device.c
>> +++ b/drivers/net/wireguard/device.c
>> @@ -271,9 +271,14 @@ static void wg_setup(struct net_device *dev)
>>   	dev->features |= WG_NETDEV_FEATURES;
>>   	dev->hw_features |= WG_NETDEV_FEATURES;
>>   	dev->hw_enc_features |= WG_NETDEV_FEATURES;
>> +
>>   	dev->mtu = ETH_DATA_LEN - MESSAGE_MINIMUM_LENGTH -
>>   		   sizeof(struct udphdr) -
>>   		   max(sizeof(struct ipv6hdr), sizeof(struct iphdr));
>> +	dev->min_mtu = MESSAGE_PADDING_MULTIPLE;
>> +	dev->max_mtu = ETH_MAX_MTU - MESSAGE_MINIMUM_LENGTH -
>> +		       sizeof(struct udphdr) -
>> +		       max(sizeof(struct ipv6hdr), sizeof(struct iphdr));
>>   
>>   	SET_NETDEV_DEVTYPE(dev, &device_type);
>>   
>_______________________________________________
>WireGuard mailing list
>WireGuard@lists.zx2c4.com
>https://lists.zx2c4.com/mailman/listinfo/wireguard

-- 
Samir Nassar
samir@samirnassar.com

Sent from my mobile device. Please excuse my brevity.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
