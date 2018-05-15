Return-Path: sedlmeyer@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efc6de6b
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 23:09:36 +0000 (UTC)
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c31335e
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 23:09:36 +0000 (UTC)
Received: by mail-it0-x242.google.com with SMTP id z6-v6so5850706iti.4
 for <wireguard@lists.zx2c4.com>; Tue, 15 May 2018 16:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20180515225433.GA26432@zx2c4.com>
In-Reply-To: <20180515225433.GA26432@zx2c4.com>
From: Tim Sedlmeyer <sedlmeyer@gmail.com>
Date: Tue, 15 May 2018 19:09:21 -0400
Message-ID: <CAK_h9uFnazi0x+Ky_bUn1ZZfaDHas-X-bdLR8x-G=oS-POL5Zg@mail.gmail.com>
Subject: Re: [ANNOUNCE] Alpha Snapshots of WireGuard for Android and macOS
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="0000000000000db8af056c46b337"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000000db8af056c46b337
Content-Type: text/plain; charset="UTF-8"

MacOS users should be aware that if you have manually assigned DNS servers
the current wg-quick implementation will remove them and not restore them.

On Tue, May 15, 2018, 6:54 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

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

--0000000000000db8af056c46b337
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>MacOS users should be aware that if you have manuall=
y assigned DNS servers the current wg-quick implementation will remove them=
 and not restore them.<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">O=
n Tue, May 15, 2018, 6:54 PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason=
@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Hey folks,<br>
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
droid" rel=3D"noreferrer noreferrer" target=3D"_blank">https://play.google.=
com/store/apps/details?id=3Dcom.wireguard.android</a><br>
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
guard.com" target=3D"_blank" rel=3D"noreferrer">team@wireguard.com</a>.<br>
<br>
[WORKHORSE] WireGuard for Linux<br>
-------------------------------<br>
The Linux kernel implementation remains the recommended and most complete<b=
r>
WireGuard implementation, and we&#39;re actively working on upstreaming thi=
s code<br>
to <a href=3D"http://kernel.org" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">kernel.org</a>. Install instructions are available for every major di=
stro on:<br>
<a href=3D"https://www.wireguard.com/install/" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://www.wireguard.com/install/</a><br>
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
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div></div></div>

--0000000000000db8af056c46b337--
