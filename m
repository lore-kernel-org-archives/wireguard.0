Return-Path: jan@incubaid.com
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
 [209.85.215.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80b61d8b
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 16:01:20 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id h129so30446486lfh.1
 for <wireguard@lists.zx2c4.com>; Fri, 08 Jul 2016 09:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAA5ikozfeQAFGx8Yi9d=1r5gkHNnq6e0yHFVLXHdVYD_V_Wwfg@mail.gmail.com>
 <CAHmME9oN9NU8fHTjfW6ougLf4u9ZfUHJ11MxDf3RhbC5n64g3g@mail.gmail.com>
 <CAA5ikozn+uj+FPG1eLAR9uS+Lxqiab4+dMUhmBmyg9oBiWFQEg@mail.gmail.com>
 <20160707131324.GA18014@lud.polynome.dn42>
 <CAA5ikoypGoMip+DS=Ud-dNRZOf-8m+MDtV5JobLr1MBmAdRS=A@mail.gmail.com>
 <20160707150059.GA679@wolff.to>
 <CAHmME9pcKkjmYgdgH6i3vGbd8iFxOaJDUsbczCU068sZk_pTuQ@mail.gmail.com>
In-Reply-To: <CAHmME9pcKkjmYgdgH6i3vGbd8iFxOaJDUsbczCU068sZk_pTuQ@mail.gmail.com>
From: Jan De Landtsheer <jan@incubaid.com>
Date: Fri, 08 Jul 2016 16:01:29 +0000
Message-ID: <CAA5ikozCC91ZtVPyh5Z7tEc6pZ+AktguYc9qTn6bnZPSqEpK0A@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Bruno Wolff III <bruno@wolff.to>
Content-Type: multipart/alternative; boundary=001a11406b36f7f829053721ea59
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Client changes endpoint port, why?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11406b36f7f829053721ea59
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

happened again, link was up a few moments ago, and then no ping =E2=80=A6

[delandtj@rt01 ~]$ sudo wg
interface: wg0
  public key: Stillthesame=3D
  private key: Stillthesame=3D
  listening port: 23123

peer: Stillthesame=3D
  endpoint: xxx.xxx.xxx.126:17059    #### changed port
  allowed ips: 192.168.251.1/32
  latest handshake: 1 hour, 58 minutes, 4 seconds ago
  bandwidth: 161.04 MiB received, 5.38 MiB sent

Then, with

[delandtj@rt01 ~]$ sudo wg setconf wg0 wg/
conf        Dockerfile  priv        pub
[delandtj@rt01 ~]$ sudo wg setconf wg0 wg/conf
[delandtj@rt01 ~]$ sudo wg
interface: wg0
  public key: REDACTED=3D
  private key: REDACTED=3D
  listening port: 23123

peer: REDACTED=3D
  endpoint: xxx.xxx.xxx.126:51820
  allowed ips: 192.168.251.1/32
[delandtj@rt01 ~]$ ping -c1 192.168.251.1
PING 192.168.251.1 (192.168.251.1) 56(84) bytes of data.
64 bytes from 192.168.251.1: icmp_seq=3D1 ttl=3D64 time=3D27.3 ms

--- 192.168.251.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev =3D 27.333/27.333/27.333/0.000 ms

and ping was back

it took 24-ish hours to happen, but not having touched the tunnel, nor the
set-up, I can definitely confirm this happening=E2=80=A6

[delandtj@rt01 ~]$ cat wg/conf
[Interface]
PrivateKey =3D REDACTED=3D
ListenPort =3D 23123

[Peer]
PublicKey =3D REDACTED=3D
EndPoint =3D xxx.xxx.xxx.126:51820
AllowedIPs =3D  192.168.251.1/32

### and server :
[root@Firewall001 ~]# cat /etc/zcomp/wireguard/wg.conf
[Interface]
ListenPort =3D 51820
PrivateKey =3D REDACTED=3D

[Peer]
PublicKey =3D REDACTED=3D
AllowedIPs =3D  192.168.251.2/32, 192.168.64.0/24

Jan
=E2=80=8B

On Thu, Jul 7, 2016 at 6:38 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> On Thu, Jul 7, 2016 at 5:00 PM, Bruno Wolff III <bruno@wolff.to> wrote:
> > On Thu, Jul 07, 2016 at 14:45:22 +0000,
> >  Jan De Landtsheer <jan@incubaid.com> wrote:
> >>
> >>
> >> nope, Start with basics, use pub ip to pub ip
> >> BTW, can a client run behind NAT ? (I assume not, as AFAICT both need =
to
> >> listen on a port)
> >
> >
> > The one behind nat can hold the tunnel open so the other end can always
> > reach it.
>
> This is the thrust of the issue -- holding the tunnel open when
> there's no traffic. This needs to be addressed. Started new thread to
> discuss this.
>

--001a11406b36f7f829053721ea59
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"markdown-here-wrapper" style=3D""><p style=
=3D"margin:0px 0px 1.2em!important">happened again, link was up a few momen=
ts ago, and then no ping =E2=80=A6</p>
<pre style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Courier,mon=
ospace;font-size:1em;line-height:1.2em;margin:1.2em 0px"><code style=3D"fon=
t-size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;margin:0px=
 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234=
,234);border-radius:3px;display:inline;background-color:rgb(248,248,248);wh=
ite-space:pre;overflow:auto;border-radius:3px;border:1px solid rgb(204,204,=
204);padding:0.5em 0.7em;display:block!important">[delandtj@rt01 ~]$ sudo w=
g=20
interface: wg0
  public key: Stillthesame=3D
  private key: Stillthesame=3D
  listening port: 23123

peer: Stillthesame=3D
  endpoint: xxx.xxx.xxx.126:17059    #### changed port=20
  allowed ips: <a href=3D"http://192.168.251.1/32">192.168.251.1/32</a>
  latest handshake: 1 hour, 58 minutes, 4 seconds ago
  bandwidth: 161.04 MiB received, 5.38 MiB sent
</code></pre><p style=3D"margin:0px 0px 1.2em!important">Then, with </p>
<pre style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Courier,mon=
ospace;font-size:1em;line-height:1.2em;margin:1.2em 0px"><code style=3D"fon=
t-size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;margin:0px=
 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234=
,234);border-radius:3px;display:inline;background-color:rgb(248,248,248);wh=
ite-space:pre;overflow:auto;border-radius:3px;border:1px solid rgb(204,204,=
204);padding:0.5em 0.7em;display:block!important">[delandtj@rt01 ~]$ sudo w=
g setconf wg0 wg/
conf        Dockerfile  priv        pub        =20
[delandtj@rt01 ~]$ sudo wg setconf wg0 wg/conf=20
[delandtj@rt01 ~]$ sudo wg=20
interface: wg0
  public key: REDACTED=3D
  private key: REDACTED=3D
  listening port: 23123

peer: REDACTED=3D
  endpoint: xxx.xxx.xxx.126:51820
  allowed ips: <a href=3D"http://192.168.251.1/32">192.168.251.1/32</a>
[delandtj@rt01 ~]$ ping -c1 192.168.251.1
PING 192.168.251.1 (192.168.251.1) 56(84) bytes of data.
64 bytes from <a href=3D"http://192.168.251.1">192.168.251.1</a>: icmp_seq=
=3D1 ttl=3D64 time=3D27.3 ms

--- 192.168.251.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev =3D 27.333/27.333/27.333/0.000 ms
</code></pre><p style=3D"margin:0px 0px 1.2em!important">and ping was back<=
/p>
<p style=3D"margin:0px 0px 1.2em!important">it took 24-ish hours to happen,=
 but not having touched the tunnel, nor the set-up, I can definitely confir=
m this happening=E2=80=A6</p>
<pre style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Courier,mon=
ospace;font-size:1em;line-height:1.2em;margin:1.2em 0px"><code style=3D"fon=
t-size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;margin:0px=
 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234=
,234);border-radius:3px;display:inline;background-color:rgb(248,248,248);wh=
ite-space:pre;overflow:auto;border-radius:3px;border:1px solid rgb(204,204,=
204);padding:0.5em 0.7em;display:block!important">[delandtj@rt01 ~]$ cat wg=
/conf=20
[Interface]
PrivateKey =3D REDACTED=3D
ListenPort =3D 23123

[Peer]
PublicKey =3D REDACTED=3D
EndPoint =3D xxx.xxx.xxx.126:51820
AllowedIPs =3D  <a href=3D"http://192.168.251.1/32">192.168.251.1/32</a>

### and server :
[root@Firewall001 ~]# cat /etc/zcomp/wireguard/wg.conf=20
[Interface]
ListenPort =3D 51820
PrivateKey =3D REDACTED=3D

[Peer]
PublicKey =3D REDACTED=3D
AllowedIPs =3D  <a href=3D"http://192.168.251.2/32">192.168.251.2/32</a>, <=
a href=3D"http://192.168.64.0/24">192.168.64.0/24</a>
</code></pre><p style=3D"margin:0px 0px 1.2em!important">Jan</p>
<div title=3D"MDH:aGFwcGVuZWQgYWdhaW4sIGxpbmsgd2FzIHVwIGEgZmV3IG1vbWVudHMgY=
WdvLCBhbmQgdGhlbiBu
byBwaW5nIC4uLjxkaXY+PGJyPjxkaXY+YGBgPC9kaXY+PGRpdj48ZGl2PltkZWxhbmR0akBydDA=
x
IH5dJCBzdWRvIHdnJm5ic3A7PC9kaXY+PGRpdj5pbnRlcmZhY2U6IHdnMDwvZGl2PjxkaXY+Jm5=
i
c3A7IHB1YmxpYyBrZXk6IFN0aWxsdGhlc2FtZT08L2Rpdj48ZGl2PiZuYnNwOyBwcml2YXRlIGt=
l
eTombmJzcDtTdGlsbHRoZXNhbWU9PC9kaXY+PGRpdj4mbmJzcDsgbGlzdGVuaW5nIHBvcnQ6IDI=
z
MTIzPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5wZWVyOiZuYnNwO1N0aWxsdGhlc2FtZT08L2R=
p
dj48ZGl2PiZuYnNwOyBlbmRwb2ludDogeHh4Lnh4eC54eHguMTI2OjE3MDU5ICZuYnNwOyAmbmJ=
z
cDsjIyMjIGNoYW5nZWQgcG9ydCZuYnNwOzwvZGl2PjxkaXY+Jm5ic3A7IGFsbG93ZWQgaXBzOiA=
x
OTIuMTY4LjI1MS4xLzMyPC9kaXY+PGRpdj4mbmJzcDsgbGF0ZXN0IGhhbmRzaGFrZTogMSBob3V=
y
LCA1OCBtaW51dGVzLCA0IHNlY29uZHMgYWdvPC9kaXY+PGRpdj4mbmJzcDsgYmFuZHdpZHRoOiA=
x
NjEuMDQgTWlCIHJlY2VpdmVkLCA1LjM4IE1pQiBzZW50PC9kaXY+PC9kaXY+PGRpdj5gYGA8L2R=
p
dj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoZW4sIHdpdGgmbmJzcDs8L2Rpdj48ZGl2Pjx=
i
cj48L2Rpdj48ZGl2PmBgYDwvZGl2PjxkaXY+PGRpdj5bZGVsYW5kdGpAcnQwMSB+XSQgc3VkbyB=
3
ZyBzZXRjb25mIHdnMCB3Zy88L2Rpdj48ZGl2PmNvbmYgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5=
i
c3A7RG9ja2VyZmlsZSAmbmJzcDtwcml2ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO3B1YiA=
m
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsmbmJzcDs8L2Rpdj48ZGl2PltkZWxhbmR0akBydDA=
x
IH5dJCBzdWRvIHdnIHNldGNvbmYgd2cwIHdnL2NvbmYmbmJzcDs8L2Rpdj48ZGl2PltkZWxhbmR=
0
akBydDAxIH5dJCBzdWRvIHdnJm5ic3A7PC9kaXY+PGRpdj5pbnRlcmZhY2U6IHdnMDwvZGl2Pjx=
k
aXY+Jm5ic3A7IHB1YmxpYyBrZXk6IFJFREFDVEVEPTwvZGl2PjxkaXY+Jm5ic3A7IHByaXZhdGU=
g
a2V5OiZuYnNwO1JFREFDVEVEPTwvZGl2PjxkaXY+Jm5ic3A7IGxpc3RlbmluZyBwb3J0OiAyMzE=
y
MzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+cGVlcjombmJzcDtSRURBQ1RFRD08L2Rpdj48ZGl=
2
PiZuYnNwOyBlbmRwb2ludDogeHh4Lnh4eC54eHguMTI2OjUxODIwPC9kaXY+PGRpdj4mbmJzcDs=
g
YWxsb3dlZCBpcHM6IDE5Mi4xNjguMjUxLjEvMzI8L2Rpdj48ZGl2PltkZWxhbmR0akBydDAxIH5=
d
JCBwaW5nIC1jMSAxOTIuMTY4LjI1MS4xPC9kaXY+PGRpdj5QSU5HIDE5Mi4xNjguMjUxLjEgKDE=
5
Mi4xNjguMjUxLjEpIDU2KDg0KSBieXRlcyBvZiBkYXRhLjwvZGl2PjxkaXY+NjQgYnl0ZXMgZnJ=
v
bSAxOTIuMTY4LjI1MS4xOiBpY21wX3NlcT0xIHR0bD02NCB0aW1lPTI3LjMgbXM8L2Rpdj48ZGl=
2
Pjxicj48L2Rpdj48ZGl2Pi0tLSAxOTIuMTY4LjI1MS4xIHBpbmcgc3RhdGlzdGljcyAtLS08L2R=
p
dj48ZGl2PjEgcGFja2V0cyB0cmFuc21pdHRlZCwgMSByZWNlaXZlZCwgMCUgcGFja2V0IGxvc3M=
s
IHRpbWUgMG1zPC9kaXY+PGRpdj5ydHQgbWluL2F2Zy9tYXgvbWRldiA9IDI3LjMzMy8yNy4zMzM=
v
MjcuMzMzLzAuMDAwIG1zPC9kaXY+PC9kaXY+PGRpdj5gYGA8L2Rpdj48ZGl2Pjxicj48L2Rpdj4=
8
ZGl2PmFuZCBwaW5nIHdhcyBiYWNrPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5pdCB0b29rIDI=
0
LWlzaCBob3VycyB0byBoYXBwZW4sIGJ1dCBub3QgaGF2aW5nIHRvdWNoZWQgdGhlIHR1bm5lbCw=
g
bm9yIHRoZSBzZXQtdXAsIEkgY2FuIGRlZmluaXRlbHkgY29uZmlybSB0aGlzIGhhcHBlbmluZy4=
u
LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+YGBgPC9kaXY+PGRpdj48ZGl2PltkZWxhbmR0akB=
y
dDAxIH5dJCBjYXQgd2cvY29uZiZuYnNwOzwvZGl2PjxkaXY+W0ludGVyZmFjZV08L2Rpdj48ZGl=
2
PlByaXZhdGVLZXkgPSBSRURBQ1RFRD08L2Rpdj48ZGl2Pkxpc3RlblBvcnQgPSAyMzEyMzwvZGl=
2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+W1BlZXJdPC9kaXY+PGRpdj5QdWJsaWNLZXkgPSZuYnNwO1J=
F
REFDVEVEPTwvZGl2PjxkaXY+RW5kUG9pbnQgPSB4eHgueHh4Lnh4eC4xMjY6NTE4MjA8L2Rpdj4=
8
ZGl2PkFsbG93ZWRJUHMgPSAmbmJzcDsxOTIuMTY4LjI1MS4xLzMyPC9kaXY+PC9kaXY+PGRpdj4=
8
YnI+PC9kaXY+PGRpdj4jIyMgYW5kIHNlcnZlciA6PC9kaXY+PGRpdj48ZGl2Pltyb290QEZpcmV=
3
YWxsMDAxIH5dIyBjYXQgL2V0Yy96Y29tcC93aXJlZ3VhcmQvd2cuY29uZiZuYnNwOzwvZGl2Pjx=
k
aXY+W0ludGVyZmFjZV08L2Rpdj48ZGl2Pkxpc3RlblBvcnQgPSA1MTgyMDwvZGl2PjxkaXY+UHJ=
p
dmF0ZUtleSA9IFJFREFDVEVEPTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+W1BlZXJdPC9kaXY=
+
PGRpdj5QdWJsaWNLZXkgPSZuYnNwO1JFREFDVEVEPTwvZGl2PjxkaXY+QWxsb3dlZElQcyA9ICZ=
u
YnNwOzE5Mi4xNjguMjUxLjIvMzIsIDE5Mi4xNjguNjQuMC8yNDwvZGl2PjxkaXY+PGJyPjwvZGl=
2
PjxkaXY+YGBgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5KYW48L2Rpdj48ZGl2Pjxicj48L2R=
p
dj48L2Rpdj48ZGl2Pjxicj48L2Rpdj4=3D" style=3D"height:0;width:0;max-height:0;=
max-width:0;overflow:hidden;font-size:0em;padding:0;margin:0">=E2=80=8B</di=
v></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Jul 7=
, 2016 at 6:38 PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com"=
>Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On =
Thu, Jul 7, 2016 at 5:00 PM, Bruno Wolff III &lt;<a href=3D"mailto:bruno@wo=
lff.to" target=3D"_blank">bruno@wolff.to</a>&gt; wrote:<br>
&gt; On Thu, Jul 07, 2016 at 14:45:22 +0000,<br>
&gt;=C2=A0 Jan De Landtsheer &lt;<a href=3D"mailto:jan@incubaid.com" target=
=3D"_blank">jan@incubaid.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; nope, Start with basics, use pub ip to pub ip<br>
&gt;&gt; BTW, can a client run behind NAT ? (I assume not, as AFAICT both n=
eed to<br>
&gt;&gt; listen on a port)<br>
&gt;<br>
&gt;<br>
&gt; The one behind nat can hold the tunnel open so the other end can alway=
s<br>
&gt; reach it.<br>
<br>
This is the thrust of the issue -- holding the tunnel open when<br>
there&#39;s no traffic. This needs to be addressed. Started new thread to<b=
r>
discuss this.<br>
</blockquote></div>

--001a11406b36f7f829053721ea59--
