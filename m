Return-Path: <SRS0=ZwbF=JD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2492C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Apr 2021 21:46:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94B5D613D0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Apr 2021 21:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94B5D613D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=harbourfrontcentre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dbe517ea;
	Tue, 6 Apr 2021 21:46:53 +0000 (UTC)
Received: from dkim.harbourfrontcentre.com (dkim.harbourfrontcentre.com
 [66.212.179.252])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a918850c
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Apr 2021 20:28:32 +0000 (UTC)
Received: from photolib.harbourfrontcentre.com ([192.168.1.26])
 by dkim.harbourfrontcentre.com (8.14.4/8.14.4) with ESMTP id 136KSTcB028101
 for <wireguard@lists.zx2c4.com>; Tue, 6 Apr 2021 16:28:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=harbourfrontcentre.com; s=hfc; t=1617740910;
 bh=hPYu22Mgm/l6Wws7IAvghQCJwEZbcWn7ZCLI22l5fqE=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=LDgdnlpMGlrI6dGGzxNQsgIK6Z05yvxJ7iH9zdO43V+1lvbObGGS5kSqte2Q65bP8
 G7Nm4n1MdKDQ6oRPSMpzdm7W9crVVNVk6+DTO6l2AR1sotOOZ7smWZ7ByHAc2+B1W0
 wCT9qiPQZX6OsiDkJCJmxZvYgmamA2bb7h+EHO5w=
Received: from [10.235.4.109] (ALLEN-PC10.hftnet [10.235.4.109])
 by photolib.harbourfrontcentre.com (8.13.8/8.13.8) with ESMTP id
 136KSTxX029590
 for <wireguard@lists.zx2c4.com>; Tue, 6 Apr 2021 16:28:29 -0400
Subject: Re: Best strategy for multiple point-to-point tunnels
To: wireguard@lists.zx2c4.com
References: <93213ae2-3ad1-7f8a-1e21-57f672738e18@babioch.de>
 <CA+cYV6tQA=PkSsJkAKQ199q8qv74s1y_En4gBYwZiu9bHuwu_A@mail.gmail.com>
 <CA+cYV6ve9iPTb5QzdUQ39DEY+7Weq_+OvVLfHi0Jkrx-LMmc_g@mail.gmail.com>
From: Allen Chen <achen@harbourfrontcentre.com>
Message-ID: <76daec03-67b8-25a7-a2c1-bd51a0e9c891@harbourfrontcentre.com>
Date: Tue, 6 Apr 2021 16:28:29 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CA+cYV6ve9iPTb5QzdUQ39DEY+7Weq_+OvVLfHi0Jkrx-LMmc_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Unsub: msg.XXs1PFwv
X-Mailman-Approved-At: Tue, 06 Apr 2021 21:46:47 +0000
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

The process of update is bugging me a lot. Does a update break the 1-n 
connection? There should be a way to check the version compatibility. 
But I don't know how.

Allen

On 3/30/2021 7:55 AM, Chriztoffer Hansen wrote:
> On Tue, 30 Mar 2021 at 13:53, Chriztoffer Hansen wrote:
>> On Thu, 25 Mar 2021 at 23:35, Karol Babioch wrote:
>>> What is your recommendation on handling multiple peer-to-peer tunnels?
>>> Should I go for multiple interfaces or for one interface with multiple
>>> peers?
>> If you plan to do L3 routing over the P2P tunnels (e.g.
>> OSPF/BGP/EIGRP/Babel/etc.). A dedicated wg interface per remote
>> endpoint is generally recommended.
> If you are doing a road-warrior style set-up. One WG interface (e.g.
> per subnet for road-warrior groups) at your aggregation point/server
> will be enough.
>
 
