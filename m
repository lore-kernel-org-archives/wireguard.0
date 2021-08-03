Return-Path: <SRS0=PVHX=M2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2951C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Aug 2021 17:26:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C06C560E78
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Aug 2021 17:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C06C560E78
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9d1d4fc;
	Tue, 3 Aug 2021 17:25:36 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b4f015ea
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Aug 2021 17:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628011528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYdhT+NmbcmhwMdoTJA8ywvm/26apoFckF7QtP8rDZk=;
 b=f5koT/GDrChA19J6NyR2CCY2KMJAdyUvEXaQae98/tSN+7mL7+/o2zhrHCAewvzcHjhK0u
 Hf0hNlj810PaWIeYCaCP2BSbwZls3bbYIxfMS15PqXow/ksM8G8awl7hK3VPIXDvzlkvIY
 ZikFMFVkcecfVFp3myRO+EKETYj7nLA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 47dd1211
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 3 Aug 2021 17:25:28 +0000 (UTC)
Subject: Re: Blue Screen errors with WireGuardNT using two peers
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Hiroshi Shirosaki <h.shirosaki@gmail.com>, wireguard@lists.zx2c4.com
References: <CAOWZXk1JwVVVZdRfDk9JX8tQdDnp3zbqrGL4mjCN39UuN7oJGg@mail.gmail.com>
 <6d0a94a0-ae09-39a3-7b83-c40efe40246b@zx2c4.com>
Message-ID: <50d9869c-0b89-c62e-35ff-79186413727c@zx2c4.com>
Date: Tue, 3 Aug 2021 19:25:24 +0200
MIME-Version: 1.0
In-Reply-To: <6d0a94a0-ae09-39a3-7b83-c40efe40246b@zx2c4.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 8/3/21 5:01 PM, Jason A. Donenfeld wrote:
> On 8/3/21 7:06 AM, Hiroshi Shirosaki wrote:
>> I tried to use WireGuard 0.4.0 with ExperimentalKernelDriver on.
>> When I use only one peer, it seems to work fine.
>> When I used another peer to ssh at the same time, Windows 10 became
>> blue screen and rebooted.
>> Windows 10 Pro 21H1.
>> Is using multiple peers at the same time not supported?
> 
> Multiple peers _should_ be supported, but you've evidently hit some kind 
> of bug. Do you think you could send me the files in the 
> C:\windows\minidump\ directory? It's probably best to mail these to me 
> personally rather than sending them to the mailing list.

v0.4.1 is now released. Please see if that fixes the issue.

Jason
