Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30b8c7cb
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 20:31:44 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [IPv6:2001:470:dc45:1000::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ad3ae0b
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 20:31:44 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Adrian Sevcenco <adrian.sev@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: wg addconf :: AllowedIPs gets deleted with the additions of peers
In-Reply-To: <ff54875a-3630-52bd-5f45-1b8e8a182ae7@gmail.com>
References: <a989a217-9e18-5e5f-2a97-fa3ac81ccb87@gmail.com>
 <8736xaod3b.fsf@toke.dk> <ff54875a-3630-52bd-5f45-1b8e8a182ae7@gmail.com>
Date: Mon, 25 Jun 2018 22:37:14 +0200
Message-ID: <87woummwlh.fsf@toke.dk>
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

> On 06/25/2018 10:55 PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Adrian Sevcenco <adrian.sev@gmail.com> writes:
>>=20
>>> Hi! It seems that AllowedIPs declaration gets erased when peers are
>>> added with addconf
>>=20
>> You can't have the same AllowedIPs for two different peers... :)
>
> Err... so, it's a bug or a feature?

A feature. The AllowedIPs controls which IP addresses will be routed to
that peer. They refer to addresses inside the tunnel. So depending on
your setup you'd specify the single IP you assign each peer, or possibly
any subnets behind that peer you want routed through the tunnel.

> If it is a feature how can i make server accept whatever ip get the=20
> client(s) in various networks?

Changing IPs *on the outside* of the tunnel will be accepted
automatically. The Endpoint specifier is only the initial address; if a
device changes its IP, it'll just keep sending packets from the new IP,
and because they are authenticated by the crypto, the other peer will
accept them and change its notion of what IP the other peer is
reachable at automatically. So as long as only one peer changes its IP
at a time, roaming mostly just works :)

-Toke
