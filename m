Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d03ef3fb
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 11:50:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e8a7a9a
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 11:50:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fedfbca8
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 11:48:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 549fed7a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 11:48:58 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id d189-v6so600222oib.6
 for <wireguard@lists.zx2c4.com>; Mon, 23 Jul 2018 04:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <0f15823a-d527-f281-1d4b-735d227e3844@gmail.com>
In-Reply-To: <0f15823a-d527-f281-1d4b-735d227e3844@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Jul 2018 13:59:03 +0200
Message-ID: <CAHmME9pcN_SyZ5_bYU2H=NjoZ67ETaRaYxbRR673zrk_k36_AQ@mail.gmail.com>
Subject: Re: wireguardnl: Go package for interacting with WireGuard via
 generic netlink
To: mdlayher@gmail.com
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Matt,

That's terrific! Thanks for making that. I look forward to seeing
utilities develop around your library.

Something to consider with this is the chunking. Since a device has
many peers and a peer has many allowedips, it's possible that these
might span multiple messages, larger than the maximum netlink packet
size. For that reason, wg(8) will properly split things into several
calls. Here's the set call:

https://git.zx2c4.com/WireGuard/tree/src/tools/ipc.c#n558

It accounts for toobig_allowedips and toobig_peers with some goto
jumps that are sure to make your eyes bleed (read: you can do better
than that :-). Similar in the get call, we coalesce peers that span
multiple messages:

https://git.zx2c4.com/WireGuard/tree/src/tools/ipc.c#n899
https://git.zx2c4.com/WireGuard/tree/src/tools/ipc.c#n877

The other thing that might be sort of neat to try to implement is
falling back to the userspace API:

https://www.wireguard.com/xplatform/

This is a simple unix socket-based approach that mimics the same
semantics as the netlink API, but is portable to different platforms.
This is what wireguard-go and wireguard-rs and friends use for
configuration. wg(8) implements both and provides an identical
frontend for the two. However, I imagine you starting with netlink
will be much more useful and is a good decision, since serious
wireguard users are expected to continue using the serious kernel
implementation.

> While I'm here, I did have one inquiry about "WG_CMD_GET_DEVICE": after
> working with a handful of generic netlink families, I was slightly
> surprised to see that a request paired with "NLM_F_DUMP" doesn't return
> a list of all WireGuard devices from the kernel.

The thing you're dumping from a single device is all the peers. If you
want a list of all interfaces, then the place to NLM_F_DUMP is
RTM_GETLINK, where you can then inspect
ifinfomsg->IFLA_LINKINFO->IFLA_INFO_KIND and make sure that it's
"wireguard". WireGuard itself doesn't [necessarily need to] know all
of the instances of itself, since it's instantiated by the rtnl
subsystem. Check out kernel_get_wireguard_interfaces here:

https://git.zx2c4.com/WireGuard/tree/src/tools/ipc.c#n458

If you're on IRC, come on into #wireguard on Freenode and poke me, and
we can chat about it further; I'm zx2c4.

Talk soon,
Jason
