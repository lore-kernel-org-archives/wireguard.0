Return-Path: opensource@vdorst.com
Received: from smtp01.bhosted.nl (smtp01.bhosted.nl [94.124.121.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50a414b0
 for <wireguard@lists.zx2c4.com>; Fri, 9 Sep 2016 15:13:55 +0000 (UTC)
Received: from www.lan.vdorst.com (www.lan.vdorst.com
 [IPv6:2a02:a441:63ae:0:5054:ff:feca:c4e1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 36B0F31F461
 for <wireguard@lists.zx2c4.com>; Fri,  9 Sep 2016 17:22:02 +0200 (CEST)
Date: Fri, 09 Sep 2016 15:22:08 +0000
Message-ID: <20160909152208.Horde.qMOsffs1bVcJx-AfO91qa9q@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
References: <20160808132309.Horde.PpRcvoBjgmDh9S0lYDhy7Au@www.vdorst.com>
 <CAHmME9o+QqPR0qo8uadYVZDMw=Z-uxCwuBgggOeYNdE8FDLXpQ@mail.gmail.com>
 <20160908115753.Horde.dla9pNo2jSEeBF-QW8dWlO-@www.vdorst.com>
 <20160909134611.Horde.d1CtbRQrioV8yr-kI71aUI3@www.vdorst.com>
 <20160909135202.GA32666@lud.imag.fr>
In-Reply-To: <20160909135202.GA32666@lud.imag.fr>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] News about MIPS and ARM optimized code?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Not yet.

But it think more platforms suffer of this misaligned memory fetching.

So if someone fix this also in the C code that it will boost the  
performance without the assembly version.

Greats,

René

Quoting Baptiste Jonglez <baptiste@bitsofnetworks.org>:

> Nice work!  I had tried to write chacha20_generic_block in MIPS assembly,
> but I got confused with endianness issues and the code didn't work in the
> end.
>
> Is your code available somewhere?  I'd be happy to test on a variety of
> MIPS routers.
>
> On Fri, Sep 09, 2016 at 01:46:11PM +0000, René van Dorst wrote:
>> Duo the misaligned data fetching function like poly1305 causes regression on
>> the mips.
>>
>> 	h0 += (le32_to_cpuvp(src +  0) >> 0) & 0x3ffffff;
>> 		h1 += (le32_to_cpuvp(src +  3) >> 2) & 0x3ffffff;
>> 		h2 += (le32_to_cpuvp(src +  6) >> 4) & 0x3ffffff;
>> 		h3 += (le32_to_cpuvp(src +  9) >> 6) & 0x3ffffff;
>> 		h4 += (le32_to_cpuvp(src + 12) >> 8) | hibit;
>>
>>
>> Had 26MBit now +42.
>>
>> root@lede:~# iperf3 -c 10.0.0.1 -i 10
>> Connecting to host 10.0.0.1, port 5201
>> [  4] local 10.0.0.2 port 36216 connected to 10.0.0.1 port 5201
>> [ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
>> [  4]   0.00-10.08  sec  51.2 MBytes  42.7 Mbits/sec    0    171 KBytes
>> - - - - - - - - - - - - - - - - - - - - - - - - -
>> [ ID] Interval           Transfer     Bandwidth       Retr
>> [  4]   0.00-10.08  sec  51.2 MBytes  42.7 Mbits/sec    0             sender
>> [  4]   0.00-10.08  sec  51.2 MBytes  42.7 Mbits/sec                 
>>   receiver
>>
>> iperf Done.
>> root@lede:~# iperf3 -c 10.0.0.1 -u -b 1G -i 10
>> Connecting to host 10.0.0.1, port 5201
>> [  4] local 10.0.0.2 port 60714 connected to 10.0.0.1 port 5201
>> [ ID] Interval           Transfer     Bandwidth       Total Datagrams
>> [  4]   0.00-10.00  sec  56.3 MBytes  47.2 Mbits/sec  7209
>> - - - - - - - - - - - - - - - - - - - - - - - - -
>> [ ID] Interval           Transfer     Bandwidth       Jitter    Lost/Total
>> Datagrams
>> [  4]   0.00-10.00  sec  56.3 MBytes  47.2 Mbits/sec  0.034 ms  0/7209 (0%)
>> [  4] Sent 7209 datagrams
>>
>> iperf Done.
>> root@lede:~#
>>
>>
>> Work is not done yet but a good start.
>>
>> Greats,
>>
>> René van Dorst.
>>
>> Quoting René van Dorst <opensource@vdorst.com>:
>>
>> >I did try to write some MIPS32r2 code.
>> >I wrote the chacha20_keysetup, chacha20_generic_block and
>> >poly1305_generic_blocks in assembly.
>> >Tried to load all needed variables in the registers. Which should reduce
>> >the memory overhead.
>> >But it is very difficult for me to do code profiling and/or isolate the
>> >code and make some benchmark programs like supercop.
>> >So testing was simple. Crosscompile the code. Copy and load the module on
>> >the target. Run setup script and iperf.
>> >
>> >#ifdef CONFIG_CPU_MIPS32_R2
>> >asmlinkage void chacha20_keysetup(struct chacha20_ctx *ctx, const u8
>> >key[static 32], const u8 nonce[static 8]);
>> >asmlinkage void chacha20_generic_block(struct chacha20_ctx *ctx);
>> >asmlinkage unsigned int poly1305_generic_blocks(struct poly1305_ctx *ctx,
>> >const u8 *src, unsigned int srclen, u32 hibit);
>> >#endif
>> >
>> >But the speed is equal or less on my TP WR1043ND device which is a
>> >MIPS32r2 24kc big endian.
>> >So GCC does a good job. Also 24kc has no special CoProcessors or FPU.
>> >
>> >Most improvement what I had it to change the buildroot default
>> >optimization -Os to -O2.
>> >This gives around 1-3% speed improvement.
>> >
>> >ideas:
>> >- remove the little endian parts on the MIPS.
>> >  Offcourse do it also on the other side.
>> >  On this device I can't switch endian.
>> >  But I did not see any improvements. Need 2 instruction for swapping
>> >32bit register.
>> >  After a quick calculation it could save around 0.4% which is ~0.1MBit/s
>> >on this device.
>> >
>> >Greats,
>> >
>> >René van Dorst.
>> >
>> >_______________________________________________
>> >WireGuard mailing list
>> >WireGuard@lists.zx2c4.com
>> >http://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>>
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> http://lists.zx2c4.com/mailman/listinfo/wireguard
