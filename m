Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c867f12
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 09:38:07 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d0f5d2c
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 09:38:07 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Axel Neumann <neumann@cgws.de>, Matthias Urlichs <matthias@urlichs.de>,
 wireguard@lists.zx2c4.com
Subject: Re: Need for HW-clock independent timestamps
In-Reply-To: <1FB166DA-4390-47BD-9CB0-8408C0691AC1@cgws.de>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <c468bc7b-c1bf-b8db-1168-0ee7eef2f385@urlichs.de> <87k1s7wx30.fsf@toke.dk>
 <1FB166DA-4390-47BD-9CB0-8408C0691AC1@cgws.de>
Date: Wed, 16 May 2018 11:38:23 +0200
Message-ID: <87h8n8ym7k.fsf@toke.dk>
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

Axel Neumann <neumann@cgws.de> writes:

> On 13.05.2018 14:37, Toke H=C3=B8iland-J=C3=B8rgensen wrote:> Matthias Ur=
lichs
> <matthias@urlichs.de> writes:
>>
>>> Can anybody think of problems with this solution?
>>
>> Well, the possibility of DOS if you set the counter too high,
>
> Correct me please, but skipping even many counter values should not be
> a problem at all. So do you mean DOS in case your hit a wrap around of
> the counter? IMO this can be easily prevented.

No I meant DOS if you fail to save state properly. I.e., I send seqno
100000, lose my state, reboot, and re-initialise to seqno 100. I have
now essentially locked myself out of the network until my seqno goes
above 100000 again. Since I have no way of reliably detecting this
condition, there is no straight-forward manual recovery possible.

>> and the
>> possibility of replay attacks if you fail to save the last state when
>> you shut down comes to mind :)
>
> Where is that possibility? If you fail then you would send
> handshake_initiation messages with an already outdated timestamp
> field. Exactly what now happens by default with non-HWC equipped
> devices after each reboot.

You'd need to not only save your own seqno, but also the last seen seqno
from every peer. Otherwise you're vulnerable to a replay attack after
rebooting. And if you lose that state you are, well, vulnerable to a
replay attack after rebooting :)

>> (Not saying it's not possible to create a workable solution, just that
>> it's not trivial and requires careful thought to not break the security
>> assumptions of the protocol).
>
> I agree, but looking at the recent discussion (how to secure NTP as a
> work around for for non-HWC devices) some of the assumptions made by
> the current approach seem already quite questionable to me right now.
> Like super-simple WG and firewall setup. Instead of two-lines
> documentation you will likely need 2 pages plus some references for
> further reading to other tools (like NTP) and also inherit related
> problems. That does not sound like the WG philosophy to me.

Oh, I totally agree that it would be good if a solution could be found
to this. I'm just objecting to the assertion that "it's easy, just
replace the timestamp with an increasing seqno".

-Toke
