Return-Path: labawi-wg@matrix-dream.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98c20f16
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 07:50:46 +0000 (UTC)
Received: from matrix-dream.net (matrix2.matrix-dream.net [84.200.73.251])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55650b40
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 07:50:46 +0000 (UTC)
Date: Thu, 18 May 2017 09:02:13 +0100
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: allowed_ips move semantics?
Message-ID: <20170518080213.GB1941@matrix-dream.net>
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 <20170516154204.GB9458@matrix-dream.net>
 <CAHmME9roTAqMYB0qB7JG3rkKfGw1nfzTz0AD-frcGyyweCTcJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <CAHmME9roTAqMYB0qB7JG3rkKfGw1nfzTz0AD-frcGyyweCTcJQ@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I was asking, because I think automatically
moving allowed_ips is prone to cause more
trouble than the small savings of one or few
commands, both via IPC and the wg tool. I would
suggest having an error semantics instead.


I believe there are two cases where moving
ranges is relevant:

1) You know the range is a duplicate, in which
case it shouln't be that hard to remove it
from the relevant peer first.
If it is hard, then it is a good area
of improvement.

2) You don't know the range is a duplicate,
in which case you have probably made a mistake.
One wich you might not notice until you see
something is broken, so an error instead would
be welcome.


Semantics of (permanently) moving a range
from another peer is not obvious unless you
know it or actually consider the effects.

IMO it is a bad default. It will cause pains
to fat-fingered sysadmins, it is prone to
race conditions and even more importantly
if in API, it will lead to development of
slightly broken tools.


Case in point:

The wg tool itself (0.0.20170517) will happily
accept this configuration

[Interface]
ListenPort = 51820
PrivateKey = NNNNooootttt++rrreeeaaalll+++kkkkkeeeeyyyy0=

[Peer]
PublicKey = 5c/Fuf2V7tgcxNRfMvuyCsZ+/5xXZm1pxewmvpY0n1k=
AllowedIPs = 172.16.0.1/32

[Peer]
PublicKey = 6yztQEsu3vCsKz3WrCgqXfTjizHAtTylqAQzrTwjIA0=
AllowedIPs = 172.16.0.1/32

After load, the first peer will have no allowed ips,
which was probably not intended and in large configurations
it would be easy to miss.


Example of prior art:

# ip route add 172.16.0.1/32 dev lo
# ip route add 172.16.0.1/32 dev wg0
RTNETLINK answers: File exists


I would suggest changing allowed_ips moves to be errors,
and possibly improving the wg tool to make removing unwanted
allowed_ips easier. Perhaps something ip route add/delete style
would be appropriate.

Regards,
Ivan


On Wed, May 17, 2017 at 03:47:51PM +0200, Jason A. Donenfeld wrote:
> Hi Ivan,
> 
> On Tue, May 16, 2017 at 5:42 PM, Ivan Labáth <labawi-wg@matrix-dream.net> wrote:
> > does changing one peer affect settings of another
> > peer if they have common allowed_ips?
> 
> Great question. I've improved the documentation to note this. The
> answer is that: if you have a 100% identical allowed_ips entry in a
> first peer and in a second peer, the entry moves from the first to the
> second.
> 
> Jason
