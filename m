Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 207cdb30
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 01:53:10 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ff479ff
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 01:53:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6951b54f
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 01:53:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3151978a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 01:53:09 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id n82so3219552oig.3
 for <wireguard@lists.zx2c4.com>; Wed, 25 Oct 2017 18:54:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKXLc7fhJR8X6P6xDCuANkA+6wT2nkprg6ODdudwKmSH+zHd5g@mail.gmail.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <20171026013240.13503-1-Jason@zx2c4.com>
 <CAKXLc7fhJR8X6P6xDCuANkA+6wT2nkprg6ODdudwKmSH+zHd5g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Oct 2017 03:54:48 +0200
Message-ID: <CAHmME9q7nnj0xNQo=6Cnhyq+YRyMua=JMeXFr94NdD86DW0ZRw@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: use bind mount for DNS when no openresolv
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
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

On Thu, Oct 26, 2017 at 3:53 AM, Kalin KOZHUHAROV <me.kalin@gmail.com> wrote:
> Just nitpicking on your spellchecker...

Thanks!
