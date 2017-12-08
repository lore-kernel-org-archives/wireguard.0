Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5a0a4b0
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 18:12:15 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34455054
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 18:12:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b325fe7
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 18:12:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cfff7534
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 18:12:14 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id d5so9863428oti.3
 for <wireguard@lists.zx2c4.com>; Fri, 08 Dec 2017 10:19:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171208.103841.516344129530992484.davem@davemloft.net>
References: <20171111044854.GA7956@zx2c4.com>
 <CAB=oiXZYChYMzqK4cufNy+Gr-QHK7jE=h8-9+zQMx67_xsLVoQ@mail.gmail.com>
 <CAHmME9rhB-w=EoUJ-EiT1cgJKS44Uz=uJdphsud-BEN1zHtB9A@mail.gmail.com>
 <20171208.103841.516344129530992484.davem@davemloft.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Dec 2017 19:19:23 +0100
Message-ID: <CAHmME9rMfC6xkXO8_-E2Pqf-FMxec98crzkfEcyymZ8yGUhORg@mail.gmail.com>
Subject: Re: WireGuard Upstreaming Roadmap (November 2017)
To: David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Cc: Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 LKML <linux-kernel@vger.kernel.org>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Dave,

On Fri, Dec 8, 2017 at 4:38 PM, David Miller <davem@davemloft.net> wrote:
> Sorry, you cannot force the discussion of a feature which will be submitted
> upstream to occur on a private mailing list.
>
> It is _ABSOLUTELY_ appropriate to discss this on netdev since it is the
> netdev community which must consider issues like this when looking at
> whether to accept WireGuard upstream.
>
> Jason, this action and response was entirely inappropriate, and please
> I'd like you to reply properly to questions about your feature here.

Whoops, okay! Very sorry. I'm actually kind of happy to hear that. I
had assumed that you'd be annoyed if WireGuard crypto discussion
spewed over into netdev adding even more message volume there for
something perhaps not directly relevant. But in fact, you're
interested and find it important to discuss there. So, good news. And
sorry for trying to shew it away before. I'll copy and paste the
response I had made on the other list:

> This is covered in the paper:
> https://www.wireguard.com/papers/wireguard.pdf
>
> The basic answer is that WireGuard has message type identifiers, and
> the handshake also hashes into it an identifier of the primitives
> used. If there's ever a problem with those primitives chosen, it will
> be possible to introduce new message type identifiers, if that kind of
> "support everything even the broken garbage" approach is desired by
> misguided people. However, a better approach, of course, is to keep
> your secure network separate from your insecure network, and to not
> allow insecure nodes on secure segments; when you mix the two,
> disaster tends to strike. So, in other words, both approaches to "upgrading"
> are possible, in this fantasy wireguardalypse. Take note, though, that
> neither one of these approaches (support new and retain old protocol
> too for old nodes, or only support new) are "agile" or are anything at
> all like the 90s "cipher agility" -- the user still is not permitted
> to "choose" ciphers.

Regards,
Jason
