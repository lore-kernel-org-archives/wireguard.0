Return-Path: reuben.m.work@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 974577fd
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 May 2018 23:02:37 +0000 (UTC)
Received: from mail-io0-x232.google.com (mail-io0-x232.google.com
 [IPv6:2607:f8b0:4001:c06::232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a209bab
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 May 2018 23:02:37 +0000 (UTC)
Received: by mail-io0-x232.google.com with SMTP id t23-v6so11084386ioc.10
 for <wireguard@lists.zx2c4.com>; Sat, 12 May 2018 16:05:39 -0700 (PDT)
Return-Path: <reuben.m.work@gmail.com>
Received: from subterfuge.localnet ([2605:a601:93b:400:6e62:6dff:fe57:a551])
 by smtp.gmail.com with ESMTPSA id w12-v6sm3044006iog.53.2018.05.12.16.05.38
 for <wireguard@lists.zx2c4.com>
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 12 May 2018 16:05:38 -0700 (PDT)
From: Reuben Martin <reuben.m.work@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Need for HW-clock independent timestamps
Date: Sat, 12 May 2018 18:05:37 -0500
Message-ID: <2012819.dV4fgoeI0M@subterfuge>
In-Reply-To: <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Saturday, May 12, 2018 2:29:24 PM CDT Axel Neumann wrote:
> Thanks a lot for your replies. But as you can see from my comments below
> this all does not look like a valid option for many embedded use cases.

Perhaps it might make sense to add functionality for WG to request a timest=
amp=20
from peers and to reply to TS requests so long as they are signed with a va=
lid=20
key.

Implementing the WG side of a TS exchange would probably be fairly trivial,=
=20
but I don=E2=80=99t know what is involved to take the received timestamp an=
d use that=20
to set the system clock. That part might present a whole can of worms that=
=20
Jason may not want to deal with.

=2DReuben
