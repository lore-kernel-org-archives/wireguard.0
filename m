Return-Path: henry.snow@nielsen.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 162a135e
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 17:21:56 +0000 (UTC)
Received: from mail-pl0-x231.google.com (mail-pl0-x231.google.com
 [IPv6:2607:f8b0:400e:c01::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a772d90
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 17:21:56 +0000 (UTC)
Received: by mail-pl0-x231.google.com with SMTP id u6-v6so1677701pls.9
 for <wireguard@lists.zx2c4.com>; Thu, 10 May 2018 10:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAFuSFDHSJ8zezCqKuA+JM5asoWH-B2AYLAN2fbcWCwNE=r33hQ@mail.gmail.com>
 <CAHmME9pocAi6bsEkpycRhz1LQmipzj-=6ztBPPihE8HQ7ZhQDw@mail.gmail.com>
 <CAHmME9oQNfscJCUkoVW4qKoukTKBdCj3MYaW9C4jGW2m0Nm9LA@mail.gmail.com>
 <CAFuSFDEf9gUMW5nOcStnFM22dvAa_mAtMAVnk92m-dRY2xFa5w@mail.gmail.com>
In-Reply-To: <CAFuSFDEf9gUMW5nOcStnFM22dvAa_mAtMAVnk92m-dRY2xFa5w@mail.gmail.com>
From: Henry Snow <henry.snow@nielsen.com>
Date: Thu, 10 May 2018 17:24:29 +0000
Message-ID: <CAFuSFDFziCyiL=J_aom9YTWCM6gpGmY1cC56TroxJJvFcC3GKQ@mail.gmail.com>
Subject: Re: wireguard-dkms and CentOS 7.5
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="00000000000068239b056bdd4b6c"
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--00000000000068239b056bdd4b6c
Content-Type: text/plain; charset="UTF-8"

Well, I might have spoken too soon. As soon as a connection was established
to another wireguard peer (v. 0.0.20180118), the CentOS 7.5 server kernel
panic'd.

Message from syslogd@tun001 at May 10 12:53:12 ...
 kernel:Kernel panic - not syncing: Fatal exception in interrupt

Seeing something along the lines of this in the console output on boot:
[   29.418257] wireguard: loading out-of-tree module taints kernel.
[   29.454659] wireguard: WireGuard 0.0.20180420 loaded. See
www.wireguard.com for information.
[   29.464057] wireguard: Copyright (C) 2015-2018 Jason A. Donenfeld <
Jason@zx2c4.com>. All Rights R.
[   29.598028] ------------[ cut here ]------------
[   29.604356] kernel BUG at mm/slub.c:3601!
[   29.609122] invalid opcode: 0000 [#1] SMP
[   29.614013] Modules linked in: veth vxlan wireguard(OE) bridge stp llc
ip_vs ip6_udp_tunnel udp_tunnel bonding ip


On Thu, May 10, 2018 at 12:31 PM Henry Snow <henry.snow@nielsen.com> wrote:

> Perfect, that patch worked for me. Thank you for the quick fix!
>
>
> On Thu, May 10, 2018 at 12:14 PM Jason A. Donenfeld <Jason@zx2c4.com>
> wrote:
>
>> Hi again,
>>
>> I've fixed that here:
>>
>> https://git.zx2c4.com/WireGuard/patch/?id=94f25e47b23ddeba26120de4ee3c098438fc2251
>>
>> This will be part of the next snapshot. In the meantime, you can apply
>> that manually to the src directory, and perhaps Joe (CCd) can add it
>> to the rpm.
>>
>> Jason
>>
> --
> Henry Snow | Director, Site Reliability Engineering
> eXelate, a Nielsen company <http://exelate.com/>
> E: henry.snow@nielsen.com | M: 347.366.2700 <(347)%20366-2700>
> 675 6th Ave, 3rd Floor, New York, NY 10010
>
-- 
Henry Snow | Director, Site Reliability Engineering
eXelate, a Nielsen company <http://exelate.com/>
E: henry.snow@nielsen.com | M: 347.366.2700
675 6th Ave, 3rd Floor, New York, NY 10010

--00000000000068239b056bdd4b6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Well, I might have spoken too soon. As soon as a connectio=
n was established to another wireguard peer (v. 0.0.20180118), the CentOS 7=
.5 server kernel panic&#39;d.<div><br></div><div><div>Message from syslogd@=
tun001 at May 10 12:53:12 ...</div><div>=C2=A0kernel:Kernel panic - not syn=
cing: Fatal exception in interrupt</div><div><br></div><div>Seeing somethin=
g along the lines of this in the console output on boot:</div><div>[=C2=A0 =
=C2=A029.418257] wireguard: loading out-of-tree module taints kernel.<br></=
div><div>[=C2=A0 =C2=A029.454659] wireguard: WireGuard 0.0.20180420 loaded.=
 See <a href=3D"http://www.wireguard.com">www.wireguard.com</a> for informa=
tion.<br></div><div>[=C2=A0 =C2=A029.464057] wireguard: Copyright (C) 2015-=
2018 Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.=
com</a>&gt;. All Rights R.<br></div><div><div>[=C2=A0 =C2=A029.598028] ----=
--------[ cut here ]------------</div><div>[=C2=A0 =C2=A029.604356] kernel =
BUG at mm/slub.c:3601!</div><div>[=C2=A0 =C2=A029.609122] invalid opcode: 0=
000 [#1] SMP=C2=A0</div></div><div><div>[=C2=A0 =C2=A029.614013] Modules li=
nked in: veth vxlan wireguard(OE) bridge stp llc ip_vs ip6_udp_tunnel udp_t=
unnel bonding ip=C2=A0</div></div><div><br></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr">On Thu, May 10, 2018 at 12:31 PM Henry Snow &lt;<a hr=
ef=3D"mailto:henry.snow@nielsen.com">henry.snow@nielsen.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Perfect, that patc=
h worked for me. Thank you for the quick fix!</div><div dir=3D"ltr"><br><br=
><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, May 10, 2018 at 12:14 =
PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_bla=
nk">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Hi again,<br>
<br>
I&#39;ve fixed that here:<br>
<a href=3D"https://git.zx2c4.com/WireGuard/patch/?id=3D94f25e47b23ddeba2612=
0de4ee3c098438fc2251" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c=
4.com/WireGuard/patch/?id=3D94f25e47b23ddeba26120de4ee3c098438fc2251</a><br=
>
<br>
This will be part of the next snapshot. In the meantime, you can apply<br>
that manually to the src directory, and perhaps Joe (CCd) can add it<br>
to the rpm.<br>
<br>
Jason<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"m_816313123430628=
6268gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><f=
ont color=3D"#808080" style=3D"line-height:normal;font-family:cantarell">He=
nry Snow | Director, Site Reliability Engineering</font><div><font color=3D=
"#808080" style=3D"line-height:normal;font-family:cantarell"><a href=3D"htt=
p://exelate.com/" target=3D"_blank">eXelate, a Nielsen company</a></font><b=
r style=3D"line-height:normal;color:rgb(0,0,0);font-family:cantarell"><font=
 color=3D"#808080" style=3D"line-height:normal;font-family:cantarell">E:=C2=
=A0<a href=3D"mailto:henry.snow@nielsen.com" target=3D"_blank">henry.snow@n=
ielsen.com</a>=C2=A0|=C2=A0</font><span style=3D"color:rgb(128,128,128);fon=
t-family:cantarell;line-height:normal">M: <a href=3D"tel:(347)%20366-2700" =
value=3D"+13473662700" target=3D"_blank">347.366.2700</a></span><br style=
=3D"line-height:normal;color:rgb(0,0,0);font-family:cantarell"><font color=
=3D"#808080" style=3D"line-height:normal;font-family:cantarell">675 6th Ave=
, 3rd Floor, New York, NY 10010=C2=A0</font><br></div></div></div></blockqu=
ote></div></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature"><div dir=3D"ltr"><font color=3D"#808080" st=
yle=3D"line-height:normal;font-family:cantarell">Henry Snow | Director, Sit=
e Reliability Engineering</font><div><font color=3D"#808080" style=3D"line-=
height:normal;font-family:cantarell"><a href=3D"http://exelate.com/">eXelat=
e, a Nielsen company</a></font><br style=3D"line-height:normal;color:rgb(0,=
0,0);font-family:cantarell"><font color=3D"#808080" style=3D"line-height:no=
rmal;font-family:cantarell">E:=C2=A0<a href=3D"mailto:henry.snow@nielsen.co=
m">henry.snow@nielsen.com</a>=C2=A0|=C2=A0</font><span style=3D"color:rgb(1=
28,128,128);font-family:cantarell;line-height:normal">M: 347.366.2700</span=
><br style=3D"line-height:normal;color:rgb(0,0,0);font-family:cantarell"><f=
ont color=3D"#808080" style=3D"line-height:normal;font-family:cantarell">67=
5 6th Ave, 3rd Floor, New York, NY 10010=C2=A0</font><br></div></div></div>

--00000000000068239b056bdd4b6c--
