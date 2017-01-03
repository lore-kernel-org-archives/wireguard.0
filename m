Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 212dede0
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 06:48:32 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d90ded9
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 06:48:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7bb89d27
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 06:48:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fc4b4ff5
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 06:48:32 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id b126so499613971oia.2
 for <wireguard@lists.zx2c4.com>; Mon, 02 Jan 2017 22:57:20 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 3 Jan 2017 07:57:18 +0100
Message-ID: <CAHmME9pnrjo8QcZs44xuGAwZ9TXDkRri68-LZXamuvw9sgwb5g@mail.gmail.com>
Subject: Re: [TOOL] wg-config graduates to src/tools, becomes wg-auto-config
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

On Tue, Jan 3, 2017 at 7:46 AM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> debian is unlikely to install this if it is expected to be named with a
> .bash suffix:

That's just the title in the source tree. The make file installs it as
`wg-auto-config`.

> That said, i'm not sure what you want with this.  If the ultimate goal
> is to have systemd-style .network files, you should ask for these
> changes in systemd itself.  That's likely the cleanest approach.  If you
> do this, please post a link here to the systemd github issue or pull
> request. :)

There already is a systemd-networkd pull request. I didn't write the
code for it, and it seems like it could use quite a bit of review, but
I'm pretty sure systemd-networkd .network files are going to happen.

The goal of this tool is just to have something quick&dirty for people
to use for flipping on and off their VPN. And it seems like some
people who don't use systemd-network wanted something easy they could
run from a "wireguard@.service" file.

If you have an objection to shipping this, I could just move it back
into contrib.

> (a) fork and exec ip from wg itself
> when running "wg setconf"

Not an option. wg(8) is intended to only take care of
wireguard-related things, and not overlap with ip(8). It should not be
a network management tool at all. In fact, the ultimate goal is to
fold its functionality into iproute2/ip(8).

> (b) name the wrapper something like
> /usr/bin/wg+ip

That's a decent idea for a name. But it does a _bit_ more than merely
combine the two utilities.

So, it seems like thing to do at this point would be to open this
thread up for bike-shedding over the name. What might we call this
tool to convey what it does?

- wg-helper
- wg-quick-setup
- wg-ezconfig
- wg-wrapper
- wg+ip+magic
- ??
