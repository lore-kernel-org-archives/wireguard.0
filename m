Return-Path: gbojsza@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d10b0f3
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jun 2018 20:23:21 +0000 (UTC)
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a47c30eb
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jun 2018 20:23:21 +0000 (UTC)
Received: by mail-pg0-x22f.google.com with SMTP id r21-v6so4897994pgv.4
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jun 2018 13:27:31 -0700 (PDT)
MIME-Version: 1.0
From: Glen Bojsza <gbojsza@gmail.com>
Date: Fri, 15 Jun 2018 16:27:09 -0400
Message-ID: <CACW8NbD=B07z4WqgWv4+SP8P615Ois0_cCdk0d4viAGYp=Ki2w@mail.gmail.com>
Subject: Ubuntu Error when trying to launch wireguard
To: wireguard <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="0000000000008b9b38056eb40bfa"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000008b9b38056eb40bfa
Content-Type: text/plain; charset="UTF-8"

I am trying to run wireguard server on Bionic ARM processor.

After following the installation instructions and creating my server config
file I get the following error when I run

root@odroidxu4:~# wg-quick up wg0

Warning: `/etc/wireguard/wg0.conf' is world accessible

[#] ip link add wg0 type wireguard

RTNETLINK answers: Operation not supported

Unable to access interface: Protocol not supported

[#] ip link delete dev wg0

Cannot find device "wg0"


I have followed these steps.

sudo apt update && sudo apt upgrade
sudo apt install software-properties-common
sudo add-apt-repository ppa:wireguard/wireguard
sudo apt-get update
sudo apt-get install wireguard
wg genkey | tee privatekey | wg pubkey > publickey

Create w0.conf file

Any help would be appreciated...I catch a plane tomorrow and was hoping to
have this up and running to use while i am traveling.

thanks,

Glen

--0000000000008b9b38056eb40bfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am trying to run wireguard server on Bionic ARM processo=
r.<div><br></div><div>After following the installation instructions and cre=
ating my server config file I get the following error when I run=C2=A0</div=
><div><br>




<span></span>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal"><font col=
or=3D"#000000" face=3D"Menlo"><span style=3D"font-size:11px;font-variant-li=
gatures:no-common-ligatures">root@odroidxu4:~# wg-quick up wg0</span></font=
></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-stretch:normal;line-height:normal"><fon=
t color=3D"#000000" face=3D"Menlo"><span style=3D"font-size:11px;font-varia=
nt-ligatures:no-common-ligatures">Warning: `/etc/wireguard/wg0.conf&#39; is=
 world accessible</span></font></p><p class=3D"gmail-p1" style=3D"margin:0p=
x;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:n=
ormal;line-height:normal"><font color=3D"#000000" face=3D"Menlo"><span styl=
e=3D"font-size:11px;font-variant-ligatures:no-common-ligatures">[#] ip link=
 add wg0 type wireguard</span></font></p><p class=3D"gmail-p1" style=3D"mar=
gin:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-str=
etch:normal;line-height:normal"><font color=3D"#000000" face=3D"Menlo"><spa=
n style=3D"font-size:11px;font-variant-ligatures:no-common-ligatures">RTNET=
LINK answers: Operation not supported</span></font></p><p class=3D"gmail-p1=
" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-stretch:normal;line-height:normal"><font color=3D"#000000" face=
=3D"Menlo"><span style=3D"font-size:11px;font-variant-ligatures:no-common-l=
igatures">Unable to access interface: Protocol not supported</span></font><=
/p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;line-height:normal"><font =
color=3D"#000000" face=3D"Menlo"><span style=3D"font-size:11px;font-variant=
-ligatures:no-common-ligatures">[#] ip link delete dev wg0</span></font></p=
><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;line-height:normal"><font co=
lor=3D"#000000" face=3D"Menlo"><span style=3D"font-size:11px;font-variant-l=
igatures:no-common-ligatures">Cannot find device &quot;wg0&quot;</span></fo=
nt></p><div><br></div><div><br></div><div>I have followed these steps.</div=
><div><br></div><div><div>sudo apt update &amp;&amp; sudo apt upgrade</div>=
<div>sudo apt install software-properties-common</div><div>sudo add-apt-rep=
ository ppa:wireguard/wireguard</div><div>sudo apt-get update</div><div>sud=
o apt-get install wireguard</div><div>wg genkey | tee privatekey | wg pubke=
y &gt; publickey</div><div><br></div><div>Create w0.conf file</div></div><d=
iv><br></div><div>Any help would be appreciated...I catch a plane tomorrow =
and was hoping to have this up and running to use while i am traveling.</di=
v><div><br></div><div>thanks,</div><div><br></div><div>Glen</div><p class=
=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-weight:normal;font-stretch:normal;font-size:11px;lin=
e-height:normal;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255=
,255,255)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-comm=
on-ligatures"><br></span></p><p class=3D"gmail-p1" style=3D"margin:0px;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-weight:normal;f=
ont-stretch:normal;font-size:11px;line-height:normal;font-family:Menlo;colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)"><span class=3D"gmail-s1" st=
yle=3D"font-variant-ligatures:no-common-ligatures"><br></span></p>


</div></div>

--0000000000008b9b38056eb40bfa--
