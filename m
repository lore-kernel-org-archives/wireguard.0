Return-Path: adrian.sev@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28b2901c
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 07:29:21 +0000 (UTC)
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com
 [IPv6:2a00:1450:400c:c09::235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ecc7a9c
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 07:29:21 +0000 (UTC)
Received: by mail-wm0-x235.google.com with SMTP id p11-v6so613106wmc.4
 for <wireguard@lists.zx2c4.com>; Tue, 26 Jun 2018 00:34:51 -0700 (PDT)
Return-Path: <adrian.sev@gmail.com>
Subject: Re: wg addconf :: AllowedIPs gets deleted with the additions of peers
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <a989a217-9e18-5e5f-2a97-fa3ac81ccb87@gmail.com>
 <8736xaod3b.fsf@toke.dk> <ff54875a-3630-52bd-5f45-1b8e8a182ae7@gmail.com>
 <87woummwlh.fsf@toke.dk>
From: Adrian Sevcenco <adrian.sev@gmail.com>
Message-ID: <b4b972dc-7852-4b43-0015-2963437e1de3@gmail.com>
Date: Tue, 26 Jun 2018 10:34:48 +0300
MIME-Version: 1.0
In-Reply-To: <87woummwlh.fsf@toke.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 06/25/2018 11:37 PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> Adrian Sevcenco <adrian.sev@gmail.com> writes:
>=20
>> On 06/25/2018 10:55 PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>>> Adrian Sevcenco <adrian.sev@gmail.com> writes:
>>>
>>>> Hi! It seems that AllowedIPs declaration gets erased when peers are
>>>> added with addconf
>>>
>>> You can't have the same AllowedIPs for two different peers... :)
>>
>> Err... so, it's a bug or a feature?
>=20
> A feature. The AllowedIPs controls which IP addresses will be routed to=

> that peer. They refer to addresses inside the tunnel. So depending on
> your setup you'd specify the single IP you assign each peer, or possibl=
y
> any subnets behind that peer you want routed through the tunnel.
Then, how can i set a default allow everything for each peer? Should i=20
make a different tunnel for each peer?
But given your explanation i still feel that it is a bug that when an=20
AllowIPs is declared with the addition of a second peer the declaration=20
from the first peer gets erased ...
It should be either a global setting per tunnel OR an individual setting =

per peer (in which case it should stay set)

Thank you!!
Adrian

>=20
>> If it is a feature how can i make server accept whatever ip get the
>> client(s) in various networks?
>=20
> Changing IPs *on the outside* of the tunnel will be accepted
> automatically. The Endpoint specifier is only the initial address; if a=

> device changes its IP, it'll just keep sending packets from the new IP,=

> and because they are authenticated by the crypto, the other peer will
> accept them and change its notion of what IP the other peer is
> reachable at automatically. So as long as only one peer changes its IP
> at a time, roaming mostly just works :)
>=20
> -Toke
>=20
