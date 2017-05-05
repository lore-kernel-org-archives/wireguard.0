Return-Path: damian.kaczkowski@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc70f0e2
 for <wireguard@lists.zx2c4.com>; Fri, 5 May 2017 18:19:18 +0000 (UTC)
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
 [209.85.216.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 284669f5
 for <wireguard@lists.zx2c4.com>; Fri, 5 May 2017 18:19:18 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id m36so11902895qtb.0
 for <wireguard@lists.zx2c4.com>; Fri, 05 May 2017 11:29:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rReXuDHmGTU8k7+ryu3pWSMHR0aGfaFWQzWhAnZy9DjA@mail.gmail.com>
References: <CAGzienFDihyN8fDbKj4KQ-1cwz53_u7Vz3G37P08+wS=hbF0LA@mail.gmail.com>
 <CAHmME9pNgSjXeKnzM23Bb3Q=zZJKMDtq-3xevMzdtP7XdoMjkQ@mail.gmail.com>
 <CAGzienHd=L8tYn41WdjGSk4hvCWiUW8LUi4C8jf8piBhLA=dng@mail.gmail.com>
 <CAHmME9q9Z+P7=UTE2Sc9b7tUajjkgG-pnvgpMqBO33AGdwdoyw@mail.gmail.com>
 <CAGzienGZMTeD6HqQsg36N_g+6faxivOGpBQFF2MmMTzk63iTnw@mail.gmail.com>
 <CAHmME9rReXuDHmGTU8k7+ryu3pWSMHR0aGfaFWQzWhAnZy9DjA@mail.gmail.com>
From: Damian Kaczkowski <damian.kaczkowski@gmail.com>
Date: Fri, 5 May 2017 20:28:33 +0200
Message-ID: <CAGzienGzypKvYQZBShJuZp9kZHhj26Rc8-qtObD+Ap_+XhB4+w@mail.gmail.com>
Subject: Re: Ability to use one udp port for multiple wg interfaces
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary=001a114114f201f143054ecb11c0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114114f201f143054ecb11c0
Content-Type: text/plain; charset=UTF-8

On 2 May 2017 at 21:45, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> On May 2, 2017 19:59, "Damian Kaczkowski" <damian.kaczkowski@gmail.com>
> wrote:
>
> On 2 May 2017 at 18:32, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
>>  > 3. Well if one uses firewall to control flows between zones in
>> environment
>
> > with mix protocols (eg. gre, ipsec, openvpn and so on) then using second
>> > tool just to control only wireguard ACLs is not very convenient way from
>> > administrative point of view. Also in case where peer is roaming and
>> > changing its source IP (eg. road warrior) then maintaining wireguard
>> ACLs
>> > will be a huge PITA, if not impossible at large scale.
>>
>> No, you are wrong. Allowed-ips controls the IP addresses _within_ the
>> tunnel. Thus your iptables rules can use "-i wg0 -s 10.0.0.3/32" or
>> similar to match a _precise_ peer.
>>
>
> Ok. Thanks for a tip. However I still think wireguard looses some
> flexibility in that way eg. when peer roams from one network to another
> then its ip address may be unknown.
>
>
> No, wrong. Roaming regards external IP. Allowed IPs regards internal
> tunnel IPs, which are static.
>

True. But I still think that ability to assign multi interfaces to one udp
port would be handy. Eg when one want to use only specific and limited
ports (like eg 53) for wireguard but still wants to have more interfaces at
one's disposal. Possible use case - be able to easily assign and group
various peers to different interfaces and monitor those interfaces
parameters (exposed eg by kernel) using monitoring tools capable of
collecting various information/data and/or plotting graphs like bandwidth,
traffic, and so on. This info could be later used for analysing or
debugging.


Anyway, it is not only about roaming case so if it is not much of a work
> and if it is not a security problem then please consider to allow multiple
> wg interfaces to work on one port. I hope it won't hurt to allow this
> functionality and I am sure it might come handy for some admins in the
> wild. Maybe it could be implemented in pair with the idea of refactoring
> per interface vs per peer private keys? Hope you will consider it at some
> point.
>
>
> No, you are very mistaken. Please reread the docs on allowed ips keeping
> in mind that these concern internal tunneled ips and are static. Typing to
> you on my phone so can't write more now.
>

Reading through the docs.

I come to scenario where I would like to disable whole allowed-ips thing. A
multi-homed scenario where traffics comes out via one peer/interface and
come back via the other one. Wrote about this in another email.

Greets.

--001a114114f201f143054ecb11c0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
 May 2017 at 21:45, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><span class=3D""><div=
><div data-smartmail=3D"gmail_signature">On May 2, 2017 19:59, &quot;Damian=
 Kaczkowski&quot; &lt;<a href=3D"mailto:damian.kaczkowski@gmail.com" target=
=3D"_blank">damian.kaczkowski@gmail.com</a>&gt; wrote:<br></div><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"m_45648610=
95046700501quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><div class=3D"m_4564861095046700501quoted-text">On 2 May 2017 at=
 18:32, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"mailto:Jason@zx=
2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">=C2=A0&gt; 3. Well if one uses f=
irewall to control flows between zones in environment</blockquote></div><di=
v class=3D"m_4564861095046700501quoted-text"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><span class=3D"m_4564861095046700501m_79066885590489910=
96m_3894523804232733548m_1843689576291276550gmail-">
&gt; with mix protocols (eg. gre, ipsec, openvpn and so on) then using seco=
nd<br>
&gt; tool just to control only wireguard ACLs is not very convenient way fr=
om<br>
&gt; administrative point of view. Also in case where peer is roaming and<b=
r>
&gt; changing its source IP (eg. road warrior) then maintaining wireguard A=
CLs<br>
&gt; will be a huge PITA, if not impossible at large scale.<br>
<br>
</span>No, you are wrong. Allowed-ips controls the IP addresses _within_ th=
e<br>
tunnel. Thus your iptables rules can use &quot;-i wg0 -s <a href=3D"http://=
10.0.0.3/32" rel=3D"noreferrer" target=3D"_blank">10.0.0.3/32</a>&quot; or<=
br>
similar to match a _precise_ peer.<br></blockquote><div><br></div></div><di=
v>Ok. Thanks for a tip. However I still think wireguard looses some flexibi=
lity in that way eg. when peer roams from one network to another then its i=
p address may be unknown.<br></div></div></div></div></blockquote></div></d=
iv></div><div dir=3D"auto"><br></div></span><div dir=3D"auto">No, wrong. Ro=
aming regards external IP. Allowed IPs regards internal tunnel IPs, which a=
re static.</div></div></blockquote><div><br></div><div>True. But I still th=
ink that ability to assign multi interfaces to one udp port would be handy.=
 Eg when one want to use only specific and limited ports (like eg 53) for w=
ireguard but still wants to have more interfaces at one&#39;s disposal. Pos=
sible use case - be able to easily assign and group various peers to differ=
ent interfaces and monitor those interfaces parameters (exposed eg by kerne=
l) using monitoring tools capable of collecting various information/data an=
d/or plotting graphs like bandwidth, traffic, and so on. This info could be=
 later used for analysing or debugging.</div><div>=C2=A0</div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><span class=3D""><div di=
r=3D"auto"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquot=
e class=3D"m_4564861095046700501quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_ex=
tra"><div class=3D"gmail_quote"><div>Anyway, it is not only about roaming c=
ase so if it is not much of a work and if it is not a security problem then=
 please consider to allow multiple wg interfaces to work on one port. I hop=
e it won&#39;t hurt to allow this functionality and I am sure it might come=
 handy for some admins in the wild. Maybe it could be implemented in pair w=
ith the idea of refactoring per interface vs per peer private keys? Hope yo=
u will consider it at some point.<br></div></div></div></div></blockquote><=
/div></div></div><div dir=3D"auto"><br></div></span><div dir=3D"auto">No, y=
ou are very mistaken. Please reread the docs on allowed ips keeping in mind=
 that these concern internal tunneled ips and are static. Typing to you on =
my phone so can&#39;t write more now.</div></div></blockquote><div><br></di=
v><div>Reading through the docs.</div><div></div></div><br></div><div class=
=3D"gmail_extra">I come to scenario where I would like to disable whole all=
owed-ips thing. A multi-homed scenario where traffics comes out via one pee=
r/interface and come back via the other one. Wrote about this in another em=
ail.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">G=
reets.</div><div class=3D"gmail_extra"><br></div></div>

--001a114114f201f143054ecb11c0--
