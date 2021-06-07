Return-Path: <SRS0=3dEh=LB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCD8C47082
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 18:50:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 075D9610A1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  7 Jun 2021 18:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 075D9610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e81039a;
	Mon, 7 Jun 2021 18:50:40 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4e211196
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jun 2021 18:50:36 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id CC98F6B1;
 Mon,  7 Jun 2021 18:50:34 +0000 (UTC)
Date: Mon, 7 Jun 2021 23:50:34 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, zrm
 <zrm@trustiosity.com>, StarBrilliant <coder@poorlab.com>, Baptiste Jonglez
 <baptiste@bitsofnetworks.org>, Joe Holden <jwh@zorins.us>, Nico Schottelius
 <nico.schottelius@ungleich.ch>, Vasili Pupkin <diggest@gmail.com>,
 peter@fiberdirekt.se
Subject: Re: potentially disallowing IP fragmentation on wg packets, and
 handling routing loops better
Message-ID: <20210607235034.024e6c6b@natsu>
In-Reply-To: <20210607164617.6bf015d1@natsu>
References: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
 <CAHmME9rj9M=5G6oh+ZKQjekxWFp-5sF4MWux2==2V4X2UtYkag@mail.gmail.com>
 <20210607161313.764eb5d6@natsu> <YL4CjhvPcQ+/qtG1@zx2c4.com>
 <20210607164617.6bf015d1@natsu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 7 Jun 2021 16:46:17 +0500
Roman Mamedov <rm@romanrm.net> wrote:

> On Mon, 7 Jun 2021 13:27:10 +0200
> "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> 
> > Can you walk me through your use case a bit more, so I can wrap my mind
> > around the requirements?
> > 
> > ingress --plain--> wireguard --wireguard[plain]--> vxlan --vxlan[wireguard[plain]]--> egress
> 
> Not sure I understand your scheme correctly. In any case, the path of a
> packet would be...
> 
> On peer 1:
> 
> * plain Ethernet -> wrapped into VXLAN -> encrypted into WireGuard
> 
> On peer 2:
> 
> * decrypted from WireGuard -> unwrapped from VXLAN -> plain Ethernet
> 
> > So my question is, why can't you set wireguard's MTU to 80 bytes less
> > than vxlan's MTU? What's preventing that or making it infeasible?
> 
> To transparently bridge two Ethernet LANs, a VXLAN interface needs to join an
> L2 bridge. All interfaces that are members of a bridge must have the same MTU.
> 
> As such, br0 members on both sides:
>   eth0 (MTU 1500)
>   vx0 (MTU 1500)
> 
> VXLAN transports full L2 frames encapsulating them into UDP. To fit the
> full 1500-byte packet and accounting for VXLAN and related IP overheads,
> the resulting packet size is 1574 bytes.
> 
> So this same host that just generated the 1574-byte encapsulated VXLAN packet
> with something it received via its eth0 port, now needs to send it further to
> its WG peer(s). For this to succeed, the in-tunnel WG MTU needs to be 1574 or
> more, not 1412 or 1420, as VXLAN itself can't be fragmented[1]; or even if it
> could, that would mean a much worse overhead ratio than currently.
> 
> [1] https://datatracker.ietf.org/doc/html/rfc7348#section-4.3

In case you are not convinced by this case, would you consider at least
allowing fragmentation when WG's in-tunnel MTU is set to >=1500? Because this
is the user effectively saying "yes I know this is not gonna fit in one
packet, I want to rely on WG packets being fragmented", but without the need
for extra knobs.

-- 
With respect,
Roman
