Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F837C2BBCA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Jun 2024 09:59:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e8b1da2;
	Wed, 19 Jun 2024 09:59:30 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com
 [212.3.242.68])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a5e7ca3d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Jun 2024 09:59:28 +0000 (UTC)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
 by wilbur.contactoffice.com (Postfix) with ESMTP id BF61930D4;
 Wed, 19 Jun 2024 11:59:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718791167; 
 s=20220809-q8oc; d=unstable.cc; i=a@unstable.cc;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=yaOviF3mD5DKHn3gVsnVR952sfmn+vmjYhMoz3V51dI=;
 b=EewMJDJ0+PBPZGYI/REMXzhykUWPCTQh+izgUH9FJLpBHIFFWee09FFWdsv3mm48
 THaGNL3jWb07ubN3k3ode/PVNohSk1vAOc+36hs6TOvSDArVWYQfyPWG8jSGNsKsOqZ
 cX3STD9MpVPLgwiD2UuY/7KNv/UiQsN8ATjnQhYjVs9tu8QluIoalwgdItDjw0GjEwW
 zLHAlmXa5qdnNUaOuwmnelhmtDLOZmhYwsGzY9bMNJOVruFK7bGk9ZPEJC9ZEcrRdtG
 zOo4LFd9a1AmbkJEtIhxmML4XtnOwbW7jgN9mBIVwFi2qFX9DVD/JKB2cjSTt1Uf8l0
 QQw90KX0sA==
Received: by smtp.mailfence.com with ESMTPSA ;
 Wed, 19 Jun 2024 11:59:25 +0200 (CEST)
Message-ID: <9e91adb2-b155-4eef-8604-a2f762a98d4d@unstable.cc>
Date: Wed, 19 Jun 2024 12:01:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wireguard broken with ip rule due to missing address binding
To: Nico Schottelius <nico.schottelius@ungleich.ch>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <87h6dpi7zp.fsf@ungleich.ch>
Content-Language: en-US
From: Antonio Quartulli <a@unstable.cc>
In-Reply-To: <87h6dpi7zp.fsf@ungleich.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ContactOffice-Account: com:375058688
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

On 19/06/2024 11:42, Nico Schottelius wrote:
> I really hope the address binding issue can be solved soon, especially
> giving there is already a patch for it available.

Question: instead of implementing pure IP binding, may it help to 
implement some logic so that messages to a peer are always sent using 
the IP where previous packets were received?


Cheers,

-- 
Antonio Quartulli
