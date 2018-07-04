Return-Path: stefan@agner.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba08c641
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jul 2018 23:08:17 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20e7363f
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jul 2018 23:08:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 05 Jul 2018 01:14:52 +0200
From: Stefan Agner <stefan@agner.ch>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Android: TCP connection drop when disabling WiFi
In-Reply-To: <CAHmME9odvkuvmpA6Fg0D-Cwy7zzokFDcaB7QP384AHL6VOd9RA@mail.gmail.com>
References: <fada85c8aea2e15480602784fba3eeeb@agner.ch>
 <CAHmME9odvkuvmpA6Fg0D-Cwy7zzokFDcaB7QP384AHL6VOd9RA@mail.gmail.com>
Message-ID: <f33a4a8f507ea3513e54a3f0610baf9b@agner.ch>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 04.07.2018 23:13, Jason A. Donenfeld wrote:
> Hi Stefan,
> 
> I wish this were the case too, but Android sends SOCK_DESTROY to
> everything when networks change, and there isn't a lot that can be
> done about it without rooting the device, as far as I can tell. If
> you've got some Android chops and can think of a way we can suppress
> that, I'd be very interested.


Android actually logs when it destroys sockets, here an example when
using WiFi:
$ adb logcat Netd:V *:S
07-05 00:42:14.184  3912  4042 I Netd    : Destroyed 2 sockets on
192.168.1.123 in 1.3 ms

(192.168.1.123 => device IP on WiFi)

In that particular instance I had Wireguard open and 3 SSH connections
open. Interestingly, Netd only destroyed two sockets... This is
reproducible.

When closing Wireguard, quite some connections got dropped:
07-05 00:43:34.276  3912  4042 I Netd    : Destroyed 8 sockets on
2a01:123:4321::4 in 0.9 ms
07-05 00:43:34.282  3912  4042 I Netd    : Destroyed 10 sockets on
192.168.3.123 in 3.1 ms
(IPs match the ones I use for the Wireguard tunnel)

When not using Wireguard, connecting SSH and then closing WiFi, number
of destroyed sockets are quite a bit higher:
07-05 00:45:31.129  3912  4042 I Netd    : Destroyed 18 sockets on
192.168.1.123 in 1.6 ms

With that finding, I started to doubt that Android really kills all
connections. And indeed, using "Magic iPerf" an iperf3 Android App, the
issue seems not to happen!

So it really seems that ConnectBot and Termius (the second Android SSH
Client I tried) disconnect on their own discretion.

I created a ticket for ConnectBot:
https://github.com/connectbot/connectbot/issues/623

It seems to be fairly trivial to fix by just not calling
onConnectivityLost() in ConnectivityReceiver anymore, I will give this a
try another day.

So long story short: Wireguard as well as Android seem to behave nicely
when it comes to keeping TCP connections open. It seems that some
Android apps try to be smart...

Sorry for the noise!

--
Stefan
