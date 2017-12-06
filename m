Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29fbf73a
 for <wireguard@lists.zx2c4.com>; Wed, 6 Dec 2017 13:05:41 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b943eb6
 for <wireguard@lists.zx2c4.com>; Wed, 6 Dec 2017 13:05:41 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Ryan Whelan <rcwhelan@gmail.com>
Subject: Re: Babel over wireguard
In-Reply-To: <CAM3m09T_GA3-AdFkZuEf4P5sG0=wNi4FN_79Da6cd4q6un+oDw@mail.gmail.com>
References: <CAM3m09QrRs=20aTOdDXtWg3dgCVemRgAXZ91=WTWTf_+d-ax4A@mail.gmail.com>
 <BF2C7924-EBFC-480C-AA52-D92CB818F3D3@toke.dk>
 <CAM3m09T_GA3-AdFkZuEf4P5sG0=wNi4FN_79Da6cd4q6un+oDw@mail.gmail.com>
Date: Wed, 06 Dec 2017 14:11:58 +0100
Message-ID: <87a7yw0zmp.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Ryan Whelan <rcwhelan@gmail.com> writes:

> Are there any routing protocol implementations that do not depend on
> multicast?

We are in the process of standardising Babel, and one of the things we
are adding is the ability to run entirely over unicast. So in the
future, Babel will be able to do this (and integration with Wireguard is
one of the things I want to achieve with this). But for now, no
implementation exists.

Other than that, maybe BGP? But you'd still need integration with
Wireguard if you don't want to just set AllowedIPs to ::/0

> In my setup, 2 hosts will be able to route to one another over 2
> different wg interfaces and I just need something to select whichever
> interface has the least latency. Anything like that exist? :D

You can do this with point-to-point wireguard links. I.e., as long as
the wireguard link only has two peers, you can set AllowedIPs to
0.0.0.0/0, ::/0 on both sides, assign manual link-local addresses
(anything in fe80::/64 will work, so you could just assign fe80::1/64 to
one side and fe80::2/64 to the other side; they don't need to be
globally unique either). Then you can run babeld on top, which will
instruct the kernel to send appropriate packets to the wireguard
interface, and wireguard will forward it to the other side.

It's not currently possible to run a routing daemon on a multi-peer
wireguard interface. The routing daemon would need to reconfigure
wireguard in the kernel when it adds routes. I am planning to add this
to Bird at some point, but have not gotten around to it yet...

-Toke
