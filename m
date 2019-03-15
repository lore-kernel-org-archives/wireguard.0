Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CF9C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:22:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22F2B2175B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22F2B2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rubikon.han.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20101569;
	Wed, 20 Mar 2019 22:21:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7715535
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Mar 2019 20:05:22 +0000 (UTC)
Received: from haldir.han.de (haldir.han.de
 [IPv6:2a01:488:66:1000:523:f197:0:1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c8b6243
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Mar 2019 20:05:22 +0000 (UTC)
Received: from [192.168.230.19] (p5B223FCA.dip0.t-ipconnect.de [91.34.63.202])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: toad)
 by haldir.han.de (Postfix) with ESMTPSA id 0B3395C0279
 for <wireguard@lists.zx2c4.com>; Fri, 15 Mar 2019 21:16:58 +0100 (CET)
To: wireguard@lists.zx2c4.com
From: Peter Cleve <toad@rubikon.han.de>
Subject: Best Bang for Buck Wireguard-Device? (~485Mbits/sec @ ~70EUR)
Openpgp: preference=signencrypt
Autocrypt: addr=toad@rubikon.han.de; prefer-encrypt=mutual; keydata=
 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 vQ==
Message-ID: <3ed1b8e0-a932-968a-3bdb-2cadeeedecef@rubikon.han.de>
Date: Fri, 15 Mar 2019 21:16:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:21:40 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7973013816175180864=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============7973013816175180864==
Content-Type: multipart/alternative;
 boundary="------------72AAA1C9FD7606778CEE0056"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------72AAA1C9FD7606778CEE0056
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

I just set up wireguard on a cheap (70EUR) ZyXEL NBG6617 with current openwrt snapshot, and the performance is impressive:

root@OpenWrt:~# iperf3 -R -t 30 -c 192.168.149.11
Connecting to host 192.168.149.11, port 5201
Reverse mode, remote host 192.168.149.11 is sending
[  5] local 192.168.149.10 port 51946 connected to 192.168.149.11 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  56.4 MBytes   473 Mbits/sec                 
[  5]   1.00-2.00   sec  56.9 MBytes   478 Mbits/sec                 
[  5]   2.00-3.00   sec  56.3 MBytes   472 Mbits/sec                 
[  5]   3.00-4.00   sec  58.0 MBytes   485 Mbits/sec                 
[  5]   4.00-5.00   sec  57.9 MBytes   487 Mbits/sec                 
[  5]   5.00-6.00   sec  58.9 MBytes   494 Mbits/sec                 
[  5]   6.00-7.00   sec  60.1 MBytes   504 Mbits/sec                 
[  5]   7.00-8.00   sec  59.1 MBytes   496 Mbits/sec                 
[  5]   8.00-9.00   sec  58.8 MBytes   494 Mbits/sec                 
[  5]   9.00-10.00  sec  58.1 MBytes   488 Mbits/sec                 
[  5]  10.00-11.00  sec  58.4 MBytes   490 Mbits/sec                 
[  5]  11.00-12.00  sec  58.7 MBytes   492 Mbits/sec                 
[  5]  12.00-13.00  sec  57.1 MBytes   479 Mbits/sec                 
[  5]  13.00-14.00  sec  59.6 MBytes   499 Mbits/sec                 
[  5]  14.00-15.00  sec  60.5 MBytes   507 Mbits/sec                 
[  5]  15.00-16.00  sec  59.5 MBytes   499 Mbits/sec                 
[  5]  16.00-17.00  sec  57.9 MBytes   487 Mbits/sec                 
[  5]  17.00-18.00  sec  58.6 MBytes   492 Mbits/sec                 
[  5]  18.00-19.00  sec  58.8 MBytes   492 Mbits/sec                 
[  5]  19.00-20.00  sec  57.3 MBytes   482 Mbits/sec                 
[  5]  20.00-21.00  sec  58.1 MBytes   487 Mbits/sec                 
[  5]  21.00-22.00  sec  55.6 MBytes   466 Mbits/sec                 
[  5]  22.00-23.00  sec  59.7 MBytes   499 Mbits/sec                 
[  5]  23.00-24.00  sec  60.6 MBytes   510 Mbits/sec                 
[  5]  24.00-25.00  sec  56.2 MBytes   472 Mbits/sec                 
[  5]  25.00-26.00  sec  57.0 MBytes   478 Mbits/sec                 
[  5]  26.00-27.00  sec  59.3 MBytes   498 Mbits/sec                 
[  5]  27.00-28.00  sec  58.5 MBytes   490 Mbits/sec                 
[  5]  28.00-29.00  sec  58.0 MBytes   486 Mbits/sec                 
[  5]  29.00-30.00  sec  60.2 MBytes   505 Mbits/sec                 
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-30.00  sec  1.71 GBytes   490 Mbits/sec  352             sender
[  5]   0.00-30.00  sec  1.71 GBytes   489 Mbits/sec                 
receiver

iperf Done.
root@OpenWrt:~# iperf3 -R -t 15 -c 192.168.149.11
Connecting to host 192.168.149.11, port 5201
Reverse mode, remote host 192.168.149.11 is sending
[  5] local 192.168.149.10 port 51960 connected to 192.168.149.11 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  58.3 MBytes   489 Mbits/sec                 
[  5]   1.00-2.00   sec  54.1 MBytes   453 Mbits/sec                 
[  5]   2.00-3.00   sec  56.2 MBytes   472 Mbits/sec                 
[  5]   3.00-4.00   sec  57.7 MBytes   483 Mbits/sec                 
[  5]   4.00-5.00   sec  59.0 MBytes   494 Mbits/sec                 
[  5]   5.00-6.00   sec  58.0 MBytes   487 Mbits/sec                 
[  5]   6.00-7.00   sec  58.8 MBytes   493 Mbits/sec                 
[  5]   7.00-8.00   sec  57.6 MBytes   483 Mbits/sec                 
[  5]   8.00-9.00   sec  57.6 MBytes   484 Mbits/sec                 
[  5]   9.00-10.00  sec  60.1 MBytes   504 Mbits/sec                 
[  5]  10.00-11.00  sec  57.9 MBytes   485 Mbits/sec                 
[  5]  11.00-12.00  sec  58.3 MBytes   489 Mbits/sec                 
[  5]  12.00-13.00  sec  57.8 MBytes   486 Mbits/sec                 
[  5]  13.00-14.00  sec  60.1 MBytes   502 Mbits/sec                 
[  5]  14.00-15.00  sec  58.1 MBytes   490 Mbits/sec                 
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-15.00  sec   871 MBytes   487 Mbits/sec  154             sender
[  5]   0.00-15.00  sec   869 MBytes   486 Mbits/sec                 
receiver

iperf Done.
root@OpenWrt:~#


The Wireguard Peers are directly connected in the same gigabit subnet.
The other peer is an Ryzen with 8 Cores and Linux. It seems that wireguard scales very well on the Vectorunits on this ARM Quadcore:

root@OpenWrt:~# cat /proc/cpuinfo
processor    : 0
model name    : ARMv7 Processor rev 5 (v7l)
BogoMIPS    : 67.03
Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva
idivt vfpd32 lpae evtstrm
CPU implementer    : 0x41
CPU architecture: 7
CPU variant    : 0x0
CPU part    : 0xc07
CPU revision    : 5

processor    : 1
model name    : ARMv7 Processor rev 5 (v7l)
BogoMIPS    : 67.03
Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva
idivt vfpd32 lpae evtstrm
CPU implementer    : 0x41
CPU architecture: 7
CPU variant    : 0x0
CPU part    : 0xc07
CPU revision    : 5

processor    : 2
model name    : ARMv7 Processor rev 5 (v7l)
BogoMIPS    : 67.03
Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva
idivt vfpd32 lpae evtstrm
CPU implementer    : 0x41
CPU architecture: 7
CPU variant    : 0x0
CPU part    : 0xc07
CPU revision    : 5

processor    : 3
model name    : ARMv7 Processor rev 5 (v7l)
BogoMIPS    : 67.03
Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva
idivt vfpd32 lpae evtstrm
CPU implementer    : 0x41
CPU architecture: 7
CPU variant    : 0x0
CPU part    : 0xc07
CPU revision    : 5

Hardware    : Generic DT based system
Revision    : 0000
Serial        : 0000000000000000
root@OpenWrt:~#


Great Work, thx4it 


-- Für jedes komplexe Problem gibt es eine einfache Lösung, und die ist
die falsche. -- Umberto Eco (Das Foucaultsche Pendel) Wer A sagt, der
muß nicht B sagen. Er kann auch erkennen, daß A falsch war. -- Bertolt
Brecht

-- 
Für jedes komplexe Problem gibt es eine einfache Lösung, und die ist die falsche.
-- Umberto Eco (Das Foucaultsche Pendel)

Wer A sagt, der muß nicht B sagen. Er kann auch erkennen, daß A falsch war.
-- Bertolt Brecht


--------------72AAA1C9FD7606778CEE0056
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>
    </p>
    <div class="moz-text-plain" wrap="true" style="font-family:
      -moz-fixed; font-size: 12px;" lang="x-unicode">
      <pre class="moz-quote-pre" wrap="">I just set up wireguard on a cheap (70EUR) ZyXEL NBG6617 with current openwrt snapshot, and the performance is impressive:

root@OpenWrt:~# iperf3 -R -t 30 -c 192.168.149.11
Connecting to host 192.168.149.11, port 5201
Reverse mode, remote host 192.168.149.11 is sending
[  5] local 192.168.149.10 port 51946 connected to 192.168.149.11 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  56.4 MBytes   473 Mbits/sec                 
[  5]   1.00-2.00   sec  56.9 MBytes   478 Mbits/sec                 
[  5]   2.00-3.00   sec  56.3 MBytes   472 Mbits/sec                 
[  5]   3.00-4.00   sec  58.0 MBytes   485 Mbits/sec                 
[  5]   4.00-5.00   sec  57.9 MBytes   487 Mbits/sec                 
[  5]   5.00-6.00   sec  58.9 MBytes   494 Mbits/sec                 
[  5]   6.00-7.00   sec  60.1 MBytes   504 Mbits/sec                 
[  5]   7.00-8.00   sec  59.1 MBytes   496 Mbits/sec                 
[  5]   8.00-9.00   sec  58.8 MBytes   494 Mbits/sec                 
[  5]   9.00-10.00  sec  58.1 MBytes   488 Mbits/sec                 
[  5]  10.00-11.00  sec  58.4 MBytes   490 Mbits/sec                 
[  5]  11.00-12.00  sec  58.7 MBytes   492 Mbits/sec                 
[  5]  12.00-13.00  sec  57.1 MBytes   479 Mbits/sec                 
[  5]  13.00-14.00  sec  59.6 MBytes   499 Mbits/sec                 
[  5]  14.00-15.00  sec  60.5 MBytes   507 Mbits/sec                 
[  5]  15.00-16.00  sec  59.5 MBytes   499 Mbits/sec                 
[  5]  16.00-17.00  sec  57.9 MBytes   487 Mbits/sec                 
[  5]  17.00-18.00  sec  58.6 MBytes   492 Mbits/sec                 
[  5]  18.00-19.00  sec  58.8 MBytes   492 Mbits/sec                 
[  5]  19.00-20.00  sec  57.3 MBytes   482 Mbits/sec                 
[  5]  20.00-21.00  sec  58.1 MBytes   487 Mbits/sec                 
[  5]  21.00-22.00  sec  55.6 MBytes   466 Mbits/sec                 
[  5]  22.00-23.00  sec  59.7 MBytes   499 Mbits/sec                 
[  5]  23.00-24.00  sec  60.6 MBytes   510 Mbits/sec                 
[  5]  24.00-25.00  sec  56.2 MBytes   472 Mbits/sec                 
[  5]  25.00-26.00  sec  57.0 MBytes   478 Mbits/sec                 
[  5]  26.00-27.00  sec  59.3 MBytes   498 Mbits/sec                 
[  5]  27.00-28.00  sec  58.5 MBytes   490 Mbits/sec                 
[  5]  28.00-29.00  sec  58.0 MBytes   486 Mbits/sec                 
[  5]  29.00-30.00  sec  60.2 MBytes   505 Mbits/sec                 
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-30.00  sec  1.71 GBytes   490 Mbits/sec  352             sender
[  5]   0.00-30.00  sec  1.71 GBytes   489 Mbits/sec                 
receiver

iperf Done.
root@OpenWrt:~# iperf3 -R -t 15 -c 192.168.149.11
Connecting to host 192.168.149.11, port 5201
Reverse mode, remote host 192.168.149.11 is sending
[  5] local 192.168.149.10 port 51960 connected to 192.168.149.11 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  58.3 MBytes   489 Mbits/sec                 
[  5]   1.00-2.00   sec  54.1 MBytes   453 Mbits/sec                 
[  5]   2.00-3.00   sec  56.2 MBytes   472 Mbits/sec                 
[  5]   3.00-4.00   sec  57.7 MBytes   483 Mbits/sec                 
[  5]   4.00-5.00   sec  59.0 MBytes   494 Mbits/sec                 
[  5]   5.00-6.00   sec  58.0 MBytes   487 Mbits/sec                 
[  5]   6.00-7.00   sec  58.8 MBytes   493 Mbits/sec                 
[  5]   7.00-8.00   sec  57.6 MBytes   483 Mbits/sec                 
[  5]   8.00-9.00   sec  57.6 MBytes   484 Mbits/sec                 
[  5]   9.00-10.00  sec  60.1 MBytes   504 Mbits/sec                 
[  5]  10.00-11.00  sec  57.9 MBytes   485 Mbits/sec                 
[  5]  11.00-12.00  sec  58.3 MBytes   489 Mbits/sec                 
[  5]  12.00-13.00  sec  57.8 MBytes   486 Mbits/sec                 
[  5]  13.00-14.00  sec  60.1 MBytes   502 Mbits/sec                 
[  5]  14.00-15.00  sec  58.1 MBytes   490 Mbits/sec                 
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-15.00  sec   871 MBytes   487 Mbits/sec  154             sender
[  5]   0.00-15.00  sec   869 MBytes   486 Mbits/sec                 
receiver

iperf Done.
root@OpenWrt:~#


The Wireguard Peers are directly connected in the same gigabit subnet.
The other peer is an Ryzen with 8 Cores and Linux. It seems that wireguard scales very well on the Vectorunits on this ARM Quadcore:

root@OpenWrt:~# cat /proc/cpuinfo
processor    : 0
model name    : ARMv7 Processor rev 5 (v7l)
BogoMIPS    : 67.03
Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva
idivt vfpd32 lpae evtstrm
CPU implementer    : 0x41
CPU architecture: 7
CPU variant    : 0x0
CPU part    : 0xc07
CPU revision    : 5

processor    : 1
model name    : ARMv7 Processor rev 5 (v7l)
BogoMIPS    : 67.03
Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva
idivt vfpd32 lpae evtstrm
CPU implementer    : 0x41
CPU architecture: 7
CPU variant    : 0x0
CPU part    : 0xc07
CPU revision    : 5

processor    : 2
model name    : ARMv7 Processor rev 5 (v7l)
BogoMIPS    : 67.03
Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva
idivt vfpd32 lpae evtstrm
CPU implementer    : 0x41
CPU architecture: 7
CPU variant    : 0x0
CPU part    : 0xc07
CPU revision    : 5

processor    : 3
model name    : ARMv7 Processor rev 5 (v7l)
BogoMIPS    : 67.03
Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva
idivt vfpd32 lpae evtstrm
CPU implementer    : 0x41
CPU architecture: 7
CPU variant    : 0x0
CPU part    : 0xc07
CPU revision    : 5

Hardware    : Generic DT based system
Revision    : 0000
Serial        : 0000000000000000
root@OpenWrt:~#


Great Work, thx4it <span class="moz-smiley-s1" title=":-)"></span>


<div class="moz-txt-sig">-- 
Für jedes komplexe Problem gibt es eine einfache Lösung, und die ist die falsche.
-- Umberto Eco (Das Foucaultsche Pendel)

Wer A sagt, der muß nicht B sagen. Er kann auch erkennen, daß A falsch war.
-- Bertolt Brecht

</div></pre>
    </div>
    <pre class="moz-signature" cols="72">-- 
Für jedes komplexe Problem gibt es eine einfache Lösung, und die ist die falsche.
-- Umberto Eco (Das Foucaultsche Pendel)

Wer A sagt, der muß nicht B sagen. Er kann auch erkennen, daß A falsch war.
-- Bertolt Brecht</pre>
  </body>
</html>

--------------72AAA1C9FD7606778CEE0056--

--===============7973013816175180864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7973013816175180864==--
