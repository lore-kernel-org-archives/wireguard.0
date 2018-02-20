Return-Path: dfawcus@employees.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f987c6f
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Feb 2018 00:57:47 +0000 (UTC)
Received: from accordion.employees.org (accordion.employees.org
 [198.137.202.74])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28f59d07
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Feb 2018 00:57:47 +0000 (UTC)
Date: Tue, 20 Feb 2018 01:05:20 +0000
From: Derek Fawcus <dfawcus+lists-wireguard@employees.org>
To: wireguard@lists.zx2c4.com
Subject: UDP checksums and inband control messages
Message-ID: <20180220010520.GA38119@accordion.employees.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I see from the code that currently the kernel UDP sockets
have checksums enabled.  I also note the message from
November speculating upon if in band control messages
should be added.

One thing I was pondering recently in the context of UDP tunnelling,
is that one doesn't really need to have UDP checksums on the
encapsulating packet, since they payload itself is eventually
protected by its IPv4 header checksum, and likewise its transport
payload being protected by its own TCP/UDP/etc checksum.
[OK - some exceptions, but valid to a first approximation]

In the case of a crypto tunnel tunnel when using a
verified / authenticated crypto algorithm, any lower level
UDP checksum is even more redundent.

The one place where UDP checksums would stil seem to be useful
is for any in band control messages, if they were themselves
not covered by the crypto layer.  i.e. c.f. OpenVPN and
its payload vs control messages.

Which then got me to thinking that one could sort of cheat,
and use the checksum field in the UDP header as an indicator
of if the payload is control or data.  All zero bits for
data, none zero (including 0xffff) for control.

This would also have the advantage that if one is using a system
without support for h/w checksum offload, one gets to save a
bit of CPU;  however that may or may not be significant depending
upon just if/when packet memory if touched, and by which cores
in a system.  i.e. I'm pondering a non Linux kernel implementation.

So - thoughts?  Is it worth doing something like this for wireguard?

DF
