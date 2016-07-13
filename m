Return-Path: mardnh@gmx.de
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 286bc518
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 18:14:15 +0000 (UTC)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Baptiste Jonglez <baptiste@bitsofnetworks.org>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9qvbXDENXbTYhcf58FR+1vGQfpABXKNRk04+GFM7dt0YA@mail.gmail.com>
 <871t2zt93w.fsf@alice.fifthhorseman.net>
 <CAHmME9qVThvKJpCiDjYZJTWAU+xiVSXXRpWvxY0Vy+-+_X3hzQ@mail.gmail.com>
 <CAHmME9q2Mv7D-wRLGih0r4JHp+ePLQPpgGV-WEcn6sFu9Ewu0Q@mail.gmail.com>
 <CAHmME9pkr5T3fhrEo6kdLvjU9OmPr8qFLvbxrjmwZgFmvjH00A@mail.gmail.com>
 <CAHmME9qQ=46ZyPLPAw8sDb1bhwWGdEcxoFpof3meV+WUKHrMfg@mail.gmail.com>
 <CAHmME9rF+cYmwEMcrW9DitPSBtQ=NSVbMWvhiBajwV4FtCwRpQ@mail.gmail.com>
 <20160713164946.GA25457@lud.polynome.dn42>
 <CAHmME9orx34N=seD9TYihaMWSw72m+17D9S-mVir3x126jWWmQ@mail.gmail.com>
From: Martin Hauke <mardnh@gmx.de>
Message-ID: <de39b5c8-a660-3a74-fb54-72aa18259331@gmx.de>
Date: Wed, 13 Jul 2016 20:15:03 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9orx34N=seD9TYihaMWSw72m+17D9S-mVir3x126jWWmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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

Am 13.07.2016 um 19:58 schrieb Jason A. Donenfeld:
> On Wed, Jul 13, 2016 at 6:49 PM, Baptiste Jonglez
> <baptiste@bitsofnetworks.org> wrote:
>>
>> Good point: since the test must be run as root, I anticipate this will be
>> annoying for packagers: builds are performed as simple user, with no sudo
>> access (and obviously no *passwordless* sudo access).  At least that's how
>> it works for Arch and OpenWRT.
> 
> Right, this won't work for Arch and OpenWRT. I have a suspicion it'll
> be fine in Debian, though... But waiting on Daniel to say whether or
> not.
> 
> Once we get this working reliably there, I'll see if I can cobble
> together some UML or qemu automation for the other platforms.

It also won't work on the openSUSE Build Service.
All packages on OBS are built with a simple and restricted user.
