Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5bae5564
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 22:51:48 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd2837f9
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 22:51:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9422cdbf
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 23:10:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b395fb93
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 23:10:51 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id w65so546651oia.7
 for <wireguard@lists.zx2c4.com>; Fri, 22 Sep 2017 16:19:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170922144522.GA29432@gmail.com>
References: <20170921192148.GB2587@gmail.com>
 <CAHmME9qPeMve8rRUNCsMpwHxgbXwomj2TCC_5CFKQoA+q0c3eQ@mail.gmail.com>
 <20170922144522.GA29432@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 23 Sep 2017 01:19:19 +0200
Message-ID: <CAHmME9pxswLnKBNdz6UsXT5+jxU7H6oQJEHaHKN5Ud51OrU-Fw@mail.gmail.com>
Subject: Re: 2-factor auth options
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Sep 22, 2017 at 4:45 PM, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>  The upside is that it would make sure we
> don't have 2-factor stuff happening via a separate (potentially weaker)
> crypto channel than the rest of the session,

That's not actually the case. If a normal IP packet goes through
wireguard, if it a) comes from a wireguard interface (wg0), and b) is
from a particular IP address, then it will be unforgeably bound to the
peer public key that has that IP listed in his allowed-ips. There's a
strong binding here, in otherwords, between src IPs of packets within
a wireguard interface and the actual identity.

This means...

> On Fri, Sep 22, 2017 at 12:52:43AM +0200, Jason A. Donenfeld wrote:
> It may be the easiest and, with a web frontend, would allow doing something
> like U2F (bonus!), but it'll probably be fairly
> unpopular because it would require a wholly disconnected step before
> establishing a connection.

This means that you actually wouldn't even need to do it with a
webpage. You could add this as a step that just uses tcp via ncat in a
simple script to send the challenge. That's the kind of thing you
could even add as a PostUp section in a wg-quick(8) configuration, so
that immediately after starting up the tunnel, the OTP script runs
that prompts the user for their 2FA, ncats it to a trivial little
daemon on the server, that then validates the pin and adjusts the
firewall (or more trivially, adds an entry to an ipset object).

There are a lot of very easy ways to structure this. I think next week
I'll try to put together a little OTP example for the contrib/
directory. Do you have a favorite OTP command line challenge response
tool I should use for this?

> For example,
> establishing an initial connection would satisfy one set of permitted IP
> routing, but performing some API action would apply additional rules. It
> would be hard to do this in a non-kludgy way, though.

I actually think this wouldn't be too difficult to accomplish.
Live-changing IP address ACLs usually isn't too difficult. If you're
really into it, you can even do this all with `ip-rule` instead of
iptables/ipset.

> I don't have concrete plans at this time, but we do use openvpn for
> admin-level access (that requires 2-factor auth), and I was looking for
> feature parity to see if we should eventually plan to switch.

Cool. You should certainly plan to switch. We'll make this happen.

Jason
