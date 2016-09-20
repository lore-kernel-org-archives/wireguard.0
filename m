Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 457950e1
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Sep 2016 19:49:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4614fcf5
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Sep 2016 19:49:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 26ac6479
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Sep 2016 19:49:24 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id y6so24551521lff.1
 for <wireguard@lists.zx2c4.com>; Tue, 20 Sep 2016 12:58:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160911120611.Horde.MpIrXgeYy6b-xAXfCHOkOXJ@www.vdorst.com>
References: <20160910125025.Horde.1oXPxRzlX1oP4By8Ppdyv2N@www.vdorst.com>
 <20160911120611.Horde.MpIrXgeYy6b-xAXfCHOkOXJ@www.vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 20 Sep 2016 21:58:54 +0200
Message-ID: <CAHmME9pVbxz-qy9PxqABEHufjLOpCMsWsuLMN5Rk3GgJ+HKg4Q@mail.gmail.com>
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Content-Type: multipart/alternative; boundary=001a1142a96cc6cff3053cf5db9d
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [PATCHv2] Add support for platforms which has no
 efficient unaligned memory access
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1142a96cc6cff3053cf5db9d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hey Ren=C3=A9,

This is an excellent find. Thanks. Pretty significant speed improvements. I
wonder where else this is happening too.

Have you tested this on both endians?

The main thing I'm wondering here is why exactly the compiler can't
generate more efficient code itself.

I'll review this and merge soon if it looks good.

Regards,
Jason

On Sun, Sep 11, 2016 at 2:06 PM, Ren=C3=A9 van Dorst <opensource@vdorst.com=
>
wrote:

> Typo HAVE_EFFICIENT_UNALIGNED_ACCESS --> CONFIG_HAVE_EFFICIENT_UNALIGNE
> D_ACCESS.
>
> From 13fae657624aac6b9c1f411aa6472a91aae7fcc3 Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?Ren=3DC3=3DA9=3D20van=3D20Dorst?=3D <opensource@vdorst.=
com>
> Date: Sat, 10 Sep 2016 10:58:58 +0200
> Subject: [PATCH] Add support for platforms which has no efficient unalign=
ed
>  memory access
>
> Without it, it caused 55.2% slowdown in throughput at TP-Link WR1043ND,
> MIPS32r2@400Mhz.
>
> Simply check for CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS at compile time.
>
> Test on TP-Link WR1043ND, MIPS32r2@400Mhz.
> Setup: https://lists.zx2c4.com/pipermail/wireguard/2016-August/000331.htm=
l
>
> Benchmarks before:
>
> root@lede:~# iperf3 -c 10.0.0.1 -i 10
> [ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
> [  4]   0.00-10.13  sec  28.8 MBytes  23.8 Mbits/sec    0    202 KBytes
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bandwidth       Retr
> [  4]   0.00-10.13  sec  28.8 MBytes  23.8 Mbits/sec    0
>  sender
> [  4]   0.00-10.13  sec  28.8 MBytes  23.8 Mbits/sec
> receiver
>
> root@lede:~# iperf3 -c 10.0.0.1 -i 10 -u -b 1G
> [ ID] Interval           Transfer     Bandwidth       Total Datagrams
> [  4]   0.00-10.00  sec  31.1 MBytes  26.1 Mbits/sec  3982
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bandwidth       Jitter    Lost/Tota=
l
> Datagrams
> [  4]   0.00-10.00  sec  31.1 MBytes  26.1 Mbits/sec  0.049 ms  0/3982 (0=
%)
> [  4] Sent 3982 datagrams
>
> Benchmarks with aligned memory fetching:
>
> root@lede:~# iperf3 -c 10.0.0.1 -i 10
> [ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
> [  4]   0.00-10.22  sec  52.5 MBytes  43.1 Mbits/sec    0    145 KBytes
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bandwidth       Retr
> [  4]   0.00-10.22  sec  52.5 MBytes  43.1 Mbits/sec    0
>  sender
> [  4]   0.00-10.22  sec  52.5 MBytes  43.1 Mbits/sec
> receiver
>
> iperf Done.
> root@lede:~# iperf3 -c 10.0.0.1 -i 10 -u -b 1G
> [ ID] Interval           Transfer     Bandwidth       Total Datagrams
> [  4]   0.00-10.00  sec  56.3 MBytes  47.2 Mbits/sec  7207
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bandwidth       Jitter    Lost/Tota=
l
> Datagrams
> [  4]   0.00-10.00  sec  56.3 MBytes  47.2 Mbits/sec  0.041 ms  0/7207 (0=
%)
> [  4] Sent 7207 datagrams
> ---
>  src/crypto/chacha20poly1305.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/src/crypto/chacha20poly1305.c b/src/crypto/chacha20poly1305.=
c
> index 5190894..294cbf6 100644
> --- a/src/crypto/chacha20poly1305.c
> +++ b/src/crypto/chacha20poly1305.c
> @@ -248,13 +248,29 @@ struct poly1305_ctx {
>
>  static void poly1305_init(struct poly1305_ctx *ctx, const u8 key[static
> POLY1305_KEY_SIZE])
>  {
> +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> +       u32 t0, t1, t2, t3;
> +#endif
> +
>         memset(ctx, 0, sizeof(struct poly1305_ctx));
>         /* r &=3D 0xffffffc0ffffffc0ffffffc0fffffff */
> +#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
>         ctx->r[0] =3D (le32_to_cpuvp(key +  0) >> 0) & 0x3ffffff;
>         ctx->r[1] =3D (le32_to_cpuvp(key +  3) >> 2) & 0x3ffff03;
>         ctx->r[2] =3D (le32_to_cpuvp(key +  6) >> 4) & 0x3ffc0ff;
>         ctx->r[3] =3D (le32_to_cpuvp(key +  9) >> 6) & 0x3f03fff;
>         ctx->r[4] =3D (le32_to_cpuvp(key + 12) >> 8) & 0x00fffff;
> +#else
> +       t0 =3D le32_to_cpuvp(key + 0);
> +       t1 =3D le32_to_cpuvp(key + 4);
> +       t2 =3D le32_to_cpuvp(key + 8);
> +       t3 =3D le32_to_cpuvp(key +12);
> +       ctx->r[0] =3D t0 & 0x3ffffff; t0 >>=3D 26; t0 |=3D t1 << 6;
> +       ctx->r[1] =3D t0 & 0x3ffff03; t1 >>=3D 20; t1 |=3D t2 << 12;
> +       ctx->r[2] =3D t1 & 0x3ffc0ff; t2 >>=3D 14; t2 |=3D t3 << 18;
> +       ctx->r[3] =3D t2 & 0x3f03fff; t3 >>=3D 8;
> +       ctx->r[4] =3D t3 & 0x00fffff;
> +#endif
>         ctx->s[0] =3D le32_to_cpuvp(key +  16);
>         ctx->s[1] =3D le32_to_cpuvp(key +  20);
>         ctx->s[2] =3D le32_to_cpuvp(key +  24);
> @@ -267,6 +283,9 @@ static unsigned int poly1305_generic_blocks(struct
> poly1305_ctx *ctx, const u8 *
>         u32 s1, s2, s3, s4;
>         u32 h0, h1, h2, h3, h4;
>         u64 d0, d1, d2, d3, d4;
> +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> +       u32 t0, t1, t2, t3;
> +#endif
>
>         r0 =3D ctx->r[0];
>         r1 =3D ctx->r[1];
> @@ -287,11 +306,23 @@ static unsigned int poly1305_generic_blocks(struct
> poly1305_ctx *ctx, const u8 *
>
>         while (likely(srclen >=3D POLY1305_BLOCK_SIZE)) {
>                 /* h +=3D m[i] */
> +#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
>                 h0 +=3D (le32_to_cpuvp(src +  0) >> 0) & 0x3ffffff;
>                 h1 +=3D (le32_to_cpuvp(src +  3) >> 2) & 0x3ffffff;
>                 h2 +=3D (le32_to_cpuvp(src +  6) >> 4) & 0x3ffffff;
>                 h3 +=3D (le32_to_cpuvp(src +  9) >> 6) & 0x3ffffff;
>                 h4 +=3D (le32_to_cpuvp(src + 12) >> 8) | hibit;
> +#else
> +               t0 =3D le32_to_cpuvp(src +  0);
> +               t1 =3D le32_to_cpuvp(src +  4);
> +               t2 =3D le32_to_cpuvp(src +  8);
> +               t3 =3D le32_to_cpuvp(src + 12);
> +               h0 +=3D t0 & 0x3ffffff;
> +               h1 +=3D sr((((u64)t1 << 32) | t0), 26) & 0x3ffffff;
> +               h2 +=3D sr((((u64)t2 << 32) | t1), 20) & 0x3ffffff;
> +               h3 +=3D sr((((u64)t3 << 32) | t2), 14) & 0x3ffffff;
> +               h4 +=3D (t3 >> 8) | hibit;
> +#endif
>
>                 /* h *=3D r */
>                 d0 =3D mlt(h0, r0) + mlt(h1, s4) + mlt(h2, s3) + mlt(h3, =
s2)
> + mlt(h4, s1);
> --
> 2.5.5
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard
>



--=20
Jason A. Donenfeld
Deep Space Explorer
fr: +33 6 51 90 82 66
us: +1 513 476 1200
www.jasondonenfeld.com
www.zx2c4.com
zx2c4.com/keys/AB9942E6D4A4CFC3412620A749FC7012A5DE03AE.asc

--001a1142a96cc6cff3053cf5db9d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Ren=C3=A9,<div><br></div><div>This is an excellent fin=
d. Thanks. Pretty significant speed improvements. I wonder where else this =
is happening too.</div><div><br></div><div>Have you tested this on both end=
ians?</div><div><br></div><div>The main thing I&#39;m wondering here is why=
 exactly the compiler can&#39;t generate more efficient code itself.=C2=A0<=
/div><div><br></div><div>I&#39;ll review this and merge soon if it looks go=
od.</div><div><br></div><div>Regards,</div><div>Jason</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Sep 11, 2016 at 2:0=
6 PM, Ren=C3=A9 van Dorst <span dir=3D"ltr">&lt;<a href=3D"mailto:opensourc=
e@vdorst.com" target=3D"_blank">opensource@vdorst.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Typo HAVE_EFFICIENT_UNALIGNED_ACCES<wbr>=
S --&gt; CONFIG_HAVE_EFFICIENT_UNALIGNE<wbr>D_ACCESS.<br>
<br>
>From 13fae657624aac6b9c1f411aa6472a<wbr>91aae7fcc3 Mon Sep 17 00:00:00 2001=
<span class=3D""><br>
From: =3D?UTF-8?q?Ren=3DC3=3DA9=3D20van=3D20Do<wbr>rst?=3D &lt;<a href=3D"m=
ailto:opensource@vdorst.com" target=3D"_blank">opensource@vdorst.com</a>&gt=
;<br>
Date: Sat, 10 Sep 2016 10:58:58 +0200<br></span>
Subject: [PATCH] Add support for platforms which has no efficient unaligned=
<br>
=C2=A0memory access<br><span class=3D"">
<br>
Without it, it caused 55.2% slowdown in throughput at TP-Link WR1043ND, MIP=
S32r2@400Mhz.<br>
<br></span><span class=3D"">
Simply check for CONFIG_HAVE_EFFICIENT_UNALIGNE<wbr>D_ACCESS at compile tim=
e.<br>
<br>
Test on TP-Link WR1043ND, MIPS32r2@400Mhz.<br>
Setup: <a href=3D"https://lists.zx2c4.com/pipermail/wireguard/2016-August/0=
00331.html" rel=3D"noreferrer" target=3D"_blank">https://lists.zx2c4.com/pi=
perm<wbr>ail/wireguard/2016-August/<wbr>000331.html</a><br>
<br></span><div><div class=3D"h5">
Benchmarks before:<br>
<br>
root@lede:~# iperf3 -c 10.0.0.1 -i 10<br>
[ ID] Interval=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Transfer=C2=A0 =C2=
=A0 =C2=A0Bandwidth=C2=A0 =C2=A0 =C2=A0 =C2=A0Retr=C2=A0 Cwnd<br>
[=C2=A0 4]=C2=A0 =C2=A00.00-10.13=C2=A0 sec=C2=A0 28.8 MBytes=C2=A0 23.8 Mb=
its/sec=C2=A0 =C2=A0 0=C2=A0 =C2=A0 202 KBytes<br>
- - - - - - - - - - - - - - - - - - - - - - - - -<br>
[ ID] Interval=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Transfer=C2=A0 =C2=
=A0 =C2=A0Bandwidth=C2=A0 =C2=A0 =C2=A0 =C2=A0Retr<br>
[=C2=A0 4]=C2=A0 =C2=A00.00-10.13=C2=A0 sec=C2=A0 28.8 MBytes=C2=A0 23.8 Mb=
its/sec=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sende=
r<br>
[=C2=A0 4]=C2=A0 =C2=A00.00-10.13=C2=A0 sec=C2=A0 28.8 MBytes=C2=A0 23.8 Mb=
its/sec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recei=
ver<br>
<br>
root@lede:~# iperf3 -c 10.0.0.1 -i 10 -u -b 1G<br>
[ ID] Interval=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Transfer=C2=A0 =C2=
=A0 =C2=A0Bandwidth=C2=A0 =C2=A0 =C2=A0 =C2=A0Total Datagrams<br>
[=C2=A0 4]=C2=A0 =C2=A00.00-10.00=C2=A0 sec=C2=A0 31.1 MBytes=C2=A0 26.1 Mb=
its/sec=C2=A0 3982<br>
- - - - - - - - - - - - - - - - - - - - - - - - -<br>
[ ID] Interval=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Transfer=C2=A0 =C2=
=A0 =C2=A0Bandwidth=C2=A0 =C2=A0 =C2=A0 =C2=A0Jitter=C2=A0 =C2=A0 Lost/Tota=
l Datagrams<br>
[=C2=A0 4]=C2=A0 =C2=A00.00-10.00=C2=A0 sec=C2=A0 31.1 MBytes=C2=A0 26.1 Mb=
its/sec=C2=A0 0.049 ms=C2=A0 0/3982 (0%)<br>
[=C2=A0 4] Sent 3982 datagrams<br>
<br>
Benchmarks with aligned memory fetching:<br>
<br>
root@lede:~# iperf3 -c 10.0.0.1 -i 10<br>
[ ID] Interval=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Transfer=C2=A0 =C2=
=A0 =C2=A0Bandwidth=C2=A0 =C2=A0 =C2=A0 =C2=A0Retr=C2=A0 Cwnd<br>
[=C2=A0 4]=C2=A0 =C2=A00.00-10.22=C2=A0 sec=C2=A0 52.5 MBytes=C2=A0 43.1 Mb=
its/sec=C2=A0 =C2=A0 0=C2=A0 =C2=A0 145 KBytes<br>
- - - - - - - - - - - - - - - - - - - - - - - - -<br>
[ ID] Interval=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Transfer=C2=A0 =C2=
=A0 =C2=A0Bandwidth=C2=A0 =C2=A0 =C2=A0 =C2=A0Retr<br>
[=C2=A0 4]=C2=A0 =C2=A00.00-10.22=C2=A0 sec=C2=A0 52.5 MBytes=C2=A0 43.1 Mb=
its/sec=C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sende=
r<br>
[=C2=A0 4]=C2=A0 =C2=A00.00-10.22=C2=A0 sec=C2=A0 52.5 MBytes=C2=A0 43.1 Mb=
its/sec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recei=
ver<br>
<br>
iperf Done.<br>
root@lede:~# iperf3 -c 10.0.0.1 -i 10 -u -b 1G<br>
[ ID] Interval=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Transfer=C2=A0 =C2=
=A0 =C2=A0Bandwidth=C2=A0 =C2=A0 =C2=A0 =C2=A0Total Datagrams<br>
[=C2=A0 4]=C2=A0 =C2=A00.00-10.00=C2=A0 sec=C2=A0 56.3 MBytes=C2=A0 47.2 Mb=
its/sec=C2=A0 7207<br>
- - - - - - - - - - - - - - - - - - - - - - - - -<br>
[ ID] Interval=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Transfer=C2=A0 =C2=
=A0 =C2=A0Bandwidth=C2=A0 =C2=A0 =C2=A0 =C2=A0Jitter=C2=A0 =C2=A0 Lost/Tota=
l Datagrams<br>
[=C2=A0 4]=C2=A0 =C2=A00.00-10.00=C2=A0 sec=C2=A0 56.3 MBytes=C2=A0 47.2 Mb=
its/sec=C2=A0 0.041 ms=C2=A0 0/7207 (0%)<br>
[=C2=A0 4] Sent 7207 datagrams<br></div></div><span class=3D"">
---<br>
=C2=A0src/crypto/chacha20poly1305.c | 31 ++++++++++++++++++++++++++++++<wbr=
>+<br>
=C2=A01 file changed, 31 insertions(+)<br>
<br></span>
diff --git a/src/crypto/chacha20poly1305.<wbr>c b/src/crypto/chacha20poly13=
05.<wbr>c<br>
index 5190894..294cbf6 100644<span class=3D""><br>
--- a/src/crypto/chacha20poly1305.<wbr>c<br>
+++ b/src/crypto/chacha20poly1305.<wbr>c<br>
@@ -248,13 +248,29 @@ struct poly1305_ctx {<br>
<br>
=C2=A0static void poly1305_init(struct poly1305_ctx *ctx, const u8 key[stat=
ic POLY1305_KEY_SIZE])<br>
=C2=A0{<br></span>
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNE<wbr>D_ACCESS<span class=3D""><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 t0, t1, t2, t3;<br>
+#endif<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(ctx, 0, sizeof(struct poly1305_ctx));<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* r &amp;=3D 0xffffffc0ffffffc0ffffffc0ffff<wb=
r>fff */<br></span>
+#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNE<wbr>D_ACCESS<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;r[0] =3D (le32_to_cpuvp(key +=C2=A0 0) =
&gt;&gt; 0) &amp; 0x3ffffff;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;r[1] =3D (le32_to_cpuvp(key +=C2=A0 3) =
&gt;&gt; 2) &amp; 0x3ffff03;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;r[2] =3D (le32_to_cpuvp(key +=C2=A0 6) =
&gt;&gt; 4) &amp; 0x3ffc0ff;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;r[3] =3D (le32_to_cpuvp(key +=C2=A0 9) =
&gt;&gt; 6) &amp; 0x3f03fff;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;r[4] =3D (le32_to_cpuvp(key + 12) &gt;&=
gt; 8) &amp; 0x00fffff;<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0t0 =3D le32_to_cpuvp(key + 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0t1 =3D le32_to_cpuvp(key + 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0t2 =3D le32_to_cpuvp(key + 8);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0t3 =3D le32_to_cpuvp(key +12);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;r[0] =3D t0 &amp; 0x3ffffff; t0 &gt;&gt=
;=3D 26; t0 |=3D t1 &lt;&lt; 6;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;r[1] =3D t0 &amp; 0x3ffff03; t1 &gt;&gt=
;=3D 20; t1 |=3D t2 &lt;&lt; 12;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;r[2] =3D t1 &amp; 0x3ffc0ff; t2 &gt;&gt=
;=3D 14; t2 |=3D t3 &lt;&lt; 18;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;r[3] =3D t2 &amp; 0x3f03fff; t3 &gt;&gt=
;=3D 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;r[4] =3D t3 &amp; 0x00fffff;<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;s[0] =3D le32_to_cpuvp(key +=C2=A0 16);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;s[1] =3D le32_to_cpuvp(key +=C2=A0 20);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;s[2] =3D le32_to_cpuvp(key +=C2=A0 24);=
<br>
@@ -267,6 +283,9 @@ static unsigned int poly1305_generic_blocks(struct poly=
1305_ctx *ctx, const u8 *<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 s1, s2, s3, s4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 h0, h1, h2, h3, h4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 d0, d1, d2, d3, d4;<br></span>
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNE<wbr>D_ACCESS<span class=3D""><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 t0, t1, t2, t3;<br>
+#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 r0 =3D ctx-&gt;r[0];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 r1 =3D ctx-&gt;r[1];<br>
@@ -287,11 +306,23 @@ static unsigned int poly1305_generic_blocks(struct po=
ly1305_ctx *ctx, const u8 *<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (likely(srclen &gt;=3D POLY1305_BLOCK_SIZ=
E)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* h +=3D m[i] */<b=
r></span>
+#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNE<wbr>D_ACCESS<span class=3D"im HOEnZb=
"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h0 +=3D (le32_to_cp=
uvp(src +=C2=A0 0) &gt;&gt; 0) &amp; 0x3ffffff;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h1 +=3D (le32_to_cp=
uvp(src +=C2=A0 3) &gt;&gt; 2) &amp; 0x3ffffff;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h2 +=3D (le32_to_cp=
uvp(src +=C2=A0 6) &gt;&gt; 4) &amp; 0x3ffffff;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h3 +=3D (le32_to_cp=
uvp(src +=C2=A0 9) &gt;&gt; 6) &amp; 0x3ffffff;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h4 +=3D (le32_to_cp=
uvp(src + 12) &gt;&gt; 8) | hibit;<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t0 =3D le32_to_cpuv=
p(src +=C2=A0 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t1 =3D le32_to_cpuv=
p(src +=C2=A0 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t2 =3D le32_to_cpuv=
p(src +=C2=A0 8);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t3 =3D le32_to_cpuv=
p(src + 12);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h0 +=3D t0 &amp; 0x=
3ffffff;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h1 +=3D sr((((u64)t=
1 &lt;&lt; 32) | t0), 26) &amp; 0x3ffffff;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h2 +=3D sr((((u64)t=
2 &lt;&lt; 32) | t1), 20) &amp; 0x3ffffff;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h3 +=3D sr((((u64)t=
3 &lt;&lt; 32) | t2), 14) &amp; 0x3ffffff;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h4 +=3D (t3 &gt;&gt=
; 8) | hibit;<br>
+#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* h *=3D r */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d0 =3D mlt(h0, r0) =
+ mlt(h1, s4) + mlt(h2, s3) + mlt(h3, s2) + mlt(h4, s1);<br>
--<br>
2.5.5<br>
<br>
<br></span><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"http://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"norefe=
rrer" target=3D"_blank">http://lists.zx2c4.com/mailman<wbr>/listinfo/wiregu=
ard</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Jason A. =
Donenfeld<br>Deep Space Explorer<br>fr: +33 6 51 90 82 66<br>us: +1 513 476=
 1200<br><a href=3D"http://www.jasondonenfeld.com" target=3D"_blank">www.ja=
sondonenfeld.com</a><br><a href=3D"http://www.zx2c4.com" target=3D"_blank">=
www.zx2c4.com</a><br><a href=3D"http://zx2c4.com/keys/AB9942E6D4A4CFC341262=
0A749FC7012A5DE03AE.asc" target=3D"_blank">zx2c4.com/keys/AB9942E6D4A4CFC34=
12620A749FC7012A5DE03AE.asc</a></div>
</div>

--001a1142a96cc6cff3053cf5db9d--
