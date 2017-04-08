Return-Path: georgewalkeriv@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e797e1b
 for <wireguard@lists.zx2c4.com>; Sat, 8 Apr 2017 15:37:51 +0000 (UTC)
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
 [209.85.216.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28c85ce8
 for <wireguard@lists.zx2c4.com>; Sat, 8 Apr 2017 15:37:51 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id c45so38334798qtb.1
 for <wireguard@lists.zx2c4.com>; Sat, 08 Apr 2017 08:44:24 -0700 (PDT)
Return-Path: <georgewalkeriv@gmail.com>
Content-Type: multipart/alternative;
 boundary=Apple-Mail-0FA68DCD-8618-4A69-B5F3-E0EED4A93BD6
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC] Multicast and IPv6 Link Local Addresses
From: George Walker <georgewalkeriv@gmail.com>
In-Reply-To: <CAHmME9oxt=x3tJ5wHitGGjD1yLGweQ4ed3aNv+0Cv9bvPUXDDg@mail.gmail.com>
Date: Sat, 8 Apr 2017 11:44:21 -0400
Message-Id: <907F3B78-F081-4CE9-A689-6B87285FBF80@gmail.com>
References: <CAHmME9poZPFbYhitnK8UvDB-32hLRcTFc4vAwaUPwGEz0wY+Yg@mail.gmail.com>
 <CAHmME9ouagoSmxUy2R0YAhhUhX7PVRpJuP6S6PC+AxHKHtb+BA@mail.gmail.com>
 <03B23E99-75C4-4598-AC0A-3C65F346675F@gmail.com>
 <CAHmME9oxt=x3tJ5wHitGGjD1yLGweQ4ed3aNv+0Cv9bvPUXDDg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 Juliusz Chroboczek <jch@irif.fr>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 =?utf-8?Q?Dave_T=C3=A4ht?= <dave@taht.net>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Apple-Mail-0FA68DCD-8618-4A69-B5F3-E0EED4A93BD6
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> If I understand correctly

You do.

> I find that a very nice UI
> solution. Wonderful.

Thanks!  Thinking about it definitely got me excited about what I could do w=
ith a secure multicast-capable network overlay...

Sent from my iPhone

> On Apr 7, 2017, at 4:42 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Hey George,
>=20
> More excellent feedback, thanks. Be sure to CC the list next time though.
>=20
> If I understand correctly, your suggestion is to not clutter
> everything with a horrible "multi:" prefix, but instead allow
> multicast addressees, which are well defined, to be added to multiple
> peers, and only allow unicast addresses to be added to one peer at a
> time keeping the current behavior. I find that a very nice UI
> solution. Wonderful.
>=20
> Jason
>=20
>> On Fri, Apr 7, 2017 at 6:02 PM, George Walker <georgewalkeriv@gmail.com> w=
rote:
>> Cons:
>> - A bit too magical.
>> - Seems to break paradigm.
>>=20
>>=20
>> Another is scalability --the computational and network overhead associate=
d
>> with making every peer irrevocably a member of every multicast group.
>> Sending all multicast messages to all peers eliminates much of the benefi=
t
>> of having more than one multicast address.  That could mean a lot of
>> unnecessary handshakes!  I can imagine applications for which this behavi=
or
>> would make (accidental or malicious) DoS very easy.
>>=20
>> If you only have a lab-scale deployment and generous bandwidth, of course=

>> receive-side filtering is fine.  But Wireguard's performance and general
>> utility would suggest that some will want big far-flung networks that may=

>> well have need for lots of multicast groups (e.g. industrial IoT), while n=
ot
>> being able to afford to broadcast everything to everyone.
>>=20
>> Thus, there'd have to be
>> some explicit way of telling it, "yes I really do want this to be
>> duplicated, not moved". Perhaps a "multi:" prefix?
>>=20
>>=20
>> I respectfully disagree concerning the necessity to add special, ugly,
>> inconsistent UI for the multicast-as-multicast (instead of
>> multicast-as-broadcast) approach.  Multicast address ranges are well-know=
n,
>> specified in RFCs.  That they behave a little bit differently from unicas=
t
>> addresses is expected behavior.  Most of us ignore them and don't use tho=
se
>> ranges most or all of the time, which works fine.  Thus Multicast support=

>> (e.g. in routers) doesn't generally interfere with the actual vs. expecte=
d
>> behavior of the unicast traffic most people use most of the time.
>>=20
>> Anyone who is diddling with networking at this level already knows how to=

>> avoid multicast IPs when they intend unicast (whether they know they do o=
r
>> not).
>>=20
>> It doesn't seem problematic for a layer 3 VPN to treat adding a unicast
>> address when such an address is already an allowedIP as different from
>> adding a multicast address (moving in the first case, adding in the secon=
d).
>> It sounds to me like doing the right (intuitive) thing in each case.

--Apple-Mail-0FA68DCD-8618-4A69-B5F3-E0EED4A93BD6
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div><blockquote type=3D"cite"><font color=3D=
"#000000"><span style=3D"background-color: rgba(255, 255, 255, 0);">If I und=
erstand correctly</span></font></blockquote><div id=3D"AppleMailSignature"><=
br></div><div id=3D"AppleMailSignature">You do.</div><div id=3D"AppleMailSig=
nature"><br></div><div id=3D"AppleMailSignature"><blockquote type=3D"cite"><=
font color=3D"#000000"><span style=3D"background-color: rgba(255, 255, 255, 0=
);">I find that a very nice UI<br>solution. Wonderful.</span></font></blockq=
uote><br></div><div id=3D"AppleMailSignature">Thanks! &nbsp;Thinking about i=
t definitely got me excited about what I could do with a secure multicast-ca=
pable network overlay...</div><br>Sent from my iPhone</div><div><br>On Apr 7=
, 2017, at 4:42 PM, Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com=
">Jason@zx2c4.com</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"><div=
><span>Hey George,</span><br><span></span><br><span>More excellent feedback,=
 thanks. Be sure to CC the list next time though.</span><br><span></span><br=
><span>If I understand correctly, your suggestion is to not clutter</span><b=
r><span>everything with a horrible "multi:" prefix, but instead allow</span>=
<br><span>multicast addressees, which are well defined, to be added to multi=
ple</span><br><span>peers, and only allow unicast addresses to be added to o=
ne peer at a</span><br><span>time keeping the current behavior. I find that a=
 very nice UI</span><br><span>solution. Wonderful.</span><br><span></span><b=
r><span>Jason</span><br><span></span><br><span>On Fri, Apr 7, 2017 at 6:02 P=
M, George Walker &lt;<a href=3D"mailto:georgewalkeriv@gmail.com">georgewalke=
riv@gmail.com</a>&gt; wrote:</span><br><blockquote type=3D"cite"><span>Cons:=
</span><br></blockquote><blockquote type=3D"cite"><span>- A bit too magical.=
</span><br></blockquote><blockquote type=3D"cite"><span>- Seems to break par=
adigm.</span><br></blockquote><blockquote type=3D"cite"><span></span><br></b=
lockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquot=
e type=3D"cite"><span>Another is scalability --the computational and network=
 overhead associated</span><br></blockquote><blockquote type=3D"cite"><span>=
with making every peer irrevocably a member of every multicast group.</span>=
<br></blockquote><blockquote type=3D"cite"><span>Sending all multicast messa=
ges to all peers eliminates much of the benefit</span><br></blockquote><bloc=
kquote type=3D"cite"><span>of having more than one multicast address. &nbsp;=
That could mean a lot of</span><br></blockquote><blockquote type=3D"cite"><s=
pan>unnecessary handshakes! &nbsp;I can imagine applications for which this b=
ehavior</span><br></blockquote><blockquote type=3D"cite"><span>would make (a=
ccidental or malicious) DoS very easy.</span><br></blockquote><blockquote ty=
pe=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>If=
 you only have a lab-scale deployment and generous bandwidth, of course</spa=
n><br></blockquote><blockquote type=3D"cite"><span>receive-side filtering is=
 fine. &nbsp;But Wireguard's performance and general</span><br></blockquote>=
<blockquote type=3D"cite"><span>utility would suggest that some will want bi=
g far-flung networks that may</span><br></blockquote><blockquote type=3D"cit=
e"><span>well have need for lots of multicast groups (e.g. industrial IoT), w=
hile not</span><br></blockquote><blockquote type=3D"cite"><span>being able t=
o afford to broadcast everything to everyone.</span><br></blockquote><blockq=
uote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><=
span>Thus, there'd have to be</span><br></blockquote><blockquote type=3D"cit=
e"><span>some explicit way of telling it, "yes I really do want this to be</=
span><br></blockquote><blockquote type=3D"cite"><span>duplicated, not moved"=
. Perhaps a "multi:" prefix?</span><br></blockquote><blockquote type=3D"cite=
"><span></span><br></blockquote><blockquote type=3D"cite"><span></span><br><=
/blockquote><blockquote type=3D"cite"><span>I respectfully disagree concerni=
ng the necessity to add special, ugly,</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>inconsistent UI for the multicast-as-multicast (instead of=
</span><br></blockquote><blockquote type=3D"cite"><span>multicast-as-broadca=
st) approach. &nbsp;Multicast address ranges are well-known,</span><br></blo=
ckquote><blockquote type=3D"cite"><span>specified in RFCs. &nbsp;That they b=
ehave a little bit differently from unicast</span><br></blockquote><blockquo=
te type=3D"cite"><span>addresses is expected behavior. &nbsp;Most of us igno=
re them and don't use those</span><br></blockquote><blockquote type=3D"cite"=
><span>ranges most or all of the time, which works fine. &nbsp;Thus Multicas=
t support</span><br></blockquote><blockquote type=3D"cite"><span>(e.g. in ro=
uters) doesn't generally interfere with the actual vs. expected</span><br></=
blockquote><blockquote type=3D"cite"><span>behavior of the unicast traffic m=
ost people use most of the time.</span><br></blockquote><blockquote type=3D"=
cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>Anyone w=
ho is diddling with networking at this level already knows how to</span><br>=
</blockquote><blockquote type=3D"cite"><span>avoid multicast IPs when they i=
ntend unicast (whether they know they do or</span><br></blockquote><blockquo=
te type=3D"cite"><span>not).</span><br></blockquote><blockquote type=3D"cite=
"><span></span><br></blockquote><blockquote type=3D"cite"><span>It doesn't s=
eem problematic for a layer 3 VPN to treat adding a unicast</span><br></bloc=
kquote><blockquote type=3D"cite"><span>address when such an address is alrea=
dy an allowedIP as different from</span><br></blockquote><blockquote type=3D=
"cite"><span>adding a multicast address (moving in the first case, adding in=
 the second).</span><br></blockquote><blockquote type=3D"cite"><span>It soun=
ds to me like doing the right (intuitive) thing in each case.</span><br></bl=
ockquote></div></blockquote></body></html>=

--Apple-Mail-0FA68DCD-8618-4A69-B5F3-E0EED4A93BD6--
