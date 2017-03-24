Return-Path: prvs=12561f0b45=sattler@med.uni-frankfurt.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b63e9f3
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Mar 2017 11:32:40 +0000 (UTC)
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
 [141.2.22.233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c4fbc25
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Mar 2017 11:32:40 +0000 (UTC)
Subject: Re: unable to set allowed-ips
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <eb21fbc6-206d-68a6-994f-50dce322b534@med.uni-frankfurt.de>
 <CAHmME9oiBaUets1JUp5SVP41XdPd04zJYuiN24QuqYsUttCqcA@mail.gmail.com>
From: Thomas Sattler <sattler@med.uni-frankfurt.de>
Message-ID: <ca2e540c-670e-650c-1b4b-bae0ab51218c@med.uni-frankfurt.de>
Date: Fri, 24 Mar 2017 12:37:17 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9oiBaUets1JUp5SVP41XdPd04zJYuiN24QuqYsUttCqcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Am 24.03.2017 um 02:15 schrieb Jason A. Donenfeld:
> Be sure userland wg(8) is built from the same source as kernel
> land wireguard module.

I'm not sure whether I understood that comment, but in case I did:
I cloned  https://git.zx2c4.com/WireGuard  and then run these two
commands:

  $ cd /usr/src/WireGuard/src/tools && make

and

  $ cd /usr/src/linux && 
/usr/src/WireGuard/contrib/kernel-tree/create-patch.sh | patch -sp1

The obvious difference seems to be that I used different compilers for
them:

  - sys-devel/gcc-4.9.4 for wg(8) and
  - cross-x86_64-pc-linux-gnu/gcc-4.9.4 for the kernel

Just in case the compiler is not the cause: Maybe my kernel config is
the problem? While I double checked to have everything activated that
was mentioned at https://www.wireguard.io/install (except IPv6 stuff)
there might be some other feature I have unset or set incompatible?

Thomas
