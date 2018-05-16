Return-Path: me@tombowdit.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 225349ed
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 18:11:47 +0000 (UTC)
Received: from mail-ot0-x241.google.com (mail-ot0-x241.google.com
 [IPv6:2607:f8b0:4003:c0f::241])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3bcd34d1
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 18:11:47 +0000 (UTC)
Received: by mail-ot0-x241.google.com with SMTP id h8-v6so2009503otb.2
 for <wireguard@lists.zx2c4.com>; Wed, 16 May 2018 11:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20180515225433.GA26432@zx2c4.com>
In-Reply-To: <20180515225433.GA26432@zx2c4.com>
From: Tommy Bowditch <me@tombowdit.ch>
Date: Wed, 16 May 2018 19:11:58 +0100
Message-ID: <CAEm-Zo55L1cLPviSe=C15ZpBM+gvB97MtdsCEX=AMSSYkJcHMQ@mail.gmail.com>
Subject: Re: [ANNOUNCE] Alpha Snapshots of WireGuard for Android and macOS
To: Jason@zx2c4.com
Content-Type: multipart/alternative; boundary="0000000000003d0e16056c56a846"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000003d0e16056c56a846
Content-Type: text/plain; charset="UTF-8"

Hi all,

So - I don't know if it's me being *thick* or wg-quick isn't supposed to do
this, but:

I have a wireguard config on my Macbook with addresses 10.3.0.5/31 &
fd10::10:3:41/127, other endpoint is .4 and :40.

Running wg-quick up wg-xxxxx works fine - pinging the v4 of the other side
doesn't work however v6 does -

# ping 10.3.0.4
PING 10.3.0.4 (10.3.0.4): 56 data bytes
Request timeout for icmp_seq 0
Request timeout for icmp_seq 1
# ping6 fd10::10:3:40
PING6(56=40+8+8 bytes) fd10::10:3:41 --> fd10::10:3:40
16 bytes from fd10::10:3:40, icmp_seq=0 hlim=64 time=16.008 ms
16 bytes from fd10::10:3:40, icmp_seq=1 hlim=64 time=16.019 ms
16 bytes from fd10::10:3:40, icmp_seq=2 hlim=64 time=14.460 ms

I think I see the problem:
# ip route get 10.3.0.4
10.3.0.4 via 10.2.0.1 dev en0  src 10.2.0.71
# ip -6 route get fd10::10:3:40
fd10::10:3:40 dev utun1  src fd10::10:3:41

and it's fixable, of course, I was just wondering if this is intended
behaviour considering v6 works perfectly OK?

Tom

On Tue, May 15, 2018 at 11:54 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hey folks,
>
> We're gradually adding more platforms capable of running WireGuard, thanks
> to
> some still-buggy userspace code Mathias and I have been developing. Today
> you
> can try WireGuard on two new platforms: Android and macOS.
>
> [NEW] WireGuard for Android
> ---------------------------
> You can download the app from the Play Store or from F-Droid. It supports
> adding wg-quick(8)-style .conf files or .zips of them. The app uses the
> kernel
> module if available, which gives the best performance, stability, and
> battery
> life, and falls back to the userspace code if it's not available. Download
> at:
> https://play.google.com/store/apps/details?id=com.wireguard.android
>
> [NEW] WireGuard for macOS
> -------------------------
> You can install wg-quick, wg, and wireguard-go using Homebrew. Then you
> should
> be able to run `wg-quick up whatever` and familiar commands as you're used
> to.
> If you're setting up a network manually, you can run `wireguard-go utun3`
> in
> place of the usual Linux command `ip link add utun3 dev wireguard`. Install
> with the Homebrew command:
> $ brew install wireguard-tools
>
> [FUTURE] WireGuard for ${YOUR_FAVORITE_PLATFORM}
> ------------------------------------------------
> It's a work in progress, and we hope to have nice things to announce in the
> coming weeks. If you're interested in helping to develop support for a
> particular platform, please send us an email at team@wireguard.com.
>
> [WORKHORSE] WireGuard for Linux
> -------------------------------
> The Linux kernel implementation remains the recommended and most complete
> WireGuard implementation, and we're actively working on upstreaming this
> code
> to kernel.org. Install instructions are available for every major distro
> on:
> https://www.wireguard.com/install/
>
> [DISCLAIMER] Alpha Warning for Security-related Software
> --------------------------------------------------------
> The new implementations for macOS and Android are alpha quality, at best,
> so
> keep expectations low. There are bugs. There may even be security issues,
> and
> we don't yet certify that this software does what we want it to do. Let us
> know as you encounter the inevitable nasty bugs. Consider this as
> "pre-release"
> software.
>
> Enjoy!
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000003d0e16056c56a846
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>So - I don&#39;t know if it&#39=
;s me being <b>thick</b>=C2=A0or wg-quick isn&#39;t supposed to do this, bu=
t:<div><br></div><div>I have a wireguard config on my Macbook with addresse=
s <a href=3D"http://10.3.0.5/31">10.3.0.5/31</a> &amp; fd10::10:3:41/127, o=
ther endpoint is .4 and :40.</div><div><br></div><div>Running <font face=3D=
"monospace, monospace">wg-quick up wg-xxxxx</font> works fine - pinging the=
 v4 of the other side doesn&#39;t work however v6 does -</div><div><br></di=
v><div><div><font face=3D"monospace, monospace"># ping 10.3.0.4</font></div=
><div><font face=3D"monospace, monospace">PING 10.3.0.4 (10.3.0.4): 56 data=
 bytes</font></div><div><font face=3D"monospace, monospace">Request timeout=
 for icmp_seq 0</font></div><div><font face=3D"monospace, monospace">Reques=
t timeout for icmp_seq 1</font></div></div><div><div><font face=3D"monospac=
e, monospace"># ping6 fd10::10:3:40</font></div><div><font face=3D"monospac=
e, monospace">PING6(56=3D40+8+8 bytes) fd10::10:3:41 --&gt; fd10::10:3:40</=
font></div><div><font face=3D"monospace, monospace">16 bytes from fd10::10:=
3:40, icmp_seq=3D0 hlim=3D64 time=3D16.008 ms</font></div><div><font face=
=3D"monospace, monospace">16 bytes from fd10::10:3:40, icmp_seq=3D1 hlim=3D=
64 time=3D16.019 ms</font></div><div><font face=3D"monospace, monospace">16=
 bytes from fd10::10:3:40, icmp_seq=3D2 hlim=3D64 time=3D14.460 ms</font></=
div></div><div><br></div><div>I think I see the problem:</div><div><div><fo=
nt face=3D"monospace, monospace"># ip route get 10.3.0.4</font></div><div><=
font face=3D"monospace, monospace">10.3.0.4 via 10.2.0.1 dev en0=C2=A0 src =
10.2.0.71</font></div><div><font face=3D"monospace, monospace"># ip -6 rout=
e get fd10::10:3:40</font></div><div><font face=3D"monospace, monospace">fd=
10::10:3:40 dev utun1=C2=A0 src fd10::10:3:41</font></div></div><div><br></=
div><div>and it&#39;s fixable, of course, I was just wondering if this is i=
ntended behaviour considering v6 works perfectly OK?</div><div><br></div><d=
iv>Tom</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On =
Tue, May 15, 2018 at 11:54 PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jaso=
n@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">Hey folks,<br>
<br>
We&#39;re gradually adding more platforms capable of running WireGuard, tha=
nks to<br>
some still-buggy userspace code Mathias and I have been developing. Today y=
ou<br>
can try WireGuard on two new platforms: Android and macOS.<br>
<br>
[NEW] WireGuard for Android<br>
---------------------------<br>
You can download the app from the Play Store or from F-Droid. It supports<b=
r>
adding wg-quick(8)-style .conf files or .zips of them. The app uses the ker=
nel<br>
module if available, which gives the best performance, stability, and batte=
ry<br>
life, and falls back to the userspace code if it&#39;s not available. Downl=
oad at:<br>
<a href=3D"https://play.google.com/store/apps/details?id=3Dcom.wireguard.an=
droid" rel=3D"noreferrer" target=3D"_blank">https://play.google.com/store/a=
pps/details?id=3Dcom.wireguard.android</a><br>
<br>
[NEW] WireGuard for macOS<br>
-------------------------<br>
You can install wg-quick, wg, and wireguard-go using Homebrew. Then you sho=
uld<br>
be able to run `wg-quick up whatever` and familiar commands as you&#39;re u=
sed to.<br>
If you&#39;re setting up a network manually, you can run `wireguard-go utun=
3` in<br>
place of the usual Linux command `ip link add utun3 dev wireguard`. Install=
<br>
with the Homebrew command:<br>
$ brew install wireguard-tools<br>
<br>
[FUTURE] WireGuard for ${YOUR_FAVORITE_PLATFORM}<br>
------------------------------------------------<br>
It&#39;s a work in progress, and we hope to have nice things to announce in=
 the<br>
coming weeks. If you&#39;re interested in helping to develop support for a<=
br>
particular platform, please send us an email at <a href=3D"mailto:team@wire=
guard.com" target=3D"_blank">team@wireguard.com</a>.<br>
<br>
[WORKHORSE] WireGuard for Linux<br>
-------------------------------<br>
The Linux kernel implementation remains the recommended and most complete<b=
r>
WireGuard implementation, and we&#39;re actively working on upstreaming thi=
s code<br>
to <a href=3D"http://kernel.org" rel=3D"noreferrer" target=3D"_blank">kerne=
l.org</a>. Install instructions are available for every major distro on:<br=
>
<a href=3D"https://www.wireguard.com/install/" rel=3D"noreferrer" target=3D=
"_blank">https://www.wireguard.com/install/</a><br>
<br>
[DISCLAIMER] Alpha Warning for Security-related Software<br>
--------------------------------------------------------<br>
The new implementations for macOS and Android are alpha quality, at best, s=
o<br>
keep expectations low. There are bugs. There may even be security issues, a=
nd<br>
we don&#39;t yet certify that this software does what we want it to do. Let=
 us<br>
know as you encounter the inevitable nasty bugs. Consider this as &quot;pre=
-release&quot;<br>
software.<br>
<br>
Enjoy!<br>
Jason<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--0000000000003d0e16056c56a846--
