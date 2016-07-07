Return-Path: jan@incubaid.com
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
 [209.85.215.46])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fbd6736
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 08:27:31 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id l188so6541576lfe.2
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jul 2016 01:27:42 -0700 (PDT)
MIME-Version: 1.0
From: Jan De Landtsheer <jan@incubaid.com>
Date: Thu, 07 Jul 2016 08:27:31 +0000
Message-ID: <CAA5ikozfeQAFGx8Yi9d=1r5gkHNnq6e0yHFVLXHdVYD_V_Wwfg@mail.gmail.com>
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary=001a113fc2f69babec053707757f
Subject: [WireGuard] Client changes endpoint port, why?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113fc2f69babec053707757f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Testing out this little thingie ; looks Grrrr-eat!
I dont understand why the client setup changes it=E2=80=99s port after a wh=
ile:

[delandtj@rt01 ~]$ sudo wg
interface: wg0
  public key: fppppppppppppppppppppppppppppppppp=3D
  private key: Iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii=
iiiiiiiiiiE=3D
  listening port: 23123

peer: RnPeeerrreeeerrrk=3D
  endpoint: xxx.xxx.xxx.126:51820
  allowed ips: 192.168.251.1/32
  latest handshake: 2 minutes, 14 seconds ago
  bandwidth: 658 B received, 944 B sent
[delandtj@rt01 ~]$ ping 192.168.251.1
PING 192.168.251.1 (192.168.251.1) 56(84) bytes of data.
64 bytes from 192.168.251.1: icmp_seq=3D1 ttl=3D64 time=3D10.5 ms
^C
--- 192.168.251.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev =3D 10.544/10.544/10.544/0.000 ms

Yay! now wait a few minutes

[delandtj@rt01 ~]$ ping 192.168.251.1
PING 192.168.251.1 (192.168.251.1) 56(84) bytes of data.
^C
--- 192.168.251.1 ping statistics ---
5 packets transmitted, 0 received, 100% packet loss, time 4009ms

[delandtj@rt01 ~]$ sudo wg
interface: wg0
  public key: ppppppppppppppppppppppppppppppppppppc=3D
  private key: Iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii3=
my0E=3D
  listening port: 23123

peer: RPeeerrrreeerrrrrpppppppppppppppk=3D
  endpoint: xxx.xxx.xxx.126:17409
  allowed ips: 192.168.251.1/32
  latest handshake: 13 minutes, 55 seconds ago
  bandwidth: 4.23 KiB received, 6.42 KiB sent

Ugh=E2=80=A6 endpoint port changed ? why ?
Let=E2=80=99s set it back

[delandtj@rt01 ~]$ sudo wg setconf wg0 wg/conf
[delandtj@rt01 ~]$ sudo wg
interface: wg0
  public key: frILpppppppppppppppppppppppppppppppppppppppppppp/Qc=3D
  private key: IJiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii=
iiiiiiiiiiiiiiiiiiiiiiiiiiii=3D
  listening port: 23123

peer: RnOKNCpBs2Wf2dQP9Gedd+jCVkcOJOQ0m5FK+3WFGmk=3D
  endpoint: xxx.xxx.xxx.126:51820
  allowed ips: 192.168.251.1/32
[delandtj@rt01 ~]$ ping 192.168.251.1
PING 192.168.251.1 (192.168.251.1) 56(84) bytes of data.
64 bytes from 192.168.251.1: icmp_seq=3D1 ttl=3D64 time=3D25.0 ms
^C
--- 192.168.251.1 ping statistics ---
2 packets transmitted, 1 received, 50% packet loss, time 1000ms
rtt min/avg/max/mdev =3D 25.066/25.066/25.066/0.000 ms

So=E2=80=A6 am I missing something ?

Jan
=E2=80=8B

--001a113fc2f69babec053707757f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"markdown-here-wrapper" style=3D""><p style=
=3D"margin:0px 0px 1.2em!important">Testing out this little thingie ; looks=
 Grrrr-eat!<br>I dont understand why the client setup changes it=E2=80=99s =
port after a while:</p>
<pre style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Courier,mon=
ospace;font-size:1em;line-height:1.2em;margin:1.2em 0px"><code style=3D"fon=
t-size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;margin:0px=
 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234=
,234);border-radius:3px;display:inline;background-color:rgb(248,248,248);wh=
ite-space:pre;overflow:auto;border-radius:3px;border:1px solid rgb(204,204,=
204);padding:0.5em 0.7em;display:block!important">[delandtj@rt01 ~]$ sudo w=
g
interface: wg0
  public key: fppppppppppppppppppppppppppppppppp=3D
  private key: Iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii=
iiiiiiiiiiE=3D
  listening port: 23123

peer: RnPeeerrreeeerrrk=3D
  endpoint: xxx.xxx.xxx.126:51820
  allowed ips: <a href=3D"http://192.168.251.1/32">192.168.251.1/32</a>
  latest handshake: 2 minutes, 14 seconds ago
  bandwidth: 658 B received, 944 B sent
[delandtj@rt01 ~]$ ping 192.168.251.1
PING 192.168.251.1 (192.168.251.1) 56(84) bytes of data.
64 bytes from <a href=3D"http://192.168.251.1">192.168.251.1</a>: icmp_seq=
=3D1 ttl=3D64 time=3D10.5 ms
^C
--- 192.168.251.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev =3D 10.544/10.544/10.544/0.000 ms
</code></pre><p style=3D"margin:0px 0px 1.2em!important">Yay! now wait a fe=
w minutes</p>
<pre style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Courier,mon=
ospace;font-size:1em;line-height:1.2em;margin:1.2em 0px"><code style=3D"fon=
t-size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;margin:0px=
 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234=
,234);border-radius:3px;display:inline;background-color:rgb(248,248,248);wh=
ite-space:pre;overflow:auto;border-radius:3px;border:1px solid rgb(204,204,=
204);padding:0.5em 0.7em;display:block!important">[delandtj@rt01 ~]$ ping 1=
92.168.251.1
PING 192.168.251.1 (192.168.251.1) 56(84) bytes of data.
^C
--- 192.168.251.1 ping statistics ---
5 packets transmitted, 0 received, 100% packet loss, time 4009ms

[delandtj@rt01 ~]$ sudo wg
interface: wg0
  public key: ppppppppppppppppppppppppppppppppppppc=3D
  private key: Iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii3=
my0E=3D
  listening port: 23123

peer: RPeeerrrreeerrrrrpppppppppppppppk=3D
  endpoint: xxx.xxx.xxx.126:17409
  allowed ips: <a href=3D"http://192.168.251.1/32">192.168.251.1/32</a>
  latest handshake: 13 minutes, 55 seconds ago
  bandwidth: 4.23 KiB received, 6.42 KiB sent
</code></pre><p style=3D"margin:0px 0px 1.2em!important">Ugh=E2=80=A6 endpo=
int port changed ? why ?<br>Let=E2=80=99s set it back</p>
<pre style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Courier,mon=
ospace;font-size:1em;line-height:1.2em;margin:1.2em 0px"><code style=3D"fon=
t-size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;margin:0px=
 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234=
,234);border-radius:3px;display:inline;background-color:rgb(248,248,248);wh=
ite-space:pre;overflow:auto;border-radius:3px;border:1px solid rgb(204,204,=
204);padding:0.5em 0.7em;display:block!important">[delandtj@rt01 ~]$ sudo w=
g setconf wg0 wg/conf=20
[delandtj@rt01 ~]$ sudo wg
interface: wg0
  public key: frILpppppppppppppppppppppppppppppppppppppppppppp/Qc=3D
  private key: IJiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii=
iiiiiiiiiiiiiiiiiiiiiiiiiiii=3D
  listening port: 23123

peer: RnOKNCpBs2Wf2dQP9Gedd+jCVkcOJOQ0m5FK+3WFGmk=3D
  endpoint: xxx.xxx.xxx.126:51820
  allowed ips: <a href=3D"http://192.168.251.1/32">192.168.251.1/32</a>
[delandtj@rt01 ~]$ ping 192.168.251.1
PING 192.168.251.1 (192.168.251.1) 56(84) bytes of data.
64 bytes from <a href=3D"http://192.168.251.1">192.168.251.1</a>: icmp_seq=
=3D1 ttl=3D64 time=3D25.0 ms
^C
--- 192.168.251.1 ping statistics ---
2 packets transmitted, 1 received, 50% packet loss, time 1000ms
rtt min/avg/max/mdev =3D 25.066/25.066/25.066/0.000 ms
</code></pre><p style=3D"margin:0px 0px 1.2em!important">So=E2=80=A6 am I m=
issing something ?</p>
<p style=3D"margin:0px 0px 1.2em!important">Jan</p>
<div title=3D"MDH:VGVzdGluZyBvdXQgdGhpcyBsaXR0bGUgdGhpbmdpZSA7IGxvb2tzIEdyc=
nJyLWVhdCE8ZGl2Pkkg
ZG9udCB1bmRlcnN0YW5kIHdoeSB0aGUgY2xpZW50IHNldHVwIGNoYW5nZXMgaXQncyBwb3J0IGF=
m
dGVyIGEgd2hpbGU6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5gYGA8L2Rpdj48ZGl2PltkZWx=
h
bmR0akBydDAxIH5dJCBzdWRvIHdnPGJyPjwvZGl2PjxkaXY+PGRpdj5pbnRlcmZhY2U6IHdnMDw=
v
ZGl2PjxkaXY+Jm5ic3A7IHB1YmxpYyBrZXk6IGZwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHB=
w
cHBwcHA9PC9kaXY+PGRpdj4mbmJzcDsgcHJpdmF0ZSBrZXk6IElpaWlpaWlpaWlpaWlpaWlpaWl=
p
aWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlFPTwvZGl=
2
PjxkaXY+Jm5ic3A7IGxpc3RlbmluZyBwb3J0OiAyMzEyMzwvZGl2PjxkaXY+PGJyPjwvZGl2Pjx=
k
aXY+cGVlcjogUm5QZWVlcnJyZWVlZXJycms9PC9kaXY+PGRpdj4mbmJzcDsgZW5kcG9pbnQ6IHh=
4
eC54eHgueHh4LjEyNjo1MTgyMDwvZGl2PjxkaXY+Jm5ic3A7IGFsbG93ZWQgaXBzOiAxOTIuMTY=
4
LjI1MS4xLzMyPC9kaXY+PGRpdj4mbmJzcDsgbGF0ZXN0IGhhbmRzaGFrZTogMiBtaW51dGVzLCA=
x
NCBzZWNvbmRzIGFnbzwvZGl2PjxkaXY+Jm5ic3A7IGJhbmR3aWR0aDogNjU4IEIgcmVjZWl2ZWQ=
s
IDk0NCBCIHNlbnQ8L2Rpdj48ZGl2PltkZWxhbmR0akBydDAxIH5dJCBwaW5nIDE5Mi4xNjguMjU=
x
LjE8L2Rpdj48ZGl2PlBJTkcgMTkyLjE2OC4yNTEuMSAoMTkyLjE2OC4yNTEuMSkgNTYoODQpIGJ=
5
dGVzIG9mIGRhdGEuPC9kaXY+PGRpdj42NCBieXRlcyBmcm9tIDE5Mi4xNjguMjUxLjE6IGljbXB=
f
c2VxPTEgdHRsPTY0IHRpbWU9MTAuNSBtczwvZGl2PjxkaXY+XkM8L2Rpdj48ZGl2Pi0tLSAxOTI=
u
MTY4LjI1MS4xIHBpbmcgc3RhdGlzdGljcyAtLS08L2Rpdj48ZGl2PjEgcGFja2V0cyB0cmFuc21=
p
dHRlZCwgMSByZWNlaXZlZCwgMCUgcGFja2V0IGxvc3MsIHRpbWUgMG1zPC9kaXY+PGRpdj5ydHQ=
g
bWluL2F2Zy9tYXgvbWRldiA9IDEwLjU0NC8xMC41NDQvMTAuNTQ0LzAuMDAwIG1zPC9kaXY+PGR=
p
dj5gYGA8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PllheSEgbm93IHdhaXQgYSBmZXcgbWludXR=
l
czwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+YGBgPC9kaXY+PGRpdj5bZGVsYW5kdGpAcnQwMSB=
+
XSQgcGluZyAxOTIuMTY4LjI1MS4xPC9kaXY+PGRpdj5QSU5HIDE5Mi4xNjguMjUxLjEgKDE5Mi4=
x
NjguMjUxLjEpIDU2KDg0KSBieXRlcyBvZiBkYXRhLjwvZGl2PjxkaXY+XkM8L2Rpdj48ZGl2Pi0=
t
LSAxOTIuMTY4LjI1MS4xIHBpbmcgc3RhdGlzdGljcyAtLS08L2Rpdj48ZGl2PjUgcGFja2V0cyB=
0
cmFuc21pdHRlZCwgMCByZWNlaXZlZCwgMTAwJSBwYWNrZXQgbG9zcywgdGltZSA0MDA5bXM8L2R=
p
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PltkZWxhbmR0akBydDAxIH5dJCBzdWRvIHdnPC9kaXY+PGR=
p
dj5pbnRlcmZhY2U6IHdnMDwvZGl2PjxkaXY+Jm5ic3A7IHB1YmxpYyBrZXk6IHBwcHBwcHBwcHB=
w
cHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcGM9PC9kaXY+PGRpdj4mbmJzcDsgcHJpdmF0ZSBrZXk=
6
IElpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWl=
p
aWlpM215MEU9PC9kaXY+PGRpdj4mbmJzcDsgbGlzdGVuaW5nIHBvcnQ6IDIzMTIzPC9kaXY+PGR=
p
dj48YnI+PC9kaXY+PGRpdj5wZWVyOiBSUGVlZXJycnJlZWVycnJycnBwcHBwcHBwcHBwcHBwcGs=
9
PC9kaXY+PGRpdj4mbmJzcDsgZW5kcG9pbnQ6IHh4eC54eHgueHh4LjEyNjoxNzQwOTwvZGl2Pjx=
k
aXY+Jm5ic3A7IGFsbG93ZWQgaXBzOiAxOTIuMTY4LjI1MS4xLzMyPC9kaXY+PGRpdj4mbmJzcDs=
g
bGF0ZXN0IGhhbmRzaGFrZTogMTMgbWludXRlcywgNTUgc2Vjb25kcyBhZ288L2Rpdj48ZGl2PiZ=
u
YnNwOyBiYW5kd2lkdGg6IDQuMjMgS2lCIHJlY2VpdmVkLCA2LjQyIEtpQiBzZW50PC9kaXY+PGR=
p
dj5gYGA8L2Rpdj48ZGl2PlVnaC4uLiBlbmRwb2ludCBwb3J0IGNoYW5nZWQgPyB3aHkgPzwvZGl=
2
PjxkaXY+TGV0J3Mgc2V0IGl0IGJhY2s8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmBgYDwvZGl=
2
PjxkaXY+W2RlbGFuZHRqQHJ0MDEgfl0kIHN1ZG8gd2cgc2V0Y29uZiB3ZzAgd2cvY29uZiZuYnN=
w
OzwvZGl2PjxkaXY+W2RlbGFuZHRqQHJ0MDEgfl0kIHN1ZG8gd2c8L2Rpdj48ZGl2PmludGVyZmF=
j
ZTogd2cwPC9kaXY+PGRpdj4mbmJzcDsgcHVibGljIGtleTogZnJJTHBwcHBwcHBwcHBwcHBwcHB=
w
cHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwcHBwL1FjPTwvZGl2PjxkaXY+Jm5ic3A7IHByaXZhdGU=
g
a2V5OiBJSmlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWl=
p
aWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpPTwvZGl2PjxkaXY+Jm5ic3A7IGx=
p
c3RlbmluZyBwb3J0OiAyMzEyMzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+cGVlcjogUm5PS05=
D
cEJzMldmMmRRUDlHZWRkK2pDVmtjT0pPUTBtNUZLKzNXRkdtaz08L2Rpdj48ZGl2PiZuYnNwOyB=
l
bmRwb2ludDogeHh4Lnh4eC54eHguMTI2OjUxODIwPC9kaXY+PGRpdj4mbmJzcDsgYWxsb3dlZCB=
p
cHM6IDE5Mi4xNjguMjUxLjEvMzI8L2Rpdj48ZGl2PltkZWxhbmR0akBydDAxIH5dJCBwaW5nIDE=
5
Mi4xNjguMjUxLjE8L2Rpdj48ZGl2PlBJTkcgMTkyLjE2OC4yNTEuMSAoMTkyLjE2OC4yNTEuMSk=
g
NTYoODQpIGJ5dGVzIG9mIGRhdGEuPC9kaXY+PGRpdj42NCBieXRlcyBmcm9tIDE5Mi4xNjguMjU=
x
LjE6IGljbXBfc2VxPTEgdHRsPTY0IHRpbWU9MjUuMCBtczwvZGl2PjxkaXY+XkM8L2Rpdj48ZGl=
2
Pi0tLSAxOTIuMTY4LjI1MS4xIHBpbmcgc3RhdGlzdGljcyAtLS08L2Rpdj48ZGl2PjIgcGFja2V=
0
cyB0cmFuc21pdHRlZCwgMSByZWNlaXZlZCwgNTAlIHBhY2tldCBsb3NzLCB0aW1lIDEwMDBtczw=
v
ZGl2PjxkaXY+cnR0IG1pbi9hdmcvbWF4L21kZXYgPSAyNS4wNjYvMjUuMDY2LzI1LjA2Ni8wLjA=
w
MCBtczwvZGl2PjxkaXY+PGJyPjwvZGl2PjwvZGl2PjxkaXY+YGBgPC9kaXY+PGRpdj48YnI+PC9=
k
aXY+PGRpdj5Tby4uLiBhbSBJIG1pc3Npbmcgc29tZXRoaW5nID88L2Rpdj48ZGl2Pjxicj48L2R=
p
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PkphbjwvZGl2Pg=3D=3D" style=3D"height:0;width:0=
;max-height:0;max-width:0;overflow:hidden;font-size:0em;padding:0;margin:0"=
>=E2=80=8B</div></div></div>

--001a113fc2f69babec053707757f--
