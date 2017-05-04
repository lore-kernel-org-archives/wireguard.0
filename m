Return-Path: rcwhelan@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0acfdd5
 for <wireguard@lists.zx2c4.com>; Thu, 4 May 2017 18:31:35 +0000 (UTC)
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
 [209.85.161.169])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74184f23
 for <wireguard@lists.zx2c4.com>; Thu, 4 May 2017 18:31:35 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id l18so11083103ywh.3
 for <wireguard@lists.zx2c4.com>; Thu, 04 May 2017 11:41:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oeaMNrbN1Eek=0p7xR54oCZgBRVjnR-UgcQAoPaJczGQ@mail.gmail.com>
References: <CAM3m09RKuXF=HkvGFpH3=VxW2PvqDx2BpB3yfLkMcZgLhm_X9w@mail.gmail.com>
 <CAHmME9p0L8WjCvcrtk+8AeOxmnExSK5YhnCcNbYmxmp_Yc_ejg@mail.gmail.com>
 <CAHmME9oeaMNrbN1Eek=0p7xR54oCZgBRVjnR-UgcQAoPaJczGQ@mail.gmail.com>
From: Ryan Whelan <rcwhelan@gmail.com>
Date: Thu, 4 May 2017 14:41:22 -0400
Message-ID: <CAM3m09QjwL9cyU66VXA0B8o88BcMiqTXm5Qhp-DKkaYu_A8PfA@mail.gmail.com>
Subject: Re: Specifying the source port
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=94eb2c0bcc3e9e68a6054eb71e6d
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c0bcc3e9e68a6054eb71e6d
Content-Type: text/plain; charset=UTF-8

If i'm not mistaken that sets the listing port on one end (Peer 'A') of the
connection.  Peer 'B' needs to know what the listening port is set to, to
be able to setup the handshake.  So from peer 'B's perspective, the dst
port is the "listen-port' on Peer 'A'.... How do I set the src port for
peer 'B' so all traffic from B will come from a predicable source port?

I'm sorry if i'm not being clear- I very well might not be using the right
terminology

ryan

On Thu, May 4, 2017 at 2:35 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> "ListenPort", " listen-port"
>
> On May 4, 2017 20:21, "Ryan Whelan" <rcwhelan@gmail.com> wrote:
>
> Hello!
>
> When specifying an endpoint, you have to tell wg which dst port the peer
> is listening on- is it possible to tell wg which source port to send
> traffic from?  I've looked over the documentation and if its in there, I
> managed to miss it.
>
> Thanks!
>
> ryan
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
>

--94eb2c0bcc3e9e68a6054eb71e6d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If i&#39;m not mistaken that sets the listing port on one =
end (Peer &#39;A&#39;) of the connection.=C2=A0 Peer &#39;B&#39; needs to k=
now what the listening port is set to, to be able to setup the handshake.=
=C2=A0 So from peer &#39;B&#39;s perspective, the dst port is the &quot;lis=
ten-port&#39; on Peer &#39;A&#39;.... How do I set the src port for peer &#=
39;B&#39; so all traffic from B will come from a predicable source port?<di=
v><br></div><div>I&#39;m sorry if i&#39;m not being clear- I very well migh=
t not be using the right terminology</div><div><br></div><div>ryan =C2=A0</=
div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu,=
 May 4, 2017 at 2:35 PM, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div>&quot;Lis=
tenPort&quot;, &quot; listen-port&quot;<br><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote"><div><div class=3D"h5">On May 4, 2017 20:21, &quo=
t;Ryan Whelan&quot; &lt;<a href=3D"mailto:rcwhelan@gmail.com" target=3D"_bl=
ank">rcwhelan@gmail.com</a>&gt; wrote:<br type=3D"attribution"></div></div>=
<blockquote class=3D"m_-5814849043790190054quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5"><div =
dir=3D"ltr">Hello!<div><br></div><div>When specifying an endpoint, you have=
 to tell wg which dst port the peer is listening on- is it possible to tell=
 wg which source port to send traffic from?=C2=A0 I&#39;ve looked over the =
documentation and if its in there, I managed to miss it.</div><div><br></di=
v><div>Thanks!</div><font color=3D"#888888"><div><br></div><div>ryan</div><=
/font></div>
<br></div></div>______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailma<wbr>n/listinfo/wire=
guard</a><br>
<br></blockquote></div><br></div></div></div>
</blockquote></div><br></div>

--94eb2c0bcc3e9e68a6054eb71e6d--
