Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DDDC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:55:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B89B260F4C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B89B260F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=attglobal.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e43b093;
	Wed, 22 Sep 2021 22:55:19 +0000 (UTC)
Received: from p-impout006.msg.pkvw.co.charter.net
 (p-impout006aa.msg.pkvw.co.charter.net [47.43.26.137])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9f7489e8
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 22:55:15 +0000 (UTC)
Received: from [192.168.0.3] ([108.184.10.226]) by cmsmtp with ESMTP
 id TB8zmf1GVnVnATB8zmh7re; Wed, 22 Sep 2021 22:55:13 +0000
X-Authority-Analysis: v=2.4 cv=YqrK+6UX c=1 sm=1 tr=0 ts=614bb451
 a=x8oosPCBN5qOUqq8BNRqNA==:117 a=x8oosPCBN5qOUqq8BNRqNA==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=MmRFTDfVAAAA:8 a=Brxj2roxNFKlwqLmg5UA:9
 a=QEXdDO2ut3YA:10 a=CzLJQUTY-9uIr9yd9nlC:22
From: Eddie <stunnel@attglobal.net>
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
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <061d9137-a5af-a651-9435-db92dc9f53f9@attglobal.net>
Date: Wed, 22 Sep 2021 15:55:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b566bf2d-33c0-2e89-1754-a3b4015ff624@attglobal.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Envelope: MS4xfHX9eOORNWnsmdgUU221l3s6DKy2CoVnpD52JJ3hsGznFrH71td/W+QpGGqHbxJkPlbOrTLa22nSEQbaFVz5miNaWKOoc1Nb0Uv6/9MXxcMQ6w+lVgTr
 3Emrfg8DxTMbPe31LmSPk1c2eB8eFU3IbVfNTgVvxR359LxUx156bwB9pgjIQDufGogJZCuZQEqRLk/vAh5/P1jYjo/qHZhQ0Zhu0g5YbULc4ylMjWsmxzDC
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

On 9/22/2021 3:45 PM, Eddie wrote:
> On 9/22/2021 3:35 PM, Jason A. Donenfeld wrote:
>> Hi Miguel,
>>
>> On Wed, Sep 22, 2021 at 4:31 PM Miguel Arroz <miguel.arroz@gmail.com> 
>> wrote:
>>>    After the update, when I launch the app on the iPad, the row in 
>>> the tunnel list has a red background, and the first time I launched 
>>> it, the switch started switching very quickly between connected and 
>>> disconnected. Also, nothing at all shows on the right side when I 
>>> click it (not even the empty sections that were appearing before, 
>>> it’s just a blank view). The tunnel also got disconnected when I 
>>> launched the app, and is not connecting any more.
> I see the same red backgrounds and empty details pane.

Which now means I can't delete the broken tunnels.

>> Is this on a fresh 14->15 transition? Or had you already loaded the
>> old version on 15?
> I had already upgraded all my devices, so can't verify the 14->15 upgrade.
>> The row turns red when it can't open the keychain reference. I'm
>> curious whether that's because it was already deleted stupidly by the
>> old version of the app during the 14->15 transition, or whether it's
>> still there, but the new version of the app on 15 is unable to load
>> it.
>>
>> Also, what happens if you twiddle the iCloud keychain setting?
> Sorry, as much as I like Apple, that's one part I'm not trusting to 
> their cloud.
>> Jason
>>
>>
>
>
> ----------------------------------------------------------------------
> This e-mail was checked for spam by the freeware edition of CleanMail.
> The freeware edition is restricted to personal and non-commercial use.
> You can remove this notice by purchasing a commercial license:
> http://antispam.byteplant.com/products/cleanmail/index.html


