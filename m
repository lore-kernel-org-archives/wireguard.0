Return-Path: smajor@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23b3a037
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Nov 2017 17:40:58 +0000 (UTC)
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdea473f
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Nov 2017 17:40:58 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id 9so1818556wme.4
 for <wireguard@lists.zx2c4.com>; Thu, 16 Nov 2017 09:45:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
From: Stephen Major <smajor@gmail.com>
Date: Thu, 16 Nov 2017 09:45:19 -0800
Message-ID: <CALzTOm+R0Wd=2B9Umkjfh4FiAYefbBG1upkbRb1ho-W3QkDScg@mail.gmail.com>
Subject: Re: Roaming Mischief
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="089e0822392012ab2f055e1d2f67"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--089e0822392012ab2f055e1d2f67
Content-Type: text/plain; charset="UTF-8"

I am by no means an expert in crypto but lets just for the sake of paranoia
say that an advanced attacker was able to successfully pull off a MITM like
is possible with TLS and rumored OpenVPN.Personally, my approach to
security is having the mindset of everything can be compromised and basing
all decisions on that. So when I think of VPN's I think well if someone is
listening in, whether it be an ISP or a sophisticated encryption cracking
farm installed in the Westin building in Seattle.... How do I handle this
scenario? VPN Bonding, multiple tunnels 2 to a random number of tunnels
bonded. a successful MITM attack only would see garbled packets and the
complexity in cracking a random number of tunnels and correctly
re-assembling the packets would be seriously epic, at that point there are
easier ways and makes MITM pointless. So here comes the question, would
Bonding also solve your issue?


On Tue, Nov 14, 2017 at 1:59 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hey folks,
>
> WireGuard has been built with the general rule that unauthenticated
> data doesn't influence state. There has always been one exception to
> this: roaming. The source IP address when roaming is always
> unauthenticated, and replies always happen to the source that prompted
> the reply. This means there is all sorts of mischief you can do. I
> thought it might be useful to write down a bit of this mischief.
>
> If an active man in the middle modifies a source address, he can have
> reply packets sent elsewhere, for a very limited amount of time, until
> either the encapsulated connection is dropped or the key expires and a
> handshake is needed. This kind of disruption, however, isn't that much
> different from what an active man in the middle already can do, by
> just dropping packets, or generating packets, etc.
>
> If an active man in the middle modifies a source address to be a
> server he controls, which then relays encrypted packets between the
> destination and the original source, then the sender and receiver will
> communicate through this server rather than directly. The
> communication is, of course, encrypted and authenticated, so there's
> no chance of tampering. It's mostly then just a waste of bandwidth
> resources of the attacker, to have to relay all of these unreadable
> and unmodifiable packets. However, this does make it possible to
> _extend the duration_ of a man in the middle attack, even if the man
> in the middle can't do anything with the packets. For example, an
> attacker at a coffee shop could change the endpoints to his relay
> server; when you go home, you'd ostensibly still be using that relay
> server.
>
> Is this a meaningful attack? Does anybody care? Can this be used for
> something interesting? When it comes to security of these things,
> "probably" is usually a better answer than "no". For example, even
> though the attacker with the MITM relay can't read or modify any
> packets, he may still be able to do timing correlation attacks, if he
> controls many points on the Internet. But was WireGuard ever supposed
> to protect against correlation issues? Correlation issues already
> exist without the relay anyway. And for what it's worth, Tor doesn't
> really deal with that either. So maybe this doesn't really matter. But
> perhaps there are worse things one can do with this primitive. And
> perhaps there's even further mischief.
>
> There is a mitigating factor in this that further makes it mostly not
> a practical concern: people who are looking up their endpoints using
> DNS are likely to want requery that DNS entry based on its TTL (or
> sooner in the case of dynamic IPs), in which case this aspect of
> extending the duration of an active MITM mostly goes away. However,
> telling people to use DNS to prevent against something something
> doesn't really seem like comprehensive advice. But it is a mitigating
> factor worth mentioning.
>
> So there are two attitudes toward this mischief. The first is to just
> say it doesn't matter. WireGuard's crypto is resilient to all types of
> men in the middle, and the fact of extending the duration of a man in
> the middle doesn't change the fact that WireGuard's crypto is still
> resilient. The other approach would be to add an optional exclamation
> mark to the end of an endpoint specification
> (Endpoint=my.server.whatever.zx2c4.com:51820!), that would prevent
> servers from roaming; the client would still roam in the eyes of the
> server, but the server, would no longer roam in the eyes of the
> client. In other words, an option -- gasp, a nob! -- to disable
> roaming on a per-by-peer one-sided basis. As you know, I don't really
> like nobs. And I'd hate to add this, and then for people to use it,
> and then loose some nice aspects of roaming, if it's not really even
> required.
>
> Regardless of which attitude we pick, I thought it might be a decent
> idea to write this down on the list. This is not really new -- roaming
> has been discussed in the literature for a long time now -- but it is
> interesting. And of course I'm interested to hear your thoughts.
>
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--089e0822392012ab2f055e1d2f67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am by no means an expert in crypto but lets just for the=
 sake of paranoia say that an=C2=A0advanced attacker was able to successful=
ly pull off a MITM like is possible with TLS and rumored OpenVPN.Personally=
, my approach to security is having the mindset of everything can be compro=
mised and basing all decisions on that. So when I think of VPN&#39;s I thin=
k well if someone is listening in, whether it be an ISP or a sophisticated =
encryption cracking farm installed in the Westin building in Seattle.... Ho=
w do I handle this scenario? VPN Bonding, multiple tunnels 2 to a random nu=
mber of tunnels bonded. a successful MITM attack only would see garbled pac=
kets and the complexity in cracking a random number of tunnels and correctl=
y re-assembling the packets would be seriously epic, at that point there ar=
e easier ways and makes MITM pointless. So here comes the question, would B=
onding also solve your=C2=A0issue?<div><br></div></div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On Tue, Nov 14, 2017 at 1:59 AM, Jaso=
n A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"mailto:Jason@zx2c4.com" tar=
get=3D"_blank">Jason@zx2c4.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hey folks,<br>
<br>
WireGuard has been built with the general rule that unauthenticated<br>
data doesn&#39;t influence state. There has always been one exception to<br=
>
this: roaming. The source IP address when roaming is always<br>
unauthenticated, and replies always happen to the source that prompted<br>
the reply. This means there is all sorts of mischief you can do. I<br>
thought it might be useful to write down a bit of this mischief.<br>
<br>
If an active man in the middle modifies a source address, he can have<br>
reply packets sent elsewhere, for a very limited amount of time, until<br>
either the encapsulated connection is dropped or the key expires and a<br>
handshake is needed. This kind of disruption, however, isn&#39;t that much<=
br>
different from what an active man in the middle already can do, by<br>
just dropping packets, or generating packets, etc.<br>
<br>
If an active man in the middle modifies a source address to be a<br>
server he controls, which then relays encrypted packets between the<br>
destination and the original source, then the sender and receiver will<br>
communicate through this server rather than directly. The<br>
communication is, of course, encrypted and authenticated, so there&#39;s<br=
>
no chance of tampering. It&#39;s mostly then just a waste of bandwidth<br>
resources of the attacker, to have to relay all of these unreadable<br>
and unmodifiable packets. However, this does make it possible to<br>
_extend the duration_ of a man in the middle attack, even if the man<br>
in the middle can&#39;t do anything with the packets. For example, an<br>
attacker at a coffee shop could change the endpoints to his relay<br>
server; when you go home, you&#39;d ostensibly still be using that relay<br=
>
server.<br>
<br>
Is this a meaningful attack? Does anybody care? Can this be used for<br>
something interesting? When it comes to security of these things,<br>
&quot;probably&quot; is usually a better answer than &quot;no&quot;. For ex=
ample, even<br>
though the attacker with the MITM relay can&#39;t read or modify any<br>
packets, he may still be able to do timing correlation attacks, if he<br>
controls many points on the Internet. But was WireGuard ever supposed<br>
to protect against correlation issues? Correlation issues already<br>
exist without the relay anyway. And for what it&#39;s worth, Tor doesn&#39;=
t<br>
really deal with that either. So maybe this doesn&#39;t really matter. But<=
br>
perhaps there are worse things one can do with this primitive. And<br>
perhaps there&#39;s even further mischief.<br>
<br>
There is a mitigating factor in this that further makes it mostly not<br>
a practical concern: people who are looking up their endpoints using<br>
DNS are likely to want requery that DNS entry based on its TTL (or<br>
sooner in the case of dynamic IPs), in which case this aspect of<br>
extending the duration of an active MITM mostly goes away. However,<br>
telling people to use DNS to prevent against something something<br>
doesn&#39;t really seem like comprehensive advice. But it is a mitigating<b=
r>
factor worth mentioning.<br>
<br>
So there are two attitudes toward this mischief. The first is to just<br>
say it doesn&#39;t matter. WireGuard&#39;s crypto is resilient to all types=
 of<br>
men in the middle, and the fact of extending the duration of a man in<br>
the middle doesn&#39;t change the fact that WireGuard&#39;s crypto is still=
<br>
resilient. The other approach would be to add an optional exclamation<br>
mark to the end of an endpoint specification<br>
(Endpoint=3Dmy.server.whatever.<wbr>zx2c4.com:51820!), that would prevent<b=
r>
servers from roaming; the client would still roam in the eyes of the<br>
server, but the server, would no longer roam in the eyes of the<br>
client. In other words, an option -- gasp, a nob! -- to disable<br>
roaming on a per-by-peer one-sided basis. As you know, I don&#39;t really<b=
r>
like nobs. And I&#39;d hate to add this, and then for people to use it,<br>
and then loose some nice aspects of roaming, if it&#39;s not really even<br=
>
required.<br>
<br>
Regardless of which attitude we pick, I thought it might be a decent<br>
idea to write this down on the list. This is not really new -- roaming<br>
has been discussed in the literature for a long time now -- but it is<br>
interesting. And of course I&#39;m interested to hear your thoughts.<br>
<br>
Jason<br>
______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
</blockquote></div><br></div>

--089e0822392012ab2f055e1d2f67--
