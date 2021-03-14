Return-Path: <SRS0=wF/V=IM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134BFC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 14 Mar 2021 19:01:47 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59B0864EBE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 14 Mar 2021 19:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59B0864EBE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kapsi.fi
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c6dc45b;
	Sun, 14 Mar 2021 19:01:43 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [2001:67c:1be8::25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 24c56817
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Mar 2021 19:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vyY1eaH1z+g188gbnLasPnlZSELbtMzj380Sukwq+z8=; b=egbAMzbHz8th1uS9UZRThaPLA4
 vMnQmHU73FOM6cZrlaqw0sl5ZSiu+dN9hSdN9tMOgb7gB5BPHZE/Gz2+2iyQ5VbwLTnQ7VProS33H
 Np2OlkxnBu047VOGSmH1c8H7QC1wnyBKOpxB6+KTGiuzRSpHXI7xxbiYAd+YbHpQj9CWV/tbz0NBV
 uPGTYRH/suNsKjw5u8dZcOrfPgGODcrjOUC+7HyFzeXfDQwsVIXum/t7vrWZlagX6gsT3z8RTZgJZ
 KRp2lfLSAbTKHyS3r0awbW6FulbbSK3hKPUXunHcf4N9ACeI3aiyHaI10swaaJmBbI1IK1DR3wc+W
 8Uz/Rv8g==;
Received: from [2001:67c:1104:fa0:64ee:b0de:8333:7c61]
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <samip537@kapsi.fi>) id 1lLVzh-0002Ve-I0
 for wireguard@lists.zx2c4.com; Sun, 14 Mar 2021 21:01:41 +0200
Subject: Re: Wireguard on EdgeRouter and using specified VRF and/or routing
 table
To: wireguard@lists.zx2c4.com
References: <8036163fba8a8c7cdea2af0fcac4eb07@kapsi.fi>
From: =?UTF-8?Q?Skyler_M=c3=a4ntysaari?= <samip537@kapsi.fi>
Message-ID: <4cb69d55-c577-10d4-2692-f6ebaaba5f1d@kapsi.fi>
Date: Sun, 14 Mar 2021 21:01:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8036163fba8a8c7cdea2af0fcac4eb07@kapsi.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:1104:fa0:64ee:b0de:8333:7c61
X-SA-Exim-Mail-From: samip537@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

Hi,

Could somone help me with this? Last I sent this, I got no replies.

On 27/01/2021 9.45, Skyler Mäntysaari wrote:
> Hi there,
>
> I have a use case where I'm running Bird (BGP daemon) on a EdgeRouter, 
> and then having PTP links via Wireguard for the BGP sessions but I 
> need some help on how to set the wireguard interface to use specified 
> routing table and/or vrf?
>
> I want it to use kernel routing table 1 aswell as specific VRF, and I 
> have set the "route-allowed-ips" to false, as I don't want it to 
> generate it's own routing table.
>
> For reference: Kernel version is 4.9.79.
>
> Best regards,
> Skyler Mäntysaari
