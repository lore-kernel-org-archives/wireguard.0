Return-Path: s.gottschall@dd-wrt.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47ea952c
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 11:16:17 +0000 (UTC)
Received: from webmail.newmedia-net.de (smtps.newmedia-net.de [185.84.6.167])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ea24bc8
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 11:16:17 +0000 (UTC)
Subject: Re: Tunsafe Windows client for wireguard (not opensource yet they say
To: wireguard@lists.zx2c4.com
References: <41222FCF-F9F5-4FEC-AA71-73C48F4DA4BA@gmail.com>
 <CAHmME9r95cjSXK8YitGuHxFp0EfrMKhQEGXL5Ux=rMXLt=U5FA@mail.gmail.com>
 <1520248764.27019.10.camel@infradead.org>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <f3cdde24-e1f3-a3d2-e5eb-f5e285313d66@dd-wrt.com>
Date: Mon, 5 Mar 2018 12:25:29 +0100
MIME-Version: 1.0
In-Reply-To: <1520248764.27019.10.camel@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

google chrome warns if you try to download tunsafe. its potentially 
unsafe. :-)

Am 05.03.2018 um 12:19 schrieb David Woodhouse:
> On Mon, 2018-03-05 at 10:19 +0100, Jason A. Donenfeld wrote:
>> One aspect of the WireGuard project is that we're taking development
>> very carefully and slowly, not jumping to premature releases, and
>> really studying every bit of what we produce in order to ship the
>> least-vulnerable and most-correct code we possibly can. We're still
>> shipping code -- it's not an approach that results in a complete
>> standstill -- but it does mean that in these intervening periods,
>> there will be propheteers and cowboys coming out of the woodwork to
>> fill the void.
> I wasn't sure whether to suggest this before, but adding Wireguard
> support to OpenConnect ought to be fairly easy. We already support
> three VPN protocols, so we have a *relatively* sane distinction between
> the protocol-specific parts, and all the OS-specific tun device
> handling and other bits that would just be gratuitous wheel-reinvention
> for you.
>
> It basically gives you support for Windows, Solaris, OSX, Android and
> various BSDs for nothing. With NetworkManager support.
>
> For a client that *isn't* purely wrapping the kernel implementation, it
> probably makes sense rather starting from scratch. If anyone's
> interested in working on it, I'd be happy to give some pointers.
>
> (I've also looked in the past at adding kernel support too, for DTLS
> acceleration; I may take a look at that again.)
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


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
