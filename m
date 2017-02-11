Return-Path: dave@natulte.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b380df1
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 09:36:08 +0000 (UTC)
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
 [209.85.217.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7897c0b8
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 09:36:08 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id 96so43621166uaq.3
 for <wireguard@lists.zx2c4.com>; Sat, 11 Feb 2017 01:49:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9q8+D7y0Hz4xOJv1MiVsq0=bUf3TgENseGEWWF2BEpx4Q@mail.gmail.com>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <CAHmME9q8+D7y0Hz4xOJv1MiVsq0=bUf3TgENseGEWWF2BEpx4Q@mail.gmail.com>
From: David Anderson <dave@natulte.net>
Date: Sat, 11 Feb 2017 01:49:36 -0800
Message-ID: <CAMx+r7VgJ0xDAy46d28Qv_Vv7vM8JO0yRbYEh6AHVWT55LEVAw@mail.gmail.com>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=001a113cff4407a31b05483e238f
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113cff4407a31b05483e238f
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 11, 2017 at 1:03 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Mellow yellow,
>
> That's a great idea. Do you intend to track dkg's sid package more or
> less faithfully?


In that package repository, I intend to track the sid package exactly. If I
ever take up hacking on wireguard, I'll use a separate repository for any
modified versions.

If so, I'd be happy to advertise this on the
> wireguard.io/install/ page, since I'm sure a lot of people (including
> myself!) would benefit immensely from that.
>

Cool! I'll see about setting up debian stable as well.


> Could you send some bulletproof instructions -- 3 or 4 lines of
> commands like what's there currently -- and I'll put it on the site?
>

The instructions you have on there now are fine if you're okay with
packagecloud's shell script. Manual instructions that work are:

sudo apt-get install -y apt-transport-https linux-headers-amd64 curl
curl -L https://packagecloud.io/danderson/wireguard/gpgkey | sudo apt-key
add -
echo "deb https://packagecloud.io/danderson/wireguard/debian/ stretch main"
| sudo tee /etc/apt/sources.list.d/wireguard.list
sudo apt-get update
sudo apt-get install -y wireguard-dkms wireguard-tools

Note that right now, only amd64 packages are available. If you think
there's demand for Debian on 32-bit x86, I can set up i386 builders as well.

- Dave


> Thanks,
> Jason
>

--001a113cff4407a31b05483e238f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
at, Feb 11, 2017 at 1:03 AM, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Mellow yell=
ow,<br>
<br>
That&#39;s a great idea. Do you intend to track dkg&#39;s sid package more =
or<br>
less faithfully?</blockquote><div><br></div><div>In that package repository=
, I intend to track the sid package exactly. If I ever take up hacking on w=
ireguard, I&#39;ll use a separate repository for any modified versions.</di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">If so, I=
&#39;d be happy to advertise this on the<br>
<a href=3D"http://wireguard.io/install/" rel=3D"noreferrer" target=3D"_blan=
k">wireguard.io/install/</a> page, since I&#39;m sure a lot of people (incl=
uding<br>
myself!) would benefit immensely from that.<br></blockquote><div><br></div>=
<div>Cool! I&#39;ll see about setting up debian stable as well.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Could you sen=
d some bulletproof instructions -- 3 or 4 lines of<br>
commands like what&#39;s there currently -- and I&#39;ll put it on the site=
?<br></blockquote><div><br></div><div>The instructions you have on there no=
w are fine if you&#39;re okay with packagecloud&#39;s shell script. Manual =
instructions that work are:</div><div><br></div><div>sudo apt-get install -=
y apt-transport-https linux-headers-amd64 curl</div><div>curl -L <a href=3D=
"https://packagecloud.io/danderson/wireguard/gpgkey">https://packagecloud.i=
o/danderson/wireguard/gpgkey</a> | sudo apt-key add -</div><div>echo &quot;=
deb <a href=3D"https://packagecloud.io/danderson/wireguard/debian/">https:/=
/packagecloud.io/danderson/wireguard/debian/</a> stretch main&quot; | sudo =
tee /etc/apt/sources.list.d/wireguard.list</div><div>sudo apt-get update</d=
iv><div>sudo apt-get install -y wireguard-dkms wireguard-tools</div><div><b=
r></div><div>Note that right now, only amd64 packages are available. If you=
 think there&#39;s demand for Debian on 32-bit x86, I can set up i386 build=
ers as well.</div><div><br></div><div>- Dave</div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Jason<br>
</blockquote></div><br></div></div>

--001a113cff4407a31b05483e238f--
