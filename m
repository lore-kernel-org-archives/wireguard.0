Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec64cf7b
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:04:56 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09406f68
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:04:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a99c599c
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:04:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d1552abb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:04:56 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id 128so477778990oig.0
 for <wireguard@lists.zx2c4.com>; Sun, 08 Jan 2017 14:14:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <89477ad4-b015-d0a1-1c05-ea6600b2f464@web.de>
References: <6d000312-635f-a361-200a-936da7ce7e17@web.de>
 <CAHmME9p4WOB96v6P1E2yGZcpEXdRfG7e=vK1nUwCE953tx1SSA@mail.gmail.com>
 <89477ad4-b015-d0a1-1c05-ea6600b2f464@web.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 8 Jan 2017 23:14:25 +0100
Message-ID: <CAHmME9r9DcHrp-HS00qjGqddBGaAPvY_Xj1uGdeH6dWJAkmoyg@mail.gmail.com>
Subject: Re: Multiple Endpoints
To: em12345 <em12345@web.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, Jan 7, 2017 at 5:45 PM, em12345 <em12345@web.de> wrote:
> This would require PersistentKeepalive on "server" side. But assuming
> the common case that the client sits behind a stateful firewall, how
> would the server be able to inform the client about its IP change?

Yes, the server would need the PersistentKeepalive; you're right.

> - the server (from its new IP) can send UDP packages to the still
> remembered client IP (because of PersistentKeepalive). But my
> understanding is that stateful firewalls will block UDP packages from
> the new IP until the client has send an UDP to the new server IP.

No, usually not. In most cases, the NAT mapping depends on the
client's local IP and sport/dport, but not on the remote dst IP.
Otherwise common NAT holepunching schemes like STUN and the example
holepuncher [1] wouldn't work. The new UDP packets will make it to the
client, in fact.

[1] https://git.zx2c4.com/WireGuard/tree/contrib/examples/nat-hole-punching/README
