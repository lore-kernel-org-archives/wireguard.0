Return-Path: johnstonljordan@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bcc96a0
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 23:54:07 +0000 (UTC)
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ec2a24f
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 23:54:06 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id r78so6206345wme.5
 for <wireguard@lists.zx2c4.com>; Fri, 01 Dec 2017 16:00:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9o9pQdRdQ=7MqLYe1Yg8vxZNzAHd0ouRSq1Pwb9YYaHdg@mail.gmail.com>
References: <CAKgnZ5wDEwMXA6+WbxrmQocBgPPeHCH-WBdn5kHezzsLPGDdtQ@mail.gmail.com>
 <CAHmME9qXr5aig-79MjuCbaTUPt2MEh+oAA53gpxOk999CsqKmw@mail.gmail.com>
 <CAHmME9o9pQdRdQ=7MqLYe1Yg8vxZNzAHd0ouRSq1Pwb9YYaHdg@mail.gmail.com>
From: Jordan Johnston <johnstonljordan@gmail.com>
Date: Fri, 1 Dec 2017 19:00:23 -0500
Message-ID: <CAKgnZ5zFXRVMnyG1MCGuNXkVmH3Lnp_oWK2KkMikoeWpUK+1wQ@mail.gmail.com>
Subject: Re: WireGuard (Android) Configuration issues, etc.
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="f403045c28b418e1d4055f502c70"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045c28b418e1d4055f502c70
Content-Type: text/plain; charset="UTF-8"

Hey Jason,

Ahhh. wg-quick indeed requires bash, and from what I gather, there
> isn't bash on your ROM. You should be able to build that easily from
> the AOSP source `mka bash`. This is one of the reasons I first
> launched the Android stuff with the local_manifest.xml hack instead of
> the standalone tools. I'll have to think about a more general purpose
> solution, but for now, I thing the best thing you can do would be to
> just add bash. If you're stuck and need help, I can probably build you
> a statically linked musl aarch64 bash that will work mostly
> everywhere.
>

you got it, sir! Bash does not ship on the Pixel stock rom! (This is
probably true of many Stock Roms).

I'd like to have a stab at building Bash. But I don't have AOSP on my
Archlinux box (I only build the kernel, plus apps in android studio).
So that may be an issue, but I can have a look at how AOSP builds bash (so
far, I can't even find the source code for AOSP/bash online though).

however, I do like your idea; you could save me a step and provide me with
bash, if it's not too much trouble for you. Although, shouldn't bash be
built against bionic libc not musl?

Alternatively, if someone is running an Oreo rom for arm64-v8a and/or the
Pixel ~ they could post a bash binary - that might work for me.


> We might wind up wanting that statically compiled bash for the .zip.
> Based on your findings above, we can adjust this plan accordingly.
> Having the flashable .zip infra seems like a good idea either way.


Shipping a statically compiled version of bash would be the best solution,
for sure. That would cover everybody.

We don't use this list for commercial providers -- they have their own
> private support emails and contact methods -- but I can help you with
> the free non-commericial demo server -- demo.wireguard.com.
>

I never tried connecting to your server, but next time that is what I will
do, first.


> Makes sense. It might make the most sense to just head into #wireguard
> on Freenode too, where we can troubleshoot basic how-to things in real
> time.
>

Will do, but I'll need to sort out bash, first.

Oh, wonderful! Don't hesitate to send patches to this list for that stuff.
>

Yeah, I've found the WireGuard android app repository and downloaded the
sources. So I will take a look and see if I can't make it play nice with
Oreo on boot. If i can get that working okay, I will send patches for sure.

I'll update the demo.wireguard.com scripts in the repo in a bit to
> make them slightly more simple and support v6, like the attached, but
> thought you might benefit from this now.
>
> zx2c4@thinkpad ~ $ ./client.sh > /etc/wireguard/demo.conf
> zx2c4@thinkpad ~ $ wg-quick up demo
> [#] ip link add demo type wireguard
> [#] wg setconf demo /dev/fd/63
> [#] ip address add 192.168.4.178/32 dev demo
> [#] ip link set mtu 1420 dev demo
> [#] ip link set demo up
> [#] resolvconf -a tun.demo -m 0 -x
> [#] wg set x fwmark 51820
> [#] ip -4 route add 0.0.0.0/0 dev demo table 51820
> [#] ip -4 rule add not fwmark 51820 table 51820
> [#] ip -4 rule add table main suppress_prefixlength 0
> zx2c4@thinkpad ~ $ curl -4 zx2c4.com/ip
> 163.172.161.0
> demo.wireguard.com
> curl/7.56.1
>
> Please don't run the script more than once or twice or thrice.
>

Sounds good, Jason. thanks!

I may not get to this until tomorrow, I'll be away from my computer + no
bash on my end yet.

Jordan

--f403045c28b418e1d4055f502c70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hey Jason,<br></div><br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
Ahhh. wg-quick indeed requires bash, and from what I gather, there<br>
isn&#39;t bash on your ROM. You should be able to build that easily from<br=
>
the AOSP source `mka bash`. This is one of the reasons I first<br>
launched the Android stuff with the local_manifest.xml hack instead of<br>
the standalone tools. I&#39;ll have to think about a more general purpose<b=
r>
solution, but for now, I thing the best thing you can do would be to<br>
just add bash. If you&#39;re stuck and need help, I can probably build you<=
br>
a statically linked musl aarch64 bash that will work mostly<br>
everywhere.<br></blockquote><div><br></div><div>you got it, sir! Bash does =
not ship on the Pixel stock rom! (This is probably true of many Stock Roms)=
.<br></div><div><br></div><div>I&#39;d like to have a stab at building Bash=
. But I don&#39;t have AOSP on my Archlinux box
(I only build the kernel, plus apps in android studio).</div><div>So=20
that may be an issue, but I can have a look at how AOSP builds bash (so=20
far, I can&#39;t even find the source code for AOSP/bash online=20
though). <br></div><div><br></div><div>however, I do like your idea; you co=
uld save me a step and provide me with bash, if it&#39;s not too much troub=
le for you. Although, shouldn&#39;t bash be built against bionic libc not m=
usl?</div><div><br></div><div>Alternatively, if someone is running an Oreo =
rom for arm64-v8a and/or the Pixel ~ they could post a bash binary - that m=
ight work for me.<br></div><div>=C2=A0<span></span><br><span></span></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><span>
</span>We might wind up wanting that statically compiled bash for the .zip.=
<br>
Based on your findings above, we can adjust this plan accordingly.<br>
Having the flashable .zip infra seems like a good idea either way.</blockqu=
ote><div><br></div><div>Shipping a statically compiled version of bash woul=
d be the best solution, for sure. That would cover everybody.<br></div><div=
><span></span><br><span></span></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><span>
</span>We don&#39;t use this list for commercial providers -- they have the=
ir own<br>
private support emails and contact methods -- but I can help you with<br>
the free non-commericial demo server -- <a href=3D"http://demo.wireguard.co=
m" rel=3D"noreferrer" target=3D"_blank">demo.wireguard.com</a>.<br></blockq=
uote><div><br></div><div>I never tried connecting to your server, but next =
time that is what I will do, first.<br></div><div>=C2=A0<span></span></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Makes sense. It might mak=
e the most sense to just head into #wireguard<br>
on Freenode too, where we can troubleshoot basic how-to things in real<br>
time.<br></blockquote><div><br></div><div>Will do, but I&#39;ll need to sor=
t out bash, first.<span></span></div><div><br><span></span><span></span></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><span>
</span>Oh, wonderful! Don&#39;t hesitate to send patches to this list for t=
hat stuff.<br>
</blockquote><div>=C2=A0</div><div>Yeah, I&#39;ve found the WireGuard andro=
id app repository and downloaded the=20
sources. So I will take a look and see if I can&#39;t make it play nice wit=
h
 Oreo on boot. If i can get that working okay, I will send patches for=20
sure.<br></div><div><br></div><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">I&#39;ll update the <a href=3D"http=
://demo.wireguard.com" rel=3D"noreferrer" target=3D"_blank">demo.wireguard.=
com</a> scripts in the repo in a bit to<br>
make them slightly more simple and support v6, like the attached, but<br>
thought you might benefit from this now.<br>
<br>
zx2c4@thinkpad ~ $ ./client.sh &gt; /etc/wireguard/demo.conf<br>
zx2c4@thinkpad ~ $ wg-quick up demo<br>
[#] ip link add demo type wireguard<br>
[#] wg setconf demo /dev/fd/63<br>
[#] ip address add <a href=3D"http://192.168.4.178/32" rel=3D"noreferrer" t=
arget=3D"_blank">192.168.4.178/32</a> dev demo<br>
[#] ip link set mtu 1420 dev demo<br>
[#] ip link set demo up<br>
[#] resolvconf -a tun.demo -m 0 -x<br>
[#] wg set x fwmark 51820<br>
[#] ip -4 route add <a href=3D"http://0.0.0.0/0" rel=3D"noreferrer" target=
=3D"_blank">0.0.0.0/0</a> dev demo table 51820<br>
[#] ip -4 rule add not fwmark 51820 table 51820<br>
[#] ip -4 rule add table main suppress_prefixlength 0<br>
zx2c4@thinkpad ~ $ curl -4 <a href=3D"http://zx2c4.com/ip" rel=3D"noreferre=
r" target=3D"_blank">zx2c4.com/ip</a><br>
163.172.161.0<br>
<a href=3D"http://demo.wireguard.com" rel=3D"noreferrer" target=3D"_blank">=
demo.wireguard.com</a><br>
curl/7.56.1<br>
<br>
Please don&#39;t run the script more than once or twice or thrice.<br><span=
 class=3D"m_807501156859627476HOEnZb"></span></blockquote></div></div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Sounds good, Jas=
on. thanks!<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">I may not get to this until tomorrow, I&#39;ll be away from my co=
mputer + no bash on my end yet.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Jordan<br></div></div>

--f403045c28b418e1d4055f502c70--
