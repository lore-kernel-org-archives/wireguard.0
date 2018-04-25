Return-Path: tom@tigera.io
MIME-Version: 1.0
In-Reply-To: <CAKiCHuNqght5YJQT2kBqsA82EFv-r+3BFgnbCPh27RR_kbYc2w@mail.gmail.com>
References: <CAJ5-c6WjxshZF7sE98Sk8XYr=9o5vRAiLQ+xCwq2Nidt8iPU8g@mail.gmail.com>
 <CAKiCHuNqght5YJQT2kBqsA82EFv-r+3BFgnbCPh27RR_kbYc2w@mail.gmail.com>
From: Tom Denham <tom@tigera.io>
Date: Wed, 25 Apr 2018 16:32:33 -0700
Message-ID: <CAJ5-c6WuHp-uppZO6gdSxn6J4FvNCVyfpt-wT-s9hjsRP9vyDg@mail.gmail.com>
Subject: Re: Using WireGuard with Kubernetes
To: Martin Eskdale Moen <martinmoen@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a83845056ab4b012"
Cc: WireGuard mailing list <WireGuard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000a83845056ab4b012
Content-Type: text/plain; charset="UTF-8"

For Kubernetes, using the bridge CNI plugin (
https://github.com/containernetworking/plugins/tree/master/plugins/main/bridge)
or even the ptp plugin (
https://github.com/containernetworking/plugins/tree/master/plugins/main/ptp)
should work fine. I wonder though if there's a way to alias the wg0 device
itself and push that into the container with something like the host-device
plugin (
https://github.com/containernetworking/plugins/tree/master/plugins/main/host-device).
This would avoid the overhead of a veth (and a bridge).

<https://tigera.io/> *Tom* *Denham*
Senior Software Engineer
Tigera
tom@tigera.io | @_tomdee <https://twitter.com/_tomdee> |
https://github.com/tomdee  <https://github.com/tomdee>
Follow us: Blog <https://blog.tigera.io/> | Twitter
<https://twitter.com/tigeraio> | LinkedIn
<https://www.linkedin.com/company/tigera/>

Secure Application Connectivity for the Cloud Native World
<https://tigera.io/>

On Wed, Apr 25, 2018 at 1:15 PM, Martin Eskdale Moen <martinmoen@gmail.com>
wrote:

> I've been doing some experiments with this. Not so much with kubes yet,
> that was next on the list.
> I think at the moment linking together the various network namespaces
> using a linux bridge should work.
> Not sure if I'm shooting myself in the foot at all using linux bridges.
> Reading over the docs of openvswitch vs linux bridge it seems the bridge is
> easier to understand and overall more useful.
>
> On Wed, Apr 25, 2018 at 6:54 PM, Tom Denham <tom@tigera.io> wrote:
>
>> I was wondering if anyone had any experience using WireGuard with
>> Kubernetes? I see that the WireGuard website says "Ready for Containers"
>> but the model it describes sounds like it would work for adding WireGuard
>> to a single container (putting the wg interface in the container itself).
>> If I have many containers on a host, and many containers on a host, and I
>> want them all to be able to communicate with each other using WireGuard,
>> then I would need to create many different WireGuard interfaces and
>> presumably they would all need their own independent config. It doesn't
>> feel like this would scale to 100's of hosts and tens of thousands of
>> containers.
>>
>> I'm interested in hearing people's thoughts and ideas on this
>> Thanks
>> Tom
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>>
>

--000000000000a83845056ab4b012
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">For Kubernetes, using the bridge CNI plugin (<a href=3D"ht=
tps://github.com/containernetworking/plugins/tree/master/plugins/main/bridg=
e">https://github.com/containernetworking/plugins/tree/master/plugins/main/=
bridge</a>) or even the ptp plugin (<a href=3D"https://github.com/container=
networking/plugins/tree/master/plugins/main/ptp">https://github.com/contain=
ernetworking/plugins/tree/master/plugins/main/ptp</a>) should work fine. I =
wonder though if there&#39;s a way to alias the wg0 device itself and push =
that into the container with something like the host-device plugin (<a href=
=3D"https://github.com/containernetworking/plugins/tree/master/plugins/main=
/host-device">https://github.com/containernetworking/plugins/tree/master/pl=
ugins/main/host-device</a>). This would avoid the overhead of a veth (and a=
 bridge).</div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><t=
able style=3D"font-family:&quot;Times New Roman&quot;"><tbody><tr><td valig=
n=3D"top"><a href=3D"https://tigera.io/" target=3D"_blank"><img src=3D"http=
s://www.tigera.io/wp-content/uploads/2017/12/TIGERA-logo-email-signature.pn=
g" width=3D"120" border=3D"0"></a></td><td valign=3D"top" style=3D"padding-=
left:30px;font-family:arial;font-size:13px;vertical-align:top"><strong>Tom<=
/strong>=C2=A0<strong>Denham</strong>=C2=A0<br>Senior Software Engineer=C2=
=A0<br>Tigera=C2=A0<br><a href=3D"mailto:tom@tigera.io" target=3D"_blank">t=
om@tigera.io</a> | <a href=3D"https://twitter.com/_tomdee" target=3D"_blank=
">@_tomdee</a> |<a href=3D"https://github.com/tomdee" target=3D"_blank"> ht=
tps://github.com/tomdee=C2=A0</a><br>Follow us:=C2=A0<a href=3D"https://blo=
g.tigera.io/" style=3D"color:blue" target=3D"_blank">Blog</a>=C2=A0|=C2=A0<=
a href=3D"https://twitter.com/tigeraio" style=3D"color:blue" target=3D"_bla=
nk">Twitter</a>=C2=A0|=C2=A0<a href=3D"https://www.linkedin.com/company/tig=
era/" style=3D"color:blue" target=3D"_blank">LinkedIn</a>=C2=A0<br><br><a h=
ref=3D"https://tigera.io/" style=3D"color:rgb(255,153,0);font-weight:bold" =
target=3D"_blank">Secure Application Connectivity for the Cloud Native Worl=
d</a></td></tr></tbody></table></div></div></div>
<br><div class=3D"gmail_quote">On Wed, Apr 25, 2018 at 1:15 PM, Martin Eskd=
ale Moen <span dir=3D"ltr">&lt;<a href=3D"mailto:martinmoen@gmail.com" targ=
et=3D"_blank">martinmoen@gmail.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div dir=3D"ltr"><div><div>I&#39;ve been doing some experim=
ents with this. Not so much with kubes yet, that was next on the list.<br><=
/div>I think at the moment linking together the various network namespaces =
using a linux bridge should work.<br></div><div>Not sure if I&#39;m shootin=
g myself in the foot at all using linux bridges. Reading over the docs of o=
penvswitch vs linux bridge it seems the bridge is easier to understand and =
overall more useful.<br></div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote"><div><div class=3D"h5">On Wed, Apr 25, 2018 at 6:54 PM, Tom De=
nham <span dir=3D"ltr">&lt;<a href=3D"mailto:tom@tigera.io" target=3D"_blan=
k">tom@tigera.io</a>&gt;</span> wrote:<br></div></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div><div class=3D"h5"><div dir=3D"ltr">I was wondering if anyone=
 had any experience using WireGuard with Kubernetes? I see that the WireGua=
rd website says &quot;Ready for Containers&quot; but the model it describes=
 sounds like it would work for adding WireGuard to a single container (putt=
ing the wg interface in the container itself). If I have many containers on=
 a host, and many containers on a host, and I want them all to be able to c=
ommunicate with each other using WireGuard, then I would need to create man=
y different WireGuard interfaces and presumably they would all need their o=
wn independent config. It doesn&#39;t feel like this would scale to 100&#39=
;s of hosts and tens of thousands of containers.<div><br></div><div>I&#39;m=
 interested in hearing people&#39;s thoughts and ideas on this</div><div>Th=
anks</div><span class=3D"m_-4358810127885945483m_-8512209423325127063HOEnZb=
"><font color=3D"#888888"><div>Tom</div></font></span></div>
<br></div></div>______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailma<wbr>n/listinfo/wire=
guard</a><br>
<br></blockquote></div><br></div></div>
</blockquote></div><br></div>

--000000000000a83845056ab4b012--
