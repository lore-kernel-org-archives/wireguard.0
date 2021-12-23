Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F626C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Dec 2021 15:25:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b993c241;
	Thu, 23 Dec 2021 15:25:24 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8f6eabaa
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Dec 2021 15:25:22 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1640273120; bh=X9iO8ulA0OFQXRW1WsRCcbYvXkeZTQUzCALFVpMXxZA=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=sqCirVs5U3wvOapNwLAXLuhNTaWGyvV2VBRGl3fuCa/VKxfyIILoOUo8zR9htSNLi
 UuykA+Hz9NSNmRpF99qQhBBHsHcP7ns+dzpXf99tSiPk+Fs4FsTFtMRKKCNzpIFe0a
 VEF3VaKCjA8/JyUkd+MMKZMMPE8enCbe50Avwe0Sliac3rAVo9Uo74WlHTAfvnrTLf
 /aWEfGIhX4oSHnjThSaG+7etu4UeM8CNDwVE2bCD8IUaZP4x8DFbO87jYGMT8wT/4C
 ALdFSy6N5G1KIZwJ8BdKAH4p04agZniZd4uWjQKKmG/dfBHD0X46oETWcs8ubANlBS
 PIsV5GkCC6BAA==
To: Alex <wireguard@centromere.net>, wireguard@lists.zx2c4.com
Subject: Re: eBPF + IPv6 + WireGuard
In-Reply-To: <20211217190659.251f006a@poseidon.quill.lan>
References: <20211217190659.251f006a@poseidon.quill.lan>
Date: Thu, 23 Dec 2021 16:25:20 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <877dbvbaxr.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
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

Alex <wireguard@centromere.net> writes:

> Hi all,
>
> I am championing WireGuard at work, and I have been granted permission
> to use it for establishing remote access to a private IPv6 VLAN for all
> employees. I have experimented with different approaches and ran in to
> an issue.
>
> With the help of a machine dedicated fully to the job of remote access
> (Ubuntu 20.04 / Linux 5.4), I've managed to establish end-to-end
> connectivity between my work laptop and the servers. The VPN gateway
> has a wg0 interface for employees and a "private0" interface for
> private VLAN connectivity. The goal is to link the two.
>
> I noticed an odd quirk: It only works when
> "net.ipv6.conf.all.forwarding" is 1. If this value is 0,
> "net.ipv6.conf.[wg0 | private0].forwarding" has no effect. In other
> words, I cannot seem to enable forwarding for *only* the interfaces
> that need it. It only works when forwarding is enabled for *all*
> interfaces. This is a problem because when the "all" value is set to 1,
> the machine will start to behave as a router on VLANs for which it is
> most definitely not a router.
>
> For the servers, I am using the officially defined[0] subnet-router
> anycast address as the default IPv6 gateway, and it works well.
> However, when I flipped the switch on "net.ipv6.conf.all.forwarding",
> the VPN gateway started using NDP to announce that it was a router
> across *all* VLANs! Specifically, it was claiming ownership over our
> global subnet anycast address 2001:aaaa:bbbb:cccc::. This is neither
> true nor desired. The VPN gateway started to receive outbound non-VPN
> Internet traffic which broke Internet connectivity for all servers. 
>
> This leads me to my first question: Why does
> "net.ipv6.conf.wg0.forwarding" have no effect?

That's how forwarding works in the kernel for IPv6:

https://elixir.bootlin.com/linux/latest/source/Documentation/networking/ip-sysctl.rst#L1981

I.e., there *is* no per-interface forwarding setting, you'll need to
setup netfilter rules or some other mechanism to control which
interfaces packets will be forwarded to/from. The per-interface
"forwarding" attribute only controls things like whether the kernel will
accept router advertisements on that interface. Yes, this is a bit
confusing (and also different from IPv4).

The isRouter flag in neighbour advertisements should be controllable via
the per-interface 'forwarding' setting; the default changes when you
enable the global setting, but I think it should be possible to re-set
it? See:

https://elixir.bootlin.com/linux/latest/source/Documentation/networking/ip-sysctl.rst#L2148

> In researching a solution, I decided to give eBPF a try. I attached an
> XDP program to "private0" (a layer 2 device, naturally) and
> successfully redirected packets to "wg0" (a layer 3 device) with
> bpf_redirect[1]. If the packets are unmodified, WireGuard will happily
> pass them to the remote hosts. This is an issue because the remote
> hosts are expecting to receive IP(v6) packets, not Ethernet frames. If
> I use bpf_xdp_adjust_head[1] to strip off the Ethernet frame, WireGuard
> will drop the packet[2] before it can be sent to the remote host.
>
> My theory is that bpf_xdp_adjust_head is modifying the data pointer
> only and not any underlying structures that may be associated with the
> packet (sk_buff perhaps).
>
> This leads me to my second question: Why can't I redirect traffic
> received on an L2 interface to an L3 interface, *even after stripping
> off the Ethernet frame?*

I assume you were using generic XDP here? Anyway, XDP is layer2-only by
definition, so there's not really any way to achieve what you're trying
to do with XDP.

> Finally, during this whole process I was using WireShark to inspect
> traffic received by the remote host (i.e. my work laptop). With the
> help of the extract-handshakes.sh script, I was able to decrypt traffic.
> I did discover a bug though. I believe "index_hashtable_insert" should
> actually be "wg_index_hashtable_insert"[3].
>
> Does anyone have any insights as to what a proper solution would look
> like? Is there a way to achieve my goal without introducing eBPF? Is
> XDP completely unsuited for this particular purpose? Do I actually need
> to operate on the sk_buff level, as opposed to the xdp_buff level?

You could maybe do something with TC-BPF, but why can't you just enable
net.ipv6.conf.all.forwarding and just use netfilter to control which
interfaces packets will be forwarded across? That seems like it would be
the simplest solution...

-Toke
