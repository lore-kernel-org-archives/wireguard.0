Return-Path: davem@davemloft.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 338da647
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 23:09:22 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [184.105.139.130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 221929c1
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 23:09:22 +0000 (UTC)
Date: Thu, 08 Dec 2016 18:14:53 -0500 (EST)
Message-Id: <20161208.181453.1681964885150767592.davem@davemloft.net>
To: Jason@zx2c4.com
Subject: Re: Misalignment, MIPS, and ip_hdr(skb)->version
From: David Miller <davem@davemloft.net>
In-Reply-To: <CAHmME9qGoPGEFyqe0jBaZD5R51wHTEgAYb9edj+nu9nNPWSYCA@mail.gmail.com>
References: <CAHmME9qxz6wcOZuurqahXeY6QSF=zz0gH7gY4RZujLAJPNSWBA@mail.gmail.com>
 <20161207.193716.50344961208535056.davem@davemloft.net>
 <CAHmME9qGoPGEFyqe0jBaZD5R51wHTEgAYb9edj+nu9nNPWSYCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: netdev@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 8 Dec 2016 23:20:04 +0100

> Hi David,
> 
> On Thu, Dec 8, 2016 at 1:37 AM, David Miller <davem@davemloft.net> wrote:
>> You really have to land the IP header on a proper 4 byte boundary.
>>
>> I would suggest pushing 3 dummy garbage bytes of padding at the front
>> or the end of your header.
> 
> Are you sure 3 bytes to get 4 byte alignment is really the best? I was
> thinking that adding 1 byte to get 2 byte alignment might be better,
> since it would then ensure that the subsequent TCP header winds up
> being 4 byte aligned. Or is this in fact not the desired trade off,
> and so I should stick with the 3 bytes you suggested?

If the IP header is 4 byte aligned, the TCP header will be as well.
