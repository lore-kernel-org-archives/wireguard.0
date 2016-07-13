Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0771cda9
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 16:35:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba65c5db
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 16:35:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1fd287be
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 16:35:06 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id h129so43591179lfh.1
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jul 2016 09:36:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9q2Mv7D-wRLGih0r4JHp+ePLQPpgGV-WEcn6sFu9Ewu0Q@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9qvbXDENXbTYhcf58FR+1vGQfpABXKNRk04+GFM7dt0YA@mail.gmail.com>
 <871t2zt93w.fsf@alice.fifthhorseman.net>
 <CAHmME9qVThvKJpCiDjYZJTWAU+xiVSXXRpWvxY0Vy+-+_X3hzQ@mail.gmail.com>
 <CAHmME9q2Mv7D-wRLGih0r4JHp+ePLQPpgGV-WEcn6sFu9Ewu0Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Jul 2016 18:35:57 +0200
Message-ID: <CAHmME9pkr5T3fhrEo6kdLvjU9OmPr8qFLvbxrjmwZgFmvjH00A@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: zorun@bitsofnetworks.org,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Christian Hesse <mail@eworm.de>
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Jul 13, 2016 at 4:29 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> However, it might be easiest to simply use network namespaces and run all
> this locally. I'm about to take an airplane; I'll create a 'make test' that
> does this. Then you could just incorporate calling that into your build
> system; would that work for you?

I did it!

$ make test

Will now execute src/test.sh.

This script tries several things:

- Module insertion, which, in debug mode, does internal kernel tests
of algorithms.
- ICMP in v4 over v4
- ICMP in v4 over v6
- ICMP in v6 over v4
- ICMP in v6 over v6
- TCP in v4 over v4
- TCP in v4 over v6
- TCP in v6 over v4
- TCP in v6 over v6
- UDP in v4 over v4
- UDP in v4 over v6
- UDP in v6 over v4
- UDP in v6 over v6

It uses network namespaces and seems to work quite well. If the exit
status is 0, tests were successful. It is still quite basic, but will
be gradually expanded over time. I welcome patches for it.

https://git.zx2c4.com/WireGuard/tree/src/test.sh
