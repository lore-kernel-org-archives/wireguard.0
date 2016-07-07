Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 831f3a96
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 17:57:57 +0000 (UTC)
Date: Thu, 7 Jul 2016 12:57:22 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160707175722.GB13834@wolff.to>
References: <CAHmME9piH4WkMpJ3p0rzFmtA=ozkfa-+rGbAH0T2OjQ+5AJkJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9piH4WkMpJ3p0rzFmtA=ozkfa-+rGbAH0T2OjQ+5AJkJg@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] NAT-T Keepalives
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Jul 07, 2016 at 18:33:11 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
>The most bootleg solution for this is to just run "ping $server" from
>userspace. What a disgusting fix.

This also forces encrypted traffic, which your solution would avoid.

>1. What should the payload be? Should it be a single fixed byte? Or
>should it be a zero length UDP packet?

The packet doesn't even need to make it to the endpoint, just through 
the NAT or firewall. So you don't want something that would get blocked 
by those. I don't know of anything that would be likely to. Otherwise 
you probably want minimum resources expended by the end points producing 
and receiving the packet.

>5. Is there a good resource for real world NAT mapping timings found
>in the wild?

Our NAT defaults to one minute for random UDP ports. So 30 seconds seems 
like a reasonable time if there isn't much packet loss.

>What are your thoughts?

It sounds like a nice improvement.
