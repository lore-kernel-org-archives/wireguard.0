Return-Path: <SRS0=i+YM=Q4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB54AC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 16:03:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EA432083E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 16:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EA432083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ead2e06;
	Thu, 21 Feb 2019 15:54:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d196702
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 15:54:29 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1db1e328
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 15:54:29 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 48F791E3026
 for <wireguard@lists.zx2c4.com>; Thu, 21 Feb 2019 11:03:18 -0500 (EST)
Received: from [10.4.1.148] (wsip-70-184-211-81.om.om.cox.net [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 201F21E3005
 for <wireguard@lists.zx2c4.com>; Thu, 21 Feb 2019 11:03:18 -0500 (EST)
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: iOS WG (1.0.3) - ARM64 SIMD ChaCha20
Date: Thu, 21 Feb 2019 10:03:16 -0600
References: <A76D82AE-F12E-4E3E-906A-D34640E2DF4F@lonnie.abelbeck.com>
 <db2ff044-47ab-6050-338c-d81fc0ed0c0e@newmedia-net.de>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
In-Reply-To: <db2ff044-47ab-6050-338c-d81fc0ed0c0e@newmedia-net.de>
Message-Id: <1E89DB79-1BB3-4279-B13D-1321235D9BE5@lonnie.abelbeck.com>
X-Mailer: Apple Mail (2.3445.102.3)
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



> On Feb 20, 2019, at 3:01 PM, Sebastian Gottschall <s.gottschall@newmedia-net.de> wrote:
> 
> 
> Am 20.02.2019 um 16:03 schrieb Lonnie Abelbeck:
>> Thanks to Jason and the team, a new iOS WG 1.0.3 appeared as an update:
>> 
>> 1.0.3 / Feb 19, 2019
>> --
>> Performance should be higher and battery usage lower, thanks to a new ARM64 SIMD implementation of ChaCha20
>> --
>> For reference, the upstream golang crypto commit is here [1] with performance numbers.
>> 
>> So, the question come to mind, do my iOS devices have ARM64 SIMD support, quick answer is if the device is less than 6 years old it should have ARM64 SIMD support.  Added in the A5/A6 CPU's from what I can tell.
> 
> A5 and A6 is 32 bit. A7 was the first 64 bit cpu (introduced with Iphone 5s)
> 
> Sebastian

Thanks Sebastian for the info,

It appears if the device can run iOS 12 (required by iOS WG) then it also has ARM64 SIMD support.

Lonnie



>> Apple-designed processors
>> https://en.wikipedia.org/wiki/Apple-designed_processors
>> 
>> [1] chacha20: add SIMD implementation on arm64
>> https://go.googlesource.com/crypto/+/74369b46fc6756741c016591724fd1cb8e26845f

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
