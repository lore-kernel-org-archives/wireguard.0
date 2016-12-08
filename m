Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56a6faf1
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 22:14:32 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c37d3ca
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 22:14:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d68e2b25
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 22:14:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e5c6ccd9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 22:14:31 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id g23so23716wme.1
 for <wireguard@lists.zx2c4.com>; Thu, 08 Dec 2016 14:20:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161207.193716.50344961208535056.davem@davemloft.net>
References: <CAHmME9oLgjDA2F0gkFzHU2Es8-XCxQHRABS18OKF0EnZgt1=LQ@mail.gmail.com>
 <20161207.145240.1636297838792223189.davem@davemloft.net>
 <CAHmME9qxz6wcOZuurqahXeY6QSF=zz0gH7gY4RZujLAJPNSWBA@mail.gmail.com>
 <20161207.193716.50344961208535056.davem@davemloft.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 8 Dec 2016 23:20:04 +0100
Message-ID: <CAHmME9qGoPGEFyqe0jBaZD5R51wHTEgAYb9edj+nu9nNPWSYCA@mail.gmail.com>
Subject: Re: Misalignment, MIPS, and ip_hdr(skb)->version
To: David Miller <davem@davemloft.net>
Content-Type: text/plain; charset=UTF-8
Cc: Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-mips@linux-mips.org
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi David,

On Thu, Dec 8, 2016 at 1:37 AM, David Miller <davem@davemloft.net> wrote:
> You really have to land the IP header on a proper 4 byte boundary.
>
> I would suggest pushing 3 dummy garbage bytes of padding at the front
> or the end of your header.

Are you sure 3 bytes to get 4 byte alignment is really the best? I was
thinking that adding 1 byte to get 2 byte alignment might be better,
since it would then ensure that the subsequent TCP header winds up
being 4 byte aligned. Or is this in fact not the desired trade off,
and so I should stick with the 3 bytes you suggested?

Jason
