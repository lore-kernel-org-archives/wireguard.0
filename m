Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18eede21
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 00:24:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef418b99
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 00:24:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4301b566
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 00:24:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4fe7474c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 00:24:16 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id t79so779727wmt.0
 for <wireguard@lists.zx2c4.com>; Wed, 07 Dec 2016 16:29:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161207.145240.1636297838792223189.davem@davemloft.net>
References: <CAA93jw7hcmkcyD=t4VRrQFfHk+n+EkSVgY6KFDq0_-DGpMADYw@mail.gmail.com>
 <20161207.135127.789629809982860453.davem@davemloft.net>
 <CAHmME9oLgjDA2F0gkFzHU2Es8-XCxQHRABS18OKF0EnZgt1=LQ@mail.gmail.com>
 <20161207.145240.1636297838792223189.davem@davemloft.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 8 Dec 2016 01:29:42 +0100
Message-ID: <CAHmME9qxz6wcOZuurqahXeY6QSF=zz0gH7gY4RZujLAJPNSWBA@mail.gmail.com>
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

On Wed, Dec 7, 2016 at 8:52 PM, David Miller <davem@davemloft.net> wrote:
> The only truly difficult case to handle is GRE encapsulation.  Is
> that the situation you are running into?
>
> If not, please figure out what the header configuration looks like
> in the case that hits for you, and what the originating device is
> just in case it is a device driver issue.

My case is my own driver and my own protocol, which uses a 13 byte
header. I can, if absolutely necessary, change the protocol to add
another byte of padding. Or I can choose not to decrypt in place but
rather use a different trick, like overwriting the header during
decryption, though this removes some of the scatterwalk optimizations
when src and dst are the same. Or something else. I wrote the top
email of this thread inquiring about just exactly how bad it is to
call netif_rx(skb) when skb->data is unaligned.
