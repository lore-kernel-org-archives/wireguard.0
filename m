Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65494C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 14:48:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAF6861050
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 14:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAF6861050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=spamteq.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d6375db;
	Wed, 22 Sep 2021 14:47:11 +0000 (UTC)
Received: from mail-out2.spamhaus.org (mail-out2.spamhaus.org
 [193.190.148.132])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b90838fc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 14:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=spamteq.com;
 s=dkim2018; t=1632322027;
 bh=58kVm3nIDVVSjwSbHaj1g/0n96XdOa+f0jP+961Y8xU=;
 h=Subject:To:From:Date:From:Subject:Date:To:Cc;
 b=GSLmjQZ1M4D6gnBbOoZMgdtICiMTkX8PE7fwrExbpU/2lJDQ39w03v03ruxpbaeh8
 wQBLjOkMLcF2ic7PSZfNG2sO7F4DeVehCLPCeRgU+Gcuze0ZaozDWGUszHotkwb/G6
 XuWarZNuKvMH0xpLS5+eo3O/MtNmYCee//z9CqJo9wlPHXtHndnKDgicvdEDvWLjiP
 x7fyepliBV70ezPKig8jeGy1uWOlyImF55py3ZZEp2xxs32IxnmLFAevtLg2N3UwTK
 d7K3pixM2tQzg5vH/dIl/KeNZvCKNL1JgZo6MHstmxxIoKwVzSRuE0hQ/9TpHCtgWM
 fcpJ9Kwldd7Xw==
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: wireguard@lists.zx2c4.com
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <CAHmME9p1GcTVfFNH67o1xKxTw6VF=ioqBOAnWjES4Hn15GE2JA@mail.gmail.com>
From: Andrew Fried <afried@spamteq.com>
Message-ID: <K3323-53.1632322027@spamhaus.org>
Date: Wed, 22 Sep 2021 14:47:07 +0000
MIME-Version: 1.0
In-Reply-To: <CAHmME9p1GcTVfFNH67o1xKxTw6VF=ioqBOAnWjES4Hn15GE2JA@mail.gmail.com>
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

I ran into the same problem on my iPhone  and 4 separate iPads.

The solution: delete the wireguard app, then re-download it from the app 
store.  Problem solved.

Andrew


On 9/22/21 1:17 AM, Jason A. Donenfeld wrote:
> On Tue, Sep 21, 2021 at 10:50 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>> 2. When the app can't open a keychain item, it deletes the VPN
>> profile? Or does it just gray it out? If it's deleting it, that's
>> wrong; it ought to just remain disabled until it's readable again.
> 
> This is now fixed with https://w-g.pw/l/dteZ
> 
>> 1. Something goes wrong with the keychain from 14->15 and the app
>> loses authorization.
> 
> This I still have no idea about, as I can't reproduce the issue. It
> would be useful to know if it's transient, and so the fix to (2) above
> basically handles the issue by not blowing away the VPN profile. If
> somebody's got a reliable reproduction rig and can build this in
> xcode, I'd be interested in feedback here on what's in the master
> branch.
> 
> Jason
> 

-- 
Andrew Fried
afried@spamteq.com
+1.703.667.4050 Office
+1.703.362.0067 Mobile
