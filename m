Return-Path: <SRS0=i+YM=Q4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F82BC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 17:10:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54672080D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 17:10:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=newmedia-net.de header.i=@newmedia-net.de header.b="fHiNih3v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E54672080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=newmedia-net.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37c1b9ff;
	Thu, 21 Feb 2019 17:01:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ada2623
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 17:01:11 +0000 (UTC)
Received: from webmail.newmedia-net.de (smtps.newmedia-net.de
 [IPv6:2a05:a1c0:0:de::167])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8933f10d
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 17:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=newmedia-net.de; s=mikd; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=supiX5LfEwdy4GKY30kP6/Pdk5/D9ccpjXWwCz8KQSc=; 
 b=fHiNih3vhPfkQtcPO8hDxGdPC5gANUV6datiFt/YAa7xaV9HKqgvzMr9PqmiDSZgfi7hCppUUK42n/38RSrrgC92XiCGOkwDWbdrf8vEscxZjSYHPo8cEINLG/bJVTZSCRo2xETu78hXyvrg8ChE1FEbhBslM7Dgt44Z/est5sQ=;
Subject: Re: iOS WG (1.0.3) - ARM64 SIMD ChaCha20
To: wireguard@lists.zx2c4.com
References: <A76D82AE-F12E-4E3E-906A-D34640E2DF4F@lonnie.abelbeck.com>
 <db2ff044-47ab-6050-338c-d81fc0ed0c0e@newmedia-net.de>
 <1E89DB79-1BB3-4279-B13D-1321235D9BE5@lonnie.abelbeck.com>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Message-ID: <9c33c6e4-5631-18de-24c0-49b5c6f58aa6@newmedia-net.de>
Date: Thu, 21 Feb 2019 18:09:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1E89DB79-1BB3-4279-B13D-1321235D9BE5@lonnie.abelbeck.com>
X-Received: from [212.111.244.1] (helo=[172.29.0.186])
 by webmail.newmedia-net.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.72) (envelope-from <s.gottschall@newmedia-net.de>)
 id 1gwrrF-0007Zx-Jt
 for wireguard@lists.zx2c4.com; Thu, 21 Feb 2019 18:10:01 +0100
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


Am 21.02.2019 um 17:03 schrieb Lonnie Abelbeck:
>
>> On Feb 20, 2019, at 3:01 PM, Sebastian Gottschall <s.gottschall@newmedia-net.de> wrote:
>>
>>
>> Am 20.02.2019 um 16:03 schrieb Lonnie Abelbeck:
>>> Thanks to Jason and the team, a new iOS WG 1.0.3 appeared as an update:
>>>
>>> 1.0.3 / Feb 19, 2019
>>> --
>>> Performance should be higher and battery usage lower, thanks to a new ARM64 SIMD implementation of ChaCha20
>>> --
>>> For reference, the upstream golang crypto commit is here [1] with performance numbers.
>>>
>>> So, the question come to mind, do my iOS devices have ARM64 SIMD support, quick answer is if the device is less than 6 years old it should have ARM64 SIMD support.  Added in the A5/A6 CPU's from what I can tell.
>> A5 and A6 is 32 bit. A7 was the first 64 bit cpu (introduced with Iphone 5s)
>>
>> Sebastian
> Thanks Sebastian for the info,
>
> It appears if the device can run iOS 12 (required by iOS WG) then it also has ARM64 SIMD support.
yes. because all 32 bit systems are unsupported anyway. so there is no 
32 bit wg version available since you cannot submit them to apple since 
a along time
if i remember correct 32 bit support stopped with ios 10.
>
> Lonnie
>
>
>
>>> Apple-designed processors
>>> https://en.wikipedia.org/wiki/Apple-designed_processors
>>>
>>> [1] chacha20: add SIMD implementation on arm64
>>> https://go.googlesource.com/crypto/+/74369b46fc6756741c016591724fd1cb8e26845f
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
