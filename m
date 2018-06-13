Return-Path: paul@mjr.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4f73ff8
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 14:46:07 +0000 (UTC)
Received: from mjr.org (mjr.org [212.13.216.238])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 260f9c32
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 14:46:07 +0000 (UTC)
Message-ID: <5d04738274fea550f9311a8a4b5487334fa04340.camel@mjr.org>
Subject: Re: Kernel lockup with (debian) 4.16.0-2-rt-amd64
From: Paul Hedderly <paul@mjr.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Jun 2018 15:49:59 +0100
In-Reply-To: <CAHmME9qU1OWW72PJ1q1=7pf+EYiPe8vdQX1V2f96Vi6WRmi9Ow@mail.gmail.com>
References: <46bd903565f6b1114b1d9f6bafa7db77bf3b5090.camel@mjr.org>
 <CAHmME9rtHVwfSdy4DDFYmgw06zVerbN8oP88ZZ5ahoJB3PPTFw@mail.gmail.com>
 <CAHmME9qqBFU44wBQ2r3bWk8e7BpGQhY_U6oBg14SJA3Y05aC=A@mail.gmail.com>
 <CAHmME9qW8udKYrcdwgFK6qcabAJ8vDqijek0UcRmFTGTcUdznw@mail.gmail.com>
 <ae8cd01fb2f30682efbae8b2f8b9cd98aaaa9353.camel@mjr.org>
 <CAHmME9qU1OWW72PJ1q1=7pf+EYiPe8vdQX1V2f96Vi6WRmi9Ow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, 2018-06-13 at 14:13 +0200, Jason A. Donenfeld wrote:
> Hi Paul,
> 
> > But although the machine froze I dont see the BUG's in the kernel
> > log.
> 
> Alright, so this means I've determined the root cause of the BUGs you
> were seeing before, and both the patch you applied and hopefully the
> one I committed should take care of that. However, this lockup...
> 
> > Last night I recompiled with your first patch and left the machine
> > running - this morning it was frozen again :(
> > So honestly I'm wondering if that freezing is just a coincidence
> > with
> > the bug you found since I didnt see a BUG... However I could run
> > the
> > non-rt kernel for 13 days without freeze but cant run the -rt-
> > kernel
> > without freezing for more than a few hours. Do you think think the
> > bug
> > could cause that?
> 
> Does the freeze happen _without_ WireGuard? Or does it only happen
> when using WireGuard?
> 
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

I will test that also (as well as the new patch) - havent not run
wireguard for a while... :)

Thanks 
