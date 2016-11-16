Return-Path: mail@danrl.com
Received: from mx.sealand.io (mx.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b58476f
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:32:46 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CAHmME9r0tdR8=nnC4yPLJoOE8yU_7iJi0qEpx9POyM3OBZ3otQ@mail.gmail.com>
Date: Wed, 16 Nov 2016 15:38:05 +0100
Message-Id: <44DAF4D4-00A8-4903-8003-EB0215635B61@danrl.com>
References: <A7E34EE0-F8F0-4F88-AA94-58434D0DF2BA@danrl.com>
 <CAHmME9r0tdR8=nnC4yPLJoOE8yU_7iJi0qEpx9POyM3OBZ3otQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Demo Server: Dual stack?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

> I guess I could provide IPv6 connectivity, but.... why? It's a demo.

Because it is a demo of a brand new protocol, showing how it can be used =
with legacy versions payload and transport protocol. I find that odd, =
but as I understand we have contradicting point of views on IP =
protocols.

> If you're using it as an access point to the Internet with intentions
> beyond simply trying out WireGuard, then you're abusing my service.

I am not using it at all. But it would be useful for howtos and blog =
posts to reference it. I don't use vintage IP in my posts, so I can't =
refer to the official demo server.

Since many potential peers are behind NATs using RFC1918 legacy IP =
addresses AND have global unicast IP addresses (which are easier to =
whitelist in a firewall than maintaining port forwarding in networks =
using a dynamic configuration protocol) I expect WireGuard to be =
especially useful using IPv6 as transport.

BTW, I don't see any reason why the demo server should forward to the =
Internet at all. Connectivity between peers/server and accessing the =
hidden website would be enough for my usecase (howtos/blog posts), which =
may be a different one than what you intended when you setup the server.=20=


> I'm happy to consider this, but I'll need to be convinced that this
> actually matters.

Unfortunately :) I, for one, need to be convinced why I should create =
lasting documentation using an EOL IP protocol. Why does IPv4 matter =
more than IPv6? Usually, latency is better when using IPv6. Latency is =
probably the first thing demo users test (ping through the tunnel).

However, if you like to share some information how to set up one myself, =
I am happy to host a IPv6 demo server. Currently I am wondering how to =
accept *any* public key in the [Peer] config.

Cheers,

Dan

> Jason
>=20
> On Wed, Nov 16, 2016 at 12:39 PM, Dan L=C3=BCdtke <mail@danrl.com> =
wrote:
>> Jason,
>>=20
>> do you plan on adding IPv6 compatibility to the demo server? If not, =
do you mind if I set one up? How difficult is it to run the demo server. =
It just accepts every key, right?
>>=20
>> Cheers,
>>=20
>> Dan
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> http://lists.zx2c4.com/mailman/listinfo/wireguard
