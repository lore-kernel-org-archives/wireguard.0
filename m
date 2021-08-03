Return-Path: <SRS0=PVHX=M2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDE1C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Aug 2021 17:26:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EA3660E78
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Aug 2021 17:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0EA3660E78
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e6f8c8a;
	Tue, 3 Aug 2021 17:25:53 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ba477578
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Aug 2021 17:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628011548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XP8lX9ErDv+4UZHMmZq8xY0Qq6qxajk4njhGoDX6Q3s=;
 b=hydWuaWLxq2DOq/RMG4rn3PNqDxBRhTDRsxaSszpD75KaQtuGuIGgKvPIGP8CSbfnGCmo/
 LW/HnV8E/sXD3z0aYEahmrKZOAbEfZURZbnqvB45JirSJczyr9ow4V5+38TFWW4WUdOaL4
 Tn532o93wkb9eU7wZCfgZqT9TN7iFxI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 23a4b200
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 3 Aug 2021 17:25:48 +0000 (UTC)
Subject: Re: WireGuardNT BSOD Windows 10 21H1 Mullvad
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Andre Christanto <christantoandre@gmail.com>, wireguard@lists.zx2c4.com
References: <CAB5RCdEyyeGdeBrviTTjF3EyrfNWrCsUXqFbW+RUgqjKeDUrNQ@mail.gmail.com>
 <3f38eb92-9ed6-5903-d96c-3161de5330f7@zx2c4.com>
Message-ID: <0253f078-4d5a-25ce-36c9-02d917dd2e54@zx2c4.com>
Date: Tue, 3 Aug 2021 19:25:46 +0200
MIME-Version: 1.0
In-Reply-To: <3f38eb92-9ed6-5903-d96c-3161de5330f7@zx2c4.com>
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

On 8/3/21 5:00 PM, Jason A. Donenfeld wrote:
> On 8/3/21 12:20 PM, Andre Christanto wrote:
>> Today after I received notification that an update was available, I
>> immediately update my WireGuard installation and while waiting for the
>> installation to complete, I enabled the ExperimentalKernelDriver flag.
>> After the update was completed and WireGuard automatically reconnected
>> my VPN connection, my Windows almost immediately got BSOD (~2-3s after
>> VPN connected notification)
> 
> Thank you for the bug report. I fixed a similar sounding bug yesterday, 
> but perhaps this is a new one. Do you think you could send me the files 
> in the C:\windows\minidump directory? It's probably best to mail these 
> to me personally rather than sending them to the mailing list.

v0.4.1 is now released. Please see if that fixes the issue.

Jason
