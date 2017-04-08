Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d885e2f
 for <wireguard@lists.zx2c4.com>; Sat, 8 Apr 2017 12:37:30 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bfb5283
 for <wireguard@lists.zx2c4.com>; Sat, 8 Apr 2017 12:37:30 +0000 (UTC)
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [RFC] Multicast and IPv6 Link Local Addresses
References: <CAHmME9poZPFbYhitnK8UvDB-32hLRcTFc4vAwaUPwGEz0wY+Yg@mail.gmail.com>
 <CAHmME9ouagoSmxUy2R0YAhhUhX7PVRpJuP6S6PC+AxHKHtb+BA@mail.gmail.com>
 <03B23E99-75C4-4598-AC0A-3C65F346675F@gmail.com>
 <CAHmME9oxt=x3tJ5wHitGGjD1yLGweQ4ed3aNv+0Cv9bvPUXDDg@mail.gmail.com>
Date: Sat, 08 Apr 2017 14:43:56 +0200
In-Reply-To: <CAHmME9oxt=x3tJ5wHitGGjD1yLGweQ4ed3aNv+0Cv9bvPUXDDg@mail.gmail.com>
 (Jason A. Donenfeld's message of "Fri, 7 Apr 2017 22:42:22 +0200")
Message-ID: <87wpavt6gj.fsf@alrua-karlstad>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Dave =?utf-8?Q?T=C3=A4ht?= <dave@taht.net>,
 Juliusz Chroboczek <jch@irif.fr>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Hey George,
>
> More excellent feedback, thanks. Be sure to CC the list next time though.
>
> If I understand correctly, your suggestion is to not clutter
> everything with a horrible "multi:" prefix, but instead allow
> multicast addressees, which are well defined, to be added to multiple
> peers, and only allow unicast addresses to be added to one peer at a
> time keeping the current behavior. I find that a very nice UI
> solution. Wonderful.

I'd be fine with this, as long as it's on the subnet level (which I
believe is the case, just making sure). I.e., if I want behaviour
corresponding to full link-local multicast, I can just add fe02::/16 to
every peer in my config and be done with it.

-Toke
