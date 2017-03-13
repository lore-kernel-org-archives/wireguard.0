Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dcfa4680
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Mar 2017 14:35:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a475dafa
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Mar 2017 14:35:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5dfa93c
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Mar 2017 14:35:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6e328425
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Mar 2017 14:35:46 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id o24so113523220otb.1
 for <wireguard@lists.zx2c4.com>; Mon, 13 Mar 2017 07:39:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oFbpNBTszO_Q5m8EwiG0F0SH6BUd+1SFZGUDGH0wQ0gg@mail.gmail.com>
References: <E63B612D-BFAA-48FE-A352-25B4C11B8E05@icloud.com>
 <15ac67bc30c.105593191200671.3458978345094445007@mysterious.site>
 <CAHmME9oFbpNBTszO_Q5m8EwiG0F0SH6BUd+1SFZGUDGH0wQ0gg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 13 Mar 2017 07:39:03 -0700
Message-ID: <CAHmME9rGSmXM4zskm7fHuRvQjNwcF9ibHNd4U5U7YT_gAE+3fA@mail.gmail.com>
Subject: Re: Rust implementation status
To: sopium <sopium@mysterious.site>
Content-Type: multipart/alternative; boundary=001a113d054a58b3c0054a9dacc6
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113d054a58b3c0054a9dacc6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hey Sopium,

Wonderful! I'm traveling now but will review first thing next week.

Please make sure you've implemented https://www.wireguard.io/xplatform/ so
that all implementations can share the same tooling.

Jason

On Mar 13, 2017 00:04, "sopium" <sopium@mysterious.site> wrote:

Hi,

2017-03-05 20:42 GMT+09:00 Sascha Grunert <saschagrunert@icloud.com>:
> Hey folks,
>
> I want to call for participation of the Rust userspace implementation of
WireGuard. The template for the initial implementation was this:
https://www.wireguard.io/xplatform/ and can be found here:
https://git.zx2c4.com/wireguard-rs/.
>
> [......]

I have got an initial working prototype of the WireGuard protocol in
Rust.

The code is at the `wg` branch of `TiTun`[1].

1. https://github.com/sopium/titun/tree/wg

Most of the essential aspects of the WireGuard protocol is
implemented. The missing parts should not be too hard to add.

Only Linux is supported, for the moment.

The implementation is quite fast =F0=9F=9A=80, although I haven't spent a l=
ot of
effort in optimization yet. It uses a fixed number of threads to
process packets from UDP socket or TUN device (similar to the other
Haskell impl, nara), and uses fine-grained locking to exploit
parallelism. I get 600Mbps+ to 800Mbps+ throughput and about 0.5ms
latency, between my Haswell Xeon-E3 desktop and a local KVM
instance. It should be able to get even faster with SO_REUSEPORT
sockets and multi-queue TUN devices.

Please review and test.

Regards,
Sopium


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--001a113d054a58b3c0054a9dacc6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hey Sopium,<div dir=3D"auto"><br></div><div dir=3D"auto">=
Wonderful! I&#39;m traveling now but will review first thing next week.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Please make sure you&#39;ve=
 implemented=C2=A0<a href=3D"https://www.wireguard.io/xplatform/">https://w=
ww.wireguard.io/xplatform/</a> so that all implementations can share the sa=
me tooling.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Jason</div><=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mar 13, 2=
017 00:04, &quot;sopium&quot; &lt;sopium@mysterious.site&gt; wrote:<br type=
=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<div class=3D"quoted-text"><br>
2017-03-05 20:42 GMT+09:00 Sascha Grunert &lt;<a href=3D"mailto:saschagrune=
rt@icloud.com">saschagrunert@icloud.com</a>&gt;:<br>
&gt; Hey folks,<br>
&gt;<br>
&gt; I want to call for participation of the Rust userspace implementation =
of WireGuard. The template for the initial implementation was this: <a href=
=3D"https://www.wireguard.io/xplatform/" rel=3D"noreferrer" target=3D"_blan=
k">https://www.wireguard.io/<wbr>xplatform/</a> and can be found here: <a h=
ref=3D"https://git.zx2c4.com/wireguard-rs/" rel=3D"noreferrer" target=3D"_b=
lank">https://git.zx2c4.com/<wbr>wireguard-rs/</a>.<br>
&gt;<br>
</div>&gt; [......]<br>
<br>
I have got an initial working prototype of the WireGuard protocol in<br>
Rust.<br>
<br>
The code is at the `wg` branch of `TiTun`[1].<br>
<br>
1. <a href=3D"https://github.com/sopium/titun/tree/wg" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/sopium/<wbr>titun/tree/wg</a><br>
<br>
Most of the essential aspects of the WireGuard protocol is<br>
implemented. The missing parts should not be too hard to add.<br>
<br>
Only Linux is supported, for the moment.<br>
<br>
The implementation is quite fast =F0=9F=9A=80, although I haven&#39;t spent=
 a lot of<br>
effort in optimization yet. It uses a fixed number of threads to<br>
process packets from UDP socket or TUN device (similar to the other<br>
Haskell impl, nara), and uses fine-grained locking to exploit<br>
parallelism. I get 600Mbps+ to 800Mbps+ throughput and about 0.5ms<br>
latency, between my Haswell Xeon-E3 desktop and a local KVM<br>
instance. It should be able to get even faster with SO_REUSEPORT<br>
sockets and multi-queue TUN devices.<br>
<br>
Please review and test.<br>
<br>
Regards,<br>
Sopium<br>
<div class=3D"elided-text"><br>
<br>
______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
</div></blockquote></div><br></div>

--001a113d054a58b3c0054a9dacc6--
