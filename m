Return-Path: dave@natulte.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f267c82d
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Feb 2017 02:27:11 +0000 (UTC)
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
 [209.85.217.178])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7929175
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Feb 2017 02:27:11 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id 96so49737629uaq.3
 for <wireguard@lists.zx2c4.com>; Sat, 11 Feb 2017 18:41:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMx+r7WMmcGxDLE7Dt2w6S5xj0tx3U22T-HQBhss1SzV0pgbiQ@mail.gmail.com>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <CAHmME9q8+D7y0Hz4xOJv1MiVsq0=bUf3TgENseGEWWF2BEpx4Q@mail.gmail.com>
 <CAMx+r7VgJ0xDAy46d28Qv_Vv7vM8JO0yRbYEh6AHVWT55LEVAw@mail.gmail.com>
 <CAHmME9otoumBPt4VvdM2s4FEpzO_wK86aiRjVOCpUpGam+P64Q@mail.gmail.com>
 <CAMx+r7WMmcGxDLE7Dt2w6S5xj0tx3U22T-HQBhss1SzV0pgbiQ@mail.gmail.com>
From: David Anderson <dave@natulte.net>
Date: Sat, 11 Feb 2017 18:40:43 -0800
Message-ID: <CAMx+r7Xk+vVwLq++8gnn1GfSA=jvYr=nM0EaLUjdvHXbjWD1kQ@mail.gmail.com>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=001a113ed1a21e392a05484c4377
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113ed1a21e392a05484c4377
Content-Type: text/plain; charset=UTF-8

I'm failing at setting up arm builds, raspbian/rpi emulation is not in a
great shape these days. In the meantime, debian stable for amd64 is up.
Updated instructions for both debian versions are at
https://packagecloud.io/danderson/wireguard#readme-scrollto . In
particular, the jessie install requires first installing a backported
kernel. I'll keep poking at arm builds for a bit, but I don't promise
anything.

- Dave

On Sat, Feb 11, 2017 at 1:36 PM, David Anderson <dave@natulte.net> wrote:

> On Sat, Feb 11, 2017 at 4:32 AM, Jason A. Donenfeld <Jason@zx2c4.com>
> wrote:
>
>> Hey Dave,
>>
>> On Sat, Feb 11, 2017 at 10:49 AM, David Anderson <dave@natulte.net>
>> wrote:
>> > Note that right now, only amd64 packages are available. If you think
>> there's
>> > demand for Debian on 32-bit x86, I can set up i386 builders as well.
>>
>> I doubt anybody cares about i386, but likely armv{6,7} and arm64 are
>> in demand somewhat, at the very least due to Rasberrian users.
>>
>
> Hmm, I don't have functional arm-ish things on hand, but I'll see what I
> can do with emulated setups. I'll skip i386 for now, if it turns out to be
> in demand it's one VM spinup away.
>
>
>> Jason
>>
>
>

--001a113ed1a21e392a05484c4377
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m failing at setting up arm builds, raspbian/rpi emu=
lation is not in a great shape these days. In the meantime, debian stable f=
or amd64 is up. Updated instructions for both debian versions are at=C2=A0<=
a href=3D"https://packagecloud.io/danderson/wireguard#readme-scrollto">http=
s://packagecloud.io/danderson/wireguard#readme-scrollto</a> . In particular=
, the jessie install requires first installing a backported kernel. I&#39;l=
l keep poking at arm builds for a bit, but I don&#39;t promise anything.<di=
v><br></div><div>- Dave</div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Sat, Feb 11, 2017 at 1:36 PM, David Anderson <span dir=
=3D"ltr">&lt;<a href=3D"mailto:dave@natulte.net" target=3D"_blank">dave@nat=
ulte.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><span class=
=3D"">On Sat, Feb 11, 2017 at 4:32 AM, Jason A. Donenfeld <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hey Dave,<br>
<span><br>
On Sat, Feb 11, 2017 at 10:49 AM, David Anderson &lt;<a href=3D"mailto:dave=
@natulte.net" target=3D"_blank">dave@natulte.net</a>&gt; wrote:<br>
&gt; Note that right now, only amd64 packages are available. If you think t=
here&#39;s<br>
&gt; demand for Debian on 32-bit x86, I can set up i386 builders as well.<b=
r>
<br>
</span>I doubt anybody cares about i386, but likely armv{6,7} and arm64 are=
<br>
in demand somewhat, at the very least due to Rasberrian users.<br></blockqu=
ote><div><br></div></span><div>Hmm, I don&#39;t have functional arm-ish thi=
ngs on hand, but I&#39;ll see what I can do with emulated setups. I&#39;ll =
skip i386 for now, if it turns out to be in demand it&#39;s one VM spinup a=
way.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"m_815601224337100925HOEnZb"><font color=3D"#888888"><br>
Jason<br>
</font></span></blockquote></div><br></div></div>
</blockquote></div><br></div>

--001a113ed1a21e392a05484c4377--
