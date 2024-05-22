Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC261D4922A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 14:35:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b24973a4;
	Mon, 18 Nov 2024 12:45:18 +0000 (UTC)
Received: from mail-a10.ithnet.com (mail-a10.ithnet.com [217.64.83.105])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 30c7b3f5
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 May 2024 08:53:22 +0000 (UTC)
Received: (qmail 6323 invoked by uid 0); 22 May 2024 08:53:22 -0000
Received: from skraw@ithnet.com by mail-a10 
 (Processed in 2.487937 secs); 22 May 2024 08:53:22 -0000
X-Virus-Status: No
X-ExecutableContent: No
Received: from dialin014-sr.ithnet.com (HELO ithnet.com) (217.64.64.14)
 by mail-a10.ithnet.com with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted);
 22 May 2024 08:53:19 -0000
X-Sender-Authentication: SMTP AUTH verified <skraw@ithnet.com>
Date: Wed, 22 May 2024 10:53:19 +0200
From: Stephan von Krawczynski <skraw@ithnet.com>
To: Sebastian Hyrvall <sh@keff.org>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>, Janne Johansson
 <icepic.dz@gmail.com>, Daniel =?UTF-8?B?R3LDtmJlcg==?=
 <dxld@darkboxed.org>, WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard address binding - how to fix?
Message-ID: <20240522105319.61f7c0e6@ithnet.com>
In-Reply-To: <f292656a-52c8-4258-8b6a-45064a702a8a@keff.org>
References: <87le4cfz0u.fsf@ungleich.ch>
 <20240514113648.neaj6kfazx4fi7af@House.clients.dxld.at>
 <87msojhbq0.fsf@ungleich.ch>
 <CAA6-MF-npREucdWneVw+DWMQi3bG+3zp98VNctErfLMuRkvY9A@mail.gmail.com>
 <87a5kjgw3j.fsf@ungleich.ch>
 <f292656a-52c8-4258-8b6a-45064a702a8a@keff.org>
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

Hello Sebastian,

great to hear that you came to the same conclusion regarding the security of
wg. You have never read me on the list as I get continuously censored away
from it.
Obviously because my first post 3 years ago was exactly this:

#########################

From: Stephan von Krawczynski <skraw.ml@ithnet.com>
To: wireguard@lists.zx2c4.com
Subject: How to set source ip of wireguard packets?
Date: Tue, 20 Oct 2020 13:27:46 +0200
Organization: ith Kommunikationstechnik GmbH
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)

Hello all,

configuring wireguard for the first time I ran into a question I could not
find any answer in the docs, so:
Lets assume both client and server have several IPs on their outgoing
interface. How do you setup wireguard so that a specific IP is used as source
ip in the outgoing encrypted packets?
This is important in failover-setups where a VIP moves between some physical
hosts and we don't want to listen on the physical IPs but only the VIP ...

I would have expected this to be specified in "ListenPort" optionally like 
"ListenPort = IP:PORT", but that does not work currently.

--
Regards,
Stephan

###############################

Ever since I was censored away. I came to the same conclusion, which is that
wg is in fact only an orchestrated way to get vpn over the world completely
open to mitm attacks, just like your conclusion.
Even better the very same people always talk about the insecurity of PPTP,
completely dumping the fact that every PPP since the very beginning has a
(script) interface where you can check the connecting _IPs_ and users.
We don't talk about the encryption security here, because I bet that we all
cannot analyse this point in wg, away from the fact the special implementation
should be deeply reviewed, too.
Therefore we judge the current wg as high security risk which should not be
used in professional environment. A VPN where you cannot even verify the
connecting IP? Gimme a break ...
Being one of the last "forkers" of the cipe project where all wg problems were
solved decades ago we do really wonder why this project gets so much code
support being so badly designed from the start. That is why we think it is
orchestrated by interested parties.
While we're at it, the very same seems to be going on in the certificate
business where it is prevented for decades by the browser people to use
self-signed certificates which could be verified dead easy by a pointer in the
corresponding domains' dns-record.
We are not amused.
--
Regards
Stephan



On Tue, 21 May 2024 21:11:31 +0700
Sebastian Hyrvall <sh@keff.org> wrote:

> The reason wireguard does it like this I think is because when designing 
> it there was no thought given to any client,server scenario.
> 
> Both sides are behaving like clients that can jump between IPs at any 
> time. This is a flawed concept given that in 90% of scenarios there
> is at least one side acting as a server on a static ip. Unless the 
> server side is a home user on dynamic ip and rebinding could be difficult.
> 
> I've also given a bit of thought to the security aspect of this for VPN 
> providers. Since a remote party can override the configured "Endpoint" 
> if there was a scenario where vpn provider privkeys are
> compromised. The attacker can then, by knowing the connecting clients 
> ip, get him to shift over the tunnel to their server and perform a long 
> term, most likely undetected, mitm attack.
> 
> Anyway. I've waited for this binding option for years. It's insane to me 
> it gets ignored.
> 
> One product is for example Mikrotik hardware. They don't want to 
> implement third party patches so they are waiting for this bind-patch to 
> be included in the kernel. Until then we're forced to use OpenVPN in our 
> setups.
> 
> 
> On 2024-05-21 19:58, Nico Schottelius wrote:
> > Hello Janne,
> >
> > Janne Johansson <icepic.dz@gmail.com> writes:
> >  
> >> Den tis 21 maj 2024 kl 09:50 skrev Nico Schottelius
> >> <nico.schottelius@ungleich.ch>:  
> >>> Hello Jason,
> >>> do you mind applying the patch from Daniel? Or is there anything wrong
> >>> with it?
> >>>
> >>> Daniel: amazing work, I was not aware that you have already put in the
> >>> hard work, thank you so very much!
> >>>
> >>> The world (*) is suffering because of the lack of IP address binding in
> >>> wireguard.
> >>>
> >>> (*) With world I refer to every engineer that needs to run wireguard in
> >>> non-trivial situations with multiple IP addresses on one host, which is
> >>> extremely common for anything that routes.  
> >> Well, the main reason for wg to NOT do anything special is because
> >> routing generally is done by looking at the destination ip and then  
> > No. Generally speaking that is incorrect.
> > It is not special to reply with the same IP address.
> >
> > Generally speaking, when you have systems with multiple IP addresses you
> > want to be able to steer the binding to an IP address. And even if you
> > don't do that, you reply with the same IP address you have been
> > contacted with. Wireguard does neither of it at the moment.  I have
> > written this already many times on this list, but the reason is very
> > easy:
> >
> > - A connection is initiated from device A, connecting to router B on IP
> > adddress a.b.c.d
> > - The packet is correctly received by router B
> > - The router replies incorrectly with address f.d.g.h
> > - The reply packet is correctly blocked at the firewall of device A,
> > because it comes from a random, unknown IP address
> >
> > This is the basic 101 of networking is to reply with the same address
> > you have been contacted with, there is no discussion necessary. The
> > whole world does it, even A-patch-y httpd (*) supports it. Since 1980 or
> > so.
> >
> > Routing choices are independent of that, replying with the same IP
> > address is a standard behaviour.
> >
> > Nico
> >
> > (*) As does ssh, nginx, ipsec protocols, openvpn, any rails application,
> > any python application - I am not sure which software that binds to a
> > socket does not support it, with the exception of wireguard.
> >
> >  
