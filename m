Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95a21733
 for <wireguard@lists.zx2c4.com>; Sat, 7 Jan 2017 15:13:48 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d6928ff
 for <wireguard@lists.zx2c4.com>; Sat, 7 Jan 2017 15:13:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38f74507
 for <wireguard@lists.zx2c4.com>; Sat, 7 Jan 2017 15:13:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4fe4cf50
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Jan 2017 15:13:47 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id 3so464103784oih.1
 for <wireguard@lists.zx2c4.com>; Sat, 07 Jan 2017 07:23:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <6d000312-635f-a361-200a-936da7ce7e17@web.de>
References: <6d000312-635f-a361-200a-936da7ce7e17@web.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 7 Jan 2017 16:23:08 +0100
Message-ID: <CAHmME9p4WOB96v6P1E2yGZcpEXdRfG7e=vK1nUwCE953tx1SSA@mail.gmail.com>
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

Hello,

Keep in mind that WireGuard's roaming property means that while the
two peers are communicating, they'll automatically be updating to each
others' latest IP addresses. One way to ensure that they _keep_
communicating is by using the PersistentKeepalive feature. This then
shifts the problem to "how do they start communicating", in which case
you can just use a little resolve,ping,resolve,ping loop on your
various dyndns services.

But, in case you want a different architecture, I'll directly answer
your questions:

- wg setconf/addconf/set can be run at any time, before or after the
link is up, and before or after peers are communicating. It returns
and succeeds immediately, leaving the actual negotiation to be done
whenever data needs to be sent.
- The same goes for `ip link up`, with the sole exception that `ip
link up` may fail if the UDP port is already in use by a different
program.
- The best way to determine if a wireguard link is up is if you can
send a ping through the tunnel.
- Your syntax doesn't make sense for endpoint setting. What you want
is: `wg set wg0 peer ABCDEFG... endpoint 1.2.3.4:1234`. So, yes, you
can individually set the endpoint of a peer.

Jason
