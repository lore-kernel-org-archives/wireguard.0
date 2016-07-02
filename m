Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41afaed3
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 12:35:43 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <CAHmME9r1ru8LHLGYfPsax65J9-_+FFuqwDDi3c9fRsmR2KFCfw@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <87furu3ej3.fsf@alice.fifthhorseman.net>
 <87shvtz50f.fsf@alice.fifthhorseman.net>
 <CAHmME9pZ1oQKk5=cTMxP8mBperNE0t-dCanepU8PKDvU-ak2bw@mail.gmail.com>
 <CAHmME9r1ru8LHLGYfPsax65J9-_+FFuqwDDi3c9fRsmR2KFCfw@mail.gmail.com>
Date: Sat, 02 Jul 2016 08:38:43 -0400
Message-ID: <87h9c8z030.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, zorun@bitsofnetworks.org
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

On Fri 2016-07-01 17:11:26 -0400, Jason A. Donenfeld wrote:
>> drwxr-xr-x root/root         0 2016-07-01 16:32 ./usr/share/doc/wireguard-tools/examples/client-server-example/
>> -rwxr-xr-x root/root      1015 2016-07-01 16:32 ./usr/share/doc/wireguard-tools/examples/client-server-example/client.sh
>> -rwxr-xr-x root/root       779 2016-06-28 16:32 ./usr/share/doc/wireguard-tools/examples/client-server-example/server.sh
>> drwxr-xr-x root/root         0 2016-07-01 16:32 ./usr/share/doc/wireguard-tools/examples/stress-testing/
>> -rw-r--r-- root/root       580 2016-06-28 16:32 ./usr/share/doc/wireguard-tools/examples/stress-testing/badpacket.c
>> -rw-r--r-- root/root      1296 2016-06-28 16:32 ./usr/share/doc/wireguard-tools/examples/stress-testing/peg.c
>> -rwxr-xr-x root/root      1013 2016-07-01 16:32 ./usr/share/doc/wireguard-tools/examples/stress-testing/self-send.sh
>> -rwxr-xr-x root/root       909 2016-06-28 16:32 ./usr/share/doc/wireguard-tools/examples/stress-testing/threewayiperf.sh
>> -rw-r--r-- root/root       541 2016-06-28 16:32 ./usr/share/doc/wireguard-tools/examples/wgserver.service
>
> These are not examples that are worth distributing. wgserver.service
> is somewhat useful, but stress-testing/* is definitely NOT
> APPROPRIATE, and I probably should remove those from the public repo.
> client-server is a parlor trick, but if anybody actually uses them or
> anything like them in production, they'll completely undermine the
> security of wireguard, so these scripts shouldn't be used either.
> They've been nice for my own development, but I definitely don't want
> these on people's machines. If you want one example, maybe the
> .service file is okay. But please ditch the others.

I was distributing them as part of the experimental package to encourage
people to experiment with the tool.  I thought maybe it'd be useful to
get stress-testing reports from (for example) people running powerpc64
platforms or whatever.  The "parlor trick" is quite neat: clearly not
secure, but a nice quick way for people to be able to say "hey, this
things works on my platform" without needing to set up two ends of a
tunnel themselves.

i'm fine with removing them though, if you don't want them distributed.
They'll be gone in the next revision.

        --dkg
