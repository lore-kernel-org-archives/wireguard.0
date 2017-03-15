Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68cf9b82
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Mar 2017 17:00:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3e986fd
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Mar 2017 17:00:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bac0d0ee
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Mar 2017 17:00:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7a365d15
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Mar 2017 17:00:00 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id 19so25903686oti.0
 for <wireguard@lists.zx2c4.com>; Wed, 15 Mar 2017 10:03:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1489596675.18476.2.camel@gmail.com>
References: <80387df1-3237-43a0-adaa-09ffeebbef01@me.com>
 <1489486302.24652.2.camel@gmail.com>
 <CAHmME9oaJA6xTwATpc0q=h9NO_F=ae-NveccSQpw-M4i-cF5Sw@mail.gmail.com>
 <1489596675.18476.2.camel@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 15 Mar 2017 10:03:33 -0700
Message-ID: <CAHmME9oA0b1cB9hx9tnaTUQG+8ADBNJDADnhjmxTpmXtMKtvmQ@mail.gmail.com>
Subject: Re: Rust implementation status
To: Vladimir Matveev <dpx.infinity@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Mar 15, 2017 at 9:51 AM, Vladimir Matveev
<dpx.infinity@gmail.com> wrote:
> anything, I do agree with the goal of making Wireguard implementations
> as slim as possible (i.e. following the guideline on https://www.wiregu
> ard.io/xplatform/). My thoughts in this paragraph were about the
> agree that it is right. I was talking about unofficial implementations
> - I don't believe it is possible to force someone not to create a
> Wireguard implementation with a different interface,

Oh, okay, I understand now. Indeed "non-official" ports become harder
to keep consistent. For that reason, I'm actively soliciting
contributions to the main project organization, so we can work
together to get something unified, so that there aren't ugly
fractures.

> Yes, I do agree with this, and I saw your answer on Github already and
> I'm really glad that you are not against this approach.

Cool.

> I'm very sorry if I said something which made you think so.

It's okay, and no need for apology. I was just wondering what was
happening here.
