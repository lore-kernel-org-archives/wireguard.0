Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84BEEB64DA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Jun 2023 14:48:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e864bc21;
	Mon, 26 Jun 2023 14:43:13 +0000 (UTC)
Received: from mail-yb1-xb62.google.com (mail-yb1-xb62.google.com
 [2607:f8b0:4864:20::b62])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b9c13705
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 May 2023 22:17:15 +0000 (UTC)
Received: by mail-yb1-xb62.google.com with SMTP id
 3f1490d57ef6-b9a6eec8611so33045730276.0
 for <wireguard@lists.zx2c4.com>; Tue, 09 May 2023 15:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683670634; x=1686262634;
 h=to:subject:message-id:date:from:mime-version:dkim-signature
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ihe/b+pLAFq5jM5svIC2dRd8U4C6jApwBK1xKuee+lU=;
 b=CpWIpfavDgWuK8R4jlAEG1beudbd4we6Q0BLtWFKqO+mF5bmGkRF0Bb0GlYYNqRpws
 uba7cx3rfSkh5y92hZVhDxDHILoYDaIuyf7rT0KLyZTI1G/Tdu6H9P+A/YIEacIbLFYc
 hpasnE84EKJ8w8n9WaiSx40WKHnow9qYGVsEew86O04tVKRCJN147P1Mjr5MWYMG1yAZ
 xv+oFesK8UNIe8Ze0CWByMA2HR4KPrlutNf+W8puQZhcYrQmU7rT31yj92/PDdnIEEv9
 QeWFSgV5KyKhz1umS/o3dlxpIN7yJ+HLmnSJhydynFcC9RawZvFAZDlLKSK+ct6Typlp
 DOyQ==
X-Gm-Message-State: AC+VfDwYmHDNm13qETWfQ+fqXuGiNN3IqhVXBin7JgGUFwgaAiv0UvC5
 l4xk5IM1/ibX0MfhUh++F8e2N1962HUPvZv2GQXAnyPmdQTWQr0PJhZVvx7P
X-Google-Smtp-Source: ACHHUZ4o/hLaxKQZjuDr8hBzoF8qqv5h0SH67S1q5Vf5IUuGfaPg37xJoJIs50JZtweSd3pLDbsMuRhrCGwZ
X-Received: by 2002:a81:a0ce:0:b0:559:f7d4:8d40 with SMTP id
 x197-20020a81a0ce000000b00559f7d48d40mr18032988ywg.4.1683670634257; 
 Tue, 09 May 2023 15:17:14 -0700 (PDT)
Received: from restore.menlosecurity.com ([34.202.62.188])
 by smtp-relay.gmail.com with ESMTPS id
 s64-20020a815e43000000b00559f1b8134esm1036496ywb.49.2023.05.09.15.17.13
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 May 2023 15:17:14 -0700 (PDT)
X-Relaying-Domain: menlosecurity.com
Received: from safemail-prod-02890032cr-re.menlosecurity.com (34.202.62.189)
 by restore.menlosecurity.com (34.202.62.188)
 with SMTP id 3f9fb350-eeb7-11ed-98c8-771a11661850;
 Tue, 09 May 2023 22:17:14 GMT
Received: from mail-yb1-f200.google.com (209.85.219.200)
 by safemail-prod-02890032cr-re.menlosecurity.com (34.202.62.189)
 with SMTP id 3f9fb350-eeb7-11ed-98c8-771a11661850;
 Tue, 09 May 2023 22:17:14 GMT
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-b9a6eeea78cso6121123276.0
 for <wireguard@lists.zx2c4.com>; Tue, 09 May 2023 15:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=menlosecurity.com; s=google; t=1683670632; x=1686262632;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ihe/b+pLAFq5jM5svIC2dRd8U4C6jApwBK1xKuee+lU=;
 b=QsV/kCFL0W2nP1gTcei4IQLJ0c1HgdzEAL3Itf+U9Hq7adWBIHak5qSKuanijeOqfD
 2hHSzgAj1ozgqUU4wtCwLliC8ixmkCe2EFynkB47OXWtGBiMFfLL+7KMoiRjCQjGtrDL
 GfRr/2mcO44BP+YgD+V34Xd1j4qpXX5ZZUlkc=
X-Received: by 2002:a25:87:0:b0:b9e:207:21e0 with SMTP id
 129-20020a250087000000b00b9e020721e0mr19515876yba.20.1683670632421; 
 Tue, 09 May 2023 15:17:12 -0700 (PDT)
X-Received: by 2002:a25:87:0:b0:b9e:207:21e0 with SMTP id
 129-20020a250087000000b00b9e020721e0mr19515844yba.20.1683670631805; 
 Tue, 09 May 2023 15:17:11 -0700 (PDT)
MIME-Version: 1.0
From: Rumen Telbizov <rumen.telbizov@menlosecurity.com>
Date: Tue, 9 May 2023 15:17:00 -0700
Message-ID: <CA+FoirDk8ZC09YXC7T6ureaBWG6ZREpfE3cq5MoAkKf-rC=U1g@mail.gmail.com>
Subject: WireGuard IRQ distribution
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 26 Jun 2023 14:43:07 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello WireGuard,

New subscriber to the list here.
I've been running performance tests between two bare-metal machines,
trying to gauge
what performance at what CPU utilization I can expect out of
WireGuard. While doing so
I noticed that the immediate bottleneck becomes an IRQ which lands on
a single CPU core.
I strongly suspect that this is because the underlying packet flow
between the two machines
is exactly the same 5-tuple: UDP, src IP:51280, dst IP:51280. Since
WireGuard doesn't vary
the source UDP port, all packets land on the same IRQ and thus the
same CPU. No huge
surprises so far, if my understanding is correct. The interesting part
comes when I try to
introduce UDP source-port variability artificially through nftables -
see below for details.
Even though I am able to distribute the IRQ load pretty well across
all cores, the overall
performance actually drops by about 50%. I was hoping to get some
ideas as to what might
be going on and if this is an expected behaviour. Any further pointers
as to how I can fully
utilize all my CPU capacity and get as close to wire-speed would be appreciated.


Setup -- 2 x of the following:
* Xeon(R) E-2378G CPU @ 2.80GHz, 64GB RAM
* MT27800 Family [ConnectX-5] - 2 x 25Gbit/s in LACP bond = 50Gbit/s
* Debian 11, kernel: 5.10.178-3
* modinfo wireguard: version: 1.0.0
* Server running: iperf3 -s
* Client running: iperf3 -c XXX -Z -t 30

Baseline iperf3 performance over plain VLAN:
* Stable 24Gbit/s and 2Mpps

bmon:
  Gb                      (RX Bits/second)
24.54 .........|.||..|.||.||.||||||..||.||.......................
20.45 .........|||||||||||||||||||||||||||||.....................
16.36 ........||||||||||||||||||||||||||||||.....................
12.27 ........||||||||||||||||||||||||||||||.....................
8.18 ........|||||||||||||||||||||||||||||||.....................
4.09 ::::::::|||||||||||||||||||||||||||||||:::::::::::::::::::::
     1   5   10   15   20   25   30   35   40   45   50   55   60
   M                     (RX Packets/second)
2.03 .........|.||..|.||.||.||||||..||.||........................
1.69 .........|||||||||||||||||||||||||||||......................
1.35 ........||||||||||||||||||||||||||||||......................
1.01 ........||||||||||||||||||||||||||||||......................
0.68 ........|||||||||||||||||||||||||||||||.....................
0.34 ::::::::|||||||||||||||||||||||||||||||:::::::::::::::::::::
     1   5   10   15   20   25   30   35   40   45   50   55   60

top:
%Cpu0  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu1  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu2  :  1.0 us,  1.0 sy,  0.0 ni, 98.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu3  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu4  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu5  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu6  :  1.0 us,  0.0 sy,  0.0 ni, 99.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu7  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu8  :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu9  :  1.0 us,  1.0 sy,  0.0 ni, 98.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu10 :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu11 :  0.0 us,  0.9 sy,  0.0 ni, 16.8 id,  0.0 wa,  0.0 hi, 82.2 si,  0.0 st
%Cpu12 :  0.0 us, 32.3 sy,  0.0 ni, 65.6 id,  0.0 wa,  0.0 hi,  2.1 si,  0.0 st
%Cpu13 :  1.0 us, 36.3 sy,  0.0 ni, 59.8 id,  0.0 wa,  0.0 hi,  2.9 si,  0.0 st
%Cpu14 :  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu15 :  0.0 us,  1.0 sy,  0.0 ni, 99.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st

The IRQs do pile up behind CPU 11 because iperf3 is single-threaded.
Still, I can reach the full bandwidth of a single NIC (25Gbit/s) which is
also an artefact of the LACP hashing of a single packet flow.


Scenario 1: No port randomization (stock wireguard setup)
* all IRQs land on a single CPU core
* 8Gbit/s and 660Kpps

bmon:
      Gb                      (RX Bits/second)
    8.01 ...........|||||||||||||||.|||||||||||||....................
    6.68 ...........|||||||||||||||||||||||||||||....................
    5.34 ...........||||||||||||||||||||||||||||||...................
    4.01 ...........||||||||||||||||||||||||||||||...................
    2.67 ...........||||||||||||||||||||||||||||||...................
    1.34 ::::::::::|||||||||||||||||||||||||||||||:::::::::::::::::::
         1   5   10   15   20   25   30   35   40   45   50   55   60
       K                     (RX Packets/second)
  661.71 ...........|||||||||||||||.|||||||||||||....................
  551.42 ...........|||||||||||||||||||||||||||||....................
  441.14 ...........||||||||||||||||||||||||||||||...................
  330.85 ...........||||||||||||||||||||||||||||||...................
  220.57 ...........||||||||||||||||||||||||||||||...................
  110.28 ::::::::::|||||||||||||||||||||||||||||||:::::::::::::::::::
         1   5   10   15   20   25   30   35   40   45   50   55   60

top:
%Cpu0  :  0.0 us, 28.0 sy,  0.0 ni, 69.0 id,  0.0 wa,  0.0 hi,  3.0 si,  0.0 st
%Cpu1  :  0.0 us, 18.1 sy,  0.0 ni, 79.8 id,  0.0 wa,  0.0 hi,  2.1 si,  0.0 st
%Cpu2  :  0.0 us, 20.2 sy,  0.0 ni, 77.9 id,  0.0 wa,  0.0 hi,  1.9 si,  0.0 st
%Cpu3  :  0.0 us, 22.8 sy,  0.0 ni, 74.3 id,  0.0 wa,  0.0 hi,  3.0 si,  0.0 st
%Cpu4  :  0.0 us, 14.6 sy,  0.0 ni, 85.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu5  :  0.0 us, 12.6 sy,  0.0 ni, 87.4 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu6  :  0.0 us, 21.3 sy,  0.0 ni, 75.5 id,  0.0 wa,  0.0 hi,  3.2 si,  0.0 st
%Cpu7  :  0.0 us, 17.6 sy,  0.0 ni, 76.9 id,  0.0 wa,  0.0 hi,  5.5 si,  0.0 st
%Cpu8  :  1.1 us, 24.2 sy,  0.0 ni, 70.5 id,  0.0 wa,  0.0 hi,  4.2 si,  0.0 st
%Cpu9  :  0.0 us, 20.2 sy,  0.0 ni, 74.5 id,  0.0 wa,  0.0 hi,  5.3 si,  0.0 st
%Cpu10 :  0.0 us, 30.3 sy,  0.0 ni, 62.6 id,  0.0 wa,  0.0 hi,  7.1 si,  0.0 st
%Cpu11 :  0.0 us, 22.3 sy,  0.0 ni, 71.3 id,  0.0 wa,  0.0 hi,  6.4 si,  0.0 st
%Cpu12 :  1.1 us, 15.8 sy,  0.0 ni, 76.8 id,  0.0 wa,  0.0 hi,  6.3 si,  0.0 st
%Cpu13 :  0.0 us,  0.0 sy,  0.0 ni,  5.0 id,  0.0 wa,  0.0 hi, 95.0 si,  0.0 st
%Cpu14 :  1.0 us, 23.7 sy,  0.0 ni, 71.1 id,  0.0 wa,  0.0 hi,  4.1 si,  0.0 st
%Cpu15 :  0.0 us, 23.2 sy,  0.0 ni, 73.7 id,  0.0 wa,  0.0 hi,  3.2 si,  0.0 st

As mentioned above I suspect this is an effect of the single 5-tuple
UDP, src 169.254.100.2:51280, dst 169.254.100.1:51280 that WireGuard
uses under the hood. Parallelizing iperf3 has no effect since it all comes
down to the same flow on the wire after encapsulation.

This is the point where I decided to try to diversify / randomize the source
UDP port to try to distribute the CPU load over the remaining cores.


Scenario 2: UDP source port randomization via nftables

* 4Gbit/s and 337Kpps
* I applied the following nftables to transparently change the source UDP port
at transmit time and then to bring it back to what WireGuard expects.
table inet raw {
    chain POSTROUTING {
        type filter hook postrouting priority raw; policy accept;
        oif bond0.2000 udp dport 51280   notrack udp sport set ip id
    }

    chain PREROUTING {
        type filter hook prerouting priority raw; policy accept;
        iif bond0.2000 udp dport 51280   notrack udp sport set 51280
    }
}

In essence I set the source UDP port to the IP ID field which gives me
a pretty good distribution of source UDP ports. I tried using the random
and inc modules of nftables but with no luck, port was always 0.
This trick seems to work though.

bmon:
      Gb                      (RX Bits/second)
    4.08 ........|..|||.||||||||..||||||||...........................
    3.40 ........||.||||||||||||||||||||||||||.......................
    2.72 .......||||||||||||||||||||||||||||||.......................
    2.04 .......||||||||||||||||||||||||||||||.......................
    1.36 .......||||||||||||||||||||||||||||||.......................
    0.68 :::::::|||||||||||||||||||||||||||||||::::::::::::::::::::::
         1   5   10   15   20   25   30   35   40   45   50   55   60
       K                     (RX Packets/second)
  337.23 ........|..|||.||||||||..||||||||...........................
  281.02 ........||.||||||||||||||||||||||||||.......................
  224.82 .......||||||||||||||||||||||||||||||.......................
  168.61 .......||||||||||||||||||||||||||||||.......................
  112.41 .......||||||||||||||||||||||||||||||.......................
   56.20 :::::::|||||||||||||||||||||||||||||||::::::::::::::::::::::
         1   5   10   15   20   25   30   35   40   45   50   55   60

top:
%Cpu0  :  0.0 us, 16.5 sy,  0.0 ni, 62.9 id,  0.0 wa,  0.0 hi, 20.6 si,  0.0 st
%Cpu1  :  0.0 us, 50.5 sy,  0.0 ni, 31.1 id,  0.0 wa,  0.0 hi, 18.4 si,  0.0 st
%Cpu2  :  0.0 us, 16.8 sy,  0.0 ni, 68.4 id,  0.0 wa,  0.0 hi, 14.7 si,  0.0 st
%Cpu3  :  0.0 us, 20.6 sy,  0.0 ni, 61.8 id,  0.0 wa,  0.0 hi, 17.6 si,  0.0 st
%Cpu4  :  0.0 us, 13.1 sy,  0.0 ni, 68.7 id,  0.0 wa,  0.0 hi, 18.2 si,  0.0 st
%Cpu5  :  0.0 us, 19.2 sy,  0.0 ni, 61.6 id,  0.0 wa,  0.0 hi, 19.2 si,  0.0 st
%Cpu6  :  0.0 us, 15.5 sy,  0.0 ni, 62.1 id,  0.0 wa,  0.0 hi, 22.3 si,  0.0 st
%Cpu7  :  0.0 us, 29.3 sy,  0.0 ni, 53.5 id,  0.0 wa,  0.0 hi, 17.2 si,  0.0 st
%Cpu8  :  1.0 us, 18.0 sy,  0.0 ni, 59.0 id,  0.0 wa,  0.0 hi, 22.0 si,  0.0 st
%Cpu9  :  0.0 us, 20.8 sy,  0.0 ni, 68.9 id,  0.0 wa,  0.0 hi, 10.4 si,  0.0 st
%Cpu10 :  1.0 us, 16.8 sy,  0.0 ni, 66.3 id,  0.0 wa,  0.0 hi, 15.8 si,  0.0 st
%Cpu11 :  0.0 us, 13.4 sy,  0.0 ni, 66.0 id,  0.0 wa,  0.0 hi, 20.6 si,  0.0 st
%Cpu12 :  0.0 us, 21.9 sy,  0.0 ni, 64.6 id,  0.0 wa,  0.0 hi, 13.5 si,  0.0 st
%Cpu13 :  0.0 us, 22.4 sy,  0.0 ni, 60.2 id,  0.0 wa,  0.0 hi, 17.3 si,  0.0 st
%Cpu14 :  0.0 us, 23.0 sy,  0.0 ni, 61.0 id,  0.0 wa,  0.0 hi, 16.0 si,  0.0 st
%Cpu15 :  0.0 us, 16.8 sy,  0.0 ni, 67.4 id,  0.0 wa,  0.0 hi, 15.8 si,  0.0 st

As you can see the IRQs are pretty well balanced and I have tons of idle on all
cores, yet I get half the performance numbers.

I'll continue with my tests and try a newer kernel, but wanted to share this
with this community to try and get your feedback.

Thank you,
Rumen Telbizov
