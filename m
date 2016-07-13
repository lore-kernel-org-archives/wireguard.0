Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15943b3a
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 21:56:31 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <CAHmME9rF+cYmwEMcrW9DitPSBtQ=NSVbMWvhiBajwV4FtCwRpQ@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9qvbXDENXbTYhcf58FR+1vGQfpABXKNRk04+GFM7dt0YA@mail.gmail.com>
 <871t2zt93w.fsf@alice.fifthhorseman.net>
 <CAHmME9qVThvKJpCiDjYZJTWAU+xiVSXXRpWvxY0Vy+-+_X3hzQ@mail.gmail.com>
 <CAHmME9q2Mv7D-wRLGih0r4JHp+ePLQPpgGV-WEcn6sFu9Ewu0Q@mail.gmail.com>
 <CAHmME9pkr5T3fhrEo6kdLvjU9OmPr8qFLvbxrjmwZgFmvjH00A@mail.gmail.com>
 <CAHmME9qQ=46ZyPLPAw8sDb1bhwWGdEcxoFpof3meV+WUKHrMfg@mail.gmail.com>
 <CAHmME9rF+cYmwEMcrW9DitPSBtQ=NSVbMWvhiBajwV4FtCwRpQ@mail.gmail.com>
Date: Wed, 13 Jul 2016 23:57:24 +0200
Message-ID: <87ziplmcaj.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed 2016-07-13 18:42:57 +0200, Jason A. Donenfeld wrote:
> On Jul 13, 2016 6:35 PM, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>> I did it!
>>
>> $ make test
>>
>> Will now execute src/test.sh.
>
> If it turns out the test phase of the debian package build process isn't
> permitted to do these things, we can always experiment with running this in
> qemu or UML... the tests are entirely self-contained.

this won't be done during the build phase of the package -- the build
phase of the package doesn't even build the kernel module, it just
sets up the dkms package.

However, debian has autopkgtest and https://ci.debian.net/

 https://anonscm.debian.org/git/autopkgtest/autopkgtest.git/tree/doc/README.package-tests.rst

Which i think will allow me to run these tests against all CI-supported
architectures (currently just amd64 and arm64 afaik, but future
expansion of CI would then automatically pull in wireguard).

I'll see if i can get something like this sorted out over the next few
days, and i'll post here if i have any results.

          --dkg
