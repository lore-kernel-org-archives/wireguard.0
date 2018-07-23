Return-Path: mdlayher@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e1f264b
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 15:50:12 +0000 (UTC)
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b0a0518
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 15:50:12 +0000 (UTC)
Received: by mail-it0-x244.google.com with SMTP id p17-v6so1962997itc.2
 for <wireguard@lists.zx2c4.com>; Mon, 23 Jul 2018 08:59:15 -0700 (PDT)
Return-Path: <mdlayher@gmail.com>
Subject: Re: wireguardnl: Go package for interacting with WireGuard via
 generic netlink
From: Matt Layher <mdlayher@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <0f15823a-d527-f281-1d4b-735d227e3844@gmail.com>
 <CAHmME9pcN_SyZ5_bYU2H=NjoZ67ETaRaYxbRR673zrk_k36_AQ@mail.gmail.com>
 <3c167a80-6459-7c0e-8935-a98e226fa023@gmail.com>
 <CAHmME9qBDqPUuaz9X=rErROghvc57Rxw7Hejen8XcVMi7NUDZw@mail.gmail.com>
 <4de6eec9-9239-5e4e-60c1-e287b3be336a@gmail.com>
Message-ID: <ba866611-cd70-5183-bcd4-1ea1e7cc36a5@gmail.com>
Date: Mon, 23 Jul 2018 11:59:12 -0400
MIME-Version: 1.0
In-Reply-To: <4de6eec9-9239-5e4e-60c1-e287b3be336a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

An update for those on the list, I've implemented Jason's requested name 
change and the API is now set up to allow seamless kernel and userspace 
implementations via https://godoc.org/github.com/mdlayher/wireguardctrl.

I will explicitly encourage callers to use this interface rather than 
the "wireguardnl" package, unless we do end up with useful 
netlink-specific functionality like the situation I described previously.

I'll keep working on this for now and report back when I have a working 
userspace implementation.  Should be quite straightforward compared to 
dealing with netlink! :)

- Matt


On 07/23/2018 11:29 AM, Matt Layher wrote:
> Understood and renamed to "wireguardctrl" to avoid confusion.
>
> > But more importantly, you shouldn't expose either the netlink or the 
> xplatform API distinction to users ever. They should be given one 
> interface, not three, and that one interface should be able to select 
> the right thing in 100% of cases.
>
> I can't say I agree with this under all circumstances.
>
> While I will encourage the use of the unified interface, I read that 
> there could be future work to allow the netlink interface to support 
> something like multicast group notifications.  Would you plan on 
> implementing the same functionality for the userspace interface?
>
> I think there are potential use cases for selecting one or the other, 
> but if this ends up being untrue, I can always push these packages 
> behind a Go "internal/" directory at a later time to prevent outside 
> imports.
>
> - Matt
>
>
> On 07/23/2018 11:12 AM, Jason A. Donenfeld wrote:
>> Hi Matt,
>>
>>> This is super interesting and I actually did not discover it until 
>>> after
>>> I pushed the first few commits to my package.  I could see it making
>>> sense to refactor my current package layout to something like three
>>> packages:
>>>
>>> - wireguardnl: netlink-based communication
>>> - wireguardcfg: text-based userspace configuration protocol 
>>> communication
>>> - wireguard: wrapper for both that detects the module in use and
>>> seamlessly presents a unified interface
>> No, that's really not a good approach at all. First of all, do not
>> take the raw name "wireguard". That's going to cause a lot of
>> confusion. It's really not appropriate.
>>
>> But more importantly, you shouldn't expose either the netlink or the
>> xplatform API distinction to users ever. They should be given one
>> interface, not three, and that one interface should be able to select
>> the right thing in 100% of cases.
>>
>> Jason
>
