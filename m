Return-Path: reuben.m.work@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14ccc898
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 22:56:43 +0000 (UTC)
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e7a0c49
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 22:56:43 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id k8-v6so3606358uaq.12
 for <wireguard@lists.zx2c4.com>; Fri, 10 Aug 2018 16:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
 <1635651d-7119-8ffb-a829-617dc9b9bb0d@web.de>
In-Reply-To: <1635651d-7119-8ffb-a829-617dc9b9bb0d@web.de>
From: Reuben Martin <reuben.m.work@gmail.com>
Date: Fri, 10 Aug 2018 18:07:56 -0500
Message-ID: <CALJ2VGZbmCpGYY+sT6VnDdRJK_OVBzfES-_G-+QsM3OGH2-3jg@mail.gmail.com>
Subject: Re: Reflections on WireGuard Design Goals
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="00000000000018fc1805731cd16b"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--00000000000018fc1805731cd16b
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 10, 2018, 3:16 PM em12345 <em12345@web.de> wrote:

> Hi,
>
> > From my point of view, the only thing which makes me uncomfortable about
> > wireguard is the lack of any second authentication factor. Your private
> > key is embedded in a plaintext file in your device (e.g. laptop), not
> > even protected with a passphrase.
>
> Most VPN authentications are just authorizing the machine and not the
> user sitting in front of that machine.
>
> > Anyone who gains access to that
> > laptop is able to establish wireguard connections.
> >
> > Of course, it can be argued that the laptop holds other information
> > which is more valuable that the wireguard key, therefore you should
> > concentrate on properly securing the laptop itself (*). Furthermore,
>
> No matter how much keys, passwords or tokens have to be entered by the
> user sitting in front of that machine, any other user already on that
> machine, will gain sooner or later access to the tunnel. This user or
> attacker doesn't even need to see/know wireguard's private key nor does
> the attacker need root access. Think of a second user logged in on that
> machine.
>
> It is definitely a bad idea to assume that the tunnel traffic of one
> "client" (in terms of wg's client key pair) comes from a specific user.
> Which also means that even multi factor VPN authentication still require
> all services inside the tunnel to ask for user authentication.
>

It should me noted that it is possible to isolate the VPN access to a
specific user if you assign login sessions to isolated network namespaces
and place the wireguard interface within the user's namespace.

-Reuben

>

--00000000000018fc1805731cd16b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Fri, Aug 10, 2018, 3:16 PM em12345 &lt;<a href=3D"mailto:em12345@web.de"=
>em12345@web.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<=
br>
<br>
&gt; From my point of view, the only thing which makes me uncomfortable abo=
ut<br>
&gt; wireguard is the lack of any second authentication factor. Your privat=
e<br>
&gt; key is embedded in a plaintext file in your device (e.g. laptop), not<=
br>
&gt; even protected with a passphrase.<br>
<br>
Most VPN authentications are just authorizing the machine and not the<br>
user sitting in front of that machine.<br>
<br>
&gt; Anyone who gains access to that<br>
&gt; laptop is able to establish wireguard connections.<br>
&gt;<br>
&gt; Of course, it can be argued that the laptop holds other information<br=
>
&gt; which is more valuable that the wireguard key, therefore you should<br=
>
&gt; concentrate on properly securing the laptop itself (*). Furthermore,<b=
r>
<br>
No matter how much keys, passwords or tokens have to be entered by the<br>
user sitting in front of that machine, any other user already on that<br>
machine, will gain sooner or later access to the tunnel. This user or<br>
attacker doesn&#39;t even need to see/know wireguard&#39;s private key nor =
does<br>
the attacker need root access. Think of a second user logged in on that<br>
machine.<br>
<br>
It is definitely a bad idea to assume that the tunnel traffic of one<br>
&quot;client&quot; (in terms of wg&#39;s client key pair) comes from a spec=
ific user.<br>
Which also means that even multi factor VPN authentication still require<br=
>
all services inside the tunnel to ask for user authentication.<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">It should me =
noted that it is possible to isolate the VPN access to a specific user if y=
ou assign login sessions to isolated network namespaces and place the wireg=
uard interface within the user&#39;s namespace.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">-Reuben</div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"></blockquote></div></div></div>

--00000000000018fc1805731cd16b--
