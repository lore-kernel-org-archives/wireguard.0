Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD44C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Jan 2022 18:24:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b427d7e7;
	Tue, 4 Jan 2022 18:20:37 +0000 (UTC)
Received: from mail.pineview.net (mail.pineview.net [203.33.246.11])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8a49d6a0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Dec 2021 21:49:40 +0000 (UTC)
Received: from smtpclient.apple (unknown [1.124.19.241])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.pineview.net (Postfix) with ESMTPSA id AC1F78002A;
 Tue, 21 Dec 2021 08:19:36 +1030 (ACDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike O'Connor <mike@jazmin.com.au>
Mime-Version: 1.0 (1.0)
Subject: Re: eBPF + IPv6 + WireGuard
Date: Tue, 21 Dec 2021 08:19:25 +1030
Message-Id: <35F53B88-F1A7-452D-BC86-04A49677B372@jazmin.com.au>
References: <20211217190659.251f006a@poseidon.quill.lan>
Cc: wireguard@lists.zx2c4.com
In-Reply-To: <20211217190659.251f006a@poseidon.quill.lan>
To: Alex <wireguard@centromere.net>
X-Mailer: iPhone Mail (19B74)
X-Mailman-Approved-At: Tue, 04 Jan 2022 18:20:36 +0000
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

Hi

Wireguard is a layer 3 system. As a result you must route traffic not bridge=
, this also means that ip forwarding must be enabled.

You will need to firewall the traffic or setup a separate routing table.=20

Other routers in your network will need to know about the IP addresses alloc=
ated to Wireguard and have a route for this range.

Mike

> On 21 Dec 2021, at 3:21 am, Alex <wireguard@centromere.net> wrote:
>=20
> =EF=BB=BFHi all,
>=20
> I am championing WireGuard at work, and I have been granted permission
> to use it for establishing remote access to a private IPv6 VLAN for all
> employees. I have experimented with different approaches and ran in to
> an issue.
>=20
> With the help of a machine dedicated fully to the job of remote access
> (Ubuntu 20.04 / Linux 5.4), I've managed to establish end-to-end
> connectivity between my work laptop and the servers. The VPN gateway
> has a wg0 interface for employees and a "private0" interface for
> private VLAN connectivity. The goal is to link the two.
>=20
> I noticed an odd quirk: It only works when
> "net.ipv6.conf.all.forwarding" is 1. If this value is 0,
> "net.ipv6.conf.[wg0 | private0].forwarding" has no effect. In other
> words, I cannot seem to enable forwarding for *only* the interfaces
> that need it. It only works when forwarding is enabled for *all*
> interfaces. This is a problem because when the "all" value is set to 1,
> the machine will start to behave as a router on VLANs for which it is
> most definitely not a router.
>=20
> For the servers, I am using the officially defined[0] subnet-router
> anycast address as the default IPv6 gateway, and it works well.
> However, when I flipped the switch on "net.ipv6.conf.all.forwarding",
> the VPN gateway started using NDP to announce that it was a router
> across *all* VLANs! Specifically, it was claiming ownership over our
> global subnet anycast address 2001:aaaa:bbbb:cccc::. This is neither
> true nor desired. The VPN gateway started to receive outbound non-VPN
> Internet traffic which broke Internet connectivity for all servers.=20
>=20
> This leads me to my first question: Why does
> "net.ipv6.conf.wg0.forwarding" have no effect?
>=20
> In researching a solution, I decided to give eBPF a try. I attached an
> XDP program to "private0" (a layer 2 device, naturally) and
> successfully redirected packets to "wg0" (a layer 3 device) with
> bpf_redirect[1]. If the packets are unmodified, WireGuard will happily
> pass them to the remote hosts. This is an issue because the remote
> hosts are expecting to receive IP(v6) packets, not Ethernet frames. If
> I use bpf_xdp_adjust_head[1] to strip off the Ethernet frame, WireGuard
> will drop the packet[2] before it can be sent to the remote host.
>=20
> My theory is that bpf_xdp_adjust_head is modifying the data pointer
> only and not any underlying structures that may be associated with the
> packet (sk_buff perhaps).
>=20
> This leads me to my second question: Why can't I redirect traffic
> received on an L2 interface to an L3 interface, *even after stripping
> off the Ethernet frame?*
>=20
> Finally, during this whole process I was using WireShark to inspect
> traffic received by the remote host (i.e. my work laptop). With the
> help of the extract-handshakes.sh script, I was able to decrypt traffic.
> I did discover a bug though. I believe "index_hashtable_insert" should
> actually be "wg_index_hashtable_insert"[3].
>=20
> Does anyone have any insights as to what a proper solution would look
> like? Is there a way to achieve my goal without introducing eBPF? Is
> XDP completely unsuited for this particular purpose? Do I actually need
> to operate on the sk_buff level, as opposed to the xdp_buff level?
>=20
> Thank you all for your time.
>=20
> - Alex
>=20
> [0] https://datatracker.ietf.org/doc/rfc1884/ (Section 2.5.1)
> [1] https://www.man7.org/linux/man-pages/man7/bpf-helpers.7.html
> [2] https://git.zx2c4.com/wireguard-linux/tree/drivers/net/wireguard/devic=
e.c#n131
> [3] https://git.zx2c4.com/wireguard-tools/tree/contrib/extract-handshakes/=
extract-handshakes.sh#n46

