Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b8cd6c0
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 12:06:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 108991ad
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 12:06:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1edbf26d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 12:06:46 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id l69so30005515lfg.1
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jul 2016 05:07:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160714105500.GT3952@sliepen.org>
References: <CAHmME9piH4WkMpJ3p0rzFmtA=ozkfa-+rGbAH0T2OjQ+5AJkJg@mail.gmail.com>
 <20160714105500.GT3952@sliepen.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 15 Jul 2016 14:07:54 +0200
Message-ID: <CAHmME9pVwcxZS1NaH2=7c=hpiUqbSWDC6rZL0iLLyr50+TZQyw@mail.gmail.com>
To: Guus Sliepen <guus@tinc-vpn.org>
Content-Type: text/plain; charset=UTF-8
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

Hey Guus,

On Thu, Jul 14, 2016 at 12:55 PM, Guus Sliepen <guus@tinc-vpn.org> wrote:
> Some insights learned from tinc:

Thanks very much for these!

>
> On Thu, Jul 07, 2016 at 06:33:11PM +0200, Jason A. Donenfeld wrote:
>
>> a) The persistent keepalive does not need an active session and does
>> not need to send any encrypted data. It simply is a UDP packet to the
>> endpoint. The payload doesn't matter for the purpose of just keeping
>> the NAT mapping alive.
>
> Indeed.
>
>> 1. What should the payload be? Should it be a single fixed byte? Or
>> should it be a zero length UDP packet?
>
> A zero-length UDP packet should be fine, although it might upset some
> OSes or firewalls.

In fact, we wound up switching to an encrypted keepalive, so that it
would work nicely with roaming and endpoint discovery. Now, setting
persistent-keepalive mode on will ensure that wireguard remains
"connected", while its default is to "go to sleep".


>
> Another issue that tinc deals with is path MTU discovery. It combines
> this with the heartbeat packets. While a zero-length UDP packets is
> enough to keep a NAT mapping alive, the actual path between two peers
> might change, and that also changes the path MTU. AFAIK WireGuard
> doesn't care about this, but in case you (start to) do, you want to send
> packets with the discovered MTU and perhaps a slightly bigger one too,
> once in a while, to check whether the PMTU changed.
>
> Discovering the PMTU between two peers and enforcing this inside the
> tunnel helps prevent fragmentation of the outer UDP packets. This
> improves performance and sometimes it's just necessary because there are
> firewalls out there that block fragments.

Doesn't the Linux kernel already support PMTU discovery with the usual
ICMP notifications, unless you turn it off with the sysctl nob? Have
you experimented at all with how this discovery trickles down to tinc?
I wonder if, since I'm inside the kernel, I'd have an even closer way
of integrating with the already existing mechanisms.


> If you want to keep alive a NAT mapping, then experience tells me 10
> seconds is something that works for virtually all NAT devices. Once you
> start to go over 10 seconds, you will find there are those that will
> drop the mappings. There are RFCs which tell you how a NAT device should
> behave (RFC 4787 and 7857), but it's hard to find devices that follow
> all these requirements. The recommended timeout for NAT devices is 5
> minutes. I'm quite sure a 3600 second interval is useless in practice.

Yea, I read those RFCs and then promptly found out nobody follows
them. What a disappointment.

In practice, have you seen any devices that are worse than 30 seconds?
That's about the lowest I saw.
