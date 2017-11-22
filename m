Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e979b0dd
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 13:09:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 060a8bef
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 13:09:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5b462f5
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 13:09:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 56cafac0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 13:09:21 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id g104so13540815otg.7
 for <wireguard@lists.zx2c4.com>; Wed, 22 Nov 2017 05:14:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAC6SzHJ_xHN5fCn2mQ=xrx2Uz6YbZLoHE6As0bwE1SmzprCn+g@mail.gmail.com>
References: <CAC6SzHKVvOEZYXiuK-O6jMN=OOPjfogq2bbeHnYA1xoLew-OcQ@mail.gmail.com>
 <CAHmME9qmZCt7GDeXZtDBwSeg2z1Md9UQENbNo5TXvSqWion9rA@mail.gmail.com>
 <CAC6SzHJ_xHN5fCn2mQ=xrx2Uz6YbZLoHE6As0bwE1SmzprCn+g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Nov 2017 14:14:27 +0100
Message-ID: <CAHmME9ptPrvEXNELfX5OX4jGbBEu=QkR2EaHY+i2VQNA3QCWZg@mail.gmail.com>
Subject: Re: roaming and ddns dynamic ip
To: d tbsky <tbskyd@gmail.com>
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

On Wed, Nov 22, 2017 at 1:51 PM, d tbsky <tbskyd@gmail.com> wrote:
>  I don't think it's a bug. as you said, that's by design.although it
> means I need other tool to co-maintain the vpn connection.

WireGuard is by design a building block. wg-quick is one possible tool
made out of the building block. The script I linked in the last email
is another. You might need to make another tool out of the building
block, which you could then open source.
