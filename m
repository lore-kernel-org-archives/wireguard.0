Return-Path: jimb245@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21bcb972
 for <wireguard@lists.zx2c4.com>; Wed, 2 May 2018 18:30:02 +0000 (UTC)
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7fcbe36
 for <wireguard@lists.zx2c4.com>; Wed, 2 May 2018 18:30:02 +0000 (UTC)
Received: by mail-lf0-x244.google.com with SMTP id y72-v6so8557454lfd.2
 for <wireguard@lists.zx2c4.com>; Wed, 02 May 2018 11:31:47 -0700 (PDT)
MIME-Version: 1.0
From: Jim Brandt <jimb245@gmail.com>
Date: Wed, 02 May 2018 18:31:35 +0000
Message-ID: <CA+bEQRmXzZQAL7fhmvNwdVrXg8vhwOi59W_W=DOLo1s5b1vo+Q@mail.gmail.com>
Subject: Access to server's local network
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="0000000000009d0306056b3d4cba"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000009d0306056b3d4cba
Content-Type: text/plain; charset="UTF-8"

Hi,

I set up WireGuard on two Ras Pi's, one acting as a vpn server and the
other as a portable access point. The server uses only its eth0 interface.
The access point uses one wifi interface for the public side, and another
wifi plus eth0 for clients. The iptables are similar to www.ckn.io.
Packets leaving the wg0 interface on the access point are NATed.

 I'd like to allow clients to access the server's local subnet as well as
routing to the public net but do not see how to do it.  Packets sent to a
local ip seem to get dropped at the server end of the tunnel because that
is as far as a traceroute can go, and tcpdump does not show the packets
arriving at the wg0 interface. Packets to public ip's work as expected.
ProxyARP is enabled on the server but that does not seem to be the current
issue. Could anyone suggest a way to do this?

Client wg-quick config:

[Interface]
Address = 10.200.200.3/32
DNS = 10.200.200.1
PrivateKey = ...
MTU = 1500

[Peer]
PublicKey = ...
AllowedIPs = 0.0.0.0/0
Endpoint = 10.0.0.23:51820
PersistentKeepalive = 21

server wg-quick config:

[Interface]
Address = 10.200.200.1/32
ListenPort = 51820
PrivateKey = ...
MTU = 1500

[Peer]
PublicKey = ...
AllowedIPs = 10.200.200.3/32

sudo ip route show:

default via 10.0.0.1 dev eth0 src 10.0.0.23 metric 202
10.0.0.0/24 dev eth0 proto kernel scope link src 10.0.0.23 metric 202
10.200.200.3 dev wg0 scope link

Click here to Reply or Forward
64.86 GB (30%) of 215 GB used
Manage <https://www.google.com/settings/u/0/storage?hl=en>
Terms <https://www.google.com/intl/en/policies/terms/> - Privacy
<https://www.google.com/intl/en/policies/privacy/>
Last account activity: 1 minute ago
Details

--0000000000009d0306056b3d4cba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"color:rgb(0,0,0);font-family:arial,sans-seri=
f;font-size:medium;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-d=
ecoration-style:initial;text-decoration-color:initial;min-height:100%"><div=
 class=3D"gmail-nH" style=3D"width:994px"><div class=3D"gmail-nH" style=3D"=
"><div class=3D"gmail-nH gmail-bkL"><div class=3D"gmail-no" style=3D"float:=
left"><div class=3D"gmail-nH gmail-bkK gmail-nn" style=3D"min-height:1px;fl=
oat:left;width:792px"><div class=3D"gmail-nH"><div class=3D"gmail-nH"><div =
class=3D"gmail-nH gmail-ar4 gmail-z"><div class=3D"gmail-aeI"><div class=3D=
"gmail-AO" style=3D""><div id=3D"gmail-:4" class=3D"gmail-Tm gmail-aeJ gmai=
l-bt0" style=3D"padding-right:4px;background:rgb(255,255,255);overflow-y:sc=
roll;height:524px"><div id=3D"gmail-:2" class=3D"gmail-aeF" style=3D"paddin=
g:0px;vertical-align:bottom;min-height:334px"><div class=3D"gmail-nH"><div =
class=3D"gmail-nH"><div class=3D"gmail-nH gmail-g"><table class=3D"gmail-Bs=
 gmail-nH gmail-iY gmail-bAt" cellpadding=3D"0" style=3D"padding:0px;border=
-collapse:collapse;width:772px"><tbody><tr><td class=3D"gmail-Bu gmail-bAn"=
 style=3D"font-family:arial,sans-serif;margin:0px;vertical-align:top;paddin=
g:0px;background:rgb(255,255,255)"><div class=3D"gmail-nH gmail-if" style=
=3D"margin:0px 8px 0px 0px"><div class=3D"gmail-nH gmail-aHU" style=3D""><d=
iv class=3D"gmail-nH gmail-hx" style=3D"background-color:transparent;color:=
rgb(34,34,34);min-width:502px;padding:4px 0px"><div class=3D"gmail-nH"><div=
 class=3D"gmail-h7 gmail-ie gmail-nH gmail-oy8Mbf" tabindex=3D"-1" style=3D=
"clear:both;padding-bottom:0px;max-width:100000px;outline:none"><div class=
=3D"gmail-Bk" style=3D"margin-bottom:0px;border-width:0px;border-top-style:=
solid;border-right-style:initial;border-bottom-style:initial;border-left-st=
yle:initial;border-top-color:rgb(239,239,239);border-right-color:initial;bo=
rder-left-color:initial;border-bottom-color:initial;border-radius:0px;width=
:764px;float:none"><div class=3D"gmail-G3 gmail-G2" style=3D"padding-top:0p=
x;background-color:transparent;border-width:1px 0px 0px;border-right-style:=
initial;border-bottom-style:initial;border-left-style:initial;border-right-=
color:initial;border-bottom-color:rgb(216,216,216);border-left-color:initia=
l;border-top-style:solid;border-top-color:rgb(216,216,216);border-radius:0p=
x;margin-bottom:0px;margin-left:0px;margin-right:0px"><div><div id=3D"gmail=
-:2i"><div class=3D"gmail-adn gmail-ads" style=3D"border-left:1px solid tra=
nsparent;padding-bottom:20px;padding-left:4px"><div class=3D"gmail-gs" styl=
e=3D"margin-left:30px"><div id=3D"gmail-:2f" class=3D"gmail-ii gmail-gt" st=
yle=3D"font-size:12.8px;direction:ltr;margin:5px 15px 0px 0px;padding-botto=
m:5px"><div id=3D"gmail-:2g" class=3D"gmail-a3s gmail-aXjCH" style=3D"overf=
low:hidden"><div dir=3D"ltr"><div><br class=3D"gmail-Apple-interchange-newl=
ine">Hi,</div><div><br></div><div>I set up WireGuard on two Ras Pi&#39;s, o=
ne acting as a vpn server and the other as a portable access point. The ser=
ver uses only its eth0 interface. The access point uses one wifi interface =
for the public side, and another wifi plus eth0 for clients. The iptables a=
re similar to<span>=C2=A0</span><a href=3D"http://www.ckn.io/" target=3D"_b=
lank" style=3D"color:rgb(17,85,204)">www.ckn.io</a>.=C2=A0 Packets leaving =
the wg0 interface on the access point are NATed.</div><div><br></div><div>=
=C2=A0I&#39;d like to allow clients to access the server&#39;s local subnet=
 as well as routing to the public net but do not see how to do it.=C2=A0 Pa=
ckets sent to a local ip seem to get dropped at the server end of the tunne=
l because that is as far as a traceroute can go, and tcpdump does not show =
the packets arriving at the wg0 interface. Packets to public ip&#39;s work =
as expected. ProxyARP is enabled on the server but that does not seem to be=
 the current issue. Could anyone suggest a way to do this?</div><div><br></=
div><div>Client wg-quick config:</div><div><br></div><div><div>[Interface]<=
/div><div>Address =3D<span>=C2=A0</span><a href=3D"http://10.200.200.3/32" =
target=3D"_blank" style=3D"color:rgb(17,85,204)">10.200.200.3/32</a></div><=
div>DNS =3D 10.200.200.1</div><div>PrivateKey =3D ...</div><div>MTU =3D 150=
0</div><div><br></div><div>[Peer]</div><div>PublicKey =3D ...</div><div>All=
owedIPs =3D<span>=C2=A0</span><a href=3D"http://0.0.0.0/0" target=3D"_blank=
" style=3D"color:rgb(17,85,204)">0.0.0.0/0</a></div><div>Endpoint =3D<span>=
=C2=A0</span><a href=3D"http://10.0.0.23:51820/" target=3D"_blank" style=3D=
"color:rgb(17,85,204)">10.0.0.23:51820</a></div><div>PersistentKeepalive =
=3D 21</div></div><div><br></div><div>server wg-quick config:</div><div><br=
></div><div><div>[Interface]</div><div>Address =3D<span>=C2=A0</span><a hre=
f=3D"http://10.200.200.1/32" target=3D"_blank" style=3D"color:rgb(17,85,204=
)">10.200.200.1/32</a></div><div>ListenPort =3D 51820</div><div>PrivateKey =
=3D ...</div><div>MTU =3D 1500</div><div><br></div><div>[Peer]</div><div>Pu=
blicKey =3D ...</div><div>AllowedIPs =3D<span>=C2=A0</span><a href=3D"http:=
//10.200.200.3/32" target=3D"_blank" style=3D"color:rgb(17,85,204)">10.200.=
200.3/32</a></div></div><div><br></div><div>sudo ip route show:</div><div><=
br></div><div><div>default via 10.0.0.1 dev eth0 src 10.0.0.23 metric 202=
=C2=A0</div><div><a href=3D"http://10.0.0.0/24" target=3D"_blank" style=3D"=
color:rgb(17,85,204)">10.0.0.0/24</a><span>=C2=A0</span>dev eth0 proto kern=
el scope link src 10.0.0.23 metric 202=C2=A0</div><div>10.200.200.3 dev wg0=
 scope link=C2=A0</div></div><div class=3D"gmail-yj6qo"></div><div class=3D=
"gmail-adL"><br></div></div></div></div><div class=3D"gmail-hi" style=3D"bo=
rder-bottom-left-radius:1px;border-bottom-right-radius:1px;padding:0px;widt=
h:auto;background:rgb(242,242,242);margin:0px"></div></div><div class=3D"gm=
ail-ajx" style=3D"clear:both"></div></div><div class=3D"gmail-gA gmail-gt g=
mail-acV" style=3D"font-size:12.8px;padding:0px;width:auto;border-bottom-le=
ft-radius:0px;border-bottom-right-radius:0px;border-top:none;margin:0px;bac=
kground:transparent"><div class=3D"gmail-gB gmail-xu" style=3D"border-top:0=
px;padding:0px"><div class=3D"gmail-ip gmail-iq" style=3D"clear:both;margin=
:0px 5px 0px 0px;padding:8px 0px 0px 4px;border-top:1px solid rgb(216,216,2=
16)"><div id=3D"gmail-:2e"><table class=3D"gmail-cf gmail-wS" style=3D"bord=
er-collapse:collapse"><tbody><tr><td class=3D"gmail-amq" style=3D"font-fami=
ly:arial,sans-serif;margin:0px;padding:0px 8px 1px 1px;vertical-align:top;w=
idth:44px"><img id=3D"gmail-:0_2" name=3D":0" src=3D"https://plus.google.co=
m/u/0/_/focus/photos/public/AIbEiAIAAABDCKTakv3R466XCSILdmNhcmRfcGhvdG8qKDJ=
iNjFmYWE3YTAyNGJkMjE4ZGZhMDQ3MWVlNmMwYWM5ZDRkYmJlZjcwAZOgWxqa5P8ncaK12Pw3FB=
3h8TUC?sz=3D24" class=3D"gmail-ajn gmail-bofPge" style=3D"display: block; w=
idth: 24px; height: 24px;"></td><td class=3D"gmail-amr" style=3D"font-famil=
y:arial,sans-serif;margin:0px;padding:0px;width:722px"><div class=3D"gmail-=
nr gmail-wR" style=3D"background-color:rgb(255,255,255);color:rgb(34,34,34)=
;padding:0px;box-sizing:border-box;border-radius:1px;border-width:1px;borde=
r-style:solid;border-color:rgb(192,192,192) rgb(217,217,217) rgb(217,217,21=
7)"><div class=3D"gmail-amn" style=3D"color:rgb(153,153,153);height:64px;pa=
dding:8px 0px 0px 12px">Click here to<span>=C2=A0</span><span id=3D"gmail-:=
1u" tabindex=3D"0" class=3D"gmail-ams gmail-bkH" style=3D"text-decoration:u=
nderline">Reply</span><span>=C2=A0</span>or<span>=C2=A0</span><span id=3D"g=
mail-:2j" tabindex=3D"0" class=3D"gmail-ams gmail-bkG" style=3D"text-decora=
tion:underline">Forward</span></div></div></td></tr></tbody></table></div><=
/div></div></div></div></div></div></div></div></div><div class=3D"gmail-nH=
"></div><div class=3D"gmail-nH"></div></div></div><div class=3D"gmail-nH"><=
div class=3D"gmail-l2 gmail-ov" style=3D"padding-bottom:440px;padding-top:2=
0px;text-align:center"><div id=3D"gmail-:5d"></div><div id=3D"gmail-:3j" cl=
ass=3D"gmail-aeV" style=3D"float:left;width:254.406px;text-align:left"><div=
><div class=3D"gmail-md gmail-mj" style=3D"font-size:11.2px;font-weight:bol=
d;color:rgb(34,34,34);padding-top:0px"><div><span dir=3D"ltr">64.86 GB</spa=
n><span>=C2=A0</span>(30%) of<span>=C2=A0</span><span dir=3D"ltr">215 GB</s=
pan><span>=C2=A0</span>used</div><div class=3D"gmail-aeW" style=3D"font-wei=
ght:normal"><a target=3D"_blank" href=3D"https://www.google.com/settings/u/=
0/storage?hl=3Den" class=3D"gmail-l8" style=3D"color:rgb(34,34,34);text-dec=
oration:underline">Manage</a></div></div></div></div><div class=3D"gmail-ae=
U" style=3D"float:left;width:254.406px"><div id=3D"gmail-:3k"><div><div cla=
ss=3D"gmail-ma" style=3D"font-size:11.2px;color:rgb(34,34,34);padding-top:0=
px"><a href=3D"https://www.google.com/intl/en/policies/terms/" target=3D"_b=
lank" class=3D"gmail-l9" style=3D"color:rgb(34,34,34)">Terms</a><span>=C2=
=A0</span>-<span>=C2=A0</span><a href=3D"https://www.google.com/intl/en/pol=
icies/privacy/" target=3D"_blank" class=3D"gmail-l9" style=3D"color:rgb(34,=
34,34)">Privacy</a></div></div></div></div><div id=3D"gmail-:5g" class=3D"g=
mail-ae3" style=3D"float:left;width:254.406px;text-align:right"><div><div c=
lass=3D"gmail-l6" style=3D"padding-top:12px;font-size:11.2px;color:rgb(34,3=
4,34)"><div>Last account activity: 1 minute ago</div><span id=3D"gmail-:2x"=
 class=3D"gmail-l8 gmail-ou" tabindex=3D"0" style=3D"color:rgb(34,34,34);te=
xt-decoration:underline">Details</span></div></div></div><div style=3D"clea=
r:both"></div></div></div></div></td><td class=3D"gmail-Bu gmail-yM" style=
=3D"font-family:arial,sans-serif;margin:0px;vertical-align:top;padding:0px;=
width:0px;background:rgb(255,255,255)"><div class=3D"gmail-Bt" style=3D"hei=
ght:0px;overflow:hidden;width:0px"></div><div class=3D"gmail-nH" style=3D"w=
idth:0px"><div class=3D"gmail-no" style=3D"float:left"><div class=3D"gmail-=
nH gmail-nn" style=3D"min-height:1px;float:left;width:0px"><div style=3D"he=
ight:64ex"></div></div></div><div class=3D"gmail-dJ" style=3D"height:0px;ov=
erflow:hidden;clear:both"></div></div></td><td class=3D"gmail-Bu gmail-y3" =
style=3D"font-family:arial,sans-serif;margin:0px;vertical-align:top;padding=
:0px;width:0px;height:100px;background:rgb(255,255,255)"><div class=3D"gmai=
l-Bt" style=3D"height:0px;overflow:hidden;width:396px"></div><div class=3D"=
gmail-nH gmail-bno gmail-adC" style=3D"width:0px;margin:0px"><div class=3D"=
gmail-nH"><div class=3D"gmail-nH gmail-Pj"></div></div></div><div class=3D"=
gmail-y4" style=3D"height:1366px;width:0px;opacity:0"></div></td></tr></tbo=
dy></table></div></div></div></div></div></div></div></div></div></div></di=
v><div class=3D"gmail-nH gmail-bnl gmail-nn" style=3D"min-height:1px;float:=
left;background:rgb(255,255,255);margin-top:43px;max-width:0px;min-width:0p=
x;width:0px;height:524px"></div></div><div class=3D"gmail-dJ" style=3D"heig=
ht:0px;overflow:hidden;clear:both"></div></div></div></div></div><div class=
=3D"gmail-vY gmail-nq" style=3D"width:994px;height:632px;color:rgb(0,0,0);f=
ont-family:arial,sans-serif;font-size:medium;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;text-decoration-style:initial;text-decoration-color:ini=
tial"></div><div style=3D"color:rgb(0,0,0);font-family:arial,sans-serif;fon=
t-size:medium;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-decora=
tion-style:initial;text-decoration-color:initial"></div><br></div>

--0000000000009d0306056b3d4cba--
