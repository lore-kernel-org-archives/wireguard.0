Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4684f2fd
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 15:06:14 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 058e643d
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 15:06:13 +0000 (UTC)
Date: Sat, 14 Apr 2018 20:20:29 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Mixed MTU hosts on a network
Message-ID: <20180414202029.5f247fba@natsu>
In-Reply-To: <CAHmME9ra=DZiaUS7pP3xAxC_7H-yqfiTefU3Q8gufpP7e6H2zw@mail.gmail.com>
References: <20180316142547.2ecb70de@natsu>
 <CAHmME9rVba9Zzv65guftwxZcRGWBY0uaP=_GhHVnBz=8+L6Y3A@mail.gmail.com>
 <20180414024017.GA14470@zx2c4.com>
 <CAHmME9ru0iQeYMv_Y5dBZ1GoJvT_=UK8V74wWYNz2jtZWRFhfw@mail.gmail.com>
 <20180414184018.0166bc48@natsu>
 <CAHmME9rHTu1dQi+xyyRnkKxVkC9bx91V06-qF513SsVt8e7FKg@mail.gmail.com>
 <20180414193815.0d0cd039@natsu>
 <CAHmME9ra=DZiaUS7pP3xAxC_7H-yqfiTefU3Q8gufpP7e6H2zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Luis Ressel <aranea@aixah.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Roman Mamedov <rm.wg@romanrm.net>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, 14 Apr 2018 16:45:32 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> In this case, WireGuard seems to be doing the right thing. Think you
> could come up with some minimal test that exhibits the behavior you're
> seeing?

I now remember in more detail what was the problem. It was not with MTU 1412
on both sides, it was during trying to mix WG MTU 1412 on the PPPoE-connected
machine, with WG MTU 1420 on the other side (which uses full 1500 underlying
MTU).

Here I posted about it with some tcpdumps included:
https://lists.zx2c4.com/pipermail/wireguard/2018-March/002537.html

With 1420 on the "full MTU" side, the "PPPoE" side had to set 1408 WG MTU for
things to work properly, not 1412 as would theoretically fit into its PPPoE.

I'll post an update if I come up with a short and simple reproducer sequence.

Setting 1412 on both sides seems to work fine from more testing just now.

-- 
With respect,
Roman
