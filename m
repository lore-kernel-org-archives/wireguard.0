Return-Path: jmberi@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58ac85ac
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Feb 2018 15:32:12 +0000 (UTC)
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
 [209.85.213.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e381d447
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Feb 2018 15:32:12 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id x135so1804489vkd.5
 for <wireguard@lists.zx2c4.com>; Sat, 17 Feb 2018 07:39:27 -0800 (PST)
MIME-Version: 1.0
References: <CANcmUPE9PPfniYa5ejj180Wncth7i3qS0A-ZaG06X4bwkRn5qQ@mail.gmail.com>
 <CAHmME9raXy8gjJ44MHso1WjU_QFz1_Z8Q12q2GauoBPGJSaSxg@mail.gmail.com>
In-Reply-To: <CAHmME9raXy8gjJ44MHso1WjU_QFz1_Z8Q12q2GauoBPGJSaSxg@mail.gmail.com>
From: Jonathan Beri <jmberi@gmail.com>
Date: Sat, 17 Feb 2018 15:39:14 +0000
Message-ID: <CANcmUPEyCiw694-aa32fbLJ5LTd-fMp0D7NtgteqRvLasfmNZQ@mail.gmail.com>
Subject: Re: Cortex-m support
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="001a1143f79e15105005656a44c3"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1143f79e15105005656a44c3
Content-Type: text/plain; charset="UTF-8"

Thanks Jason! Do you have a sense of the resource requirements? If that's a
hard question to answer because of the OS coupling, what about the main app
minus the OS-owned resources?

For comparison, I'm wondering if wiregaurd can run on a 200mhz cortex m4f,
with 246KB of ram, with an LwIP ip stack + FreeRTOS. That's the typical IoT
hardware we target.

On Fri, Feb 16, 2018, 2:21 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Jonathan,
>
> Currently it's quite coupled to Linux, but it doesn't have to be that
> way for ever. Our cross platform implementations are coming along.
>
> Jason
>

--001a1143f79e15105005656a44c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jason! Do you have a sense of the resource requirements? If that&#39=
;s a hard question to answer because of the OS coupling, what about the mai=
n app minus the OS-owned resources?<div><br></div><div>For comparison, I&#3=
9;m wondering if wiregaurd can run on a 200mhz cortex m4f, with 246KB of ra=
m, with an LwIP ip stack + FreeRTOS. That&#39;s the typical IoT hardware we=
 target.<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Feb 16,=
 2018, 2:21 PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Ja=
son@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Jon=
athan,<br>
<br>
Currently it&#39;s quite coupled to Linux, but it doesn&#39;t have to be th=
at<br>
way for ever. Our cross platform implementations are coming along.<br>
<br>
Jason<br>
</blockquote></div></div>

--001a1143f79e15105005656a44c3--
