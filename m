Return-Path: mdlayher@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03871b3e
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 13:34:50 +0000 (UTC)
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e063f64
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 13:34:50 +0000 (UTC)
Received: by mail-qk0-x231.google.com with SMTP id 26-v6so402556qks.9
 for <wireguard@lists.zx2c4.com>; Mon, 23 Jul 2018 06:43:52 -0700 (PDT)
Return-Path: <mdlayher@gmail.com>
Subject: Re: wireguardnl: Go package for interacting with WireGuard via
 generic netlink
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <0f15823a-d527-f281-1d4b-735d227e3844@gmail.com>
 <CAHmME9pcN_SyZ5_bYU2H=NjoZ67ETaRaYxbRR673zrk_k36_AQ@mail.gmail.com>
From: Matt Layher <mdlayher@gmail.com>
Message-ID: <3c167a80-6459-7c0e-8935-a98e226fa023@gmail.com>
Date: Mon, 23 Jul 2018 09:43:48 -0400
MIME-Version: 1.0
In-Reply-To: <CAHmME9pcN_SyZ5_bYU2H=NjoZ67ETaRaYxbRR673zrk_k36_AQ@mail.gmail.com>
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

Hey Jason,

Thanks very much for WireGuard and for the information.

 > Something to consider with this is the chunking.

Certainly! This was a first pass but these changes should be reasonable 
to port to Go as well.  I suppose I'll have to introduce some more 
complicated test devices to this logic.  I've filed a couple issues to 
track this and hope that I can at least implement the chunking get logic 
this week.

 > The other thing that might be sort of neat to try to implement is
falling back to the userspace API:

This is super interesting and I actually did not discover it until after 
I pushed the first few commits to my package.  I could see it making 
sense to refactor my current package layout to something like three 
packages:

- wireguardnl: netlink-based communication
- wireguardcfg: text-based userspace configuration protocol communication
- wireguard: wrapper for both that detects the module in use and 
seamlessly presents a unified interface

 > The thing you're dumping from a single device is all the peers. If 
you want a list of all interfaces, then the place to NLM_F_DUMP is 
RTM_GETLINK, where you can then inspect 
ifinfomsg->IFLA_LINKINFO->IFLA_INFO_KIND and make sure that it's 
"wireguard".

Ahhh, that makes more sense to me.  Perhaps I glossed over the 
uapi/wireguard.h documentation.  For the time being, I'm doing a call to 
Go's "net.Interfaces" which is a bit easier (though less efficient) than 
doing rtnetlink calls directly.  Perhaps this is something I can iterate 
on in the future as well.

 > If you're on IRC, come on into #wireguard on Freenode and poke me, and
we can chat about it further; I'm zx2c4.

Certainly!  I don't have any further inquiries at this time, but I'll 
join up!

Thank you again for WireGuard, and thank you very much for your time, 
feedback, and answers to my questions.

- Matt Layher


On 07/23/2018 07:59 AM, Jason A. Donenfeld wrote:
> Hey Matt,
>
> That's terrific! Thanks for making that. I look forward to seeing
> utilities develop around your library.
>
> Something to consider with this is the chunking. Since a device has
> many peers and a peer has many allowedips, it's possible that these
> might span multiple messages, larger than the maximum netlink packet
> size. For that reason, wg(8) will properly split things into several
> calls. Here's the set call:
>
> https://git.zx2c4.com/WireGuard/tree/src/tools/ipc.c#n558
>
> It accounts for toobig_allowedips and toobig_peers with some goto
> jumps that are sure to make your eyes bleed (read: you can do better
> than that :-). Similar in the get call, we coalesce peers that span
> multiple messages:
>
> https://git.zx2c4.com/WireGuard/tree/src/tools/ipc.c#n899
> https://git.zx2c4.com/WireGuard/tree/src/tools/ipc.c#n877
>
> The other thing that might be sort of neat to try to implement is
> falling back to the userspace API:
>
> https://www.wireguard.com/xplatform/
>
> This is a simple unix socket-based approach that mimics the same
> semantics as the netlink API, but is portable to different platforms.
> This is what wireguard-go and wireguard-rs and friends use for
> configuration. wg(8) implements both and provides an identical
> frontend for the two. However, I imagine you starting with netlink
> will be much more useful and is a good decision, since serious
> wireguard users are expected to continue using the serious kernel
> implementation.
>
>> While I'm here, I did have one inquiry about "WG_CMD_GET_DEVICE": after
>> working with a handful of generic netlink families, I was slightly
>> surprised to see that a request paired with "NLM_F_DUMP" doesn't return
>> a list of all WireGuard devices from the kernel.
> The thing you're dumping from a single device is all the peers. If you
> want a list of all interfaces, then the place to NLM_F_DUMP is
> RTM_GETLINK, where you can then inspect
> ifinfomsg->IFLA_LINKINFO->IFLA_INFO_KIND and make sure that it's
> "wireguard". WireGuard itself doesn't [necessarily need to] know all
> of the instances of itself, since it's instantiated by the rtnl
> subsystem. Check out kernel_get_wireguard_interfaces here:
>
> https://git.zx2c4.com/WireGuard/tree/src/tools/ipc.c#n458
>
> If you're on IRC, come on into #wireguard on Freenode and poke me, and
> we can chat about it further; I'm zx2c4.
>
> Talk soon,
> Jason
