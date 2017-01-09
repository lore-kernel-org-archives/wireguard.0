Return-Path: dave.taht@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1a928b5
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jan 2017 06:51:22 +0000 (UTC)
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
 [209.85.220.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b6808ac
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jan 2017 06:51:22 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id u25so516122801qki.2
 for <wireguard@lists.zx2c4.com>; Sun, 08 Jan 2017 23:00:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pZLDieAabMhjDQHxpj_TDd5OLjNEUpQrraFvXA0g7gmA@mail.gmail.com>
References: <20170108224117.GB9445@tuxmachine.polynome.dn42>
 <CAHmME9pZLDieAabMhjDQHxpj_TDd5OLjNEUpQrraFvXA0g7gmA@mail.gmail.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Sun, 8 Jan 2017 23:00:55 -0800
Message-ID: <CAA93jw7X7ha87T-VH4FRkB7wM3gw4d4JgPuZLF1yjFm0iSpP+w@mail.gmail.com>
Subject: Re: [RFC] Handling multiple endpoints for a single peer
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

As I mentioned on an earlier thread, a daydream of mine is to use up extra
ipv6 /64s to improve "fair queued" latency and eliminate head of line
blocking for individual flows.

So being able to dedicate an entire /64 as an endpoint

Endpoint=3Dmyserver.tld/64:4242

would lead to a major advance over conventional vpn technologies.



On Sun, Jan 8, 2017 at 2:49 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Thanks for the proposal. Obviously the easiest solution is a userspace
> decoupled one, but this might not necessarily be the most desirable.
> However, it's possible the upcoming userspace event notification fd
> support (epoll on an fd to learn when handshakes happen) and userspace
> peer-message support (send an encrypted out of band non-IP packet
> directly to a peer, for things like autoconfig) could play a nice role
> in this.
>
> But if it is in the kernel, the decision logic boils down essentially
> to: there's a list of endpoints in a given order. Based on differing
> metrics of success at differing points in time, the list gets
> reordered, and packets are always sent to the top of the list. For
> example, the list could be rotated or permutated on every handshake
> retry. Or the various other RTT or routing metrics you mentioned
> earlier.
>
> However, this doesn't shine any light on the hardest problem: how to
> update the list of addresses in a memory-bounded fashion. Right now,
> if you receive an encrypted packet, the endpoint of that peer is
> updated to the src address of that packet. With multi-endpoint, which
> endpoint is updated? Is it simply appended to an ever-growing list of
> recent endpoints? How to keep this clean and manageable?
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard



--=20
Dave T=C3=A4ht
Let's go make home routers and wifi faster! With better software!
http://blog.cerowrt.org
