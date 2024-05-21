Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3F8D4921D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 14:35:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dd12e42;
	Mon, 18 Nov 2024 12:45:17 +0000 (UTC)
Received: from mail-a09.ithnet.com (mail-a09.ithnet.com [217.64.83.104])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b5bab717
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2024 12:55:44 +0000 (UTC)
Received: (qmail 19417 invoked by uid 0); 21 May 2024 12:55:44 -0000
Received: from skraw.ml@ithnet.com by mail-a09 
 (Processed in 2.211485 secs); 21 May 2024 12:55:44 -0000
X-Virus-Status: No
X-ExecutableContent: No
Received: from dialin014-sr.ithnet.com (HELO ithnet.com) (217.64.64.14)
 by mail-a09.ithnet.com with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted);
 21 May 2024 12:55:42 -0000
X-Sender-Authentication: SMTP AUTH verified <skraw.ml@ithnet.com>
Date: Tue, 21 May 2024 14:55:41 +0200
From: Stephan von Krawczynski <skraw.ml@ithnet.com>
To: Janne Johansson <icepic.dz@gmail.com>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>, Daniel =?UTF-8?B?R3I=?=
 =?UTF-8?B?w7ZiZXI=?= <dxld@darkboxed.org>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Wireguard address binding - how to fix?
Message-ID: <20240521145541.7f13c632@ithnet.com>
In-Reply-To: <CAA6-MF-npREucdWneVw+DWMQi3bG+3zp98VNctErfLMuRkvY9A@mail.gmail.com>
References: <87le4cfz0u.fsf@ungleich.ch>
 <20240514113648.neaj6kfazx4fi7af@House.clients.dxld.at>
 <87msojhbq0.fsf@ungleich.ch>
 <CAA6-MF-npREucdWneVw+DWMQi3bG+3zp98VNctErfLMuRkvY9A@mail.gmail.com>
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

Hello Janne,

I know that most people dealing with wg do not really understand how a box
works that has more than one IP and one interface.
A simple question: an interface has 100 IP addresses, how do you choose in wg
on which IP your tunnel end is?
Can you please (all wg infected) understand that about every box that has a
redundancy setup has several IPs per interface and you want wg connect to the
_right_ one, because this is the one taken over in case of failover.
The question is not about interface for routing, the question is about
LISTEN_ADDR.

I always thought it cannot get worse, but then came wg...
--
Regards,
Stephan




On Tue, 21 May 2024 13:11:00 +0200
Janne Johansson <icepic.dz@gmail.com> wrote:

> Den tis 21 maj 2024 kl 09:50 skrev Nico Schottelius
> <nico.schottelius@ungleich.ch>:
> > Hello Jason,
> > do you mind applying the patch from Daniel? Or is there anything wrong
> > with it?
> >
> > Daniel: amazing work, I was not aware that you have already put in the
> > hard work, thank you so very much!
> >
> > The world (*) is suffering because of the lack of IP address binding in
> > wireguard.
> >
> > (*) With world I refer to every engineer that needs to run wireguard in
> > non-trivial situations with multiple IP addresses on one host, which is
> > extremely common for anything that routes.  
> 
> Well, the main reason for wg to NOT do anything special is because
> routing generally is done by looking at the destination ip and then
> using the routing rules which the kernel uses to tell the packet which
> interface is considered "best" in order to reach that ip, which is why
> icmp and udp acts like this. I am certain that many engineers
> hope/think it would be more logical (or fit their designs better) if
> it responded on the same interface as the packet came in or whatever
> but the reason for wg to act like it does is because this is how
> connection-less packets have been acting since ages. The point that
> many engineers design wg endpoints "the wrong way" is probably a fault
> of education when it comes to how TCP/IP stacks did and do manage IP
> output.
> 
> I have zero power to decide anything regarding how wg chooses to
> implement a workaround for IP being designed the way it is designed,
> but I can at least see why it hasn't immediately been accepted even if
> it would make some engineers suffer(*) less, at least in the short
> term.
> 
> There are a lot of workarounds for the times when you did design the
> udp service as if it would act like tcp does in multihomed situations,
> which includes firewall tricks, or VRF/namespace/routing-domains to
> make sure the inner and outer address-pairs for the wg tunnel see
> different views of the network to handle this without changing how wg
> sends packets.
> 
> -- 
> May the most significant bit of your life be positive.


