Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02592C6FA82
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Sep 2022 13:28:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f38df1ad;
	Thu, 22 Sep 2022 13:26:14 +0000 (UTC)
Received: from vidar.ut-capitole.fr (vidar-alt-1.ut-capitole.fr
 [193.49.48.246])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 653001a7
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 13:26:12 +0000 (UTC)
Received: from [10.26.2.40] (a19600.ut-capitole.fr [10.26.2.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bandry)
 by vidar.ut-capitole.fr (Postfix) with ESMTPSA id 1CAC040C2E6D
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 15:26:12 +0200 (CEST)
Message-ID: <622e8ce5-82bc-c633-4cfa-ebd2a42a8fc7@ut1.org>
Date: Thu, 22 Sep 2022 15:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: MacOS app update needed
Content-Language: fr
References: <CALDyVtsgMjH1YqrTrosDVU2khC9iEgMgUYDd8D65+h-K54y2fA@mail.gmail.com>
 <CABBZOs=bkOWQv09UQJnf18xVGAq_o6O+Ar+asMKoXtghcQvnog@mail.gmail.com>
 <ee65e180-eef5-b882-58ab-8a1188a38a09@ut1.org>
 <CAHmME9rd4g0EkPQqXX9vViHRuU8uaGkENNNa+TsBi3C_QNHbxw@mail.gmail.com>
 <1980318156.4949115.1663848249035.JavaMail.zimbra@donzis.com>
From: Bruno <bandry@ut1.org>
To: wireguard@lists.zx2c4.com
In-Reply-To: <1980318156.4949115.1663848249035.JavaMail.zimbra@donzis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

I'm sorry if my question was awkward. Like I said, it works well.

I never asked for useless development. I'm just surprised last commits 
are not included in a release.

We also had a constructive chat in November (with Diab Neiroukh) on this 
list. You made an appreciated change, but the question remained opened.

I really admire your work and simply asked if something was planned. I 
understand you have priorities and won't bother you any longer.

Regards.

Bruno

Le 22/09/2022 à 14:04, Lewis Donzis a écrit :
> ----- On Sep 22, 2022, at 6:43 AM, Jason A. Donenfeld Jason@zx2c4.com wrote:
>> On Wed, Sep 21, 2022 at 10:22 AM Bruno <bandry@ut1.org> wrote:
>>>
>>> Hi,
>>>
>>> Windows Client project don't feel alive either. Last commit has 6 months
>>> and last release is 9 month old.
>>>
>>> Same, here https://git.zx2c4.com/wireguard-windows/log/ and here
>>> https://github.com/WireGuard/wireguard-windows
>>>
>>> Version 0.5.3 works well, but I suppose it can be even better!
>>
>> That seems pretty uncalled for. Folks asking for a wireguard-apple
>> update have good reason to do so -- there are outstanding bugs and
>> pull requests. But for wireguard-windows/wireguard-nt? C'mon now --
>> that's received some *extremely* active development, stabilizing after
>> nearly weekly updates for some time. Are there outstanding pull
>> requests for it? So your note here really isn't appreciated. The
>> WireGuard project doesn't churn out code and updates just for the sake
>> of writing code and doing updates. Things need to have rationale.
>> There will be updates to wireguard-windows/wireguard-nt at some point
>> when development makes sense there. But right now? Is there something
>> pending? Instead maybe be thankful that that software has reached a
>> point of stability where project development energies can go into more
>> pressing tasks, such as wireguard-apple.
>>
>> Jason
> 
> I could not agree more.  What a world we live in where code that hasn't been touched for a few months is considered stale, rather than being rewarded and appreciated for reliability and stability.  Jason, congratulations on not needing to touch that code for six months!  Much of the beauty of Wireguard is its simplicity, to the point that it can be done "right", and it really shouldn't need to be touched!
> 
