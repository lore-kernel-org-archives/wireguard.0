Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9258390b
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Jul 2016 14:26:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57290412
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Jul 2016 14:26:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6a962935
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Jul 2016 14:26:55 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id b199so65550953lfe.0
 for <wireguard@lists.zx2c4.com>; Thu, 14 Jul 2016 07:27:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87ziplmcaj.fsf@alice.fifthhorseman.net>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9qvbXDENXbTYhcf58FR+1vGQfpABXKNRk04+GFM7dt0YA@mail.gmail.com>
 <871t2zt93w.fsf@alice.fifthhorseman.net>
 <CAHmME9qVThvKJpCiDjYZJTWAU+xiVSXXRpWvxY0Vy+-+_X3hzQ@mail.gmail.com>
 <CAHmME9q2Mv7D-wRLGih0r4JHp+ePLQPpgGV-WEcn6sFu9Ewu0Q@mail.gmail.com>
 <CAHmME9pkr5T3fhrEo6kdLvjU9OmPr8qFLvbxrjmwZgFmvjH00A@mail.gmail.com>
 <CAHmME9qQ=46ZyPLPAw8sDb1bhwWGdEcxoFpof3meV+WUKHrMfg@mail.gmail.com>
 <CAHmME9rF+cYmwEMcrW9DitPSBtQ=NSVbMWvhiBajwV4FtCwRpQ@mail.gmail.com>
 <87ziplmcaj.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 14 Jul 2016 16:27:50 +0200
Message-ID: <CAHmME9p2b_XqCYSs=Yz7jD6roviA2CaAY+sMBtZgivo-Au8RaA@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: Christian Hesse <mail@eworm.de>, zorun@bitsofnetworks.org,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey,

So I made a disgusting harness that uses QEMU and doesn't require
root. It compiles a kernel and then makes a little testing filesystem
for the VM, pulling down tarballs from random places and compiling
them.

It is arguably one of the grossest scripts I've ever made. But it
works very well. And I'm hoping the mere existence of it will
encourage you guys to send [PATCH]es that make it not as awful.

Here's a video of it in action: https://data.zx2c4.com/wireguard-qemu-test.mp4
And here's the script:
https://git.zx2c4.com/WireGuard/tree/src/tests/qemu.sh and
https://git.zx2c4.com/WireGuard/tree/src/tests/guest-init.sh

Interested to see what becomes of this...

Jason
