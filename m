Return-Path: paul@mjr.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c05f173
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Jun 2018 19:45:59 +0000 (UTC)
Received: from mjr.org (mjr.org [212.13.216.238])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6d7fed5
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Jun 2018 19:45:58 +0000 (UTC)
Message-ID: <9d824fde3e070d0d1264a09425a3c4b5cd455560.camel@mjr.org>
Subject: Re: Kernel lockup with (debian) 4.16.0-2-rt-amd64
From: Paul Hedderly <paul@mjr.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 14 Jun 2018 20:49:54 +0100
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

Well just some feedback - I ran overnight on the -rt- kernel with no
wireguard... and it was clean and normal in the morning. Worked for a
couple of hours with and then fired up wireguard compiled from the
above commit - and its been running 10 hours now with no issues
whatsoever. dmesg nice and empty!

So many thanks - I think you nailed that one!

> I realize the solution in that patch is a bit of a bummer, but at the
> very least it keeps things from breaking now. I'll see if I can
> improve it somewhere down the line.

Its great to get a stable system again - brilliant work.

I love wg - and having it on android (user-space only because its a new
unrooted phone :( ) and Ubiquiti and LEDE... I'm sorted!

The GSOC projects are also very exciting prospects... 
