Return-Path: jan@delandtsheer.eu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04621449
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 08:51:54 +0000 (UTC)
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
 [209.85.161.193])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7e6a6ae
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 08:51:54 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id p68so78497ywg.5
 for <wireguard@lists.zx2c4.com>; Thu, 10 Aug 2017 02:13:58 -0700 (PDT)
MIME-Version: 1.0
From: Jan De Landtsheer <jan@delandtsheer.eu>
Date: Thu, 10 Aug 2017 09:13:46 +0000
Message-ID: <CADqnr01+qq8K+083_LRJeq424BHB_F+R-nxoGdrWAPCuS1r=gA@mail.gmail.com>
Subject: FR: interface ListenAddress (Aka:Multihomed server issue)
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="001a114e46a0c99b120556629dee"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114e46a0c99b120556629dee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jason,
To elaborate on
https://lists.zx2c4.com/pipermail/wireguard/2017-August/001598.html, there
is something that can be clarified =E2=80=A6

I have a multihomed server (our router for everything) attached to a core
switch with vlans, and the router runs openvswitch (but that=E2=80=99s besi=
des the
point).

We run a bunch of wg peers, interconnected to each other (30 or so), but
most connect directly to our router.

The router has an Uplink interface with a /30 and I use that interface
solely to forward packets to our (bgp routed) default gw (Provider).

On the same router, I have a Public Interface, also with a public IP (/24)
and have on the router itself some IP addresses used for DNAT, and here
specifically one for Wireguard. (so NOT the Uplink IP address)

When wireguard clients connect, their config shows their peer to be the
Uplink IP address instead of the IP on the Public interface that was
specifically assigned for wireguard (wgsrv), and as such packets sent to
the Uplink IP address were dropped by the firewall.

You might say: open up the port for wireguard on the Uplink and off you go.
Which I did, to solve my immediate problem. (still find it ugly)

But no we=E2=80=99re getting a second provider in da house, that will be co=
nnected
the same way as the other, with that link being Uplink2. So now I *really*
need my bgp routed Public IP address to be the sole answering wireguard IP
packets, so that I can be sure that if one of my bgp peers dies, the same
Public ip address is used by the clients, not the one wireguard deduces
from the subnet with the default route.

Now, wireguard will use the incoming UplinkX ip as source and advertise it
to the clients connected through either one that has the same metric and
routing policy

Voila=E2=80=A6 in a nutshell ;-)

Jan
=E2=80=8B

--001a114e46a0c99b120556629dee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"markdown-here-wrapper" style=3D""><p style=
=3D"margin:0px 0px 1.2em!important">Jason,<br>To elaborate on <a href=3D"ht=
tps://lists.zx2c4.com/pipermail/wireguard/2017-August/001598.html">https://=
lists.zx2c4.com/pipermail/wireguard/2017-August/001598.html</a>, there is s=
omething that can be clarified =E2=80=A6</p>
<p style=3D"margin:0px 0px 1.2em!important">I have a multihomed server (our=
 router for everything) attached to a core switch with vlans, and the route=
r runs openvswitch (but that=E2=80=99s besides the point).</p>
<p style=3D"margin:0px 0px 1.2em!important">We run a bunch of wg peers, int=
erconnected to each other (30 or so), but most connect directly to our rout=
er.</p>
<p style=3D"margin:0px 0px 1.2em!important">The router has an <code style=
=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Courier,monospace;mar=
gin:0px 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(=
234,234,234);background-color:rgb(248,248,248);border-radius:3px;display:in=
line">Uplink</code> interface with a /30 and I use that interface solely to=
 forward packets to our (bgp routed) default gw (Provider).</p>
<p style=3D"margin:0px 0px 1.2em!important">On the same router, I have a <c=
ode style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Courier,mono=
space;margin:0px 0.15em;padding:0px 0.3em;white-space:pre-wrap;border:1px s=
olid rgb(234,234,234);background-color:rgb(248,248,248);border-radius:3px;d=
isplay:inline">Public</code> Interface, also with a public IP (/24) and hav=
e on the router itself some IP addresses used for DNAT, and here specifical=
ly one for Wireguard. (so NOT the <code style=3D"font-size:0.85em;font-fami=
ly:Consolas,Inconsolata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3=
em;white-space:pre-wrap;border:1px solid rgb(234,234,234);background-color:=
rgb(248,248,248);border-radius:3px;display:inline">Uplink</code> IP address=
)</p>
<p style=3D"margin:0px 0px 1.2em!important">When wireguard clients connect,=
 their config shows their peer to be the <code style=3D"font-size:0.85em;fo=
nt-family:Consolas,Inconsolata,Courier,monospace;margin:0px 0.15em;padding:=
0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234,234);background=
-color:rgb(248,248,248);border-radius:3px;display:inline">Uplink</code> IP =
address instead of the IP on the <code style=3D"font-size:0.85em;font-famil=
y:Consolas,Inconsolata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3e=
m;white-space:pre-wrap;border:1px solid rgb(234,234,234);background-color:r=
gb(248,248,248);border-radius:3px;display:inline">Public</code> interface t=
hat was specifically assigned for wireguard (<code style=3D"font-size:0.85e=
m;font-family:Consolas,Inconsolata,Courier,monospace;margin:0px 0.15em;padd=
ing:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234,234);backgr=
ound-color:rgb(248,248,248);border-radius:3px;display:inline">wgsrv</code>)=
, and as such packets sent to the <code style=3D"font-size:0.85em;font-fami=
ly:Consolas,Inconsolata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3=
em;white-space:pre-wrap;border:1px solid rgb(234,234,234);background-color:=
rgb(248,248,248);border-radius:3px;display:inline">Uplink</code> IP address=
 were dropped by the firewall.</p>
<p style=3D"margin:0px 0px 1.2em!important">You might say: open up the port=
 for wireguard on the <code style=3D"font-size:0.85em;font-family:Consolas,=
Inconsolata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3em;white-spa=
ce:pre-wrap;border:1px solid rgb(234,234,234);background-color:rgb(248,248,=
248);border-radius:3px;display:inline">Uplink</code> and off you go. Which =
I did, to solve my immediate problem. (still find it ugly)</p>
<p style=3D"margin:0px 0px 1.2em!important">But no we=E2=80=99re getting a =
second provider in da house, that will be connected the same way as the oth=
er, with that link being <code style=3D"font-size:0.85em;font-family:Consol=
as,Inconsolata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3em;white-=
space:pre-wrap;border:1px solid rgb(234,234,234);background-color:rgb(248,2=
48,248);border-radius:3px;display:inline">Uplink2</code>. So now I <em>real=
ly</em> need my bgp routed <code style=3D"font-size:0.85em;font-family:Cons=
olas,Inconsolata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3em;whit=
e-space:pre-wrap;border:1px solid rgb(234,234,234);background-color:rgb(248=
,248,248);border-radius:3px;display:inline">Public</code> IP address to be =
the sole answering wireguard IP packets, so that I can be sure that if one =
of my bgp peers dies, the same <code style=3D"font-size:0.85em;font-family:=
Consolas,Inconsolata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3em;=
white-space:pre-wrap;border:1px solid rgb(234,234,234);background-color:rgb=
(248,248,248);border-radius:3px;display:inline">Public</code> ip address is=
 used by the clients, not the one wireguard deduces from the subnet with th=
e default route.</p>
<p style=3D"margin:0px 0px 1.2em!important">Now, wireguard will use the inc=
oming <code style=3D"font-size:0.85em;font-family:Consolas,Inconsolata,Cour=
ier,monospace;margin:0px 0.15em;padding:0px 0.3em;white-space:pre-wrap;bord=
er:1px solid rgb(234,234,234);background-color:rgb(248,248,248);border-radi=
us:3px;display:inline">UplinkX</code> ip as source and advertise it to the =
clients connected through either one  that has the same metric and routing =
policy</p>
<p style=3D"margin:0px 0px 1.2em!important">Voila=E2=80=A6 in a nutshell ;-=
)</p>
<p style=3D"margin:0px 0px 1.2em!important">Jan</p>
<div title=3D"MDH:SmFzb24swqA8ZGl2PlRvIGVsYWJvcmF0ZSBvbiZuYnNwOzxhIGhyZWY9I=
mh0dHBzOi8vbGlzdHMu
engyYzQuY29tL3BpcGVybWFpbC93aXJlZ3VhcmQvMjAxNy1BdWd1c3QvMDAxNTk4Lmh0bWwiPmh=
0
dHBzOi8vbGlzdHMuengyYzQuY29tL3BpcGVybWFpbC93aXJlZ3VhcmQvMjAxNy1BdWd1c3QvMDA=
x
NTk4Lmh0bWw8L2E+LCB0aGVyZSBpcyBzb21ldGhpbmcgdGhhdCBjYW4gYmUgY2xhcmlmaWVkIC4=
u
LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBoYXZlIGEgbXVsdGlob21lZCBzZXJ2ZXIgKG9=
1
ciByb3V0ZXIgZm9yIGV2ZXJ5dGhpbmcpIGF0dGFjaGVkIHRvIGEgY29yZSBzd2l0Y2ggd2l0aCB=
2
bGFucywgYW5kIHRoZSByb3V0ZXIgcnVucyBvcGVudnN3aXRjaCAoYnV0IHRoYXQncyBiZXNpZGV=
z
IHRoZSBwb2ludCkuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5XZSBydW4gYSBidW5jaCBvZiB=
3
ZyBwZWVycywgaW50ZXJjb25uZWN0ZWQgdG8gZWFjaCBvdGhlciAoMzAgb3Igc28pLCBidXQgbW9=
z
dCBjb25uZWN0IGRpcmVjdGx5IHRvIG91ciByb3V0ZXIuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGR=
p
dj5UaGUgcm91dGVyIGhhcyBhbiBgVXBsaW5rYCBpbnRlcmZhY2Ugd2l0aCBhIC8zMCBhbmQgSSB=
1
c2UgdGhhdCBpbnRlcmZhY2Ugc29sZWx5IHRvIGZvcndhcmQgcGFja2V0cyB0byBvdXIgKGJncCB=
y
b3V0ZWQpIGRlZmF1bHQgZ3cgKFByb3ZpZGVyKS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pk9=
u
IHRoZSBzYW1lIHJvdXRlciwgSSBoYXZlIGEgYFB1YmxpY2AgSW50ZXJmYWNlLCBhbHNvIHdpdGg=
g
YSBwdWJsaWMgSVAgKC8yNCkgYW5kIGhhdmUgb24gdGhlIHJvdXRlciBpdHNlbGYgc29tZSBJUCB=
h
ZGRyZXNzZXMgdXNlZCBmb3IgRE5BVCwgYW5kIGhlcmUgc3BlY2lmaWNhbGx5IG9uZSBmb3IgV2l=
y
ZWd1YXJkLiAoc28gTk9UIHRoZSBgVXBsaW5rYCBJUCBhZGRyZXNzKTwvZGl2PjxkaXY+PGJyPjw=
v
ZGl2PjxkaXY+V2hlbiB3aXJlZ3VhcmQgY2xpZW50cyBjb25uZWN0LCB0aGVpciBjb25maWcgc2h=
v
d3MgdGhlaXIgcGVlciB0byBiZSB0aGUgYFVwbGlua2AgSVAgYWRkcmVzcyBpbnN0ZWFkIG9mIHR=
o
ZSBJUCBvbiB0aGUgYFB1YmxpY2AgaW50ZXJmYWNlIHRoYXQgd2FzIHNwZWNpZmljYWxseSBhc3N=
p
Z25lZCBmb3Igd2lyZWd1YXJkIChgd2dzcnZgKSwgYW5kIGFzIHN1Y2ggcGFja2V0cyBzZW50IHR=
v
IHRoZSBgVXBsaW5rYCBJUCBhZGRyZXNzIHdlcmUgZHJvcHBlZCBieSB0aGUgZmlyZXdhbGwuPC9=
k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Zb3UgbWlnaHQgc2F5OiBvcGVuIHVwIHRoZSBwb3J0IGZ=
v
ciB3aXJlZ3VhcmQgb24gdGhlIGBVcGxpbmtgIGFuZCBvZmYgeW91IGdvLiBXaGljaCBJIGRpZCw=
g
dG8gc29sdmUgbXkgaW1tZWRpYXRlIHByb2JsZW0uIChzdGlsbCBmaW5kIGl0IHVnbHkpPC9kaXY=
+
PGRpdj48YnI+PC9kaXY+PGRpdj5CdXQgbm8gd2UncmUgZ2V0dGluZyBhIHNlY29uZCBwcm92aWR=
l
ciBpbiBkYSBob3VzZSwgdGhhdCB3aWxsIGJlIGNvbm5lY3RlZCB0aGUgc2FtZSB3YXkgYXMgdGh=
l
IG90aGVyLCB3aXRoIHRoYXQgbGluayBiZWluZyBgVXBsaW5rMmAuIFNvIG5vdyBJICpyZWFsbHk=
q
IG5lZWQgbXkgYmdwIHJvdXRlZCBgUHVibGljYCBJUCBhZGRyZXNzIHRvIGJlIHRoZSBzb2xlIGF=
u
c3dlcmluZyB3aXJlZ3VhcmQgSVAgcGFja2V0cywgc28gdGhhdCBJIGNhbiBiZSBzdXJlIHRoYXQ=
g
aWYgb25lIG9mIG15IGJncCBwZWVycyBkaWVzLCB0aGUgc2FtZSBgUHVibGljYCBpcCBhZGRyZXN=
z
IGlzIHVzZWQgYnkgdGhlIGNsaWVudHMsIG5vdCB0aGUgb25lIHdpcmVndWFyZCBkZWR1Y2VzIGZ=
y
b20gdGhlIHN1Ym5ldCB3aXRoIHRoZSBkZWZhdWx0IHJvdXRlLjwvZGl2PjxkaXY+PGJyPjwvZGl=
2
PjxkaXY+Tm93LCB3aXJlZ3VhcmQgd2lsbCB1c2UgdGhlIGluY29taW5nIGBVcGxpbmtYYCBpcCB=
h
cyBzb3VyY2UgYW5kIGFkdmVydGlzZSBpdCB0byB0aGUgY2xpZW50cyBjb25uZWN0ZWQgdGhyb3V=
n
aCBlaXRoZXIgb25lICZuYnNwO3RoYXQgaGFzIHRoZSBzYW1lIG1ldHJpYyBhbmQgcm91dGluZyB=
w
b2xpY3k8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlZvaWxhLi4uIGl=
u
IGEgbnV0c2hlbGwgOy0pPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5KYW48L2Rpdj4=3D" sty=
le=3D"height:0;width:0;max-height:0;max-width:0;overflow:hidden;font-size:0=
em;padding:0;margin:0">=E2=80=8B</div></div></div>

--001a114e46a0c99b120556629dee--
