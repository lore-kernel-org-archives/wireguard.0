Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c29169ec
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Feb 2017 18:33:31 +0000 (UTC)
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
 [209.85.215.46])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2811bc81
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Feb 2017 18:33:31 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id g134so20216711lfe.1
 for <wireguard@lists.zx2c4.com>; Thu, 23 Feb 2017 10:34:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qvYSmw0gjhnL81WCT7s2BSj7+TNf0F1zJ6CQxOSgp_mw@mail.gmail.com>
References: <CADdae-jjwxrBSw0e5nJNGUQv6Bf=JuiRoKfj5qVS351ExaHtoA@mail.gmail.com>
 <CAHmME9qvYSmw0gjhnL81WCT7s2BSj7+TNf0F1zJ6CQxOSgp_mw@mail.gmail.com>
From: Nicolas Prochazka <nicolas.prochazka@gmail.com>
Date: Thu, 23 Feb 2017 19:34:36 +0100
Message-ID: <CADdae-h1+ixAGJW=qAk8Jx2anu=X2o7-vB0_vTx0KyPNLeWCYA@mail.gmail.com>
Subject: Re: [ wireguard-dev ] dmesg when using ipv6
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=94eb2c1cb94a818557054936dd7a
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1cb94a818557054936dd7a
Content-Type: text/plain; charset=UTF-8

you are right, sorry.
I do a lot of tests  and sometime it seems  wireguard is in  a "strange"
state, I'm trying to reproduce.

A question :
When I've the dmesg, "could not create ipv4 socket", i cannot rmmod
wireguard from kernel.
I'm trying
ip link del dev wg0  ,
rmmod wireguard
there's no wireguard interface, however, i cannot remove wireguard module,
system tells module is used.

When wireguard works well, i can remove module without problem.

Regards,
Nicolas






2017-02-23 18:32 GMT+01:00 Jason A. Donenfeld <Jason@zx2c4.com>:

> Hello,
>
> For the second time today, please provide more debugging information
> than that. Full dmesg output, full configs, exactly what you're doing.
> Otherwise nobody can help you.
>
> Jason
>

--94eb2c1cb94a818557054936dd7a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>you are right, sorry.</div></div><div>I do a lot=
 of tests =C2=A0and sometime it seems =C2=A0wireguard is in =C2=A0a &quot;s=
trange&quot; state, I&#39;m trying to reproduce.</div><div><br></div><div>A=
 question :=C2=A0</div><div>When I&#39;ve the dmesg, &quot;could not create=
 ipv4 socket&quot;, i cannot rmmod wireguard from kernel.</div><div>I&#39;m=
 trying=C2=A0</div><div>ip link del dev wg0 =C2=A0,</div><div>rmmod wiregua=
rd=C2=A0</div><div>there&#39;s no wireguard interface, however, i cannot re=
move wireguard module, system tells module is used.</div><div><br></div><di=
v>When wireguard works well, i can remove module without problem.</div><div=
><br></div><div>Regards,=C2=A0</div><div>Nicolas</div><div>=C2=A0</div><div=
><br></div><div><br></div><div><br></div><div><br></div></div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">2017-02-23 18:32 GMT+01:00 Jas=
on A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"mailto:Jason@zx2c4.com" ta=
rget=3D"_blank">Jason@zx2c4.com</a>&gt;</span>:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Hello,<br>
<br>
For the second time today, please provide more debugging information<br>
than that. Full dmesg output, full configs, exactly what you&#39;re doing.<=
br>
Otherwise nobody can help you.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Jason<br>
</font></span></blockquote></div><br></div>

--94eb2c1cb94a818557054936dd7a--
