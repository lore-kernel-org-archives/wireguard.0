Return-Path: davem@davemloft.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0f5219c
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 19:47:18 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [184.105.139.130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c5daa64
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 19:47:18 +0000 (UTC)
Date: Wed, 07 Dec 2016 14:52:40 -0500 (EST)
Message-Id: <20161207.145240.1636297838792223189.davem@davemloft.net>
To: Jason@zx2c4.com
Subject: Re: Misalignment, MIPS, and ip_hdr(skb)->version
From: David Miller <davem@davemloft.net>
In-Reply-To: <CAHmME9oLgjDA2F0gkFzHU2Es8-XCxQHRABS18OKF0EnZgt1=LQ@mail.gmail.com>
References: <CAA93jw7hcmkcyD=t4VRrQFfHk+n+EkSVgY6KFDq0_-DGpMADYw@mail.gmail.com>
 <20161207.135127.789629809982860453.davem@davemloft.net>
 <CAHmME9oLgjDA2F0gkFzHU2Es8-XCxQHRABS18OKF0EnZgt1=LQ@mail.gmail.com>
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
Date: Wed, 7 Dec 2016 19:54:12 +0100

> On Wed, Dec 7, 2016 at 7:51 PM, David Miller <davem@davemloft.net> wrote:
>> It's so much better to analyze properly where the misalignment comes from
>> and address it at the source, as we have for various cases that trip up
>> Sparc too.
> 
> That's sort of my attitude too, hence starting this thread. Any
> pointers you have about this would be most welcome, so as not to
> perpetuate what already seems like an issue in other parts of the
> stack.

The only truly difficult case to handle is GRE encapsulation.  Is
that the situation you are running into?

If not, please figure out what the header configuration looks like
in the case that hits for you, and what the originating device is
just in case it is a device driver issue.

Thanks.
