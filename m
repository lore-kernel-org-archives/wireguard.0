Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68b60c5b
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2016 16:03:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b746dae
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2016 16:03:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2c0f25d9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2016 16:03:08 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id b14so67612419lfg.2
 for <wireguard@lists.zx2c4.com>; Fri, 04 Nov 2016 09:04:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1518389796.20161104190140@vodka.home.kg>
References: <1518389796.20161104190140@vodka.home.kg>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 4 Nov 2016 17:04:29 +0100
Message-ID: <CAHmME9r6uS+vwiKOjzk9FAAKLTxTst3E0vPiwt2=2FmDd+RmBw@mail.gmail.com>
To: k@vodka.home.kg
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] heavy packet loss
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi k,

I'll look into this. Which snapshot are you using? Or, which commit is this?

Jason


On Fri, Nov 4, 2016 at 5:01 PM,  <k@vodka.home.kg> wrote:
> I'm trying to connect 2 endpoints with wireguard.
> One endpoint has MTU of inet inteface 1500, another 1456.
> To prevent packet fragmentation on inet interface i set up mtu 1383 for both wg interfaces. Checked that no frag occurs on inet interface in wireshark. Maximum packet data size is 1383-28 = 1355. Checked with no-fragment ping, packets pass well.
>
> First I checked packet loss between inet IPs
>
> iperf  -c x.x.x.x -u -b 25M -l 1400
> 0.0-10.3 sec  29.6 MBytes  24.2 Mbits/sec  16.073 ms  175/23090 (0.76%)
>
> packet loss always within 0.5..1%. its normal
> now I try to do the same with much less bandwidth between wireguard ips
> on packet size <=1252 packet loss rate is 0.5..1%
>
> iperf  -c 192.168.254.65 -w 500000 -u -b 1M -l 1252
> 0.0-10.0 sec  1.18 MBytes   991 Kbits/sec   0.659 ms    9/ 1000 (0.9%)
>
> but starting from packet size 1253 packets loss greatly increases. its 6..10%
>
> iperf  -c 192.168.254.65 -w 500000 -u -b 1M -l 1253
> 0.0-10.0 sec  1.12 MBytes   936 Kbits/sec   0.328 ms   64/  998 (6.4%)
>
> Thats why TCP is incredibly slow. If I set up mss for TCP to not exceed packets size threshold TCP is fast.
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard
