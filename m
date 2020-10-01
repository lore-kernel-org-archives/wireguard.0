Return-Path: <SRS0=Zpbp=DI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE350C4727C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 14:42:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9347920780
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 14:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9347920780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-free.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22fecf52;
	Thu, 1 Oct 2020 14:10:52 +0000 (UTC)
Received: from s2.spam-free.eu (s2.spam-free.eu [195.5.121.125])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c6f11dd8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 14:10:50 +0000 (UTC)
Received: from [192.168.129.206]
 (dslb-002-204-084-239.002.204.pools.vodafone-ip.de [2.204.84.239])
 by s2.spam-free.eu (Postfix) with ESMTPSA id A71111C0D02
 for <wireguard@lists.zx2c4.com>; Thu,  1 Oct 2020 16:42:40 +0200 (CEST)
Subject: Re: lineageos 17.1after autostart on boot tunnel not functioning
From: Chris <wireguard@spam-free.eu>
To: wireguard@lists.zx2c4.com
References: <mailman.0.1601114111.20018.wireguard@lists.zx2c4.com>
 <296f17d0-3f0b-6021-7bb3-4b4bf576f6c7@spam-free.eu>
Message-ID: <e6bcd0a7-fe36-61f0-e289-148c682acdaf@spam-free.eu>
Date: Thu, 1 Oct 2020 16:42:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <296f17d0-3f0b-6021-7bb3-4b4bf576f6c7@spam-free.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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

In answer to my own conribution and to further clarify the problem:
The server address was given as a DNS Name rather than an ip number.
Replacing it with the ip number, it works.
This probably means that wireguard tries to contact the server before DNS is 
functioning.
And this does not change!!
I never had this problem with openvpn.
Chris


On 26/09/2020 12:40, Chris wrote:
> I'm running the f-droid repo of the wireguard client on lineageos 17.1
> When set auto autostart on boot, it does run.
> The wireguard process is running and the tun0 interface is up with its setup 
> ip address.
>
> However the tunnel is not working. I can't ping the server.
> After manually disabling and re-enabling the client everything is fine.
> BR
> Chris
>

