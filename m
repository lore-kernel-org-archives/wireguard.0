Return-Path: k@vodka.home.kg
Received: from mail.kotidze.in (mail.kotidze.in [91.92.66.82])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c77675b
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2016 16:17:00 +0000 (UTC)
Received: from private.domain by mail.kotidze.in with [XMail 1.27 ESMTP Server]
 id <S19BB> for <wireguard@lists.zx2c4.com> from <k@vodka.home.kg>;
 Fri, 4 Nov 2016 19:18:21 +0300
Date: Fri, 4 Nov 2016 19:18:15 +0300
From: k@vodka.home.kg
Message-ID: <1859699461.20161104191815@vodka.home.kg>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <CAHmME9r6uS+vwiKOjzk9FAAKLTxTst3E0vPiwt2=2FmDd+RmBw@mail.gmail.com>
References: <1518389796.20161104190140@vodka.home.kg>
 <CAHmME9r6uS+vwiKOjzk9FAAKLTxTst3E0vPiwt2=2FmDd+RmBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Problematic version was 0.0.20161025.
I upgraded kmod to 0.0.20161103 at it works fine now.

> Hi k,

> I'll look into this. Which snapshot are you using? Or, which commit is th=
is?

> Jason


> On Fri, Nov 4, 2016 at 5:01 PM,  <k@vodka.home.kg> wrote:
>> I'm trying to connect 2 endpoints with wireguard.
>> One endpoint has MTU of inet inteface 1500, another 1456.
>> To prevent packet fragmentation on inet interface i set up mtu 1383 for =
both wg interfaces. Checked that no frag occurs on inet interface in wiresh=
ark. Maximum packet data size is 1383-28 =3D 1355. Checked with no-fragment=
 ping, packets pass well.
>>
>> First I checked packet loss between inet IPs
>>
>> iperf  -c x.x.x.x -u -b 25M -l 1400
>> 0.0-10.3 sec  29.6 MBytes  24.2 Mbits/sec  16.073 ms  175/23090 (0.76%)
>>
>> packet loss always within 0.5..1%. its normal
>> now I try to do the same with much less bandwidth between wireguard ips
>> on packet size <=3D1252 packet loss rate is 0.5..1%
>>
>> iperf  -c 192.168.254.65 -w 500000 -u -b 1M -l 1252
>> 0.0-10.0 sec  1.18 MBytes   991 Kbits/sec   0.659 ms    9/ 1000 (0.9%)
>>
>> but starting from packet size 1253 packets loss greatly increases. its 6=
..10%
>>
>> iperf  -c 192.168.254.65 -w 500000 -u -b 1M -l 1253
>> 0.0-10.0 sec  1.12 MBytes   936 Kbits/sec   0.328 ms   64/  998 (6.4%)
>>
>> Thats why TCP is incredibly slow. If I set up mss for TCP to not exceed =
packets size threshold TCP is fast.
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> http://lists.zx2c4.com/mailman/listinfo/wireguard

--=20
=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
 K                          mailto:k@vodka.home.kg
