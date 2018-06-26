Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3400d8ae
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 10:51:21 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [IPv6:2001:470:dc45:1000::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 419e8db0
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 10:51:21 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Adrian Sevcenco <adrian.sev@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: wg addconf :: AllowedIPs gets deleted with the additions of peers
In-Reply-To: <b4b972dc-7852-4b43-0015-2963437e1de3@gmail.com>
References: <a989a217-9e18-5e5f-2a97-fa3ac81ccb87@gmail.com>
 <8736xaod3b.fsf@toke.dk> <ff54875a-3630-52bd-5f45-1b8e8a182ae7@gmail.com>
 <87woummwlh.fsf@toke.dk> <b4b972dc-7852-4b43-0015-2963437e1de3@gmail.com>
Date: Tue, 26 Jun 2018 12:56:53 +0200
Message-ID: <87o9fxn7d6.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Adrian Sevcenco <adrian.sev@gmail.com> writes:

> On 06/25/2018 11:37 PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Adrian Sevcenco <adrian.sev@gmail.com> writes:
>>=20
>>> On 06/25/2018 10:55 PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>>>> Adrian Sevcenco <adrian.sev@gmail.com> writes:
>>>>
>>>>> Hi! It seems that AllowedIPs declaration gets erased when peers are
>>>>> added with addconf
>>>>
>>>> You can't have the same AllowedIPs for two different peers... :)
>>>
>>> Err... so, it's a bug or a feature?
>>=20
>> A feature. The AllowedIPs controls which IP addresses will be routed to
>> that peer. They refer to addresses inside the tunnel. So depending on
>> your setup you'd specify the single IP you assign each peer, or possibly
>> any subnets behind that peer you want routed through the tunnel.
> Then, how can i set a default allow everything for each peer? Should i=20
> make a different tunnel for each peer?

Yes, if you want point-to-point links where all traffic is sent to a
single other peer, you'll need separate interfaces.

If you want a road warrior type setup, where client devices connect to a
server and use that as a default gateway, you'd assign each client a
single IP (inside the tunnel) and put that in each peer config's
allowedips. The clients can then all have 0.0.0.0/0 as allowedip of the
server.

> But given your explanation i still feel that it is a bug that when an=20
> AllowIPs is declared with the addition of a second peer the declaration=20
> from the first peer gets erased ...

Well, the UI can be surprising, sure, but the alternative would be to
report an error if you try to set the same allowedIP on different peers,
which is not necessarily better. And it's not a bug in that it is
intentional behaviour ;)

> It should be either a global setting per tunnel OR an individual setting=
=20
> per peer (in which case it should stay set)

I think the point of confusion is that it is called 'allowedips', but it
really means 'ips that are allowed from this peer *and* routed to this
peer'. I.e., it is also a routing table. See
https://www.wireguard.com/#cryptokey-routing


-Toke
