Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb3d45d3
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:48:18 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b63181b7
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:48:18 +0000 (UTC)
In-Reply-To: <CAHmME9oOJozBq-+UbYiZzF9uBpjMQ=saNPOeXnb2mPYNiKs0iw@mail.gmail.com>
References: <CAHmME9oOJozBq-+UbYiZzF9uBpjMQ=saNPOeXnb2mPYNiKs0iw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: Multicast over a wireguard link?
From: =?ISO-8859-1?Q?Toke_H=F8iland-J=F8rgensen?= <toke@toke.dk>
Date: Tue, 20 Dec 2016 19:55:18 +0100
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <2FDC4297-6948-436F-B1A4-03EE711E1AD5@toke.dk>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>



On 20 December 2016 19:43:15 CET, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>On Tue, Dec 20, 2016 at 7:40 PM, Toke Høiland-Jørgensen <toke@toke.dk>
>wrote:
>> Right, but that means that even if multicast is added, a routing
>> protocol won't be terribly useful, since it can't tell wireguard
>which
>> subnets lives behind which peers. What I would need is to be able to
>> assign /32s (or IPv6 lladdrs) to the interface for each peer, and
>have
>> the kernel routing table determine which subnets should go to each of
>> those. My hope was that wireguard could then figure out where to send
>> the packet from the /32s (which would be in the wireguard config,
>> presumably).
>
>Ahh, I see. In this case, the routing protocol needs to update
>WireGuard, not the kernel's routing table. This forces you to
>re-envision your routing protocol in terms of "which public key should
>get which routes?" which strikes me as an authenticity improvement.

Hmm, longer term carrying public keys in the routing protocol might be viable, but getting to there is not trivial. 

However a netlink interface that says, essentially, "add traffic going to subnet A to the same peer that has address X". That would turn wireguard into a normal routing table (conceptually, at least). If the same netlink interface could be used, it wouldn't even be necessary to modify the routing daemon...
