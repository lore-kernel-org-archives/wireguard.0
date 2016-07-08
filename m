Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48f2a025
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 21:20:15 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <CAHmME9q=QKAGo3MBeMXcT_FWRUG3O=qsmTJSeX7UB7Z_gfMO9A@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <87furu3ej3.fsf@alice.fifthhorseman.net>
 <87shvtz50f.fsf@alice.fifthhorseman.net>
 <CAHmME9q=QKAGo3MBeMXcT_FWRUG3O=qsmTJSeX7UB7Z_gfMO9A@mail.gmail.com>
Date: Fri, 08 Jul 2016 23:20:36 +0200
Message-ID: <87shvjvnbv.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] debian packaging [was: Re: The Distro Package
	Maintainers Thread]
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu 2016-07-07 00:34:50 +0200, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> There's this page here:
> https://www.wireguard.io/install/#option-b-compiling-from-source
>
> In the "Option B)" section, what command line would you like me to
> specify for Debian?

something like this should work fine:

    # apt install pkg-config libmnl-dev build-essential linux-headers-$(uname -r)

Or, if they have the experimental apt repo installed they should just be
able to do:

    # apt-get build-dep wireguard


hth,

        --dkg
