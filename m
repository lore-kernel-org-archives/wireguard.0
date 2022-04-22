Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E96C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 09:29:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 25ab79a1;
	Fri, 22 Apr 2022 09:29:15 +0000 (UTC)
Received: from mail.otpe.de (mail.otpe.de [194.163.141.229])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 164d7114
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 09:29:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3AB8E460FC6; Fri, 22 Apr 2022 11:29:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qupfer.de; s=dkim;
 t=1650619753; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=FV8C2qbxFdldBxTkzZLTTk9NUwUlt2JSWdRgIyzlXXI=;
 b=LO0TOh836rLnJ9+GisYjkvkxiIWs4cqfxrEXhFxPRkrTIDXR9ONk+CajGkLt6drLmkyrGm
 rtmjB4H4HszD7LbW0cYmgyfwR7/N0D8TmABnGgpIG6hOPRidFnntpW5Tr14mHhJXO68Zxs
 408U5zaZuLbi4YeCAG+47AbSbNg5MBMcUeTIO+kLi0Hll/nujnps1itM6hVqtZKyFZeCoj
 GK4BfaMb6rGBSCtNyQZpsGHp98n7yQaKwY5IlNyZwWgNrBedwj0EfItuXsiNCe9M/NWBLd
 g0jZV7Dmg/CcYyvQqsneDzNMAP+YeDHQIZPQLnJC2LSeLQzWTLdq2Ubdp2CgoQ==
Message-ID: <34a3aa4f-76b6-9fbe-93ec-01cee228b382@qupfer.de>
Date: Fri, 22 Apr 2022 11:29:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Is it possible to disable wireguard on specific Wi-Fi ?
Content-Language: en-US
To: Nohk Two <nohktwo@gmail.com>, wireguard@lists.zx2c4.com
References: <77422@imapsync>
From: wireguard@qupfer.de
In-Reply-To: <77422@imapsync>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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


On 18.04.22 04:12, Nohk Two wrote:
>  I guess there are something conflict because the vanilla IP network 
> and the allowed IP network are the same.

Thats right, but you can simply use other IPs for your WG clients 
(192.168.187.0/24 or 172.16.0.0/24)

