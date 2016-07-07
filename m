Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef25f76c
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 16:33:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f9df047
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 16:33:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 831b3e8b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 16:33:02 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id q132so14960287lfe.3
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jul 2016 09:33:15 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 7 Jul 2016 18:33:11 +0200
Message-ID: <CAHmME9piH4WkMpJ3p0rzFmtA=ozkfa-+rGbAH0T2OjQ+5AJkJg@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Subject: [WireGuard] NAT-T Keepalives
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi folks,

WireGuard is designed to be as silent as possible. We have
opportunistic encrypted keepalives sent only in relation to received
data with nothing to respond, to detect if the link is dead. This
system works quite well.

However, with NAT, a mapping times out after a while. This is fine for
the case in which the system behind NAT connects up to the server,
after a period of inactivity, since then there will simply be a new
NAT mapping and roaming support takes care of it. However, if the NAT
mapping expires, and the server wants to send a packet to the client
behind NAT, then we're in trouble. This is a common setup too, when
people want to keep their PCs at home accessible via their VPN.

The most bootleg solution for this is to just run "ping $server" from
userspace. What a disgusting fix.

It seems evident that, like every other UDP protocol on the planet,
WireGuard needs to support what I'm calling "persistent keepalives". I
call it persistent to distinguish it from the encrypted ones which are
opportunistic. There are several other important differences:

a) The persistent keepalive does not need an active session and does
not need to send any encrypted data. It simply is a UDP packet to the
endpoint. The payload doesn't matter for the purpose of just keeping
the NAT mapping alive.
b) The persistent keepalive is optional. It is a configuration option
in seconds. "0" means off. "60" means send once per minute. And so
forth. By default it is off.

So, now there are several things to decide:

1. What should the payload be? Should it be a single fixed byte? Or
should it be a zero length UDP packet?
2. What is an acceptable minimum interval? Every 5 seconds?
3. What is an acceptable maximum interval? 3600 seconds?
4. What is a good interval to show in documentation examples that will
work for most people?
5. Is there a good resource for real world NAT mapping timings found
in the wild?

After this feature is ironed out, I'll be pushing a new experimental
snapshot. This is currently the most visible headache of WireGuard and
I'd like to get it ironed out sooner rather than later.

What are your thoughts?

Thanks,
Jason
