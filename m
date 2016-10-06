Return-Path: jehan@altheamesh.com
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab47ab7f
 for <wireguard@lists.zx2c4.com>; Thu, 6 Oct 2016 19:22:41 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B68A20B95
 for <wireguard@lists.zx2c4.com>; Thu,  6 Oct 2016 15:34:10 -0400 (EDT)
Message-Id: <1475782450.3353184.748070729.059CB89D@webmail.messagingengine.com>
From: Jehan Tremback <jehan@altheamesh.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain
Date: Thu, 06 Oct 2016 12:34:10 -0700
In-Reply-To: <20161006134247.347b1040@alex-archsus>
References: <1475719977.650386.747317105.1837502D@webmail.messagingengine.com>
 <20161006150310.GB30704@wolff.to>
 <1475771658.1684011.747950545.01B63CCC@webmail.messagingengine.com>
 <20161006134247.347b1040@alex-archsus>
Subject: Re: [WireGuard] auth-only wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> And encryption keeps various neighbors traffic hidden from passive
> eavesdroppers. Do your customers a service; encrypt their traffic
> wherever possible.

> So... now everybody can spy on each other's traffic instead of
> also spoofing it. That doesn't seem like a huge improvement to me.

Just to elaborate on why I don't want encryption for the specific tunnel
I describe: This is to be used between physical neighbors, to prevent
spoofing IP addresses to steal bandwidth. For example, let's say that
Alice and Bob are both connected to Charlie. Charlie has a connection to
the internet, and has made a contract with Bob to sell him a certain
amount of data (or a certain connection duration at a specified
bandwidth). Without authentication, Alice could spoof Bob's IP or MAC
address to use up his quota, or his bandwidth. This authentication is
happening at every hop, so it would be good to keep the overhead down.

There is typically another tunnel used on mesh networks, between exit
servers (which perform NAT and deal with legal complaints) and the end
user nodes. This would be encrypted, and I believe this is what the
network in Germany is looking at WireGuard for. Having two layers of
encryption within the network, in addition to whatever e2e the user may
be using, seems excessive.

Also, Bob doesn't necessarily trust Charlie. He is just providing a
service. Encryption between Bob and Charlie provides little benefit. The
NSA could join the mesh group, set up a cheaper uplink, get Bob to buy
some bandwidth, and see Bob's packets that way. The encryption is
provided by the tunnel to the exit server, and more importantly, the
user's e2e.

-- 
  Jehan Tremback
  jehan@altheamesh.com

On Thu, Oct 6, 2016, at 10:42 AM, Alex Xu wrote:
> On Thu, 06 Oct 2016 09:34:18 -0700
> Jehan Tremback <jehan@altheamesh.com> wrote:
> 
> > Let me be more specific about my application. I'm trying to create a
> > system where routers in a "mesh" network (mixed ad-hoc wifi and
> > ethernet) pay their neighbors, or are paid by their neighbors for
> > bandwidth. To make this happen, I've got to be able to identify
> > traffic from specific neighbors with something less spoofable than MAC
> > addresses. Creating tunnels between neighbors fits the bill for now,
> > and gives me a good handle to apply traffic shaping to different
> > neighbors. The encapsulating tunnel packet will have the source IP
> > address of the previous hop neighbor, and will be sent to the next
> > hop neighbor, and can be prioritized . Authentication keeps anyone
> > from spoofing addresses and stealing bandwidth.
> 
> So... now everybody can spy on each other's traffic instead of
> also spoofing it. That doesn't seem like a huge improvement to me.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard
