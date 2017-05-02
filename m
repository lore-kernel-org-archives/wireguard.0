Return-Path: damian.kaczkowski@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd9e636a
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 17:50:20 +0000 (UTC)
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
 [209.85.220.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aba6eee0
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 17:50:20 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id q1so49808450qkd.2
 for <wireguard@lists.zx2c4.com>; Tue, 02 May 2017 10:59:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9q9Z+P7=UTE2Sc9b7tUajjkgG-pnvgpMqBO33AGdwdoyw@mail.gmail.com>
References: <CAGzienFDihyN8fDbKj4KQ-1cwz53_u7Vz3G37P08+wS=hbF0LA@mail.gmail.com>
 <CAHmME9pNgSjXeKnzM23Bb3Q=zZJKMDtq-3xevMzdtP7XdoMjkQ@mail.gmail.com>
 <CAGzienHd=L8tYn41WdjGSk4hvCWiUW8LUi4C8jf8piBhLA=dng@mail.gmail.com>
 <CAHmME9q9Z+P7=UTE2Sc9b7tUajjkgG-pnvgpMqBO33AGdwdoyw@mail.gmail.com>
From: Damian Kaczkowski <damian.kaczkowski@gmail.com>
Date: Tue, 2 May 2017 19:59:12 +0200
Message-ID: <CAGzienGZMTeD6HqQsg36N_g+6faxivOGpBQFF2MmMTzk63iTnw@mail.gmail.com>
Subject: Re: Ability to use one udp port for multiple wg interfaces
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=001a114a82448b00e2054e8e4eea
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114a82448b00e2054e8e4eea
Content-Type: text/plain; charset=UTF-8

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

Anyway, it is not only about roaming case so if it is not much of a work
and if it is not a security problem then please consider to allow multiple
wg interfaces to work on one port. I hope it won't hurt to allow this
functionality and I am sure it might come handy for some admins in the
wild. Maybe it could be implemented in pair with the idea of refactoring
per interface vs per peer private keys? Hope you will consider it at some
point.

Best Regards.
Damian.

--001a114a82448b00e2054e8e4eea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
 May 2017 at 18:32, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; Hello Janson.<b=
r>
<br>
My name is Jason.<br></blockquote><div><br></div><div>Sorry.<br>=C2=A0<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"m_3894523804232733548m_1843689576291276550gmail-">&gt; 3. We=
ll if one uses firewall to control flows between zones in environment<br>
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
similar to match a _precise_ peer.<br></blockquote><div><br></div><div>Ok. =
Thanks for a tip. However I still think wireguard looses some flexibility i=
n that way eg. when peer roams from one network to another then its ip addr=
ess may be unknown.<br><br>Anyway, it is not only about roaming case so if =
it is not much of a work and if it is not a security problem then please co=
nsider to allow multiple wg interfaces to work on one port. I hope it won&#=
39;t hurt to allow this functionality and I am sure it might come handy for=
 some admins in the wild. Maybe it could be implemented in pair with the id=
ea of refactoring per interface vs per peer private keys? Hope you will con=
sider it at some point.<br><br></div><div>Best Regards.<br></div><div>Damia=
n.<br></div><div><br></div></div></div></div>

--001a114a82448b00e2054e8e4eea--
