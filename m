Return-Path: logcabin@fastmail.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 582b7f1f
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 19:30:02 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44ec3a35
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 19:30:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C4AA21813
 for <wireguard@lists.zx2c4.com>; Wed, 18 Apr 2018 15:30:01 -0400 (EDT)
Message-Id: <1524079801.2688027.1342783808.37E4761C@webmail.messagingengine.com>
From: logcabin@fastmail.net
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="_----------=_152407980126880271"
Subject: Re: On redhat 7.4 wireguard not working
In-Reply-To: <CAPGejTdkr5ERbLPR=94do2_w6GddCK4fOP62ofZ=VYuvSNJ40w@mail.gmail.com>
Date: Wed, 18 Apr 2018 15:30:01 -0400
References: <CAPGejTdkr5ERbLPR=94do2_w6GddCK4fOP62ofZ=VYuvSNJ40w@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.

--_----------=_152407980126880271
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

FWIW, tried this on Debian Stretch, no errors:

0:      from all lookup local
32763:  from all lookup main suppress_prefixlength 0
32764:  from all lookup main suppress_prefixlength 0
32765:  not from all fwmark 0xca6c lookup 51820
32766:  from all lookup main
32767:  from all lookup default


On Wed, Apr 18, 2018, at 3:16 PM, Vikas wrote:
> 
> The error i get is:


> 


> 


> Error: argument "suppress_prefixlength" is wrong: Failed to parse
> rule type> 
> Here is the detailed output:
> 


> 


> root@freepbx ~# wg-quick up wg0


> [#] ip link add wg0 type wireguard


> [#] wg setconf wg0 /dev/fd/63


> [#] ip address add 10.1.9.4/16 dev wg0


> [#] ip link set mtu 1420 dev wg0


> [#] ip link set wg0 up


> [#] wg set wg0 fwmark 51820


> [#] ip -4 route add 0.0.0.0/0 dev wg0 table 51820


> [#] ip -4 rule add not fwmark 51820 table 51820


> [#] ip -4 rule add table main suppress_prefixlength 0


> Error: argument "suppress_prefixlength" is wrong: Failed to parse
> rule type> [#] ip -4 rule delete table 51820


> [#] ip link delete dev wg0


> 
> 
> --
> VK
> _________________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--_----------=_152407980126880271
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<!DOCTYPE html>
<html>
<head>
<title></title>
<style type=3D"text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style>
</head>
<body><div style=3D"font-family:Arial;">FWIW, tried this on Debian Stretch,=
 no errors:<br></div>
<div style=3D"font-family:Arial;"><br></div>
<div style=3D"font-family:Arial;">0:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from all=
 lookup local<br></div>
<div style=3D"font-family:Arial;">32763:&nbsp; from all lookup main suppres=
s_prefixlength 0<br></div>
<div style=3D"font-family:Arial;">32764:&nbsp; from all lookup main suppres=
s_prefixlength 0<br></div>
<div style=3D"font-family:Arial;">32765:&nbsp; not from all fwmark 0xca6c l=
ookup 51820<br></div>
<div style=3D"font-family:Arial;">32766:&nbsp; from all lookup main<br></di=
v>
<div style=3D"font-family:Arial;">32767:&nbsp; from all lookup default<br><=
/div>
<div style=3D"font-family:Arial;"><br></div>
<div><br></div>
<div>On Wed, Apr 18, 2018, at 3:16 PM, Vikas wrote:<br></div>
<blockquote type=3D"cite"><div dir=3D"ltr"><div style=3D"font-family:Arial;=
"><span></span><br></div>
<p style=3D"margin: 0px; font-style: normal; font-variant: normal; font-wei=
ght: normal; font-stretch: normal; line-height: normal;"><span style=3D"bac=
kground-color:rgb(255, 255, 255)" class=3D"highlight"><span style=3D"color:=
rgb(0, 0, 0)" class=3D"colour"><span style=3D"font-family:Menlo" class=3D"f=
ont"><span style=3D"font-size:16px" class=3D"size"><span style=3D"font-vari=
ant-ligatures:no-common-ligatures;">The error i get is:</span></span></span=
></span></span><br></p><p style=3D"margin: 0px; font-style: normal; font-va=
riant: normal; font-weight: normal; font-stretch: normal; line-height: norm=
al;"><span style=3D"background-color:rgb(255, 255, 255)" class=3D"highlight=
"><span style=3D"color:rgb(0, 0, 0)" class=3D"colour"><span style=3D"font-f=
amily:Menlo" class=3D"font"><span style=3D"font-size:16px" class=3D"size"><=
span style=3D"font-variant-ligatures:no-common-ligatures;"></span></span></=
span></span></span><br></p><p style=3D"font-style: normal; font-variant: no=
rmal; font-weight: normal; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; =
text-decoration-style: initial; text-decoration-color: initial; margin: 0px=
; font-stretch: normal; line-height: normal;"><span style=3D"background-col=
or:rgb(255, 255, 255)" class=3D"highlight"><span style=3D"color:rgb(0, 0, 0=
)" class=3D"colour"><span style=3D"font-family:Menlo" class=3D"font"><span =
style=3D"font-size:16px" class=3D"size"><span style=3D"font-variant-ligatur=
es:no-common-ligatures;"></span></span></span></span></span><br></p><p styl=
e=3D"font-style: normal; font-variant: normal; font-weight: normal; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; text-decoration-style: initial; te=
xt-decoration-color: initial; margin: 0px; font-stretch: normal; line-heigh=
t: normal;"><span style=3D"background-color:rgb(255, 255, 255)" class=3D"hi=
ghlight"><span style=3D"color:rgb(0, 0, 0)" class=3D"colour"><span style=3D=
"font-family:Menlo" class=3D"font"><span style=3D"font-size:16px" class=3D"=
size"><span style=3D"font-variant-ligatures:no-common-ligatures;">Error: ar=
gument "suppress_prefixlength" is wrong: Failed to parse rule type</span></=
span></span></span></span><br></p><div style=3D"font-family:Arial;"><br></d=
iv>
<div style=3D"font-family:Arial;">Here is the detailed output:<br></div>
<p><br></p><p style=3D"margin: 0px; font-style: normal; font-variant: norma=
l; font-weight: normal; font-stretch: normal; line-height: normal;"><span s=
tyle=3D"background-color:rgb(255, 255, 255)" class=3D"highlight"><span styl=
e=3D"color:rgb(0, 0, 0)" class=3D"colour"><span style=3D"font-family:Menlo"=
 class=3D"font"><span style=3D"font-size:16px" class=3D"size"><span style=
=3D"font-variant-ligatures:no-common-ligatures;"></span></span></span></spa=
n></span><br></p><p style=3D"margin: 0px; font-style: normal; font-variant:=
 normal; font-weight: normal; font-stretch: normal; line-height: normal;"><=
span style=3D"background-color:rgb(255, 255, 255)" class=3D"highlight"><spa=
n style=3D"color:rgb(0, 0, 0)" class=3D"colour"><span style=3D"font-family:=
Menlo" class=3D"font"><span style=3D"font-size:16px" class=3D"size"><span s=
tyle=3D"font-variant-ligatures:no-common-ligatures;">root@freepbx </span><s=
pan style=3D"color:rgb(195, 55, 32)" class=3D"colour">~</span><span style=
=3D"font-variant-ligatures:no-common-ligatures;"># </span><span style=3D"co=
lor:rgb(213, 59, 211)" class=3D"colour">wg-quick</span><span style=3D"font-=
variant-ligatures:no-common-ligatures;"> </span><span style=3D"color:rgb(51=
, 187, 200)" class=3D"colour">up</span><span style=3D"font-variant-ligature=
s:no-common-ligatures;"> </span><span style=3D"color:rgb(51, 187, 200)" cla=
ss=3D"colour">wg0</span></span></span></span></span><br></p><p style=3D"mar=
gin: 0px; font-style: normal; font-variant: normal; font-weight: normal; fo=
nt-stretch: normal; line-height: normal;"><span style=3D"background-color:r=
gb(255, 255, 255)" class=3D"highlight"><span style=3D"color:rgb(0, 0, 0)" c=
lass=3D"colour"><span style=3D"font-family:Menlo" class=3D"font"><span styl=
e=3D"font-size:16px" class=3D"size"><span style=3D"font-variant-ligatures:n=
o-common-ligatures;">[#] ip link add wg0 type wireguard</span></span></span=
></span></span><br></p><p style=3D"margin: 0px; font-style: normal; font-va=
riant: normal; font-weight: normal; font-stretch: normal; line-height: norm=
al;"><span style=3D"background-color:rgb(255, 255, 255)" class=3D"highlight=
"><span style=3D"color:rgb(0, 0, 0)" class=3D"colour"><span style=3D"font-f=
amily:Menlo" class=3D"font"><span style=3D"font-size:16px" class=3D"size"><=
span style=3D"font-variant-ligatures:no-common-ligatures;">[#] wg setconf w=
g0 /dev/fd/63</span></span></span></span></span><br></p><p style=3D"margin:=
 0px; font-style: normal; font-variant: normal; font-weight: normal; font-s=
tretch: normal; line-height: normal;"><span style=3D"background-color:rgb(2=
55, 255, 255)" class=3D"highlight"><span style=3D"color:rgb(0, 0, 0)" class=
=3D"colour"><span style=3D"font-family:Menlo" class=3D"font"><span style=3D=
"font-size:16px" class=3D"size"><span style=3D"font-variant-ligatures:no-co=
mmon-ligatures;">[#] ip address add <a href=3D"http://10.1.9.4/16">10.1.9.4=
/16</a> dev wg0</span></span></span></span></span><br></p><p style=3D"margi=
n: 0px; font-style: normal; font-variant: normal; font-weight: normal; font=
-stretch: normal; line-height: normal;"><span style=3D"background-color:rgb=
(255, 255, 255)" class=3D"highlight"><span style=3D"color:rgb(0, 0, 0)" cla=
ss=3D"colour"><span style=3D"font-family:Menlo" class=3D"font"><span style=
=3D"font-size:16px" class=3D"size"><span style=3D"font-variant-ligatures:no=
-common-ligatures;">[#] ip link set mtu 1420 dev wg0</span></span></span></=
span></span><br></p><p style=3D"margin: 0px; font-style: normal; font-varia=
nt: normal; font-weight: normal; font-stretch: normal; line-height: normal;=
"><span style=3D"background-color:rgb(255, 255, 255)" class=3D"highlight"><=
span style=3D"color:rgb(0, 0, 0)" class=3D"colour"><span style=3D"font-fami=
ly:Menlo" class=3D"font"><span style=3D"font-size:16px" class=3D"size"><spa=
n style=3D"font-variant-ligatures:no-common-ligatures;">[#] ip link set wg0=
 up</span></span></span></span></span><br></p><p style=3D"margin: 0px; font=
-style: normal; font-variant: normal; font-weight: normal; font-stretch: no=
rmal; line-height: normal;"><span style=3D"background-color:rgb(255, 255, 2=
55)" class=3D"highlight"><span style=3D"color:rgb(0, 0, 0)" class=3D"colour=
"><span style=3D"font-family:Menlo" class=3D"font"><span style=3D"font-size=
:16px" class=3D"size"><span style=3D"font-variant-ligatures:no-common-ligat=
ures;">[#] wg set wg0 fwmark 51820</span></span></span></span></span><br></=
p><p style=3D"margin: 0px; font-style: normal; font-variant: normal; font-w=
eight: normal; font-stretch: normal; line-height: normal;"><span style=3D"b=
ackground-color:rgb(255, 255, 255)" class=3D"highlight"><span style=3D"colo=
r:rgb(0, 0, 0)" class=3D"colour"><span style=3D"font-family:Menlo" class=3D=
"font"><span style=3D"font-size:16px" class=3D"size"><span style=3D"font-va=
riant-ligatures:no-common-ligatures;">[#] ip -4 route add <a href=3D"http:/=
/0.0.0.0/0">0.0.0.0/0</a> dev wg0 table 51820</span></span></span></span></=
span><br></p><p style=3D"margin: 0px; font-style: normal; font-variant: nor=
mal; font-weight: normal; font-stretch: normal; line-height: normal;"><span=
 style=3D"background-color:rgb(255, 255, 255)" class=3D"highlight"><span st=
yle=3D"color:rgb(0, 0, 0)" class=3D"colour"><span style=3D"font-family:Menl=
o" class=3D"font"><span style=3D"font-size:16px" class=3D"size"><span style=
=3D"font-variant-ligatures:no-common-ligatures;">[#] ip -4 rule add not fwm=
ark 51820 table 51820</span></span></span></span></span><br></p><p style=3D=
"margin: 0px; font-style: normal; font-variant: normal; font-weight: normal=
; font-stretch: normal; line-height: normal;"><span style=3D"background-col=
or:rgb(255, 255, 255)" class=3D"highlight"><span style=3D"color:rgb(0, 0, 0=
)" class=3D"colour"><span style=3D"font-family:Menlo" class=3D"font"><span =
style=3D"font-size:16px" class=3D"size"><span style=3D"font-variant-ligatur=
es:no-common-ligatures;">[#] ip -4 rule add table main suppress_prefixlengt=
h 0</span></span></span></span></span><br></p><p style=3D"margin: 0px; font=
-style: normal; font-variant: normal; font-weight: normal; font-stretch: no=
rmal; line-height: normal;"><span style=3D"background-color:rgb(255, 255, 2=
55)" class=3D"highlight"><span style=3D"color:rgb(0, 0, 0)" class=3D"colour=
"><span style=3D"font-family:Menlo" class=3D"font"><span style=3D"font-size=
:16px" class=3D"size"><span style=3D"font-variant-ligatures:no-common-ligat=
ures;">Error: argument "suppress_prefixlength" is wrong: Failed to parse ru=
le type</span></span></span></span></span><br></p><p style=3D"margin: 0px; =
font-style: normal; font-variant: normal; font-weight: normal; font-stretch=
: normal; line-height: normal;"><span style=3D"background-color:rgb(255, 25=
5, 255)" class=3D"highlight"><span style=3D"color:rgb(0, 0, 0)" class=3D"co=
lour"><span style=3D"font-family:Menlo" class=3D"font"><span style=3D"font-=
size:16px" class=3D"size"><span style=3D"font-variant-ligatures:no-common-l=
igatures;">[#] ip -4 rule delete table 51820</span></span></span></span></s=
pan><br></p><p style=3D"margin: 0px; font-style: normal; font-variant: norm=
al; font-weight: normal; font-stretch: normal; line-height: normal;"><span =
style=3D"background-color:rgb(255, 255, 255)" class=3D"highlight"><span sty=
le=3D"color:rgb(0, 0, 0)" class=3D"colour"><span style=3D"font-family:Menlo=
" class=3D"font"><span style=3D"font-size:16px" class=3D"size"><span style=
=3D"font-variant-ligatures:no-common-ligatures;">[#] ip link delete dev wg0=
</span></span></span></span></span><br></p><div style=3D"font-family:Arial;=
"><br></div>
<div><div><div style=3D"font-family:Arial;"><br></div>
<div style=3D"font-family:Arial;">--<br></div>
<div style=3D"font-family:Arial;">VK<br></div>
</div>
</div>
</div>
<div><u>_______________________________________________</u><br></div>
<div>WireGuard mailing list<br></div>
<div><a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com=
</a><br></div>
<div><a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard">https:/=
/lists.zx2c4.com/mailman/listinfo/wireguard</a><br></div>
</blockquote><div style=3D"font-family:Arial;"><br></div>
</body>
</html>

--_----------=_152407980126880271--
