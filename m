Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a53effeb
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 12:09:34 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5bd9159d
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 12:09:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16d81e30
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 12:08:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7a94a001
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 12:08:21 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id w13-v6so2656242ote.11
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jun 2018 05:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <46bd903565f6b1114b1d9f6bafa7db77bf3b5090.camel@mjr.org>
 <CAHmME9rtHVwfSdy4DDFYmgw06zVerbN8oP88ZZ5ahoJB3PPTFw@mail.gmail.com>
 <CAHmME9qqBFU44wBQ2r3bWk8e7BpGQhY_U6oBg14SJA3Y05aC=A@mail.gmail.com>
 <CAHmME9qW8udKYrcdwgFK6qcabAJ8vDqijek0UcRmFTGTcUdznw@mail.gmail.com>
 <ae8cd01fb2f30682efbae8b2f8b9cd98aaaa9353.camel@mjr.org>
In-Reply-To: <ae8cd01fb2f30682efbae8b2f8b9cd98aaaa9353.camel@mjr.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Jun 2018 14:13:15 +0200
Message-ID: <CAHmME9qU1OWW72PJ1q1=7pf+EYiPe8vdQX1V2f96Vi6WRmi9Ow@mail.gmail.com>
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

> But although the machine froze I dont see the BUG's in the kernel log.

Alright, so this means I've determined the root cause of the BUGs you
were seeing before, and both the patch you applied and hopefully the
one I committed should take care of that. However, this lockup...

> Last night I recompiled with your first patch and left the machine
> running - this morning it was frozen again :(
> So honestly I'm wondering if that freezing is just a coincidence with
> the bug you found since I didnt see a BUG... However I could run the
> non-rt kernel for 13 days without freeze but cant run the -rt- kernel
> without freezing for more than a few hours. Do you think think the bug
> could cause that?

Does the freeze happen _without_ WireGuard? Or does it only happen
when using WireGuard?

Jason
