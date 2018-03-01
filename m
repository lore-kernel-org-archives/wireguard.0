Return-Path: damian.kaczkowski@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ced2d35d
 for <wireguard@lists.zx2c4.com>; Thu, 1 Mar 2018 15:36:31 +0000 (UTC)
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
 [209.85.128.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b52e5472
 for <wireguard@lists.zx2c4.com>; Thu, 1 Mar 2018 15:36:31 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id z12so7001080wrg.4
 for <wireguard@lists.zx2c4.com>; Thu, 01 Mar 2018 07:45:16 -0800 (PST)
MIME-Version: 1.0
Sender: damian.kaczkowski@gmail.com
In-Reply-To: <CAHmME9rV3simg0dTD7ja-RGWGTSR0dSMgJ20ft1FXPeZyFWamw@mail.gmail.com>
References: <4B7E0154-039F-4008-9C47-C825E1474731@lonnie.abelbeck.com>
 <CAHmME9pL8+FQv_oAKCFpnZQ6ew1xmoKk-RQqtDHktWARvDXH_w@mail.gmail.com>
 <705B40D6-4947-4E5A-A042-B0C8A0D5BB84@lonnie.abelbeck.com>
 <CAHmME9rV3simg0dTD7ja-RGWGTSR0dSMgJ20ft1FXPeZyFWamw@mail.gmail.com>
From: Damian Kaczkowski <damian.kaczkowski+wireguard.lists@gmail.com>
Message-ID: <CAGzienE4uVUo9BEEpQKmoD2vgqtzQQDBOo=h_vMJejxQF5kNzQ@mail.gmail.com>
Subject: Re: [patch] add support for peer names using a file in userspace
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="089e08283dacf47ef705665bbe03"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Date: Thu, 01 Mar 2018 15:36:34 -0000

--089e08283dacf47ef705665bbe03
Content-Type: text/plain; charset="UTF-8"

On 8 December 2017 at 19:45, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Absolutely not. If something like this lands, it will be called
> "Description=" or the like, as another attribute of a peer. There's no
> reason to make the section parser more complicated, when this is
> essentially just another key value.


+1.
Description, Comment, or maybe Name would be handy.
I got > 200 peers. I am getting hard times checking for peer status.
It would be nice to be able to do something like this:

wg | grep -A6 -B6 my_Description_or_Comment

Or maybe even simpler:

wg show peer by_Name

To show current status of selected peer.

--089e08283dacf47ef705665bbe03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 8=
 December 2017 at 19:45, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Absolutely not. If something lik=
e this lands, it will be called<br>
&quot;Description=3D&quot; or the like, as another attribute of a peer. The=
re&#39;s no<br>
reason to make the section parser more complicated, when this is<br>
essentially just another key value.</blockquote><div><br></div><div>

<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial">=
+1.</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial">Description, Comment, or maybe Name would be handy.</div><div styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial">I got &gt=
; 200 peers. I am getting hard times checking for peer status.</div><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial">It woul=
d be nice to be able to do something like this:=C2=A0<br></div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><br></div>=
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial">=
wg | grep -A6 -B6 my_Description_or_Comment<br></div><div style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial"><br></div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial">Or maybe e=
ven simpler:</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial"><br></div><div style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial">wg show peer by_Name<br></div><div style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial"><br></div><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial">To show=
 current status of selected peer.</div>

=C2=A0</div></div></div></div>

--089e08283dacf47ef705665bbe03--
