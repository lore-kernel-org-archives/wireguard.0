Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ae9abb3
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:08:31 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89872dd5
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:08:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 221efd68
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:08:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b3a0f6ab
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:08:31 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id 3so489314165oih.1
 for <wireguard@lists.zx2c4.com>; Sun, 08 Jan 2017 14:18:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170108141216.GB6421@tuxmachine.polynome.dn42>
References: <6d000312-635f-a361-200a-936da7ce7e17@web.de>
 <CAHmME9p4WOB96v6P1E2yGZcpEXdRfG7e=vK1nUwCE953tx1SSA@mail.gmail.com>
 <89477ad4-b015-d0a1-1c05-ea6600b2f464@web.de>
 <20170108141216.GB6421@tuxmachine.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 8 Jan 2017 23:18:01 +0100
Message-ID: <CAHmME9p0wV=cVME+3vQ5tenWOBc5SQWicKevXOwf2N7O2R225Q@mail.gmail.com>
Subject: Re: Multiple Endpoints
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
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

On Sun, Jan 8, 2017 at 3:12 PM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> I am also interested in multiple endpoints support, and I am preparing a
> proposal that I will send soon.

Cool. Any details? Probably best to discuss it casually before putting
too much work into it.
Have you read that Mosh multipath paper? I just ran into this the
other night and put it on my reading list. If so, is it any good or
relavent to this?

> So, if a client is connected to the server and the server changes its IP
> address, the client will keep trying to use the old IP address forever.

No. If the server sends a packet to the client using the same UDP
src/dst, then it will make it to the client, and the client will learn
the new server IP.

> You would need to destroy the wireguard interface on the client and
> recreate it, so that `wg` configures the kernel module with the new IP
> address associated with the hostname.

No. And even in the worst possible case, no destruction of the wg
interface would be necessary. wg(8) can reconfigure all attributes on
the fly.

> You're right, in your case, you would need to setup port forwarding on
> your client, so that wireguard on your client device can be reached from
> any IP address.

No. In the vast majority of cases I've seen, both stateful firewalls
and NAT do not do the mapping based on the remote IP.
