Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bca45074
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 16:48:18 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 790b2218
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 16:48:17 +0000 (UTC)
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Subject: Re: [RFC] Multicast and IPv6 Link Local Addresses
In-Reply-To: <20170417141107.GA10609@tuxmachine.polynome.dn42> (Baptiste
 Jonglez's message of "Mon, 17 Apr 2017 16:11:07 +0200")
References: <CAHmME9poZPFbYhitnK8UvDB-32hLRcTFc4vAwaUPwGEz0wY+Yg@mail.gmail.com>
 <20170417141107.GA10609@tuxmachine.polynome.dn42>
Date: Mon, 17 Apr 2017 18:55:46 +0200
Message-ID: <87r30r3re5.fsf@alrua-x1>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Juliusz Chroboczek <jch@irif.fr>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Baptiste Jonglez <baptiste@bitsofnetworks.org> writes:

> Hi Jason,
>
> On Fri, Apr 07, 2017 at 04:02:49PM +0200, Jason A. Donenfeld wrote:
>> Various networking people have been poking and prodding about
>> supporting IPv6 Link Local addresses and about supporting special
>> multicast addresses. *I MAY VERY WELL NEVER CHOOSE TO IMPLEMENT THIS*
>> but in case I do, I wanted to start spec'ing out what this might look
>> like in order to think about it better. There are a lot of odd
>> concerns to take into account, so I doubt that the below will wind up
>> as a final solution.
>
> This is good news!  I can't wait to see Babel running on a wireguard
> interface with several peers, or even what OSPF would look like on such a
> network.
>
> That being said, for the purpose of a routing protocol like Babel, I think
> it still makes more sense to use only *point-to-point* wireguard links.
> Link-local and multicast communication solves the problem of discovering
> remote routing daemon, but the AllowedIPs list is still static, which does
> not make sense for a routing protocol.  With point-to-point links, you can
> bypass this limitation by simply setting AllowedIPs to ::/0.  Of course,
> once we have dynamic AllowedIPs, this will change :)

Yeah, for the use case I'm envisioning, I would teach the routing daemon
to update wireguard's route tables...

> There is just the minor issue of subnets that encompass both unicast and
> multicast addresses, the simplest one being ::/0.  Such subnets could be
> automatically split by wireguard, or just have the "moving" semantic of
> unicast subnets.  With this last option, a user would have to explicitly
> add a subnet which is *within* a multicast prefix to trigger the "cloning"
> semantic.

I agree that the least confusing would be to only treat prefixes
entirely contained in the known multicast prefixes as having "cloning"
semantics.

-Toke
