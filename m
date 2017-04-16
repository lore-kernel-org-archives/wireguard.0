Return-Path: egbert@eggiecode.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93585397
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Apr 2017 15:56:53 +0000 (UTC)
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24481aa9
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Apr 2017 15:56:53 +0000 (UTC)
Message-ID: <1492358650.1445.11.camel@eggiecode.org>
Subject: Re: wireguard-tools Ubuntu package missing the binaries
From: Egbert Verhage <egbert@eggiecode.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 16 Apr 2017 18:04:10 +0200
In-Reply-To: <CAHmME9pc6jFnb5NMYt=yi+voWjsg4dS=NC+X1tY2qY4xbo1oVA@mail.gmail.com>
References: <b36d8e7f-e2a4-379b-1c02-6269766288d4@gmail.com>
 <b58aaa20-6b03-5501-3cad-f791cfd2319a@york.ac.uk>
 <1492357636.1445.6.camel@eggiecode.org>
 <CAHmME9pc6jFnb5NMYt=yi+voWjsg4dS=NC+X1tY2qY4xbo1oVA@mail.gmail.com>
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

To clarify my message.

Going to fix/test the package on arm and i386 with hda.
Then will update my PI to ubuntu 17.04 to add that to the package.

Greetz,
Egbert

On Sun, 2017-04-16 at 17:50 +0200, Jason A. Donenfeld wrote:
> I did not comprehend your message. Is the problem fixed and are
> packages that actually work available now on Launchpad?
> 
On Sun, 2017-04-16 at 17:47 +0200, Egbert Verhage wrote:
> 
> This problem got previously with my RaspPi. That tools binaries build
> are not in de build of armv6 and think that is the same with i386.
> 
> This was a old item in the mailing list about arm packages in ubuntu
> repo: https://lists.zx2c4.com/pipermail/wireguard/2017-February/00105
> 0.
> html
> Coud not figer out what the problem was.
> 
> And a great time to add ubuntu 17.04 (zesty) and test it on my pi.
> 
> hda (cryptofuture) is testing it now on his own ppa, see here the
> github issue: https://github.com/EggieCode/wireguard-ppa/issues/13
> and
> the fix https://github.com/EggieCode/wireguard-ppa/pull/14
