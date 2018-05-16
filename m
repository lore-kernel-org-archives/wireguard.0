Return-Path: neumann@cgws.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dcb807d
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 07:01:50 +0000 (UTC)
Received: from mail.dabax.net (mail.dabax.net [88.99.12.75])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6558fd73
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 07:01:50 +0000 (UTC)
Date: Wed, 16 May 2018 09:01:07 +0200
In-Reply-To: <87k1s7wx30.fsf@toke.dk>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <c468bc7b-c1bf-b8db-1168-0ee7eef2f385@urlichs.de> <87k1s7wx30.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----0EHNKOCZ8XUMN5VK2YPM4D5VQTX51X"
Subject: Need for HW-clock independent timestamps
To: =?ISO-8859-1?Q?Toke_H=F8iland-J=F8rgensen?= <toke@toke.dk>,
 Matthias Urlichs <matthias@urlichs.de>, wireguard@lists.zx2c4.com
From: Axel Neumann <neumann@cgws.de>
Message-ID: <1FB166DA-4390-47BD-9CB0-8408C0691AC1@cgws.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

------0EHNKOCZ8XUMN5VK2YPM4D5VQTX51X
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13=2E05=2E2018 14:37, Toke H=C3=B8iland-J=C3=B8rgensen wrote:> Matthias =
Urlichs
<matthias@urlichs=2Ede> writes:
>
>> Can anybody think of problems with this solution?
>
> Well, the possibility of DOS if you set the counter too high,

Correct me please, but skipping even many counter values should not be a p=
roblem at all=2E So do you mean DOS in case your hit a wrap around of the
counter? IMO this can be easily prevented=2E

If the=20
TAI64/96 bit timestamp field (64-bit seconds count + 32-bit nanoseconds co=
unt)=20
in WG handshake_init messages is used as a counter, then it seems sufficie=
nt to just use the 32-bit nano-cnt part for sequential increments after eac=
h handshake=2E Only the sec-cnt part needs to be saved with a +1 value (imp=
licitly assuming nano-cnt saved as zero): during wg modprobe and also whene=
ver the in-memory nano-cnt value got 80% exhausted=2E Reserving room for 80=
0 000 000 handshakes (in non-reboot cases) before a new fs-write operation =
is needed=2E Given that just the handshake-required ECDH-Curve25519 takes m=
ore than a ms (eg 769 handshake/s measured on my intel notebook) calculatio=
n, that would happen at most once every 10 days=2E But realistically rather=
 in terms of month or years=2E=20
So in practice, a sec-cnt+1 value, now representing not secs but handshake=
 counts x 1000000000) would only be saved during each system boot or wg ini=
t=2E


> and the
> possibility of replay attacks if you fail to save the last state when
> you shut down comes to mind :)

Where is that possibility? If you fail then you would send
handshake_initiation messages with an already outdated timestamp field=2E =
 Exactly what now happens by default with non-HWC equipped devices after ea=
ch reboot=2E


>
> (Not saying it's not possible to create a workable solution, just that
> it's not trivial and requires careful thought to not break the security
> assumptions of the protocol)=2E

I agree,
but looking at the recent discussion (how to secure NTP as a work around f=
or for non-HWC devices) some of the assumptions made by the current approac=
h seem already quite questionable to me right now=2E Like super-simple WG a=
nd firewall setup=2E Instead of two-lines documentation
you will likely need 2 pages plus some references for further reading to o=
ther tools (like NTP) and also inherit related problems=2E That does not so=
und like the WG philosophy to me=2E

/Axel

>
> -Toke
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists=2Ezx2c4=2Ecom
> https://lists=2Ezx2c4=2Ecom/mailman/listinfo/wireguard
>


--=20
Diese Nachricht wurde von meinem Android-Ger=C3=A4t mit K-9 Mail gesendet=
=2E
------0EHNKOCZ8XUMN5VK2YPM4D5VQTX51X
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13=2E05=2E2018 14:37, Toke H=C3=B8iland-J=C3=B8rgensen wrote:&gt; Matthi=
as Urlichs<br>
&lt;matthias@urlichs=2Ede&gt; writes:<br>
&gt;<br>
&gt;&gt; Can anybody think of problems with this solution?<br>
&gt;<br>
&gt; Well, the possibility of DOS if you set the counter too high,<br>
<br>
Correct me please, but skipping even many counter values should not be a p=
roblem at all=2E So do you mean DOS in case your hit a wrap around of the<b=
r>
counter? IMO this can be easily prevented=2E<br>
<br>
If the <br>
TAI64/96 bit timestamp field (64-bit seconds count + 32-bit nanoseconds co=
unt) <br>
in WG handshake_init messages is used as a counter, then it seems sufficie=
nt to just use the 32-bit nano-cnt part for sequential increments after eac=
h handshake=2E Only the sec-cnt part needs to be saved with a +1 value (imp=
licitly assuming nano-cnt saved as zero): during wg modprobe and also whene=
ver the in-memory nano-cnt value got 80% exhausted=2E Reserving room for 80=
0 000 000 handshakes (in non-reboot cases) before a new fs-write operation =
is needed=2E Given that just the handshake-required ECDH-Curve25519 takes m=
ore than a ms (eg 769 handshake/s measured on my intel notebook) calculatio=
n, that would happen at most once every 10 days=2E But realistically rather=
 in terms of month or years=2E <br>
So in practice, a sec-cnt+1 value, now representing not secs but handshake=
 counts x 1000000000) would only be saved during each system boot or wg ini=
t=2E<br>
<br>
<br>
&gt; and the<br>
&gt; possibility of replay attacks if you fail to save the last state when=
<br>
&gt; you shut down comes to mind :)<br>
<br>
Where is that possibility? If you fail then you would send<br>
handshake_initiation messages with an already outdated timestamp field=2E =
 Exactly what now happens by default with non-HWC equipped devices after ea=
ch reboot=2E<br>
<br>
<br>
&gt;<br>
&gt; (Not saying it&#39;s not possible to create a workable solution, just=
 that<br>
&gt; it&#39;s not trivial and requires careful thought to not break the se=
curity<br>
&gt; assumptions of the protocol)=2E<br>
<br>
I agree,<br>
but looking at the recent discussion (how to secure NTP as a work around f=
or for non-HWC devices) some of the assumptions made by the current approac=
h seem already quite questionable to me right now=2E Like super-simple WG a=
nd firewall setup=2E Instead of two-lines documentation<br>
you will likely need 2 pages plus some references for further reading to o=
ther tools (like NTP) and also inherit related problems=2E That does not so=
und like the WG philosophy to me=2E<br>
<br>
/Axel<br>
<br>
&gt;<br>
&gt; -Toke<br>
&gt; _______________________________________________<br>
&gt; WireGuard mailing list<br>
&gt; WireGuard@lists=2Ezx2c4=2Ecom<br>
&gt; <a href=3D"https://lists=2Ezx2c4=2Ecom/mailman/listinfo/wireguard">ht=
tps://lists=2Ezx2c4=2Ecom/mailman/listinfo/wireguard</a><br>
&gt;<br>
<br>
<br>
-- <br>
Diese Nachricht wurde von meinem Android-Ger=C3=A4t mit K-9 Mail gesendet=
=2E
------0EHNKOCZ8XUMN5VK2YPM4D5VQTX51X--
