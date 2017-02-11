Return-Path: dave@natulte.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c079f66d
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 10:02:25 +0000 (UTC)
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
 [209.85.217.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e8bfdd9
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 10:02:25 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id y9so44012732uae.2
 for <wireguard@lists.zx2c4.com>; Sat, 11 Feb 2017 02:16:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rumLr0V6yD=zoHk-GSN2-bCiGe644WHtt4EJvKrhtLoA@mail.gmail.com>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <CAHmME9q8+D7y0Hz4xOJv1MiVsq0=bUf3TgENseGEWWF2BEpx4Q@mail.gmail.com>
 <CAMx+r7VgJ0xDAy46d28Qv_Vv7vM8JO0yRbYEh6AHVWT55LEVAw@mail.gmail.com>
 <CAHmME9rumLr0V6yD=zoHk-GSN2-bCiGe644WHtt4EJvKrhtLoA@mail.gmail.com>
From: David Anderson <dave@natulte.net>
Date: Sat, 11 Feb 2017 02:15:53 -0800
Message-ID: <CAMx+r7VkgtkFdqkKVbeX_Pv=T1TO6KaTY-+T1iM2OphS-L8mWA@mail.gmail.com>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=001a113cff44111a7105483e818a
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113cff44111a7105483e818a
Content-Type: text/plain; charset=UTF-8

Hi,

Yes, linux-headers-amd64 is required, otherwise the wireguard-dkms package
won't build the kernel module, and leave a very confused user. I *think* I
saw a conversation in this list's archives about whether the headers should
be made a dependency of wireguard-dkms, but I can't find it now...

- Dave

On Sat, Feb 11, 2017 at 2:04 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Dave,
>
> Good idea. I don't like the scary pipe to bash one liners. I'll go
> with what you suggested. However, is `linux-headers-amd64` really
> required?
>
> Thanks,
> Jason
>

--001a113cff44111a7105483e818a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Yes, linux-headers-amd64 is require=
d, otherwise the wireguard-dkms package won&#39;t build the kernel module, =
and leave a very confused user. I *think* I saw a conversation in this list=
&#39;s archives about whether the headers should be made a dependency of wi=
reguard-dkms, but I can&#39;t find it now...</div><div><br></div><div>- Dav=
e</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On S=
at, Feb 11, 2017 at 2:04 AM, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Hi Dave,<br>
<br>
Good idea. I don&#39;t like the scary pipe to bash one liners. I&#39;ll go<=
br>
with what you suggested. However, is `linux-headers-amd64` really<br>
required?<br>
<br>
Thanks,<br>
Jason<br>
</blockquote></div><br></div>

--001a113cff44111a7105483e818a--
