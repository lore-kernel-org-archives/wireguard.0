Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7F1C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Dec 2021 16:51:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 10f18153;
	Mon, 20 Dec 2021 16:51:16 +0000 (UTC)
Received: from mail.centromere.net (centromere.net [88.80.28.23])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 06c06863
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Dec 2021 00:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=centromere.net;
 s=ecclesia; t=1639786022;
 bh=vRhJkcJNqj889rHjRi58tB12symXj4PtoCFtM2TN3UI=;
 h=From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=fRZm5OfbWB2iZtt7P5mI2MhIBaARo8gaHfgv06FI1JAwdOO47UUq9PestujW20JLW
 5gTopVZajp43gDENrml0o0OPTsAdj1za+Mm0Gs7rNSTlL/GjaTpEIwbrkI3wQrM0oa
 iapK5G19W1bp/el0TYpEGIg7AectzmCR7K+IcA+lyV3frmc67k70Fe/4484Ru53rnx
 olJnQV/4eTASI+ZMB9khMeUhJMOhbQW6vgX5mpWBmnqvOCsqdVoZrCwDyocH0xpnf+
 Z4tLl8gvN1gx0SWRu85THnWHknkFkJEG8inr48u1S5QFTE3+dRJRYU76DWyiZWqolh
 tFW6W9iiu07pWZP+XbbztmtjmdFFRs5XVrxSRvaiiguLF/h/7Q5UHzy54jXrBqtON0
 pYPuHtwSoAZi6ddp8EaudNk08O/rNppYRuPiX0dIOO+SpH1AdRYg+cpiTQP0YXNL3a
 FI6yzA4IUyOlUYlrM+09b4KglVrQ9xjsTqCwEHQK7FgvOn5jbBMGz6JHOiVwRfVFk1
 PvKE1Rkuq755cfET6uQGirLY2WdlfdvC8rgjXr0kg5U2cHrwL7U8jSWqTo0pCMdafm
 Z33GR3/L3ewNquS+b4RUO5E5fYDAaLmyN6CbxhtiDKVTajhIyo3kNlt8stRcIULOUl
 0Al+NYkWgjrklldEmQ3wKbjU=
Date: Fri, 17 Dec 2021 19:06:59 -0500
From: Alex <wireguard@centromere.net>
To: wireguard@lists.zx2c4.com
Subject: eBPF + IPv6 + WireGuard
Message-ID: <20211217190659.251f006a@poseidon.quill.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 20 Dec 2021 16:51:11 +0000
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

Hi all,

I am championing WireGuard at work, and I have been granted permission
to use it for establishing remote access to a private IPv6 VLAN for all
employees. I have experimented with different approaches and ran in to
an issue.

With the help of a machine dedicated fully to the job of remote access
(Ubuntu 20.04 / Linux 5.4), I've managed to establish end-to-end
connectivity between my work laptop and the servers. The VPN gateway
has a wg0 interface for employees and a "private0" interface for
private VLAN connectivity. The goal is to link the two.

I noticed an odd quirk: It only works when
"net.ipv6.conf.all.forwarding" is 1. If this value is 0,
"net.ipv6.conf.[wg0 | private0].forwarding" has no effect. In other
words, I cannot seem to enable forwarding for *only* the interfaces
that need it. It only works when forwarding is enabled for *all*
interfaces. This is a problem because when the "all" value is set to 1,
the machine will start to behave as a router on VLANs for which it is
most definitely not a router.

For the servers, I am using the officially defined[0] subnet-router
anycast address as the default IPv6 gateway, and it works well.
However, when I flipped the switch on "net.ipv6.conf.all.forwarding",
the VPN gateway started using NDP to announce that it was a router
across *all* VLANs! Specifically, it was claiming ownership over our
global subnet anycast address 2001:aaaa:bbbb:cccc::. This is neither
true nor desired. The VPN gateway started to receive outbound non-VPN
Internet traffic which broke Internet connectivity for all servers. 

This leads me to my first question: Why does
"net.ipv6.conf.wg0.forwarding" have no effect?

In researching a solution, I decided to give eBPF a try. I attached an
XDP program to "private0" (a layer 2 device, naturally) and
successfully redirected packets to "wg0" (a layer 3 device) with
bpf_redirect[1]. If the packets are unmodified, WireGuard will happily
pass them to the remote hosts. This is an issue because the remote
hosts are expecting to receive IP(v6) packets, not Ethernet frames. If
I use bpf_xdp_adjust_head[1] to strip off the Ethernet frame, WireGuard
will drop the packet[2] before it can be sent to the remote host.

My theory is that bpf_xdp_adjust_head is modifying the data pointer
only and not any underlying structures that may be associated with the
packet (sk_buff perhaps).

This leads me to my second question: Why can't I redirect traffic
received on an L2 interface to an L3 interface, *even after stripping
off the Ethernet frame?*

Finally, during this whole process I was using WireShark to inspect
traffic received by the remote host (i.e. my work laptop). With the
help of the extract-handshakes.sh script, I was able to decrypt traffic.
I did discover a bug though. I believe "index_hashtable_insert" should
actually be "wg_index_hashtable_insert"[3].

Does anyone have any insights as to what a proper solution would look
like? Is there a way to achieve my goal without introducing eBPF? Is
XDP completely unsuited for this particular purpose? Do I actually need
to operate on the sk_buff level, as opposed to the xdp_buff level?

Thank you all for your time.

 - Alex

[0] https://datatracker.ietf.org/doc/rfc1884/ (Section 2.5.1)
[1] https://www.man7.org/linux/man-pages/man7/bpf-helpers.7.html
[2] https://git.zx2c4.com/wireguard-linux/tree/drivers/net/wireguard/device.c#n131
[3] https://git.zx2c4.com/wireguard-tools/tree/contrib/extract-handshakes/extract-handshakes.sh#n46
