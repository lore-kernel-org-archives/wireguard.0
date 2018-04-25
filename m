Return-Path: martinmoen@gmail.com
MIME-Version: 1.0
In-Reply-To: <CAJ5-c6WjxshZF7sE98Sk8XYr=9o5vRAiLQ+xCwq2Nidt8iPU8g@mail.gmail.com>
References: <CAJ5-c6WjxshZF7sE98Sk8XYr=9o5vRAiLQ+xCwq2Nidt8iPU8g@mail.gmail.com>
From: Martin Eskdale Moen <martinmoen@gmail.com>
Date: Wed, 25 Apr 2018 21:15:28 +0100
Message-ID: <CAKiCHuNqght5YJQT2kBqsA82EFv-r+3BFgnbCPh27RR_kbYc2w@mail.gmail.com>
Subject: Re: Using WireGuard with Kubernetes
To: Tom Denham <tom@tigera.io>
Content-Type: multipart/alternative; boundary="f403043e74100adad8056ab1f195"
Cc: WireGuard mailing list <WireGuard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403043e74100adad8056ab1f195
Content-Type: text/plain; charset="UTF-8"

I've been doing some experiments with this. Not so much with kubes yet,
that was next on the list.
I think at the moment linking together the various network namespaces using
a linux bridge should work.
Not sure if I'm shooting myself in the foot at all using linux bridges.
Reading over the docs of openvswitch vs linux bridge it seems the bridge is
easier to understand and overall more useful.

On Wed, Apr 25, 2018 at 6:54 PM, Tom Denham <tom@tigera.io> wrote:

> I was wondering if anyone had any experience using WireGuard with
> Kubernetes? I see that the WireGuard website says "Ready for Containers"
> but the model it describes sounds like it would work for adding WireGuard
> to a single container (putting the wg interface in the container itself).
> If I have many containers on a host, and many containers on a host, and I
> want them all to be able to communicate with each other using WireGuard,
> then I would need to create many different WireGuard interfaces and
> presumably they would all need their own independent config. It doesn't
> feel like this would scale to 100's of hosts and tens of thousands of
> containers.
>
> I'm interested in hearing people's thoughts and ideas on this
> Thanks
> Tom
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>

--f403043e74100adad8056ab1f195
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I&#39;ve been doing some experiments with this. =
Not so much with kubes yet, that was next on the list.<br></div>I think at =
the moment linking together the various network namespaces using a linux br=
idge should work.<br></div><div>Not sure if I&#39;m shooting myself in the =
foot at all using linux bridges. Reading over the docs of openvswitch vs li=
nux bridge it seems the bridge is easier to understand and overall more use=
ful.<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
Wed, Apr 25, 2018 at 6:54 PM, Tom Denham <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:tom@tigera.io" target=3D"_blank">tom@tigera.io</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I was wondering if anyon=
e had any experience using WireGuard with Kubernetes? I see that the WireGu=
ard website says &quot;Ready for Containers&quot; but the model it describe=
s sounds like it would work for adding WireGuard to a single container (put=
ting the wg interface in the container itself). If I have many containers o=
n a host, and many containers on a host, and I want them all to be able to =
communicate with each other using WireGuard, then I would need to create ma=
ny different WireGuard interfaces and presumably they would all need their =
own independent config. It doesn&#39;t feel like this would scale to 100&#3=
9;s of hosts and tens of thousands of containers.<div><br></div><div>I&#39;=
m interested in hearing people&#39;s thoughts and ideas on this</div><div>T=
hanks</div><span class=3D"m_-8512209423325127063HOEnZb"><font color=3D"#888=
888"><div>Tom</div></font></span></div>
<br>______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailma<wbr>n/listinfo/wire=
guard</a><br>
<br></blockquote></div><br></div></div>

--f403043e74100adad8056ab1f195--
