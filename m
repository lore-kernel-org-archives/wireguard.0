Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca0c92d4
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 01:26:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e642af1
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 01:26:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7582fdd1
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 01:10:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 51cbe7b9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Sep 2018 01:10:38 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id t68-v6so24264226oie.12
 for <wireguard@lists.zx2c4.com>; Thu, 06 Sep 2018 18:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAHijbEWf1S0Tc+zxZBvmJ0xe5iBU00pOxikejetF8x33Qh=GcQ@mail.gmail.com>
In-Reply-To: <CAHijbEWf1S0Tc+zxZBvmJ0xe5iBU00pOxikejetF8x33Qh=GcQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Sep 2018 19:26:33 -0600
Message-ID: <CAHmME9rB71UbcY-kLkJO0yOVQ-s31E_S9yCKdZTh6F9-PScN5A@mail.gmail.com>
Subject: Re: Setting the transit namespace at runtime
To: ju.orth@gmail.com
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

Hi Julian,

I'd thought of this early on, but failed to come up with what seemed
like an actually realistic use case for it.

On Thu, Sep 6, 2018 at 10:15 AM Julian Orth <ju.orth@gmail.com> wrote:
> * If multiple processes are creating Wireguard devices at the same time, then
>   their device namespaces are isolated as long as each process uses its own
>   network namespace. This means that there is no problem if two processes try
>   to create the `wg0` device at the same time.

The typical solution for this is to create "wg%d":

zx2c4@thinkpad ~ $ ip link add wg%d type wireguard
zx2c4@thinkpad ~ $ ip link add wg%d type wireguard
zx2c4@thinkpad ~ $ ip link add wg%d type wireguard
zx2c4@thinkpad ~ $ ip link add wg%d type wireguard
zx2c4@thinkpad ~ $ ip link add wg%d type wireguard
zx2c4@thinkpad ~ $ ip link show | grep wg
47: wg0: <POINTOPOINT,NOARP> mtu 1420 qdisc noop state DOWN mode
DEFAULT group default qlen 1000
48: wg1: <POINTOPOINT,NOARP> mtu 1420 qdisc noop state DOWN mode
DEFAULT group default qlen 1000
49: wg2: <POINTOPOINT,NOARP> mtu 1420 qdisc noop state DOWN mode
DEFAULT group default qlen 1000
50: wg3: <POINTOPOINT,NOARP> mtu 1420 qdisc noop state DOWN mode
DEFAULT group default qlen 1000
51: wg4: <POINTOPOINT,NOARP> mtu 1420 qdisc noop state DOWN mode
DEFAULT group default qlen 1000

Or you just use a try-loop, incrementing until there are no races with
another process who has already claimed it.

Alternatively if you just generate a random byte sequence that's also
a valid interface name, you get around 119.5 bits of randomness, which
makes the possibility of collision for this use case sufficiently
unlikely. (A random UUID only has 122 bits of randomness, for
comparison.)

> * The intention is for the `wg0` device to be used only within the `vpn`
>   namespace. It does not feel clean that the device has to live in the init
>   namespace for an arbitrarily short but non-zero amount of time. This also
>   leaks the existence of the `wg0` device to all processes living in the init
>   namespace.

I wonder what happens with that "leak" that you're concerned with. It
doesn't have to be configured with any information like ip addresses
or routes, and the original name can be entirely different from the
final name used.

Jason
