Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACF0C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:57:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 627A061131
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 627A061131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=attglobal.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4f28096;
	Wed, 22 Sep 2021 22:57:04 +0000 (UTC)
Received: from p-impout004.msg.pkvw.co.charter.net
 (p-impout004aa.msg.pkvw.co.charter.net [47.43.26.135])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 271431f6
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 22:57:01 +0000 (UTC)
Received: from [192.168.0.3] ([108.184.10.226]) by cmsmtp with ESMTP
 id TBAgm98NTJGPoTBAhmfOQo; Wed, 22 Sep 2021 22:56:59 +0000
X-Authority-Analysis: v=2.4 cv=EJHDb3VC c=1 sm=1 tr=0 ts=614bb4bb
 a=x8oosPCBN5qOUqq8BNRqNA==:117 a=x8oosPCBN5qOUqq8BNRqNA==:17
 a=IkcTkHD0fZMA:10 a=mHFh7uMkAAAA:8 a=pGLkceISAAAA:8 a=yZ-kJEWfCFpM-kAUfs8A:9
 a=QEXdDO2ut3YA:10 a=HQEt9TzzOQq8o8QOxM_l:22
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
 <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
 <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
 <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
 <381D3BFE-1437-40F1-B79B-DAF82DE4F7D8@gmail.com>
 <CAHmME9r0xXq8XYJshVEnx0q8Sim7wuJ8gjy=_EszYf4Z020_Fw@mail.gmail.com>
 <b566bf2d-33c0-2e89-1754-a3b4015ff624@attglobal.net>
 <814501e8-c2c8-1e0a-2f30-fd83fb7769ec@attglobal.net>
 <CAHmME9p5C3bGT=gXV6WQ5HNOBTtitXdGwKm7EaOv_bnVVvX5vA@mail.gmail.com>
From: Eddie <stunnel@attglobal.net>
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <dc479512-e2e6-f6f9-3780-9a9b9b5bbc13@attglobal.net>
Date: Wed, 22 Sep 2021 15:56:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9p5C3bGT=gXV6WQ5HNOBTtitXdGwKm7EaOv_bnVVvX5vA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Envelope: MS4xfAc4rTgRyNkXnN1wgdyQdpTTnEviU+8Ppz8mt9GkW9zVPS0X5D1puQ3PoRCQLa3R7xVbxlpFdB7dqatOVivnz0orgVDpZoTduS1Oj+cznyrKjVozC2/2
 rFoxcU124jW5rltEyLXZMFQO8FJpP338/GCAnYe7no/sZ6aNdMdiLJBS6ftAVwsPXOr92BZMhH9HDqjP27wb0W9Cfybvi+TYIS2ufsVbdu5um+C6/+9ChzGK
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
Reply-To: stunnel@attglobal.net
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


On 9/22/2021 3:54 PM, Jason A. Donenfeld wrote:
> On Wed, Sep 22, 2021 at 4:53 PM Eddie <stunnel@attglobal.net> wrote:
>> On 9/22/2021 3:45 PM, Eddie wrote:
>>> On 9/22/2021 3:35 PM, Jason A. Donenfeld wrote:
>>>> Hi Miguel,
>>>>
>>>> On Wed, Sep 22, 2021 at 4:31 PM Miguel Arroz <miguel.arroz@gmail.com>
>>>> wrote:
>>>>>     After the update, when I launch the app on the iPad, the row in
>>>>> the tunnel list has a red background, and the first time I launched
>>>>> it, the switch started switching very quickly between connected and
>>>>> disconnected. Also, nothing at all shows on the right side when I
>>>>> click it (not even the empty sections that were appearing before,
>>>>> it’s just a blank view). The tunnel also got disconnected when I
>>>>> launched the app, and is not connecting any more.
>>> I see the same red backgrounds and empty details pane.
>> Which now means I can't delete the broken tunnels.
> What happens when you slide the item over to reveal the delete button
> and then press it?
>
Sorry 'bout not sending that to the list, corrected.

Didn't know about that option  :-(  Which does work, thanks.

