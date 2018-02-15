Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a42227bd
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Feb 2018 14:00:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab1b689a
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Feb 2018 14:00:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06e27f22
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Feb 2018 13:52:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id da7419b6
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Feb 2018 13:52:04 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id l124so6910165oib.0
 for <wireguard@lists.zx2c4.com>; Thu, 15 Feb 2018 06:07:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <cba131ba-cd15-8bf4-cdd1-4d46ad774d41@student.tuwien.ac.at>
References: <7d5325a3-fa07-f67f-a31e-aadd44458d41@student.tuwien.ac.at>
 <CAHmME9qVoBkdu35n4aGdZ8nCH6ONZhcGb=WCGx2LGbyHgJMTSw@mail.gmail.com>
 <CAFi5oX6LM+A=jbPmhffc4wT+pKmMg8xi=2ebSMg=s7Qg2AY_sw@mail.gmail.com>
 <cba131ba-cd15-8bf4-cdd1-4d46ad774d41@student.tuwien.ac.at>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 15 Feb 2018 15:07:54 +0100
Message-ID: <CAHmME9rZU8y8mjHhHkVJ9foRW8Wuk5QMoijMfVU=_4LHfg7F-w@mail.gmail.com>
Subject: Re: NetworkManager Plugin
To: Maximilian Moser <e1326252@student.tuwien.ac.at>
Content-Type: text/plain; charset="UTF-8"
Cc: Jordan DeBeer <debee1jp@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Max,

On Thu, Feb 15, 2018 at 1:34 AM, Maximilian Moser
<e1326252@student.tuwien.ac.at> wrote:
> I actually just wanted to get this thesis over with and thought, why not
> post the result to the mailing list
> I'll probably focus more on the written part of the
> thesis, so fixing the issues will probably have to wait a while on my part.

I'm certainly not interested in "throw it over the fence" coding. I'm
happy to work with you on "the acceptance and the possible prospect of
this thing getting packaged for distros," as you wrote, but only if
you're actually committed to maintaining it. It sounds to me like this
is something in your mind that is "over with"? That's disapointing.

> Regarding the issues... About some of them, I did know in one way or the
> other.
> So I'm somewhat excited about the acceptance and the possible prospect of
> this thing getting packaged for distros :D

As I wrote earlier, this is going to require a lot of work to actually
bring to fruition. The first priority should be entirely dispensing
with the use of wg-quick. In order to aid these efforts, I spent some
time writing a mini single-file-c library that you can drop into your
project as a means for talking to the kernel and configuring devices
directly:

https://git.zx2c4.com/WireGuard/tree/contrib/examples/embeddable-wg-library/README

Should be pretty straight-forward to integrate. You'll basically only
need to use the "wg_set_device" function, and perhaps the
"wg_key_from_base64" function too.

Jason
