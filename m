Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebdb4ea1
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 13:49:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee4113c8
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 13:49:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6347aa05
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 13:47:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 11cbf787
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 13:47:53 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id a141-v6so2365171oii.8
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jun 2018 06:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <46bd903565f6b1114b1d9f6bafa7db77bf3b5090.camel@mjr.org>
 <CAHmME9rtHVwfSdy4DDFYmgw06zVerbN8oP88ZZ5ahoJB3PPTFw@mail.gmail.com>
 <CAHmME9qqBFU44wBQ2r3bWk8e7BpGQhY_U6oBg14SJA3Y05aC=A@mail.gmail.com>
 <CAHmME9qW8udKYrcdwgFK6qcabAJ8vDqijek0UcRmFTGTcUdznw@mail.gmail.com>
 <ae8cd01fb2f30682efbae8b2f8b9cd98aaaa9353.camel@mjr.org>
 <CAHmME9qU1OWW72PJ1q1=7pf+EYiPe8vdQX1V2f96Vi6WRmi9Ow@mail.gmail.com>
In-Reply-To: <CAHmME9qU1OWW72PJ1q1=7pf+EYiPe8vdQX1V2f96Vi6WRmi9Ow@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Jun 2018 15:52:47 +0200
Message-ID: <CAHmME9okF00z8-9xPU=dm_vOrdf5gv4D+CpWtVXdu2oW+N-7zw@mail.gmail.com>
Subject: Re: Kernel lockup with (debian) 4.16.0-2-rt-amd64
To: paul@mjr.org
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Paul,

I got an -rt kernel up and running, enabled a bunch of nice debugging
options, and found a handful of problems, all of which were fixed by:
https://git.zx2c4.com/WireGuard/commit/?id=0f05452d043d8d047cf5d7987fc2732b97d676e6

I realize the solution in that patch is a bit of a bummer, but at the
very least it keeps things from breaking now. I'll see if I can
improve it somewhere down the line.

Jason
