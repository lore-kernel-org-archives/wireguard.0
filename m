Return-Path: s.gottschall@dd-wrt.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81f672f8
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 11:20:40 +0000 (UTC)
Received: from webmail.newmedia-net.de (smtps.newmedia-net.de [185.84.6.167])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db3daf5b
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 11:20:40 +0000 (UTC)
Subject: Re: Tunsafe Windows client for wireguard (not opensource yet they say
To: wireguard@lists.zx2c4.com
References: <41222FCF-F9F5-4FEC-AA71-73C48F4DA4BA@gmail.com>
 <CAHmME9r95cjSXK8YitGuHxFp0EfrMKhQEGXL5Ux=rMXLt=U5FA@mail.gmail.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <9e0354b6-9f31-665c-fee1-db504572ce86@dd-wrt.com>
Date: Mon, 5 Mar 2018 12:29:53 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9r95cjSXK8YitGuHxFp0EfrMKhQEGXL5Ux=rMXLt=U5FA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

nevermind. its just the tap source

Am 05.03.2018 um 10:19 schrieb Jason A. Donenfeld:
> Hi Henrique,
>
> Thanks for posting this.
>
> Please stay away from this software, and generally be wary of
> closed-source WireGuard implementations trying to fill the void. This
> one was written by a community-unfriendly proprietary author, and
> we've got little way of ensuring protocol compliance or basic
> security. Especially from my discussions from him, it's clear what
> he's up to, and this seems like some nastiness. Should I spend my time
> reverse engineering this software and discovering zero-days? Probably
> not a good use of my time, despite my usual love of this sort of
> thing.
>
> One aspect of the WireGuard project is that we're taking development
> very carefully and slowly, not jumping to premature releases, and
> really studying every bit of what we produce in order to ship the
> least-vulnerable and most-correct code we possibly can. We're still
> shipping code -- it's not an approach that results in a complete
> standstill -- but it does mean that in these intervening periods,
> there will be propheteers and cowboys coming out of the woodwork to
> fill the void.
>
> It's quite easy to make a tiny tunneling protocol that's reasonably
> fast and does a few things; if you look on Github there are hundreds.
> It's quite another thing to write robust and secure software intend to
> last for a long time. That's what we're working on here.
>
> Fortunately we have two very nice projects that are rapidly
> approaching maturity: one in Go and one in Rust. I fully welcome
> future OSS authors into the project. When I'm back from visiting
> family at the beginning of April, I think we'll be in a good place to
> have a few first releases.
>
> I'll also do what I can to see that people aren't peddling junk and
> calling it wireguard, so as to reduce user confusion, but this of
> course isn't a very easy endeavor. I'm open to suggestions on how to
> approach this.
>
> Regards,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

-- 
Mit freundlichen Grüssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Stubenwaldallee 21a, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Geschäftsführer: Peter Steinhäuser, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565
