Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD460C6FD18
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Apr 2023 11:14:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a0c9ee2;
	Sat, 22 Apr 2023 11:14:37 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ce76ddb9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Apr 2023 20:48:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9E8D25C00E7;
 Sun, 16 Apr 2023 16:48:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 16 Apr 2023 16:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johnnyutahh.com;
 h=cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1681678121; x=1681764521; bh=+fNO3Pu9bZ14fmRg4JtCsjTwTS08SurWoBA
 j6PfHvuM=; b=UMWOi4giVAEaT9q0rM+Kjjn2hcWK0NmSqgGIJU39tdQA5jYVyiy
 PmidhB50ESF3liK/OmLq/bCXxzTxXOq6YyRgMK3lQoN0N5kQ/5+sJ9h26o8gnU76
 /7Yf19+wddNBn3bodxP9ycvS0YSfuWESofmhRFNAMUUYtthSDoTTnCxhhdaV9Yam
 o7CAwyoJMNNBz/2Uf4Ai5SzV/NeJLMOPwJRR10zdVCVU7NswCCqW+EOuyjY/JMNl
 ehcLA8wr0D1lgzR7DMYnWBbtJHF5F+aRqq3uc4dFKPnbKnkywsQwg8I9Pn96v0hs
 Np9w4qaz5DF/0nJVRbfyEmqgXSQfdez5LpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1681678121; x=
 1681764521; bh=+fNO3Pu9bZ14fmRg4JtCsjTwTS08SurWoBAj6PfHvuM=; b=i
 OjuYXuNlRzlbE/qZg+nbkd1pmo0AhfxE6eRTD9soyeolCVtZy9vKsE2UcdvSu8zu
 gAuUjY3htgSAVDvSR2V4nzLx4oGv4IcvoxliZIhfeQg9rDc2jK1gONBvPh5chy1z
 zd12zcdQ49/0UlHyPqzXXp8lL34ZR2x5tXFkb7gSpclUCk989Gw5nGUTVikQtCFA
 TOfYf8KzaXs2YumUdXANJFCb/bbUPq4Tk1btOqHrXrzUwoowpubGHBKcNb6rLabn
 TgUdqEozquZxsXvd4cHM7efQAjhSr2egFnU05947VTFcoipGHECDM9CD83ZKZJuL
 pTVFBp4ZY39TbMiL0N2CA==
X-ME-Sender: <xms:KV88ZPFEnSIWbHKbFoDI7ZqeNR3VQ2QEhNaoK0dMT8bIEbNtuZjfXQ>
 <xme:KV88ZMX8CN32SPqzdJHGZUNIsr-suxMs6GjOF9jxvQ6ADUMe6K9En-Mbdy6nO_oAb
 iz130Mwip2zDYpWJX8>
X-ME-Received: <xmr:KV88ZBL26AL4qNFAQRPdwG1YU-RS1kuB-V0lO6UtQHkhg_KS5d1L70setePWzJe4wWC_Fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdelgedgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepkfffgggfuffhvfhfjggtgfesth
 ekredttdefjeenucfhrhhomheplfhohhhnnhihucgfthgrhhhhuceomhgrihhlmhgrnhdq
 fihirhgvghhurghrugdrtghomhesjhhohhhnnhihuhhtrghhhhdrtghomheqnecuggftrf
 grthhtvghrnhepkefgjedtiefgudeitefhiefgkefhteehleffheeigfffuddufeelffeg
 ieekhfefnecuffhomhgrihhnpehrvgguughithdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghilhhmrghnqdifihhrvghguhgr
 rhgurdgtohhmsehjohhhnhhnhihuthgrhhhhrdgtohhm
X-ME-Proxy: <xmx:KV88ZNFdwEMabc5yMO1GzH7R9RscH10PYNgM17T0J1N38fcxbwFaqQ>
 <xmx:KV88ZFV8IaRFyLFqouI18tshdtIaVVQy6PD9s16TBglYkWjaL5ypRw>
 <xmx:KV88ZIPqOM299zRCa7gHAR02Tpi-sbJ8L6_zNaaxRmOJxJn-AbBVzg>
 <xmx:KV88ZGcDxPdsrg5GQHAMkWdUXNAUpUzqZxbwdQLaTopR1aTrgoAD6A>
Feedback-ID: i099146e4:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Apr 2023 16:48:40 -0400 (EDT)
Message-ID: <a67d212a-3aa5-36da-ce05-37370e22fccf@johnnyutahh.com>
Date: Sun, 16 Apr 2023 15:48:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: How to optimize AllowedIPs "overlapping" routes?
Content-Language: en-US
From: Johnny Utahh <mailman-wireguard.com@johnnyutahh.com>
To: wireguard@lists.zx2c4.com
References: <da06afd5-82bf-56e7-aa27-394c750a44f8@johnnyutahh.com>
In-Reply-To: <da06afd5-82bf-56e7-aa27-394c750a44f8@johnnyutahh.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Apr 2023 11:14:31 +0000
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

More discussion here:

https://www.reddit.com/r/WireGuard/comments/12oimvq/how_to_optimize_allowedips_overlapping_routes/

Clearly this is FAQ-ish kind of thing. It was a little hard for me to 
easily find a reference for this kind of stuff. I realize the WireGuard 
project may not consider it to be their responsibility to address such 
things.

~J

On 2023-04-16 10:06 AM, Johnny Utahh wrote:
> 1. wg0.conf: AllowedIPs = 0.0.0.0/0, ::0/0 --> higher-latency network
> 2. wg1.conf: AllowedIPs = 192.168.7.0/24   --> much-lower-latency network
>
> When enabling both of the devices/.conf's (listed as 1. and 2. above) 
> concurrently, the #2 route travels over #1 (all starting up via 
> 'wg-quick'). In this scenario I'd prefer #2 routing "bypasses" #1 and 
> retain its (#2's) lower-latency path/network. Can this be done, somehow?
>
> I deduce the "route" for #2 changes when concurrently-enabling #1 
> because the #2-ping-latency immediately and dramatically increases to 
> match #1-network's latency (and immediately reverts to #2's lower 
> latency when #1 is disabled). This hurts my #2 network, badly.
>
> I'm running/testing the above on macOS v12.6.3 build 21G419, 
> wireguard-go v0.0.20230223. If not on macOS, might this be feasible on 
> Fedora or Ubuntu?
>
> I realize this might be a FAQ. I could not find any docs/resources to 
> help after a brief search, so I'm posting here.
>
> [I'm not a networking expert, so I may be butchering various 
> terminology, concepts. I apologize in advance for my ignorance.]
>
> ~J
