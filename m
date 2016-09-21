Return-Path: opensource@vdorst.com
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6ffe3f7
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Sep 2016 06:36:02 +0000 (UTC)
Date: Wed, 21 Sep 2016 06:45:44 +0000
Message-ID: <20160921064544.Horde.U1_rS--SvWRZ_qy2ErNTycl@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20160910125025.Horde.1oXPxRzlX1oP4By8Ppdyv2N@www.vdorst.com>
 <20160911120611.Horde.MpIrXgeYy6b-xAXfCHOkOXJ@www.vdorst.com>
 <CAHmME9pVbxz-qy9PxqABEHufjLOpCMsWsuLMN5Rk3GgJ+HKg4Q@mail.gmail.com>
In-Reply-To: <CAHmME9pVbxz-qy9PxqABEHufjLOpCMsWsuLMN5Rk3GgJ+HKg4Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary="=_Dqm9X6QxGmExjyjuRpjjBXk"
MIME-Version: 1.0
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

This message is in MIME format.

--=_Dqm9X6QxGmExjyjuRpjjBXk
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Description: Plaintext Message
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

  Hi Jason,

I searched a bit if I could find it in other places but I could not find it.

> Have you tested this on both endians?

No, my hardware only supports big endian.
I am not experienced enough to run it in Qemu.

  I see it is already applied. Great!

Greats,

René van Dorst.

Quoting "Jason A. Donenfeld" <Jason@zx2c4.com>:

> Hey René,       
>    This is an excellent find. Thanks. Pretty significant speed  
> improvements. I wonder where else this is happening too.
>     
>    Have you tested this on both endians?
>     
>    The main thing I'm wondering here is why exactly the compiler  
> can't generate more efficient code itself. 
>     
>    I'll review this and merge soon if it looks good.
>     
>    Regards,
>    Jason
>
>
>    On Sun, Sep 11, 2016 at 2:06 PM, René van Dorst  
> <opensource@vdorst.com> wrote:
>
>> Typo HAVE_EFFICIENT_UNALIGNED_ACCESS -->  
>> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS.
>>
>> From 13fae657624aac6b9c1f411aa6472a91aae7fcc3 Mon Sep 17 00:00:00 2001
>> From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
>> Date: Sat, 10 Sep 2016 10:58:58 +0200
>> Subject: [PATCH] Add support for platforms which has no efficient unaligned
>>  memory access
>>
>> Without it, it caused 55.2% slowdown in throughput at TP-Link  
>> WR1043ND, MIPS32r2@400Mhz.
>>
>> Simply check for CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS at compile time.
>>
>> Test on TP-Link WR1043ND, MIPS32r2@400Mhz.
>> Setup: https://lists.zx2c4.com/pipermail/wireguard/2016-August/000331.html
>>
>>            Benchmarks before:
>>
>> root@lede:~# iperf3 -c 10.0.0.1 -i 10
>> [ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
>> [  4]   0.00-10.13  sec  28.8 MBytes  23.8 Mbits/sec    0    202 KBytes
>> - - - - - - - - - - - - - - - - - - - - - - - - -
>> [ ID] Interval           Transfer     Bandwidth       Retr
>> [  4]   0.00-10.13  sec  28.8 MBytes  23.8 Mbits/sec    0             sender
>> [  4]   0.00-10.13  sec  28.8 MBytes  23.8 Mbits/sec                 
>>   receiver
>>
>> root@lede:~# iperf3 -c 10.0.0.1 -i 10 -u -b 1G
>> [ ID] Interval           Transfer     Bandwidth       Total Datagrams
>> [  4]   0.00-10.00  sec  31.1 MBytes  26.1 Mbits/sec  3982
>> - - - - - - - - - - - - - - - - - - - - - - - - -
>> [ ID] Interval           Transfer     Bandwidth       Jitter     
>> Lost/Total Datagrams
>> [  4]   0.00-10.00  sec  31.1 MBytes  26.1 Mbits/sec  0.049 ms  0/3982 (0%)
>> [  4] Sent 3982 datagrams
>>
>> Benchmarks with aligned memory fetching:
>>
>> root@lede:~# iperf3 -c 10.0.0.1 -i 10
>> [ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
>> [  4]   0.00-10.22  sec  52.5 MBytes  43.1 Mbits/sec    0    145 KBytes
>> - - - - - - - - - - - - - - - - - - - - - - - - -
>> [ ID] Interval           Transfer     Bandwidth       Retr
>> [  4]   0.00-10.22  sec  52.5 MBytes  43.1 Mbits/sec    0             sender
>> [  4]   0.00-10.22  sec  52.5 MBytes  43.1 Mbits/sec                 
>>   receiver
>>
>> iperf Done.
>> root@lede:~# iperf3 -c 10.0.0.1 -i 10 -u -b 1G
>> [ ID] Interval           Transfer     Bandwidth       Total Datagrams
>> [  4]   0.00-10.00  sec  56.3 MBytes  47.2 Mbits/sec  7207
>> - - - - - - - - - - - - - - - - - - - - - - - - -
>> [ ID] Interval           Transfer     Bandwidth       Jitter     
>> Lost/Total Datagrams
>> [  4]   0.00-10.00  sec  56.3 MBytes  47.2 Mbits/sec  0.041 ms  0/7207 (0%)
>> [  4] Sent 7207 datagrams
>>
>> ---
>>  src/crypto/chacha20poly1305.c | 31 +++++++++++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/src/crypto/chacha20poly1305.c b/src/crypto/chacha20poly1305.c
>> index 5190894..294cbf6 100644
>> --- a/src/crypto/chacha20poly1305.c
>> +++ b/src/crypto/chacha20poly1305.c
>> @@ -248,13 +248,29 @@ struct poly1305_ctx {
>>
>>  static void poly1305_init(struct poly1305_ctx *ctx, const u8  
>> key[static POLY1305_KEY_SIZE])
>>  {
>> +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
>> +       u32 t0, t1, t2, t3;
>> +#endif
>> +
>>         memset(ctx, 0, sizeof(struct poly1305_ctx));
>>         /* r &= 0xffffffc0ffffffc0ffffffc0fffffff */
>> +#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
>>         ctx->r[0] = (le32_to_cpuvp(key +  0) >> 0) & 0x3ffffff;
>>         ctx->r[1] = (le32_to_cpuvp(key +  3) >> 2) & 0x3ffff03;
>>         ctx->r[2] = (le32_to_cpuvp(key +  6) >> 4) & 0x3ffc0ff;
>>         ctx->r[3] = (le32_to_cpuvp(key +  9) >> 6) & 0x3f03fff;
>>         ctx->r[4] = (le32_to_cpuvp(key + 12) >> 8) & 0x00fffff;
>> +#else
>> +       t0 = le32_to_cpuvp(key + 0);
>> +       t1 = le32_to_cpuvp(key + 4);
>> +       t2 = le32_to_cpuvp(key + 8);
>> +       t3 = le32_to_cpuvp(key +12);
>> +       ctx->r[0] = t0 & 0x3ffffff; t0 >>= 26; t0 |= t1 << 6;
>> +       ctx->r[1] = t0 & 0x3ffff03; t1 >>= 20; t1 |= t2 << 12;
>> +       ctx->r[2] = t1 & 0x3ffc0ff; t2 >>= 14; t2 |= t3 << 18;
>> +       ctx->r[3] = t2 & 0x3f03fff; t3 >>= 8;
>> +       ctx->r[4] = t3 & 0x00fffff;
>> +#endif
>>         ctx->s[0] = le32_to_cpuvp(key +  16);
>>         ctx->s[1] = le32_to_cpuvp(key +  20);
>>         ctx->s[2] = le32_to_cpuvp(key +  24);
>> @@ -267,6 +283,9 @@ static unsigned int  
>> poly1305_generic_blocks(struct poly1305_ctx *ctx, const u8 *
>>         u32 s1, s2, s3, s4;
>>         u32 h0, h1, h2, h3, h4;
>>         u64 d0, d1, d2, d3, d4;
>> +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
>> +       u32 t0, t1, t2, t3;
>> +#endif
>>
>>         r0 = ctx->r[0];
>>         r1 = ctx->r[1];
>> @@ -287,11 +306,23 @@ static unsigned int  
>> poly1305_generic_blocks(struct poly1305_ctx *ctx, const u8 *
>>
>>         while (likely(srclen >= POLY1305_BLOCK_SIZE)) {
>>                 /* h += m[i] */
>> +#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
>>                 h0 += (le32_to_cpuvp(src +  0) >> 0) & 0x3ffffff;
>>                 h1 += (le32_to_cpuvp(src +  3) >> 2) & 0x3ffffff;
>>                 h2 += (le32_to_cpuvp(src +  6) >> 4) & 0x3ffffff;
>>                 h3 += (le32_to_cpuvp(src +  9) >> 6) & 0x3ffffff;
>>                 h4 += (le32_to_cpuvp(src + 12) >> 8) | hibit;
>> +#else
>> +               t0 = le32_to_cpuvp(src +  0);
>> +               t1 = le32_to_cpuvp(src +  4);
>> +               t2 = le32_to_cpuvp(src +  8);
>> +               t3 = le32_to_cpuvp(src + 12);
>> +               h0 += t0 & 0x3ffffff;
>> +               h1 += sr((((u64)t1 << 32) | t0), 26) & 0x3ffffff;
>> +               h2 += sr((((u64)t2 << 32) | t1), 20) & 0x3ffffff;
>> +               h3 += sr((((u64)t3 << 32) | t2), 14) & 0x3ffffff;
>> +               h4 += (t3 >> 8) | hibit;
>> +#endif
>>
>>                 /* h *= r */
>>                 d0 = mlt(h0, r0) + mlt(h1, s4) + mlt(h2, s3) +  
>> mlt(h3, s2) + mlt(h4, s1);
>> --
>> 2.5.5
>>
>>            _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> http://lists.zx2c4.com/mailman/listinfo/wireguard
>
>     
> --
>    Jason A. Donenfeld
> Deep Space Explorer
> fr: +33 6 51 90 82 66
> us: +1 513 476 1200
> www.jasondonenfeld.com[1]
> www.zx2c4.com[2]
> zx2c4.com/keys/AB9942E6D4A4CFC3412620A749FC7012A5DE03AE.asc[3]



Links:
------
[1] http://www.jasondonenfeld.com
[2] http://www.zx2c4.com
[3] http://zx2c4.com/keys/AB9942E6D4A4CFC3412620A749FC7012A5DE03AE.asc

--=_Dqm9X6QxGmExjyjuRpjjBXk
Content-Type: text/html; charset=utf-8
Content-Description: HTML Message
Content-Disposition: inline

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
"http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title></title>
</head>
<body style="font-family:Arial;font-size:14px">
<p lang="en-US" style="margin-bottom: 0cm; line-height: 100%">Hi Jason,<br>
<br>
I searched a bit if I could find it in other places but I could not find it.<br>
<br>
&gt; Have you tested this on both endians?<br>
<br>
No, my hardware only supports big endian.<br>
I am not experienced enough to run it in Qemu.</p>
<p>I see it is already applied. Great!<br>
<br>
Greats,<br>
<br>
Ren&eacute; van Dorst.<br>
<br>
Quoting "Jason A. Donenfeld" &lt;<a href="mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt;:</p>
<blockquote style="border-left:2px solid blue;margin-left:2px;padding-left:12px;" type="cite">
<div dir="ltr">Hey Ren&eacute;,
<div>&nbsp;</div>
<div>This is an excellent find. Thanks. Pretty significant speed improvements. I wonder where else this is happening too.</div>
<div>&nbsp;</div>
<div>Have you tested this on both endians?</div>
<div>&nbsp;</div>
<div>The main thing I'm wondering here is why exactly the compiler can't generate more efficient code itself.&nbsp;</div>
<div>&nbsp;</div>
<div>I'll review this and merge soon if it looks good.</div>
<div>&nbsp;</div>
<div>Regards,</div>
<div>Jason</div>
</div>
<div class="gmail_extra"><br>
<div class="gmail_quote">On Sun, Sep 11, 2016 at 2:06 PM, Ren&eacute; van Dorst <span dir="ltr">&lt;<a href="mailto:opensource@vdorst.com" target="_blank">opensource@vdorst.com</a>&gt;</span> wrote:<br>
<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<p>Typo HAVE_EFFICIENT_UNALIGNED_ACCES<wbr>S --&gt; CONFIG_HAVE_EFFICIENT_UNALIGNE<wbr>D_ACCESS.<br>
<br>
>From 13fae657624aac6b9c1f411aa6472a<wbr>91aae7fcc3 Mon Sep 17 00:00:00 2001<br>
<span>From: =?UTF-8?q?Ren=C3=A9=20van=20Do<wbr></span>rst?= &lt;<a href="mailto:opensource@vdorst.com" target="_blank">opensource@vdorst.com</a>&gt;<br>
Date: Sat, 10 Sep 2016 10:58:58 +0200<br>
Subject: [PATCH] Add support for platforms which has no efficient unaligned<br>
&nbsp;memory access<br>
<br>
<span>Without it, it caused 55.2% slowdown in throughput at TP-Link WR1043ND, MIPS32r2@400Mhz.</span><br>
<br>
<span>Simply check for CONFIG_HAVE_EFFICIENT_UNALIGNE<wbr></span>D_ACCESS at compile time.<br>
<br>
Test on TP-Link WR1043ND, MIPS32r2@400Mhz.<br>
Setup: <a href="https://lists.zx2c4.com/pipermail/wireguard/2016-August/000331.html" rel="noreferrer" target="_blank">https://lists.zx2c4.com/piperm<wbr>ail/wireguard/2016-August/<wbr>000331.html</a><br>
<br></p>
<div>
<div class="h5">Benchmarks before:<br>
<br>
root@lede:~# iperf3 -c 10.0.0.1 -i 10<br>
[ ID] Interval&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Transfer&nbsp; &nbsp; &nbsp;Bandwidth&nbsp; &nbsp; &nbsp; &nbsp;Retr&nbsp; Cwnd<br>
[&nbsp; 4]&nbsp; &nbsp;0.00-10.13&nbsp; sec&nbsp; 28.8 MBytes&nbsp; 23.8 Mbits/sec&nbsp; &nbsp; 0&nbsp; &nbsp; 202 KBytes<br>
- - - - - - - - - - - - - - - - - - - - - - - - -<br>
[ ID] Interval&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Transfer&nbsp; &nbsp; &nbsp;Bandwidth&nbsp; &nbsp; &nbsp; &nbsp;Retr<br>
[&nbsp; 4]&nbsp; &nbsp;0.00-10.13&nbsp; sec&nbsp; 28.8 MBytes&nbsp; 23.8 Mbits/sec&nbsp; &nbsp; 0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sender<br>
[&nbsp; 4]&nbsp; &nbsp;0.00-10.13&nbsp; sec&nbsp; 28.8 MBytes&nbsp; 23.8 Mbits/sec&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; receiver<br>
<br>
root@lede:~# iperf3 -c 10.0.0.1 -i 10 -u -b 1G<br>
[ ID] Interval&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Transfer&nbsp; &nbsp; &nbsp;Bandwidth&nbsp; &nbsp; &nbsp; &nbsp;Total Datagrams<br>
[&nbsp; 4]&nbsp; &nbsp;0.00-10.00&nbsp; sec&nbsp; 31.1 MBytes&nbsp; 26.1 Mbits/sec&nbsp; 3982<br>
- - - - - - - - - - - - - - - - - - - - - - - - -<br>
[ ID] Interval&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Transfer&nbsp; &nbsp; &nbsp;Bandwidth&nbsp; &nbsp; &nbsp; &nbsp;Jitter&nbsp; &nbsp; Lost/Total Datagrams<br>
[&nbsp; 4]&nbsp; &nbsp;0.00-10.00&nbsp; sec&nbsp; 31.1 MBytes&nbsp; 26.1 Mbits/sec&nbsp; 0.049 ms&nbsp; 0/3982 (0%)<br>
[&nbsp; 4] Sent 3982 datagrams<br>
<br>
Benchmarks with aligned memory fetching:<br>
<br>
root@lede:~# iperf3 -c 10.0.0.1 -i 10<br>
[ ID] Interval&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Transfer&nbsp; &nbsp; &nbsp;Bandwidth&nbsp; &nbsp; &nbsp; &nbsp;Retr&nbsp; Cwnd<br>
[&nbsp; 4]&nbsp; &nbsp;0.00-10.22&nbsp; sec&nbsp; 52.5 MBytes&nbsp; 43.1 Mbits/sec&nbsp; &nbsp; 0&nbsp; &nbsp; 145 KBytes<br>
- - - - - - - - - - - - - - - - - - - - - - - - -<br>
[ ID] Interval&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Transfer&nbsp; &nbsp; &nbsp;Bandwidth&nbsp; &nbsp; &nbsp; &nbsp;Retr<br>
[&nbsp; 4]&nbsp; &nbsp;0.00-10.22&nbsp; sec&nbsp; 52.5 MBytes&nbsp; 43.1 Mbits/sec&nbsp; &nbsp; 0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sender<br>
[&nbsp; 4]&nbsp; &nbsp;0.00-10.22&nbsp; sec&nbsp; 52.5 MBytes&nbsp; 43.1 Mbits/sec&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; receiver<br>
<br>
iperf Done.<br>
root@lede:~# iperf3 -c 10.0.0.1 -i 10 -u -b 1G<br>
[ ID] Interval&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Transfer&nbsp; &nbsp; &nbsp;Bandwidth&nbsp; &nbsp; &nbsp; &nbsp;Total Datagrams<br>
[&nbsp; 4]&nbsp; &nbsp;0.00-10.00&nbsp; sec&nbsp; 56.3 MBytes&nbsp; 47.2 Mbits/sec&nbsp; 7207<br>
- - - - - - - - - - - - - - - - - - - - - - - - -<br>
[ ID] Interval&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Transfer&nbsp; &nbsp; &nbsp;Bandwidth&nbsp; &nbsp; &nbsp; &nbsp;Jitter&nbsp; &nbsp; Lost/Total Datagrams<br>
[&nbsp; 4]&nbsp; &nbsp;0.00-10.00&nbsp; sec&nbsp; 56.3 MBytes&nbsp; 47.2 Mbits/sec&nbsp; 0.041 ms&nbsp; 0/7207 (0%)<br>
[&nbsp; 4] Sent 7207 datagrams</div>
</div>
<span>---<br>
&nbsp;src/crypto/chacha20poly1305.c | 31 ++++++++++++++++++++++++++++++<wbr></span>+<br>
&nbsp;1 file changed, 31 insertions(+)<br>
<br>
diff --git a/src/crypto/chacha20poly1305.<wbr>c b/src/crypto/chacha20poly1305.<wbr>c<br>
index 5190894..294cbf6 100644<br>
<span>--- a/src/crypto/chacha20poly1305.<wbr></span>c<br>
+++ b/src/crypto/chacha20poly1305.<wbr>c<br>
@@ -248,13 +248,29 @@ struct poly1305_ctx {<br>
<br>
&nbsp;static void poly1305_init(struct poly1305_ctx *ctx, const u8 key[static POLY1305_KEY_SIZE])<br>
&nbsp;{<br>
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNE<wbr>D_ACCESS<br>
<span>+&nbsp; &nbsp; &nbsp; &nbsp;u32 t0, t1, t2, t3;<br>
+#endif<br>
+<br>
&nbsp; &nbsp; &nbsp; &nbsp; memset(ctx, 0, sizeof(struct poly1305_ctx));<br>
&nbsp; &nbsp; &nbsp; &nbsp; /* r &amp;= 0xffffffc0ffffffc0ffffffc0ffff<wbr></span>fff */<br>
+#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNE<wbr>D_ACCESS<br>
<span>&nbsp; &nbsp; &nbsp; &nbsp; ctx-&gt;r[0] = (le32_to_cpuvp(key +&nbsp; 0) &gt;&gt; 0) &amp; 0x3ffffff;<br>
&nbsp; &nbsp; &nbsp; &nbsp; ctx-&gt;r[1] = (le32_to_cpuvp(key +&nbsp; 3) &gt;&gt; 2) &amp; 0x3ffff03;<br>
&nbsp; &nbsp; &nbsp; &nbsp; ctx-&gt;r[2] = (le32_to_cpuvp(key +&nbsp; 6) &gt;&gt; 4) &amp; 0x3ffc0ff;<br>
&nbsp; &nbsp; &nbsp; &nbsp; ctx-&gt;r[3] = (le32_to_cpuvp(key +&nbsp; 9) &gt;&gt; 6) &amp; 0x3f03fff;<br>
&nbsp; &nbsp; &nbsp; &nbsp; ctx-&gt;r[4] = (le32_to_cpuvp(key + 12) &gt;&gt; 8) &amp; 0x00fffff;<br>
+#else<br>
+&nbsp; &nbsp; &nbsp; &nbsp;t0 = le32_to_cpuvp(key + 0);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;t1 = le32_to_cpuvp(key + 4);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;t2 = le32_to_cpuvp(key + 8);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;t3 = le32_to_cpuvp(key +12);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;r[0] = t0 &amp; 0x3ffffff; t0 &gt;&gt;= 26; t0 |= t1 &lt;&lt; 6;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;r[1] = t0 &amp; 0x3ffff03; t1 &gt;&gt;= 20; t1 |= t2 &lt;&lt; 12;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;r[2] = t1 &amp; 0x3ffc0ff; t2 &gt;&gt;= 14; t2 |= t3 &lt;&lt; 18;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;r[3] = t2 &amp; 0x3f03fff; t3 &gt;&gt;= 8;<br>
+&nbsp; &nbsp; &nbsp; &nbsp;ctx-&gt;r[4] = t3 &amp; 0x00fffff;<br>
+#endif<br>
&nbsp; &nbsp; &nbsp; &nbsp; ctx-&gt;s[0] = le32_to_cpuvp(key +&nbsp; 16);<br>
&nbsp; &nbsp; &nbsp; &nbsp; ctx-&gt;s[1] = le32_to_cpuvp(key +&nbsp; 20);<br>
&nbsp; &nbsp; &nbsp; &nbsp; ctx-&gt;s[2] = le32_to_cpuvp(key +&nbsp; 24);<br>
@@ -267,6 +283,9 @@ static unsigned int poly1305_generic_blocks(struct poly1305_ctx *ctx, const u8 *<br>
&nbsp; &nbsp; &nbsp; &nbsp; u32 s1, s2, s3, s4;<br>
&nbsp; &nbsp; &nbsp; &nbsp; u32 h0, h1, h2, h3, h4;<br>
&nbsp; &nbsp; &nbsp; &nbsp; u64 d0, d1, d2, d3, d4;</span><br>
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNE<wbr>D_ACCESS<br>
<span>+&nbsp; &nbsp; &nbsp; &nbsp;u32 t0, t1, t2, t3;<br>
+#endif<br>
<br>
&nbsp; &nbsp; &nbsp; &nbsp; r0 = ctx-&gt;r[0];<br>
&nbsp; &nbsp; &nbsp; &nbsp; r1 = ctx-&gt;r[1];<br>
@@ -287,11 +306,23 @@ static unsigned int poly1305_generic_blocks(struct poly1305_ctx *ctx, const u8 *<br>
<br>
&nbsp; &nbsp; &nbsp; &nbsp; while (likely(srclen &gt;= POLY1305_BLOCK_SIZE)) {<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* h += m[i] */</span><br>
+#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNE<wbr>D_ACCESS<br>
<span class="im HOEnZb">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; h0 += (le32_to_cpuvp(src +&nbsp; 0) &gt;&gt; 0) &amp; 0x3ffffff;<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; h1 += (le32_to_cpuvp(src +&nbsp; 3) &gt;&gt; 2) &amp; 0x3ffffff;<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; h2 += (le32_to_cpuvp(src +&nbsp; 6) &gt;&gt; 4) &amp; 0x3ffffff;<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; h3 += (le32_to_cpuvp(src +&nbsp; 9) &gt;&gt; 6) &amp; 0x3ffffff;<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; h4 += (le32_to_cpuvp(src + 12) &gt;&gt; 8) | hibit;<br>
+#else<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t0 = le32_to_cpuvp(src +&nbsp; 0);<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t1 = le32_to_cpuvp(src +&nbsp; 4);<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t2 = le32_to_cpuvp(src +&nbsp; 8);<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t3 = le32_to_cpuvp(src + 12);<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;h0 += t0 &amp; 0x3ffffff;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;h1 += sr((((u64)t1 &lt;&lt; 32) | t0), 26) &amp; 0x3ffffff;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;h2 += sr((((u64)t2 &lt;&lt; 32) | t1), 20) &amp; 0x3ffffff;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;h3 += sr((((u64)t3 &lt;&lt; 32) | t2), 14) &amp; 0x3ffffff;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;h4 += (t3 &gt;&gt; 8) | hibit;<br>
+#endif<br>
<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* h *= r */<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; d0 = mlt(h0, r0) + mlt(h1, s4) + mlt(h2, s3) + mlt(h3, s2) + mlt(h4, s1);<br>
--<br>
2.5.5</span><br>
<br>
<br>
<div class="HOEnZb">
<div class="h5">______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href="mailto:WireGuard@lists.zx2c4.com" target="_blank">WireGuard@lists.zx2c4.com</a><br>
<a href="http://lists.zx2c4.com/mailman/listinfo/wireguard" rel="noreferrer" target="_blank">http://lists.zx2c4.com/mailman<wbr>/listinfo/wireguard</a></div>
</div>
</blockquote>
</div>
<br>
<br clear="all">
<div>&nbsp;</div>
--<br>
<div class="gmail_signature" data-smartmail="gmail_signature">Jason A. Donenfeld<br>
Deep Space Explorer<br>
fr: +33 6 51 90 82 66<br>
us: +1 513 476 1200<br>
<a href="http://www.jasondonenfeld.com" target="_blank">www.jasondonenfeld.com</a><br>
<a href="http://www.zx2c4.com" target="_blank">www.zx2c4.com</a><br>
<a href="http://zx2c4.com/keys/AB9942E6D4A4CFC3412620A749FC7012A5DE03AE.asc" target="_blank">zx2c4.com/keys/AB9942E6D4A4CFC3412620A749FC7012A5DE03AE.asc</a></div>
</div>
</blockquote>
<p><br>
<br></p>
</body>
</html>
--=_Dqm9X6QxGmExjyjuRpjjBXk--
