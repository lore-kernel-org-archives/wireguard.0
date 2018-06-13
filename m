Return-Path: paul@mjr.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f05525c7
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 14:50:32 +0000 (UTC)
Received: from mjr.org (mjr.org [212.13.216.238])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5690992f
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 14:50:32 +0000 (UTC)
Message-ID: <98f37803e752f4d4f19b9064240f0b876b2db588.camel@mjr.org>
Subject: Re: Kernel lockup with (debian) 4.16.0-2-rt-amd64
From: Paul Hedderly <paul@mjr.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Jun 2018 15:54:24 +0100
In-Reply-To: <CAHmME9okF00z8-9xPU=dm_vOrdf5gv4D+CpWtVXdu2oW+N-7zw@mail.gmail.com>
References: <46bd903565f6b1114b1d9f6bafa7db77bf3b5090.camel@mjr.org>
 <CAHmME9rtHVwfSdy4DDFYmgw06zVerbN8oP88ZZ5ahoJB3PPTFw@mail.gmail.com>
 <CAHmME9qqBFU44wBQ2r3bWk8e7BpGQhY_U6oBg14SJA3Y05aC=A@mail.gmail.com>
 <CAHmME9qW8udKYrcdwgFK6qcabAJ8vDqijek0UcRmFTGTcUdznw@mail.gmail.com>
 <ae8cd01fb2f30682efbae8b2f8b9cd98aaaa9353.camel@mjr.org>
 <CAHmME9qU1OWW72PJ1q1=7pf+EYiPe8vdQX1V2f96Vi6WRmi9Ow@mail.gmail.com>
 <CAHmME9okF00z8-9xPU=dm_vOrdf5gv4D+CpWtVXdu2oW+N-7zw@mail.gmail.com>
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

On Wed, 2018-06-13 at 15:52 +0200, Jason A. Donenfeld wrote:
> Hi Paul,
> 
> I got an -rt kernel up and running, enabled a bunch of nice debugging
> options, and found a handful of problems, all of which were fixed by:
> https://git.zx2c4.com/WireGuard/commit/?id=0f05452d043d8d047cf5d7987f
> c2732b97d676e6
> 
> I realize the solution in that patch is a bit of a bummer, but at the
> very least it keeps things from breaking now. I'll see if I can
> improve it somewhere down the line.

OUch. "So on sane kernels" I guess RT isn't sane then!

Yea that performance hit is a nuisance, although in reality when I
really need RT I wont be doing much over a VPN... so I may have to suck
up to rebooting between kernels for a while. No big deal.

Thanks again - I will test that new patch later.
