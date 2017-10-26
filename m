Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f0ef1ba
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 00:54:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e17443c6
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 00:54:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b345bfe
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 00:54:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 78761060
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 00:54:11 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id h200so3067023oib.4
 for <wireguard@lists.zx2c4.com>; Wed, 25 Oct 2017 17:55:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKXLc7fv-d2sswAUcVA7n2oedgZZfdqO1WmQxi=yvzu6rQB9mQ@mail.gmail.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <CAKXLc7fv-d2sswAUcVA7n2oedgZZfdqO1WmQxi=yvzu6rQB9mQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Oct 2017 02:55:49 +0200
Message-ID: <CAHmME9pdCnrfWBymOvhkff8coFn28jPAx6-Ss8yAPgVMKTDiyQ@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
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

On Thu, Oct 26, 2017 at 1:37 AM, Kalin KOZHUHAROV <me.kalin@gmail.com> wrote:
> And can you briefly remind me why do you need to bother with the
> resolv settings?
> May be this is only valid for "use-only-VPN", e.g. laptop in China?

Sometimes people use a VPN to access an intranet with its own naming
scheme. For example, when you're at my house, if you do a DNS lookup
for "thinkpad", you get my laptop. When I wireguard in from the road,
sometimes I'll do things like `ssh odroid`, which uses my home
resolver to get the home IP of my odroid. This is possible because I
have `DNS = 10.0.0.8` or whatever in my wireguard config file.

> * See if there is another mount, before doing it, i.e. check for the
> hatchet before using it?

I guess the idea here is that since unmounting can only be done in
reverse order, yet removing interfaces can be done in any order,
allowing multiply-stacked resolv.conf mounts would fail to unwind in
the correct way. That makes sense.

Fortunately, by calling `unlink(2)` on the file after I bind mount it,
subsequent bind mounts on top fail to work, because they can't resolve
that dentry any more. The underlying reasoning behind that is caught
up in the insane fs/namespace.c voodoo magic that probably only Al
Viro understands.

> * Not sure anyone will hit the corner case of needing to umount /etc
> while wireguard is running, but who knows.

That's a good point.

Another potential snag:

- If other daemons try to update the old file while it's being mounted
over, it won't be able to be updated, so when the user finally
unmounts when removing the wireguard interface, the resolv.conf could
be stale. Probably this isn't a real concern, but it is a possibility.
