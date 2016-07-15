Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f18e0dc
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 12:11:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cedea041
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 12:11:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a31bb6bb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 12:11:05 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id l69so30086566lfg.1
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jul 2016 05:12:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87inw9q5d1.fsf@alice.fifthhorseman.net>
References: <20160712231438.GF5136@gradx.cs.jhu.edu>
 <CAHmME9qvXU0GDfjT+4PrvPK3XTUU7LFz8S0b_n_XtJw3wrT7Dw@mail.gmail.com>
 <87inw9q5d1.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 15 Jul 2016 14:12:13 +0200
Message-ID: <CAHmME9qqZoyOqmPW=g_Lnp7R0-X_9q4+nXpUwoKKrS6UXxDDmQ@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: Nathaniel W Filardo <nwf@cs.jhu.edu>, NIIBE Yutaka <gniibe@fsij.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard key lifetime / keys in smartcard?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Daniel,

Thanks for the pointer.

Gniibe -- pleased to meet you. What's programming these things like?
How much effort do you suppose it would take me to produce a very
stripped-down firmware for one of these that has these simple USB
operations:

- load key from host input
- multiply loaded key by host input
- erase key

What's the X25519 implementation in general like? Any architecture
specific tricks required to avoid sidechannel attacks and such?

Regards,
Jason

On Wed, Jul 13, 2016 at 11:01 AM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> On Wed 2016-07-13 10:21:43 +0200, Jason A. Donenfeld wrote:
>> The kernel's crypto API has all sorts of async methods of getting
>> things done, and I'm pretty sure this was built with smartcards and
>> HSMs in mind. In our case, we wouldn't be asking for a signature but
>> rather an X25519 multiplication from the device. I assume there's some
>> ugly code out there for javacard, but I'm not sure if there's any real
>> HSM for 25519. Something to look into... Using hardware to prevent key
>> heists strikes me as generally the most robust solution.
>
> it's not labeled officially an "HSM", but Gnuk is a USB hardware token
> capable of X25519 and guarded storage of secret key material:
>
>   http://www.fsij.org/doc-gnuk/
>   https://anonscm.debian.org/git/gnuk/gnuk/gnuk.git/tree/README
>   https://lists.alioth.debian.org/mailman/listinfo/gnuk-users
>
> It has an open hardware design (the small FST-01 [0]) and also targets
> the low-cost Olimex STM32-H103 [1].  It has a fully-free software stack
> for those who might want to hack it to be more wireguard-friendly.
>
> Access to the gnuk is usually routed through GnuPG, but it's clearly not
> limited to that.
>
> The author, Gniibe (cc'ed here), is helpful and responsive.  I'm sure if
> anyone tried to get the gnuk working with wireguard he would be happy to
> give pointers.
>
>     --dkg
>
> [0] http://www.seeedstudio.com/wiki/FST-01
>     https://shop.fsf.org/storage-devices/neug-usb-true-random-number-generator
>     https://www.seeedstudio.com/item_detail.html?p_id=1277
>     https://www.seeedstudio.com/item_detail.html?p_id=1276
>
> [1] https://www.olimex.com/Products/ARM/ST/STM32-H103/
