Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3fea0cc2
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 19:35:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20566375
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 19:35:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 249eca21
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 19:35:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3779afd7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 19:35:33 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id e65so24906888ita.1
 for <wireguard@lists.zx2c4.com>; Tue, 02 May 2017 12:45:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGzienGZMTeD6HqQsg36N_g+6faxivOGpBQFF2MmMTzk63iTnw@mail.gmail.com>
References: <CAGzienFDihyN8fDbKj4KQ-1cwz53_u7Vz3G37P08+wS=hbF0LA@mail.gmail.com>
 <CAHmME9pNgSjXeKnzM23Bb3Q=zZJKMDtq-3xevMzdtP7XdoMjkQ@mail.gmail.com>
 <CAGzienHd=L8tYn41WdjGSk4hvCWiUW8LUi4C8jf8piBhLA=dng@mail.gmail.com>
 <CAHmME9q9Z+P7=UTE2Sc9b7tUajjkgG-pnvgpMqBO33AGdwdoyw@mail.gmail.com>
 <CAGzienGZMTeD6HqQsg36N_g+6faxivOGpBQFF2MmMTzk63iTnw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 2 May 2017 21:45:05 +0200
Message-ID: <CAHmME9rReXuDHmGTU8k7+ryu3pWSMHR0aGfaFWQzWhAnZy9DjA@mail.gmail.com>
Subject: Re: Ability to use one udp port for multiple wg interfaces
To: Damian Kaczkowski <damian.kaczkowski@gmail.com>
Content-Type: multipart/alternative; boundary=001a113d3c6ad58122054e8fc6a3
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113d3c6ad58122054e8fc6a3
Content-Type: text/plain; charset=UTF-8

On May 2, 2017 19:59, "Damian Kaczkowski" <damian.kaczkowski@gmail.com>
wrote:

On 2 May 2017 at 18:32, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> > Hello Janson.
>
> My name is Jason.
>

Sorry.


> > 3. Well if one uses firewall to control flows between zones in
> environment
> > with mix protocols (eg. gre, ipsec, openvpn and so on) then using second
> > tool just to control only wireguard ACLs is not very convenient way from
> > administrative point of view. Also in case where peer is roaming and
> > changing its source IP (eg. road warrior) then maintaining wireguard ACLs
> > will be a huge PITA, if not impossible at large scale.
>
> No, you are wrong. Allowed-ips controls the IP addresses _within_ the
> tunnel. Thus your iptables rules can use "-i wg0 -s 10.0.0.3/32" or
> similar to match a _precise_ peer.
>

Ok. Thanks for a tip. However I still think wireguard looses some
flexibility in that way eg. when peer roams from one network to another
then its ip address may be unknown.



No, wrong. Roaming regards external IP. Allowed IPs regards internal tunnel
IPs, which are static.


Anyway, it is not only about roaming case so if it is not much of a work
and if it is not a security problem then please consider to allow multiple
wg interfaces to work on one port. I hope it won't hurt to allow this
functionality and I am sure it might come handy for some admins in the
wild. Maybe it could be implemented in pair with the idea of refactoring
per interface vs per peer private keys? Hope you will consider it at some
point.


No, you are very mistaken. Please reread the docs on allowed ips keeping in
mind that these concern internal tunneled ips and are static. Typing to you
on my phone so can't write more now.


Best Regards.
Damian.

--001a113d3c6ad58122054e8fc6a3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div data-smartmail=3D"gmail_signature"><br></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On May 2, 2017 19:5=
9, &quot;Damian Kaczkowski&quot; &lt;<a href=3D"mailto:damian.kaczkowski@gm=
ail.com">damian.kaczkowski@gmail.com</a>&gt; wrote:<br type=3D"attribution"=
><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><div class=3D"quoted-text">On 2 May 2017 at 18:32, Ja=
son A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"mailto:Jason@zx2c4.com" t=
arget=3D"_blank">Jason@zx2c4.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">&gt; Hello Janson.<br>
<br>
My name is Jason.<br></blockquote><div><br></div></div><div>Sorry.<br>=C2=
=A0<br></div><div class=3D"quoted-text"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<span class=3D"m_7906688559048991096m_3894523804232733548m_1843689576291276=
550gmail-">&gt; 3. Well if one uses firewall to control flows between zones=
 in environment<br>
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
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">No, wrong. Roaming regards external IP. Allowed IPs regards inter=
nal tunnel IPs, which are static.</div><div dir=3D"auto"><div class=3D"gmai=
l_extra"><div class=3D"gmail_quote"><blockquote class=3D"quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div><br>Anyway, i=
t is not only about roaming case so if it is not much of a work and if it i=
s not a security problem then please consider to allow multiple wg interfac=
es to work on one port. I hope it won&#39;t hurt to allow this functionalit=
y and I am sure it might come handy for some admins in the wild. Maybe it c=
ould be implemented in pair with the idea of refactoring per interface vs p=
er peer private keys? Hope you will consider it at some point.<br></div></d=
iv></div></div></blockquote></div></div></div><div dir=3D"auto"><br></div><=
div dir=3D"auto">No, you are very mistaken. Please reread the docs on allow=
ed ips keeping in mind that these concern internal tunneled ips and are sta=
tic. Typing to you on my phone so can&#39;t write more now.</div><div dir=
=3D"auto"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote=
 class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gma=
il_quote"><div><br></div><div>Best Regards.<font color=3D"#888888"><br></fo=
nt></div><font color=3D"#888888"><div>Damian.<br></div><div><br></div></fon=
t></div></div></div>
</blockquote></div><br></div></div></div>

--001a113d3c6ad58122054e8fc6a3--
