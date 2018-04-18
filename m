Return-Path: kedia.vikas@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6d3347b
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 19:16:34 +0000 (UTC)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
 [209.85.218.51])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b7ecc3e
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 19:16:34 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id n65-v6so2622730oig.6
 for <wireguard@lists.zx2c4.com>; Wed, 18 Apr 2018 12:16:34 -0700 (PDT)
MIME-Version: 1.0
From: Vikas <kedia.vikas@gmail.com>
Date: Wed, 18 Apr 2018 12:16:32 -0700
Message-ID: <CAPGejTdkr5ERbLPR=94do2_w6GddCK4fOP62ofZ=VYuvSNJ40w@mail.gmail.com>
Subject: On redhat 7.4 wireguard not working
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="00000000000003c7f0056a244ba9"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--00000000000003c7f0056a244ba9
Content-Type: text/plain; charset="UTF-8"

The error i get is:


Error: argument "suppress_prefixlength" is wrong: Failed to parse rule type

Here is the detailed output:


root@freepbx ~# wg-quick up wg0

[#] ip link add wg0 type wireguard

[#] wg setconf wg0 /dev/fd/63

[#] ip address add 10.1.9.4/16 dev wg0

[#] ip link set mtu 1420 dev wg0

[#] ip link set wg0 up

[#] wg set wg0 fwmark 51820

[#] ip -4 route add 0.0.0.0/0 dev wg0 table 51820

[#] ip -4 rule add not fwmark 51820 table 51820

[#] ip -4 rule add table main suppress_prefixlength 0

Error: argument "suppress_prefixlength" is wrong: Failed to parse rule type

[#] ip -4 rule delete table 51820

[#] ip link delete dev wg0


--
VK

--00000000000003c7f0056a244ba9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">




<span></span>





<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:16px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>The error i get is:</span></p><p class=3D"gmail-p1" style=3D"margin:0px;fo=
nt-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;=
font-size:16px;line-height:normal;font-family:Menlo;color:rgb(0,0,0);backgr=
ound-color:rgb(255,255,255)"><span class=3D"gmail-s1" style=3D"font-variant=
-ligatures:no-common-ligatures"></span></p><p class=3D"gmail-p1" style=3D"f=
ont-style:normal;font-variant:normal;font-weight:normal;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;margin:0px;font-stretch:normal;font-siz=
e:16px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=
=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"><br></sp=
an></p><p class=3D"gmail-p1" style=3D"font-style:normal;font-variant:normal=
;font-weight:normal;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
margin:0px;font-stretch:normal;font-size:16px;line-height:normal;font-famil=
y:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-li=
gatures:no-common-ligatures">Error: argument &quot;suppress_prefixlength&qu=
ot; is wrong: Failed to parse rule type</span></p><br class=3D"gmail-Apple-=
interchange-newline">Here is the detailed output:<p></p><p class=3D"gmail-p=
1" style=3D"margin:0px;font-style:normal;font-variant:normal;font-weight:no=
rmal;font-stretch:normal;font-size:16px;line-height:normal;font-family:Menl=
o;color:rgb(0,0,0);background-color:rgb(255,255,255)"><span class=3D"gmail-=
s1" style=3D"font-variant-ligatures:no-common-ligatures"><br></span></p><p =
class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:norma=
l;font-weight:normal;font-stretch:normal;font-size:16px;line-height:normal;=
font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><span=
 class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">ro=
ot@freepbx </span><span class=3D"gmail-s2" style=3D"font-variant-ligatures:=
no-common-ligatures;color:rgb(195,55,32)">~</span><span class=3D"gmail-s1" =
style=3D"font-variant-ligatures:no-common-ligatures"># </span><span class=
=3D"gmail-s3" style=3D"font-variant-ligatures:no-common-ligatures;color:rgb=
(213,59,211)">wg-quick</span><span class=3D"gmail-s1" style=3D"font-variant=
-ligatures:no-common-ligatures"> </span><span class=3D"gmail-s4" style=3D"f=
ont-variant-ligatures:no-common-ligatures;color:rgb(51,187,200)">up</span><=
span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures=
"> </span><span class=3D"gmail-s4" style=3D"font-variant-ligatures:no-commo=
n-ligatures;color:rgb(51,187,200)">wg0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:16px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>[#] ip link add wg0 type wireguard</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:16px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>[#] wg setconf wg0 /dev/fd/63</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:16px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>[#] ip address add <a href=3D"http://10.1.9.4/16">10.1.9.4/16</a> dev wg0<=
/span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:16px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>[#] ip link set mtu 1420 dev wg0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:16px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>[#] ip link set wg0 up</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:16px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>[#] wg set wg0 fwmark 51820</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:16px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>[#] ip -4 route add <a href=3D"http://0.0.0.0/0">0.0.0.0/0</a> dev wg0 tab=
le 51820</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:16px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>[#] ip -4 rule add not fwmark 51820 table 51820</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:16px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>[#] ip -4 rule add table main suppress_prefixlength 0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:16px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>Error: argument &quot;suppress_prefixlength&quot; is wrong: Failed to pars=
e rule type</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:16px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>[#] ip -4 rule delete table 51820</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:16px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>[#] ip link delete dev wg0</span></p>


<br clear=3D"all"><div><div class=3D"gmail_signature" data-smartmail=3D"gma=
il_signature"><br>--<br>VK</div></div>
</div>

--00000000000003c7f0056a244ba9--
