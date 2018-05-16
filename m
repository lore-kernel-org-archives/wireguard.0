Return-Path: neumann@cgws.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81aad57d
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 11:12:43 +0000 (UTC)
Received: from mail.dabax.net (mail.dabax.net [88.99.12.75])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1264211a
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 11:12:43 +0000 (UTC)
Date: Wed, 16 May 2018 13:12:56 +0200
In-Reply-To: <87h8n8ym7k.fsf@toke.dk>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <c468bc7b-c1bf-b8db-1168-0ee7eef2f385@urlichs.de> <87k1s7wx30.fsf@toke.dk>
 <1FB166DA-4390-47BD-9CB0-8408C0691AC1@cgws.de> <87h8n8ym7k.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: Need for HW-clock independent timestamps
To: =?ISO-8859-1?Q?Toke_H=F8iland-J=F8rgensen?= <toke@toke.dk>,
 Matthias Urlichs <matthias@urlichs.de>, wireguard@lists.zx2c4.com
From: Axel Neumann <neumann@cgws.de>
Message-ID: <1B816906-0833-4F46-A3D3-0DBA692C84A2@cgws.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>



Am 16=2E Mai 2018 11:38:23 MESZ schrieb "Toke H=C3=B8iland-J=C3=B8rgensen"=
 <toke@toke=2Edk>:
>Axel Neumann <neumann@cgws=2Ede> writes:
>
>> On 13=2E05=2E2018 14:37, Toke H=C3=B8iland-J=C3=B8rgensen wrote:> Matth=
ias Urlichs
>> <matthias@urlichs=2Ede> writes:
>>>
>>>> Can anybody think of problems with this solution?
>>>
>>> Well, the possibility of DOS if you set the counter too high,
>>
>> Correct me please, but skipping even many counter values should not be
>> a problem at all=2E So do you mean DOS in case your hit a wrap around o=
f
>> the counter? IMO this can be easily prevented=2E
>
>No I meant DOS if you fail to save state properly=2E I=2Ee=2E, I send seq=
no
>100000, lose my state, reboot, and re-initialise to seqno 100=2E I have
>now essentially locked myself out of the network until my seqno goes
>above 100000 again=2E Since I have no way of reliably detecting this
>condition, there is no straight-forward manual recovery possible=2E

Ok, then measures to mitigate this likelyhood are needed=2E But as said, i=
t boils down to incrementing and saving  a number during each system boot=
=2E Don't you think thid can be done in a reliable way=2E

>
>>> and the
>>> possibility of replay attacks if you fail to save the last state
>when
>>> you shut down comes to mind :)
>>
>> Where is that possibility? If you fail then you would send
>> handshake_initiation messages with an already outdated timestamp
>> field=2E Exactly what now happens by default with non-HWC equipped
>> devices after each reboot=2E
>
>You'd need to not only save your own seqno, but also the last seen
>seqno
>from every peer=2E Otherwise you're vulnerable to a replay attack after
>rebooting=2E And if you lose that state you are, well, vulnerable to a
>replay attack after rebooting :)

With my understanding, the same issue exists right now=2E The peers only v=
erify if a less or equal timestamp has been seen before from this peer=2E P=
eer timestamps are not recovered over reboots and also NOT related to its o=
wn clock or timestamps=2E As said in the other thread=2E Time discrepancy c=
an be infinite as long as it increases monotonically per peer=2E

/axel


>
>>> (Not saying it's not possible to create a workable solution, just
>that
>>> it's not trivial and requires careful thought to not break the
>security
>>> assumptions of the protocol)=2E
>>
>> I agree, but looking at the recent discussion (how to secure NTP as a
>> work around for for non-HWC devices) some of the assumptions made by
>> the current approach seem already quite questionable to me right now=2E
>> Like super-simple WG and firewall setup=2E Instead of two-lines
>> documentation you will likely need 2 pages plus some references for
>> further reading to other tools (like NTP) and also inherit related
>> problems=2E That does not sound like the WG philosophy to me=2E
>
>Oh, I totally agree that it would be good if a solution could be found
>to this=2E I'm just objecting to the assertion that "it's easy, just
>replace the timestamp with an increasing seqno"=2E
>
>-Toke

--=20
Diese Nachricht wurde von meinem Android-Ger=C3=A4t mit K-9 Mail gesendet=
=2E
