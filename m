Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b125ff6
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 18:48:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98ba54bd
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 18:48:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0a0a56fc
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 18:48:48 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f82so181853468wmf.1
 for <wireguard@lists.zx2c4.com>; Wed, 07 Dec 2016 10:54:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161207.135127.789629809982860453.davem@davemloft.net>
References: <CAHmME9o_eCNXpVztOZKW55kpRtE+1KSEQTQOjUBVn68Y2+or2g@mail.gmail.com>
 <CAA93jw7hcmkcyD=t4VRrQFfHk+n+EkSVgY6KFDq0_-DGpMADYw@mail.gmail.com>
 <20161207.135127.789629809982860453.davem@davemloft.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 7 Dec 2016 19:54:12 +0100
Message-ID: <CAHmME9oLgjDA2F0gkFzHU2Es8-XCxQHRABS18OKF0EnZgt1=LQ@mail.gmail.com>
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

On Wed, Dec 7, 2016 at 7:51 PM, David Miller <davem@davemloft.net> wrote:
> It's so much better to analyze properly where the misalignment comes from
> and address it at the source, as we have for various cases that trip up
> Sparc too.

That's sort of my attitude too, hence starting this thread. Any
pointers you have about this would be most welcome, so as not to
perpetuate what already seems like an issue in other parts of the
stack.
