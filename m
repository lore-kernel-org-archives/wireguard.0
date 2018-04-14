Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3eac5ba
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 13:26:04 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b09f0489
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 13:26:04 +0000 (UTC)
Date: Sat, 14 Apr 2018 18:40:18 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Mixed MTU hosts on a network
Message-ID: <20180414184018.0166bc48@natsu>
In-Reply-To: <CAHmME9ru0iQeYMv_Y5dBZ1GoJvT_=UK8V74wWYNz2jtZWRFhfw@mail.gmail.com>
References: <20180316142547.2ecb70de@natsu>
 <CAHmME9rVba9Zzv65guftwxZcRGWBY0uaP=_GhHVnBz=8+L6Y3A@mail.gmail.com>
 <20180414024017.GA14470@zx2c4.com>
 <CAHmME9ru0iQeYMv_Y5dBZ1GoJvT_=UK8V74wWYNz2jtZWRFhfw@mail.gmail.com>
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

On Sat, 14 Apr 2018 15:16:56 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> Hi Roman,
> 
> This commit should fix it. It now has a unit test too so that we don't
> hit this issue again. Thanks for reporting it in such detail.
> 
> https://git.zx2c4.com/WireGuard/commit/?id=a88a067d5477f877003d3703bb3b95cb4e94bc46
> 
> Let me know if that fixes it on your end.
> 
> Jason

Thanks! I didn't get a chance to test it yet.

Leaving route MTUs aside, did you look into why the interface MTU of 1412
behaves erratically (while by all calculations it should just fit into 1492
underlying PPPoE MTU), with only 1408 working reliably? Is it also because of
the padding?

-- 
With respect,
Roman
