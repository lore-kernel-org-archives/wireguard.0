Return-Path: rcwhelan@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66b8096a
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jun 2018 11:10:31 +0000 (UTC)
Received: from mail-qt0-x22a.google.com (mail-qt0-x22a.google.com
 [IPv6:2607:f8b0:400d:c0d::22a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f0f3ab6
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jun 2018 11:10:31 +0000 (UTC)
Received: by mail-qt0-x22a.google.com with SMTP id p23-v6so15103896qtn.6
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jun 2018 04:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20180602201143.GC5571@puffer.in.lylie.net>
In-Reply-To: <20180602201143.GC5571@puffer.in.lylie.net>
From: Ryan Whelan <rcwhelan@gmail.com>
Date: Mon, 4 Jun 2018 07:13:06 -0400
Message-ID: <CAM3m09Q8-=juJ-wtQRB6LkHqExjLiibme9cbmgLVAtcjap7HwQ@mail.gmail.com>
Subject: Re: peer key in file
To: jungleboogie0@gmail.com
Content-Type: multipart/alternative; boundary="0000000000001706ce056dcf050d"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000001706ce056dcf050d
Content-Type: text/plain; charset="UTF-8"

if using bash -

wg set tun0 peer $(cat peerfile) allowed-ips 0.0.0.0/0 endpoint
192.168.0.1:7394



On Sat, Jun 2, 2018 at 4:12 PM Jungle Boogie <jungleboogie0@gmail.com>
wrote:

> Hi All,
>
> I know the private key can be specified via file, but what about the peer
> key?
>
> wg set tun0 peer ./peerfile allowed-ips 0.0.0.0/0 endpoint
> 192.168.0.1:7394
>
> Thanks!
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000001706ce056dcf050d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">if using bash -=C2=A0<div><br></div><div>

<span style=3D"color:rgb(34,34,34);font-family:sans-serif;font-size:13px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline">wg set tun0 peer $(cat peerfile) allowed-ips<span>=C2=A0=
</span></span><a href=3D"http://0.0.0.0/0" rel=3D"noreferrer" target=3D"_bl=
ank" style=3D"color:rgb(17,85,204);font-family:sans-serif;font-size:13px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255)">0.0.0.0/0</a><span style=3D"color:rgb(34,34,34);font-family:sans-se=
rif;font-size:13px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline"><span>=C2=A0</span>endpoint<span>=
=C2=A0</span></span><a href=3D"http://192.168.0.1:7394/" rel=3D"noreferrer"=
 target=3D"_blank" style=3D"color:rgb(17,85,204);font-family:sans-serif;fon=
t-size:13px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255)">192.168.0.1:7394</a>

<br><div><br></div><div><br></div></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr">On Sat, Jun 2, 2018 at 4:12 PM Jungle Boogie &lt;<a href=
=3D"mailto:jungleboogie0@gmail.com">jungleboogie0@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hi All,<br>
<br>
I know the private key can be specified via file, but what about the peer k=
ey?<br>
<br>
wg set tun0 peer ./peerfile allowed-ips <a href=3D"http://0.0.0.0/0" rel=3D=
"noreferrer" target=3D"_blank">0.0.0.0/0</a> endpoint <a href=3D"http://192=
.168.0.1:7394" rel=3D"noreferrer" target=3D"_blank">192.168.0.1:7394</a><br=
>
<br>
Thanks!<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--0000000000001706ce056dcf050d--
