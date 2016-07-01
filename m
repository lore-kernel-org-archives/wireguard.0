Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88d8ec88
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2016 21:08:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99482e55
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2016 21:08:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1b3877fb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2016 21:08:29 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id h129so84735134lfh.1
 for <wireguard@lists.zx2c4.com>; Fri, 01 Jul 2016 14:11:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pZ1oQKk5=cTMxP8mBperNE0t-dCanepU8PKDvU-ak2bw@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <87furu3ej3.fsf@alice.fifthhorseman.net>
 <87shvtz50f.fsf@alice.fifthhorseman.net>
 <CAHmME9pZ1oQKk5=cTMxP8mBperNE0t-dCanepU8PKDvU-ak2bw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 1 Jul 2016 23:11:26 +0200
Message-ID: <CAHmME9r1ru8LHLGYfPsax65J9-_+FFuqwDDi3c9fRsmR2KFCfw@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
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

> drwxr-xr-x root/root         0 2016-07-01 16:32 ./usr/share/doc/wireguard-tools/examples/client-server-example/
> -rwxr-xr-x root/root      1015 2016-07-01 16:32 ./usr/share/doc/wireguard-tools/examples/client-server-example/client.sh
> -rwxr-xr-x root/root       779 2016-06-28 16:32 ./usr/share/doc/wireguard-tools/examples/client-server-example/server.sh
> drwxr-xr-x root/root         0 2016-07-01 16:32 ./usr/share/doc/wireguard-tools/examples/stress-testing/
> -rw-r--r-- root/root       580 2016-06-28 16:32 ./usr/share/doc/wireguard-tools/examples/stress-testing/badpacket.c
> -rw-r--r-- root/root      1296 2016-06-28 16:32 ./usr/share/doc/wireguard-tools/examples/stress-testing/peg.c
> -rwxr-xr-x root/root      1013 2016-07-01 16:32 ./usr/share/doc/wireguard-tools/examples/stress-testing/self-send.sh
> -rwxr-xr-x root/root       909 2016-06-28 16:32 ./usr/share/doc/wireguard-tools/examples/stress-testing/threewayiperf.sh
> -rw-r--r-- root/root       541 2016-06-28 16:32 ./usr/share/doc/wireguard-tools/examples/wgserver.service



These are not examples that are worth distributing. wgserver.service
is somewhat useful, but stress-testing/* is definitely NOT
APPROPRIATE, and I probably should remove those from the public repo.
client-server is a parlor trick, but if anybody actually uses them or
anything like them in production, they'll completely undermine the
security of wireguard, so these scripts shouldn't be used either.
They've been nice for my own development, but I definitely don't want
these on people's machines. If you want one example, maybe the
.service file is okay. But please ditch the others.
