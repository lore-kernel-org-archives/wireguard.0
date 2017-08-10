Return-Path: jan@delandtsheer.eu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18f98da4
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 16:35:10 +0000 (UTC)
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
 [209.85.161.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ca10b2f
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 16:35:10 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id l82so8306499ywc.2
 for <wireguard@lists.zx2c4.com>; Thu, 10 Aug 2017 09:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <CADqnr01+qq8K+083_LRJeq424BHB_F+R-nxoGdrWAPCuS1r=gA@mail.gmail.com>
 <CAHmME9pMAMC4DY6PXTB_y64O6O2O6JVQY8ks=c=co+gDFYMHqA@mail.gmail.com>
In-Reply-To: <CAHmME9pMAMC4DY6PXTB_y64O6O2O6JVQY8ks=c=co+gDFYMHqA@mail.gmail.com>
From: Jan De Landtsheer <jan@delandtsheer.eu>
Date: Thu, 10 Aug 2017 16:57:05 +0000
Message-ID: <CADqnr00euKzi7R44JSTktKCbooodU5Y1sko6wP9b8bpf4SLFbg@mail.gmail.com>
Subject: Re: FR: interface ListenAddress (Aka:Multihomed server issue)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="94eb2c07b99eb5643b055669165e"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c07b99eb5643b055669165e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

no, very simple =E2=80=A6
I have (for the sake of brevity) 2 interfaces:

one is eth0 with ip 123.45.67.1/30 and I have on the box 123.45.67.2 as
default gateway.
on that link I bgp peer with 123.45.67.2 and announce my own /24, let=E2=80=
=99s say
134.56.78.0/24

another eth interface (eth1) hosts several ip addresses and one of these is
134.56.78.5/24

for that interface I allow port 443 to accept packets for

[Interface]
ListenPort =3D 443

but I do not allow packets to connect to 123.45.67.1/30 on port 443 (as
this iface is just my Provider=E2=80=99s /30

when a client connects to 134.56.78.5/24, the wg server tells the client
that it=E2=80=99s destination is 123.45.67.1/30 for this link , and that ge=
ts of
course firewalled.
So reluctantly I opened up port 443 on the uplink interface to accomodate
this, erm, inconvenience.

on client side I have a config :

[Peer]
PublicKey =3D (hidden)
EndPoint =3D 134.56.78.5:443
AllowedIPs =3D  0.0.0.0/0

but when connection is established
wg show says :

peer: (hidden)
  endpoint: 123.34.56.1:443
  allowed ips: 10.0.0.0/8
  latest handshake: 36 seconds ago
  transfer: 468.40 MiB received, 17.88 MiB sent

but now of course, when the third interface eth2 will arrive, with another
subnet to another provider, my announced IP 134.56.78.5/24 may not be
altered by the path taken, otherwise the clients need to reconnect=E2=80=A6

but I don=E2=80=99t know for sure=E2=80=A6 it seems to be a regression some=
where as I don=E2=80=99t
recall to have that problem before=E2=80=A6 I had to add this accept rule l=
ast
week, suddenly, as some peers could connect, but not transfer packets any
more.

Now I understand that wg finds it=E2=80=99s IP by following the shortest pa=
th, but
that is, in my case, counterproductive.
It should reply with the IP it was spoken to (here 134.56.78.5)

I think ;-)

Jan

On Thu, Aug 10, 2017 at 5:51 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

Hey Jan,
>
> > When wireguard clients connect, their config shows their peer
> > to be the Uplink IP address instead of the IP on the Public
> > interface that was specifically assigned for wireguard (wgsrv)
>
> Do you mean to say that the _endpoint_ IP address of the WireGuard
> peer is an IP associated with Uplink instead of with Public? If this
> is the case, it might be some odd DNAT situation causing this to
> happen for you? The peer's endpoint IP address is simply the src IP of
> the most recently authenticated packet from the peer. It sounds like
> there's something odd in place causing the src IP to be wrong? But I
> can't think of how this would be WireGuard related. Unless I've
> misunderstood something?
>
> Jason
>
=E2=80=8B

--94eb2c07b99eb5643b055669165e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"markdown-here-wrapper" style=3D""><p style=
=3D"margin:0px 0px 1.2em!important">no, very simple =E2=80=A6<br>I have (fo=
r the sake of brevity) 2 interfaces:</p>
<p style=3D"margin:0px 0px 1.2em!important">one is eth0 with ip <a href=3D"=
http://123.45.67.1/30">123.45.67.1/30</a> and I have on the box 123.45.67.2=
 as default gateway.<br>on that link I bgp peer with 123.45.67.2 and announ=
ce my own /24, let=E2=80=99s say <a href=3D"http://134.56.78.0/24">134.56.7=
8.0/24</a></p>
<p style=3D"margin:0px 0px 1.2em!important">another eth interface (eth1) ho=
sts several ip addresses and one of these is <a href=3D"http://134.56.78.5/=
24">134.56.78.5/24</a></p>
<p style=3D"margin:0px 0px 1.2em!important">for that interface I allow port=
 443 to accept packets for </p>
<pre style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Courier,mon=
ospace;font-size:1em;line-height:1.2em;margin:1.2em 0px"><code style=3D"fon=
t-size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;margin:0px=
 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234=
,234);background-color:rgb(248,248,248);border-radius:3px;display:inline;wh=
ite-space:pre;overflow:auto;border-radius:3px;border:1px solid rgb(204,204,=
204);padding:0.5em 0.7em;display:block!important">[Interface]
ListenPort =3D 443
</code></pre><p style=3D"margin:0px 0px 1.2em!important">but I do not allow=
 packets to connect to <code style=3D"font-size:0.85em;font-family:Consolas=
,Inconsolata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3em;white-sp=
ace:pre-wrap;border:1px solid rgb(234,234,234);background-color:rgb(248,248=
,248);border-radius:3px;display:inline"><a href=3D"http://123.45.67.1/30">1=
23.45.67.1/30</a></code> on port 443 (as this iface is just my Provider=E2=
=80=99s /30</p>
<p style=3D"margin:0px 0px 1.2em!important">when a client connects to <a hr=
ef=3D"http://134.56.78.5/24">134.56.78.5/24</a>, the wg server tells the cl=
ient that it=E2=80=99s destination is <a href=3D"http://123.45.67.1/30">123=
.45.67.1/30</a> for this link , and that gets of course firewalled.<br>So r=
eluctantly I opened up port 443 on the uplink interface to accomodate this,=
 erm, inconvenience. </p>
<p style=3D"margin:0px 0px 1.2em!important">on client side I have a config =
:</p>
<pre style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Courier,mon=
ospace;font-size:1em;line-height:1.2em;margin:1.2em 0px"><code style=3D"fon=
t-size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;margin:0px=
 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234=
,234);background-color:rgb(248,248,248);border-radius:3px;display:inline;wh=
ite-space:pre;overflow:auto;border-radius:3px;border:1px solid rgb(204,204,=
204);padding:0.5em 0.7em;display:block!important">[Peer]
PublicKey =3D (hidden)
EndPoint =3D <a href=3D"http://134.56.78.5:443">134.56.78.5:443</a>
AllowedIPs =3D  <a href=3D"http://0.0.0.0/0">0.0.0.0/0</a>
</code></pre><p style=3D"margin:0px 0px 1.2em!important">but when connectio=
n is established<br><code style=3D"font-size:0.85em;font-family:Consolas,In=
consolata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3em;white-space=
:pre-wrap;border:1px solid rgb(234,234,234);background-color:rgb(248,248,24=
8);border-radius:3px;display:inline">wg show</code> says :</p>
<pre style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Courier,mon=
ospace;font-size:1em;line-height:1.2em;margin:1.2em 0px"><code style=3D"fon=
t-size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;margin:0px=
 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234=
,234);background-color:rgb(248,248,248);border-radius:3px;display:inline;wh=
ite-space:pre;overflow:auto;border-radius:3px;border:1px solid rgb(204,204,=
204);padding:0.5em 0.7em;display:block!important">peer: (hidden)
  endpoint: <a href=3D"http://123.34.56.1:443">123.34.56.1:443</a>
  allowed ips: <a href=3D"http://10.0.0.0/8">10.0.0.0/8</a>
  latest handshake: 36 seconds ago
  transfer: 468.40 MiB received, 17.88 MiB sent
</code></pre><p style=3D"margin:0px 0px 1.2em!important">but now of course,=
 when the third interface eth2 will arrive, with another subnet to another =
provider, my announced IP <a href=3D"http://134.56.78.5/24">134.56.78.5/24<=
/a> may not be altered by the path taken, otherwise the clients need to rec=
onnect=E2=80=A6</p>
<p style=3D"margin:0px 0px 1.2em!important">but I don=E2=80=99t know for su=
re=E2=80=A6 it seems to be a regression somewhere as I don=E2=80=99t recall=
 to have that problem before=E2=80=A6 I had to add this accept rule last we=
ek, suddenly, as some peers could connect, but not transfer packets any mor=
e.</p>
<p style=3D"margin:0px 0px 1.2em!important">Now I understand that wg finds =
it=E2=80=99s IP by following the shortest path, but that is, in my case, co=
unterproductive.<br>It should reply with the IP it was spoken to (here 134.=
56.78.5)</p>
<p style=3D"margin:0px 0px 1.2em!important">I think ;-)</p>
<p style=3D"margin:0px 0px 1.2em!important">Jan</p>
<p style=3D"margin:0px 0px 1.2em!important">On Thu, Aug 10, 2017 at 5:51 PM=
 Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank=
">Jason@zx2c4.com</a>&gt; wrote:</p>
<p style=3D"margin:0px 0px 1.2em!important"></p><div class=3D"markdown-here=
-exclude"><p></p><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Hey Jan,<br>
<br>
&gt; When wireguard clients connect, their config shows their peer<br>
&gt; to be the Uplink IP address instead of the IP on the Public<br>
&gt; interface that was specifically assigned for wireguard (wgsrv)<br>
<br>
Do you mean to say that the _endpoint_ IP address of the WireGuard<br>
peer is an IP associated with Uplink instead of with Public? If this<br>
is the case, it might be some odd DNAT situation causing this to<br>
happen for you? The peer&#39;s endpoint IP address is simply the src IP of<=
br>
the most recently authenticated packet from the peer. It sounds like<br>
there&#39;s something odd in place causing the src IP to be wrong? But I<br=
>
can&#39;t think of how this would be WireGuard related. Unless I&#39;ve<br>
misunderstood something?<br>
<br>
Jason<br>
</blockquote><p></p></div><p style=3D"margin:0px 0px 1.2em!important"></p>
<div title=3D"MDH:bm8sIHZlcnkgc2ltcGxlIC4uLjxicj5JIGhhdmUgKGZvciB0aGUgc2FrZ=
SBvZiBicmV2aXR5KSAy
IGludGVyZmFjZXM6PGRpdj48YnI+PC9kaXY+PGRpdj5vbmUgaXMgZXRoMCB3aXRoIGlwIDxhIGh=
y
ZWY9Imh0dHA6Ly8xMjMuNDUuNjcuMS8zMCIgdGFyZ2V0PSJfYmxhbmsiIGRhdGEtc2FmZXJlZGl=
y
ZWN0dXJsPSJodHRwczovL3d3dy5nb29nbGUuY29tL3VybD9xPWh0dHA6Ly8xMjMuNDUuNjcuMS8=
z
MCZhbXA7c291cmNlPWdtYWlsJmFtcDt1c3Q9MTUwMjQ3MDEyNDkzOTAwMCZhbXA7dXNnPUFGUWp=
D
TkZsczdrc3BGVzBqbTdFRTZ6YkRxWHpfcEliNEEiPjEyMy40NS42Ny4xLzMwPC9hPiBhbmQgSSB=
o
YXZlIG9uIHRoZSBib3ggMTIzLjQ1LjY3LjIgYXMgZGVmYXVsdCBnYXRld2F5LjwvZGl2PjxkaXY=
+
b24gdGhhdCBsaW5rIEkgYmdwIHBlZXIgd2l0aCZuYnNwOzEyMy40NS42Ny4yIGFuZCBhbm5vdW5=
j
ZSBteSBvd24gLzI0LCBsZXQncyBzYXkgPGEgaHJlZj0iaHR0cDovLzEzNC41Ni43OC4wLzI0IiB=
0
YXJnZXQ9Il9ibGFuayIgZGF0YS1zYWZlcmVkaXJlY3R1cmw9Imh0dHBzOi8vd3d3Lmdvb2dsZS5=
j
b20vdXJsP3E9aHR0cDovLzEzNC41Ni43OC4wLzI0JmFtcDtzb3VyY2U9Z21haWwmYW1wO3VzdD0=
x
NTAyNDcwMTI0OTM5MDAwJmFtcDt1c2c9QUZRakNORnE2cDBNUHlPWDBTdXNRYXNvVmtaOFloZnQ=
t
dyI+MTM0LjU2Ljc4LjAvMjQ8L2E+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5hbm90aGVyIGV=
0
aCBpbnRlcmZhY2UgKGV0aDEpIGhvc3RzIHNldmVyYWwgaXAgYWRkcmVzc2VzIGFuZCBvbmUgb2Y=
g
dGhlc2UgaXMgPGEgaHJlZj0iaHR0cDovLzEzNC41Ni43OC41LzI0IiB0YXJnZXQ9Il9ibGFuayI=
g
ZGF0YS1zYWZlcmVkaXJlY3R1cmw9Imh0dHBzOi8vd3d3Lmdvb2dsZS5jb20vdXJsP3E9aHR0cDo=
v
LzEzNC41Ni43OC41LzI0JmFtcDtzb3VyY2U9Z21haWwmYW1wO3VzdD0xNTAyNDcwMTI0OTM5MDA=
w
JmFtcDt1c2c9QUZRakNOSDJLSEdPWDhLZ1VmcGFmRG5SOGJJQVBjOWFadyI+MTM0LjU2Ljc4LjU=
v
MjQ8L2E+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5mb3IgdGhhdCBpbnRlcmZhY2UgSSBhbGx=
v
dyBwb3J0IDQ0MyB0byBhY2NlcHQgcGFja2V0cyBmb3ImbmJzcDs8L2Rpdj48ZGl2PmBgYDwvZGl=
2
PjxkaXY+PGRpdj5bSW50ZXJmYWNlXTwvZGl2PjxkaXY+TGlzdGVuUG9ydCA9IDQ0MzwvZGl2Pjw=
v
ZGl2PjxkaXY+YGBgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5idXQgSSBkbyBub3QgYWxsb3c=
g
cGFja2V0cyB0byBjb25uZWN0IHRvIGA8YSBocmVmPSJodHRwOi8vMTIzLjQ1LjY3LjEvMzAiIHR=
h
cmdldD0iX2JsYW5rIiBkYXRhLXNhZmVyZWRpcmVjdHVybD0iaHR0cHM6Ly93d3cuZ29vZ2xlLmN=
v
bS91cmw/cT1odHRwOi8vMTIzLjQ1LjY3LjEvMzAmYW1wO3NvdXJjZT1nbWFpbCZhbXA7dXN0PTE=
1
MDI0NzAxMjQ5MzkwMDAmYW1wO3VzZz1BRlFqQ05GbHM3a3NwRlcwam03RUU2emJEcVh6X3BJYjR=
B
Ij4xMjMuNDUuNjcuMS8zMGA8L2E+IG9uIHBvcnQgNDQzIChhcyB0aGlzIGlmYWNlIGlzIGp1c3Q=
g
bXkgUHJvdmlkZXIncyAvMzA8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PndoZW4gYSBjbGllbnQ=
g
Y29ubmVjdHMgdG8gPGEgaHJlZj0iaHR0cDovLzEzNC41Ni43OC41LzI0IiB0YXJnZXQ9Il9ibGF=
u
ayIgZGF0YS1zYWZlcmVkaXJlY3R1cmw9Imh0dHBzOi8vd3d3Lmdvb2dsZS5jb20vdXJsP3E9aHR=
0
cDovLzEzNC41Ni43OC41LzI0JmFtcDtzb3VyY2U9Z21haWwmYW1wO3VzdD0xNTAyNDcwMTI0OTM=
5
MDAwJmFtcDt1c2c9QUZRakNOSDJLSEdPWDhLZ1VmcGFmRG5SOGJJQVBjOWFadyI+MTM0LjU2Ljc=
4
LjUvMjQ8L2E+LCB0aGUgd2cgc2VydmVyIHRlbGxzIHRoZSBjbGllbnQgdGhhdCBpdCdzIGRlc3R=
p
bmF0aW9uIGlzJm5ic3A7PGEgaHJlZj0iaHR0cDovLzEyMy40NS42Ny4xLzMwIiB0YXJnZXQ9Il9=
i
bGFuayIgZGF0YS1zYWZlcmVkaXJlY3R1cmw9Imh0dHBzOi8vd3d3Lmdvb2dsZS5jb20vdXJsP3E=
9
aHR0cDovLzEyMy40NS42Ny4xLzMwJmFtcDtzb3VyY2U9Z21haWwmYW1wO3VzdD0xNTAyNDcwMTI=
0
OTM5MDAwJmFtcDt1c2c9QUZRakNORmxzN2tzcEZXMGptN0VFNnpiRHFYel9wSWI0QSI+MTIzLjQ=
1
LjY3LjEvMzA8L2E+IGZvciB0aGlzIGxpbmsgLCBhbmQgdGhhdCBnZXRzIG9mIGNvdXJzZSBmaXJ=
l
d2FsbGVkLjwvZGl2PjxkaXY+U28gcmVsdWN0YW50bHkgSSBvcGVuZWQgdXAgcG9ydCA0NDMgb24=
g
dGhlIHVwbGluayBpbnRlcmZhY2UgdG8gYWNjb21vZGF0ZSB0aGlzLCBlcm0sIGluY29udmVuaWV=
u
Y2UuJm5ic3A7PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5vbiBjbGllbnQgc2lkZSBJIGhhdmU=
g
YSBjb25maWcgOjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+YGBgPC9kaXY+PGRpdj48ZGl2Plt=
Q
ZWVyXTwvZGl2PjxkaXY+UHVibGljS2V5ID0gKGhpZGRlbik8L2Rpdj48ZGl2PkVuZFBvaW50ID0=
g
MTM0LjU2Ljc4LjU6NDQzPC9kaXY+PGRpdj5BbGxvd2VkSVBzID0gJm5ic3A7MC4wLjAuMC8wPC9=
k
aXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PGRpdj5gYGA8L2Rpdj48ZGl2PmJ1dCB3aGVuIGNvbm5=
l
Y3Rpb24gaXMgZXN0YWJsaXNoZWQ8L2Rpdj48ZGl2PmB3ZyBzaG93YCBzYXlzIDo8L2Rpdj48ZGl=
2
Pjxicj48L2Rpdj48ZGl2PmBgYDwvZGl2PjxkaXY+PGRpdj5wZWVyOiAoaGlkZGVuKTwvZGl2Pjx=
k
aXY+Jm5ic3A7IGVuZHBvaW50OiAxMjMuMzQuNTYuMTo0NDM8L2Rpdj48ZGl2PiZuYnNwOyBhbGx=
v
d2VkIGlwczogMTAuMC4wLjAvODwvZGl2PjxkaXY+Jm5ic3A7IGxhdGVzdCBoYW5kc2hha2U6IDM=
2
IHNlY29uZHMgYWdvPC9kaXY+PGRpdj4mbmJzcDsgdHJhbnNmZXI6IDQ2OC40MCBNaUIgcmVjZWl=
2
ZWQsIDE3Ljg4IE1pQiBzZW50PC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9=
k
aXY+PGRpdj5gYGA8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmJ1dCBub3cgb2YgY291cnNlLCB=
3
aGVuIHRoZSB0aGlyZCBpbnRlcmZhY2UgZXRoMiB3aWxsIGFycml2ZSwgd2l0aCBhbm90aGVyIHN=
1
Ym5ldCB0byBhbm90aGVyIHByb3ZpZGVyLCBteSBhbm5vdW5jZWQgSVAmbmJzcDs8YSBocmVmPSJ=
o
dHRwOi8vMTM0LjU2Ljc4LjUvMjQiIHRhcmdldD0iX2JsYW5rIiBkYXRhLXNhZmVyZWRpcmVjdHV=
y
bD0iaHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS91cmw/cT1odHRwOi8vMTM0LjU2Ljc4LjUvMjQmYW1=
w
O3NvdXJjZT1nbWFpbCZhbXA7dXN0PTE1MDI0NzAxMjQ5MzkwMDAmYW1wO3VzZz1BRlFqQ05IMkt=
I
R09YOEtnVWZwYWZEblI4YklBUGM5YVp3Ij4xMzQuNTYuNzguNS8yNDwvYT4gbWF5IG5vdCBiZSB=
h
bHRlcmVkIGJ5IHRoZSBwYXRoIHRha2VuLCBvdGhlcndpc2UgdGhlIGNsaWVudHMgbmVlZCB0byB=
y
ZWNvbm5lY3QuLi48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmJ1dCBJIGRvbid0IGtub3cgZm9=
y
IHN1cmUuLi4gaXQgc2VlbXMgdG8gYmUgYSByZWdyZXNzaW9uIHNvbWV3aGVyZSBhcyBJIGRvbid=
0
IHJlY2FsbCB0byBoYXZlIHRoYXQgcHJvYmxlbSBiZWZvcmUuLi4gSSBoYWQgdG8gYWRkIHRoaXM=
g
YWNjZXB0IHJ1bGUgbGFzdCB3ZWVrLCBzdWRkZW5seSwgYXMgc29tZSBwZWVycyBjb3VsZCBjb25=
u
ZWN0LCBidXQgbm90IHRyYW5zZmVyIHBhY2tldHMgYW55IG1vcmUuPC9kaXY+PGRpdj48YnI+PC9=
k
aXY+PGRpdj5Ob3cgSSB1bmRlcnN0YW5kIHRoYXQgd2cgZmluZHMgaXQncyBJUCBieSBmb2xsb3d=
p
bmcgdGhlIHNob3J0ZXN0IHBhdGgsIGJ1dCB0aGF0IGlzLCBpbiBteSBjYXNlLCBjb3VudGVycHJ=
v
ZHVjdGl2ZS48L2Rpdj48ZGl2Pkl0IHNob3VsZCByZXBseSB3aXRoIHRoZSBJUCBpdCB3YXMgc3B=
v
a2VuIHRvIChoZXJlIDEzNC41Ni43OC41KTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSB0aGl=
u
ayA7LSk8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkphbjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJ=
n
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciI+T24gVGh1LCBBdWcgMTAsIDIwMTcgYXQgNTo1MSB=
Q
TSBKYXNvbiBBLiBEb25lbmZlbGQgJmx0OzxhIGhyZWY9Im1haWx0bzpKYXNvbkB6eDJjNC5jb20=
i
IHRhcmdldD0iX2JsYW5rIj5KYXNvbkB6eDJjNC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY=
+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg=
7
Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+SGV5IEphbiw8YnI=
+
Cjxicj4KJmd0OyBXaGVuIHdpcmVndWFyZCBjbGllbnRzIGNvbm5lY3QsIHRoZWlyIGNvbmZpZyB=
z
aG93cyB0aGVpciBwZWVyPGJyPgomZ3Q7IHRvIGJlIHRoZSBVcGxpbmsgSVAgYWRkcmVzcyBpbnN=
0
ZWFkIG9mIHRoZSBJUCBvbiB0aGUgUHVibGljPGJyPgomZ3Q7IGludGVyZmFjZSB0aGF0IHdhcyB=
z
cGVjaWZpY2FsbHkgYXNzaWduZWQgZm9yIHdpcmVndWFyZCAod2dzcnYpPGJyPgo8YnI+CkRvIHl=
v
dSBtZWFuIHRvIHNheSB0aGF0IHRoZSBfZW5kcG9pbnRfIElQIGFkZHJlc3Mgb2YgdGhlIFdpcmV=
H
dWFyZDxicj4KcGVlciBpcyBhbiBJUCBhc3NvY2lhdGVkIHdpdGggVXBsaW5rIGluc3RlYWQgb2Y=
g
d2l0aCBQdWJsaWM/IElmIHRoaXM8YnI+CmlzIHRoZSBjYXNlLCBpdCBtaWdodCBiZSBzb21lIG9=
k
ZCBETkFUIHNpdHVhdGlvbiBjYXVzaW5nIHRoaXMgdG88YnI+CmhhcHBlbiBmb3IgeW91PyBUaGU=
g
cGVlcidzIGVuZHBvaW50IElQIGFkZHJlc3MgaXMgc2ltcGx5IHRoZSBzcmMgSVAgb2Y8YnI+CnR=
o
ZSBtb3N0IHJlY2VudGx5IGF1dGhlbnRpY2F0ZWQgcGFja2V0IGZyb20gdGhlIHBlZXIuIEl0IHN=
v
dW5kcyBsaWtlPGJyPgp0aGVyZSdzIHNvbWV0aGluZyBvZGQgaW4gcGxhY2UgY2F1c2luZyB0aGU=
g
c3JjIElQIHRvIGJlIHdyb25nPyBCdXQgSTxicj4KY2FuJ3QgdGhpbmsgb2YgaG93IHRoaXMgd29=
1
bGQgYmUgV2lyZUd1YXJkIHJlbGF0ZWQuIFVubGVzcyBJJ3ZlPGJyPgptaXN1bmRlcnN0b29kIHN=
v
bWV0aGluZz88YnI+Cjxicj4KSmFzb248YnI+CjwvYmxvY2txdW90ZT48L2Rpdj4=3D" style=
=3D"height:0;width:0;max-height:0;max-width:0;overflow:hidden;font-size:0em=
;padding:0;margin:0">=E2=80=8B</div></div></div>

--94eb2c07b99eb5643b055669165e--
