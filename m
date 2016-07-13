Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef5ef329
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 17:57:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a3da148
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 17:57:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 920e811a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 17:57:20 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id f93so45107351lfi.2
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jul 2016 10:58:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160713164946.GA25457@lud.polynome.dn42>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9qvbXDENXbTYhcf58FR+1vGQfpABXKNRk04+GFM7dt0YA@mail.gmail.com>
 <871t2zt93w.fsf@alice.fifthhorseman.net>
 <CAHmME9qVThvKJpCiDjYZJTWAU+xiVSXXRpWvxY0Vy+-+_X3hzQ@mail.gmail.com>
 <CAHmME9q2Mv7D-wRLGih0r4JHp+ePLQPpgGV-WEcn6sFu9Ewu0Q@mail.gmail.com>
 <CAHmME9pkr5T3fhrEo6kdLvjU9OmPr8qFLvbxrjmwZgFmvjH00A@mail.gmail.com>
 <CAHmME9qQ=46ZyPLPAw8sDb1bhwWGdEcxoFpof3meV+WUKHrMfg@mail.gmail.com>
 <CAHmME9rF+cYmwEMcrW9DitPSBtQ=NSVbMWvhiBajwV4FtCwRpQ@mail.gmail.com>
 <20160713164946.GA25457@lud.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Jul 2016 19:58:15 +0200
Message-ID: <CAHmME9orx34N=seD9TYihaMWSw72m+17D9S-mVir3x126jWWmQ@mail.gmail.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Christian Hesse <mail@eworm.de>, zorun@bitsofnetworks.org
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Jul 13, 2016 at 6:49 PM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
>
> Good point: since the test must be run as root, I anticipate this will be
> annoying for packagers: builds are performed as simple user, with no sudo
> access (and obviously no *passwordless* sudo access).  At least that's how
> it works for Arch and OpenWRT.

Right, this won't work for Arch and OpenWRT. I have a suspicion it'll
be fine in Debian, though... But waiting on Daniel to say whether or
not.

Once we get this working reliably there, I'll see if I can cobble
together some UML or qemu automation for the other platforms.
