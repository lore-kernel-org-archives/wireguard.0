Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 998e032b
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 10:19:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35985d93
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 10:19:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3ef1574c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 10:19:57 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id f6so8313572lfg.0
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jul 2016 03:20:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160707025708.95304-1-jonathan@titanous.com>
References: <20160707025708.95304-1-jonathan@titanous.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 7 Jul 2016 12:20:06 +0200
Message-ID: <CAHmME9o5aYzCQV=Py7uK5KLNFcPtEuNNFniyZB=_KAn4NYw4GA@mail.gmail.com>
To: Jonathan Rudenberg <jonathan@titanous.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [PATCH] go test: add ICMP ping
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is awesome. What fun it was making this yesterday. A couple nits, however:

On Thu, Jul 7, 2016 at 4:57 AM, Jonathan Rudenberg
<jonathan@titanous.com> wrote:
> +               Checksum: 0xa15b, // the packet is always the same, hard-code checksum

Isn't there some Go lib we can use to calculate this for us?

> +       // read ICMP Echo Reply packet
> +       replyPacket := make([]byte, 128)

Is this 128 exact?

> +       replyPacket = replyPacket[:n]

I guess not, since you truncate it to n here.

> +       replyHeaderLen := int(replyPacket[0]&0x0f) << 2
> +       replyLen := binary.BigEndian.Uint16(replyPacket[2:])
> +       replyMessage, err := icmp.ParseMessage(1, replyPacket[replyHeaderLen:replyLen])

I realize this is Go, where nobody cares about indices because the
runtime does checks for you, but... this pops out at me as ugly and
dangerous. replyHeaderLen and replyLen are attacker controlled!

> +       if echo.ID != 1 || echo.Seq != 1 || string(echo.Data) != "WireGuard" {

Can we set ID and Seq to random numbers, and check that we get them back here?
