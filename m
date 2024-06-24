Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7839ED4922D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 14:51:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23e1c102;
	Mon, 18 Nov 2024 12:45:21 +0000 (UTC)
Received: from mail-a10.ithnet.com (mail-a10.ithnet.com [217.64.83.105])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 66fa074f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Jun 2024 10:02:06 +0000 (UTC)
Received: (qmail 24927 invoked by uid 0); 24 Jun 2024 10:02:05 -0000
Received: from skraw.ml@ithnet.com by mail-a10 
 (Processed in 2.097347 secs); 24 Jun 2024 10:02:05 -0000
X-Virus-Status: No
X-ExecutableContent: No
Received: from dialin014-sr.ithnet.com (HELO ithnet.com) (217.64.64.14)
 by mail-a10.ithnet.com with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted);
 24 Jun 2024 10:02:03 -0000
X-Sender-Authentication: SMTP AUTH verified <skraw.ml@ithnet.com>
Date: Mon, 24 Jun 2024 12:02:02 +0200
From: Stephan von Krawczynski <skraw.ml@ithnet.com>
To: Adrian Larsen <alarsen@maidenheadbridge.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Wireguard address binding - how to fix?
Message-ID: <20240624120202.6fb011be@ithnet.com>
In-Reply-To: <43aac110-8699-41b3-bad8-7a38bf984b45@maidenheadbridge.com>
References: <740ee793-0ed2-4cf6-ba4a-07268b46b761@maidenheadbridge.com>
 <43aac110-8699-41b3-bad8-7a38bf984b45@maidenheadbridge.com>
Organization: ith Kommunikationstechnik GmbH
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:44:56 +0000
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

Thank you Adrian,

but remember, we are all trained professionals here mostly "skilled in the
art". Which means we all know _hacks_ to do just about everything.
But honestly, do you favor a security-based project where you have to hack
around its deficiencies to make it work how it should?

Btw, some of us aren't even allowed to post in the ML. Guess why ...
--
Regards,
Stephan


On Mon, 24 Jun 2024 10:36:06 +0100 Adrian Larsen
<alarsen@maidenheadbridge.com> wrote:

> Hi Friends,
> 
> You can achieve address binding on a Linux box with a mix of marking, ip 
> rules, ip route and Source NAT.
> 
> 1) On WG interface, add "FwMark = 0x34" (the value 0x34 is an example, 
> you can put any value here)
> 
> 2) Create IP Rule "from all fwmark 0x34 lookup rt_wg0_out" -> this will 
> force the outgoing packet to use the route table "rt_wg0_out"
> 
> 3) On the route table "rt_wg0_out" create the default or specific route 
> to force the packet market with 0x34 to leave using the interface where 
> your desire "IP address" resides.
> 
> 4) Create a POSTROUTING -> SNAT forcing mark 0x34 via the desired "IP 
> address". This will bind your "IP address".
> 
> Done! The packet with mark 0x34 will be routed via the correct interface 
> using the source IP you want.
> 
> I hope this helps.
> 
> Best regards,
> 
> Adrian Larsen
> Maidenhead Bridge
> Cloud Security Connectors for SSE vendors.
> m: +44 7487640352
> e:alarsen@maidenheadbridge.com
> 
> On 09/06/2024 16:39, Nico Schottelius wrote:
> > Jason,
> >
> > may I shortly ask what your opinion is on the patch and whether there is
> > a way forward to make wireguard usable on systems with multiple IP
> > addresses?
> >
> > Best regards,
> >
> > Nico
> >
> > Nico Schottelius<nico.schottelius@ungleich.ch>  writes:
> >  
> >> d tbsky<tbskyd@gmail.com>  writes:  
> >>> I  remembered how exciting when I tested wireguard at 2017. until I
> >>> asked muti-home question in the list.
> >>> wiregurad is beautiful,elegant,fast but not easy to get along with.
> >>> openvpn is not so amazing but it can get the job done.  
> >> Nice summary, hits the nail quite well.
> >>
> >> Jason, do you mind having a look at the submitted patches for IP address
> >> binding and comment on them? Or alternatively can you give green light
> >> for generally moving forward so that a direct inclusion in the Linux
> >> kernel would be accepted?
> >>
> >> Best regards,
> >>
> >> Nico
> >>  
> 

