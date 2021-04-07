Return-Path: <SRS0=evAC=JE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEA1C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Apr 2021 07:53:03 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 851AD606A5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Apr 2021 07:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 851AD606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=glemt.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6e00cdd;
	Wed, 7 Apr 2021 07:50:34 +0000 (UTC)
Received: from smtp.domeneshop.no (smtp.domeneshop.no [2a01:5b40:0:3005::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ff36a590
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Apr 2021 07:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=glemt.net; 
 s=ds20209;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version
 :Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G4sE26bu8Smbs5m5pvKAzOEQcEhKmCGLc7+mVHBl2fI=; b=CE4sBcH4kHGd1XdZwYCuYvQJRU
 FagFZxxXJ1eBj6CEMaBJxvbRBJroZkSH0oxne2KURGq2AJbnKPxu+U+QlareUAiyxQKxbgIBk9Wd4
 DD+8GZOBtkADEKYyzuIUf7pAUhEG7uUD4f70/IW6l3qf3J8CHCqdCuI8QDVQgGuYaa//C3CjT9/zI
 odS6CwoNF0+0tIjVVCV17ka5l5/XU4M7lDIjHwMhZGtL0n1OGBCIsk/6kpRaGmyoVxnngqgUQfQim
 tM4V3L8XlOa4AW2wS3WJqCs3Fdo23r9Qk2ZqR7OmHQ77UFN+F42kEBcdI8qWairSM1F1/e2xDWLJ1
 8fK8fWhw==;
Received: from cm-84.209.6.139.getinternet.no ([84.209.6.139]:43140
 helo=[192.168.1.70])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <olemd@glemt.net>) id 1lU2xL-0006nl-VN
 for wireguard@lists.zx2c4.com; Wed, 07 Apr 2021 09:50:31 +0200
Subject: Re: NAT to NAT peers - 'EndPoint' IP data sharing among peers of the
 same key?
To: wireguard@lists.zx2c4.com
References: <trinity-3510980c-c0ee-4d02-bcf5-8b7d2a708cda-1617424060455@3c-app-mailcom-lxa15>
 <20210407031540.6fbd6789@natsu>
From: Ole-Morten Duesund <olemd@glemt.net>
Message-ID: <69faf92d-4c03-8255-d816-3e6cac5d0bb9@glemt.net>
Date: Wed, 7 Apr 2021 09:50:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210407031540.6fbd6789@natsu>
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

On 07.04.2021 00:15, Roman Mamedov wrote:

> On Sat, 3 Apr 2021 06:27:40 +0200
> Giovanni Francesco <thelinuxguy@mail.com> wrote:
>
>> Hi, I am looking to understand if "EndPoint" IP data may be shared among peers within the tunnel?
>>
>> The question may sound confusing, let me explain my setup.
>>
>> I have a static IPv4 wireguard server (let's call it "A" peer) which has two downstream WG clients peers "B" and "C" on remote networks with dynamic WAN IPs (roaming).
>> In my current configuration all my clients "B" and "C" have a single peer "A" - therefore all traffic must always go to "A" - "A" is in a datacenter in another country.
>>
>> "B" and "C" have dynamic every changing IP "EndPoint" information, in my current setup this is not a problem because "A" is a static host.
>>
>> If "B" and "C" are connected to "A" - is it possible for me to make B and C peers of eachother without "EndPoint" ?
>> In other words, if B public key is a peer of C and vise versa would its connection to "A" share the IP addresses ("EndPoint" or where to go) downstream to "B" and "C" so they can establish direct connectivity or would traffic always need to continue to traverse via "A"?
> No, peer A will not tell peer B the current IP/port of peer C.
>
> Check out other tools, for instance Tinc can do this, but not WG.

There is also https://tailscale.com/blog/how-tailscale-works/ which does 
a bunch of magic to overcome NAT-problems.

My experience is that it works absolutely stunningly well.


- OM

