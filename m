Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf2209c6
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 22:04:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95dced6d
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 22:04:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35334b30
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 21:55:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 518a7139
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 21:55:52 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id t2so213593otj.4
 for <wireguard@lists.zx2c4.com>; Tue, 06 Mar 2018 14:14:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87y3j4luw4.fsf@toke.dk>
References: <871sgwna50.fsf@toke.dk>
 <CAHmME9oF2TUQiO=xCeoMD2ajbG+16netREXD3YCem=j7HmwkoA@mail.gmail.com>
 <87y3j4luw4.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Mar 2018 23:14:07 +0100
Message-ID: <CAHmME9ogYdW3AUUC6qQRkmq2ndEqk0MHxt0sVF=BKvdNQKZO3A@mail.gmail.com>
Subject: Re: Roaming between IPv4 and IPv6?
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
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

On Tue, Mar 6, 2018 at 11:08 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@tok=
e.dk> wrote:
> I think the idea of configuring both v4 and v6 on startup and caching
> them is a reasonable idea. Maybe even configure all available addresses
> when doing the initial DNS lookup? Or is that awkward to do?

You mean taking one v4 and one v6? That's probably possible. Since
getaddrinfo has complicated ordering logic, this probably be best
expressed as something like "endpoint" and "secondary endpoint" when
told by userspace, with them then being swapped when the FIB complains
about trying to route to one of them.
