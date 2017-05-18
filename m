Return-Path: labawi-wg@matrix-dream.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9784e382
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 11:49:13 +0000 (UTC)
Received: from matrix-dream.net (matrix2.matrix-dream.net [84.200.73.251])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8cba4abe
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 11:49:13 +0000 (UTC)
Date: Thu, 18 May 2017 13:00:41 +0100
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: allowed_ips move semantics?
Message-ID: <20170518120040.GA2306@matrix-dream.net>
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 <20170516154204.GB9458@matrix-dream.net>
 <CAHmME9roTAqMYB0qB7JG3rkKfGw1nfzTz0AD-frcGyyweCTcJQ@mail.gmail.com>
 <20170518080213.GB1941@matrix-dream.net>
 <CAHmME9pqK6qbbSWQoxE4j6E-bXBObQZTBJ8-Zjkrhw78Xj14nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9pqK6qbbSWQoxE4j6E-bXBObQZTBJ8-Zjkrhw78Xj14nQ@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I didn't think it would be such a small change :)

You mention changing routes. It is indeed a valid
use for move instead of remove + add, as it should
not drop packets, but I do not think it is a compelling
reason. Executing remove + add shouldn't take more than
a few milliseconds and networks should be capable
of handling transient errors. Unless you start responding
with resets or something, but it seems like a niche
use where users would be capable of handling it.


The race condition I mentioned was that of adding peers,
or adding new ips to existing peers.
With move semantics, if you use an interface with dynamic
ips, there is no way to be sure you didn't remove some
peer's ip, unless you use some form of external locking
and/or centralized database.

On top of a move semantics API you cannot implement a race-free
just_add_peer_with_ips_but_dont_snatch_from_others operation.
Because of that you also cannot implement an operation
that would safely add a peer and then remove it without
possibly affecting other peers even after it was removed.

If I compare functionality
a) add_ips_and_possibly_remove_from_others
b) add_ips_but_fail_if_others_use_it
I believe users will mostly want to use (b). Also (b)
is safer as it is less likely to have unintended consequences.
A good API is one that is hard to misuse. API (a) is
easy to misuse, (b) is not. As wireguard is a security
product it should provide (b).

If you wish to provide an API with move semantics,
I would even consider to make the API be
c) move_ips_X_from_peer_A_to_peer_B,
rather than the (a) version
a) add_ips_X_to_peer_B_and_remove_from_others
just so it wouldn't be easier to do the wrong
thing and mindlessly stick a move flag rather
than the right thing and find out where the ip
is used and handle it accordingly.


I think preventing the unintended consequences of removing
ips from peers when doing e.g.
wg add peer B ; wg remove peer B
which will happen, is more important than small temporary
packet loss from
wg peer A remove ips && wg peer B add ips


Regards,
ivan


On Thu, May 18, 2017 at 12:08:37PM +0200, Jason A. Donenfeld wrote:
> Hi Ivan,
> 
> You make a lot of compelling points there, and I'm inclined to follow your
> advice. The (untested) patch to change this to the behavior you'd like is
> actually this trivial two line change:
> 
> diff --git a/src/routingtable.c b/src/routingtable.c
> index f9c3eff..0ad4d3c 100644
> --- a/src/routingtable.c
> +++ b/src/routingtable.c
> @@ -194,6 +194,8 @@ static int add(struct routing_table_node __rcu **trie,
> u8 bits, const u8 *key, u
>   return 0;
>   }
>   if (node_placement(*trie, key, cidr, bits, &node, lock)) {
> + if (node->peer)
> + return -EEXIST;
>   node->peer = peer;
>   return 0;
>   }
> 
> I'm especially compelled by your point that this would mirror the semantics
> of the routing table.
> 
> However, I was a bit confused by your mention of a race condition, because
> I believe that my current solution _avoids_ a race condition. The routing
> table has a concept of metrics, which allows for avoiding a race condition
> when gracefully handing over routes between different interfaces, like this:
> 
> # ip route add 10.0.0.0/24 dev eth0 metric 1000
> # ip route add 10.0.0.0/24 dev wlan0 metric 1001
> # ip route del 10.0.0.0/24 dev eth0 metric 1000
> 
> (It also has `ip route change`, but I don't know if this is actually
> implemented in a race free way in the kernel or how it works.)
> 
> If I added the -EEXIST semantic to WireGuard's allowed-ips, if you wanted
> to change traffic from one peer to the other, you could not do so without
> dropping a bunch of packets during the interim. Thus, a race condition.
> This was the original reason for designing it as I did -- I liked the idea
> of race-free handovers.
> 
> Do you think maintaining race-free handover is important enough to warrant
> not using -EEXIST? I sort of think it is important. Of course, I could add
> an explicit "change" flag, but that makes things a bit complicated. And, in
> the case of your hypothetical fat-fingered sysadmin, the error condition is
> that this "fails closed", rather than "fails open", which probably makes it
> not such a big deal.
> 
> What do you think of that argumentation?
> 
> Jason
