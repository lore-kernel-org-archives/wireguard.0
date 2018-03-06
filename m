Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff4d0590
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 21:48:10 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1012f844
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 21:48:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 724bd0f4
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 21:39:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a24f849a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 21:39:19 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id m22so158049otf.10
 for <wireguard@lists.zx2c4.com>; Tue, 06 Mar 2018 13:57:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <871sgwna50.fsf@toke.dk>
References: <871sgwna50.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Mar 2018 22:57:34 +0100
Message-ID: <CAHmME9oF2TUQiO=xCeoMD2ajbG+16netREXD3YCem=j7HmwkoA@mail.gmail.com>
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

Hey Toke,

For incoming packets, this would be strange behavior, since it's
listening on v4 and v6. For outgoing packets, if wireguard thinks it
should be sending to a v6 address, then that's what it will do. One
way to fix this would be to re-resolve DNS from userspace, which is a
bit ugly. Another way would be to simply store the last v4 address,
and fall back to that if it can't establish a route for the v6
address. And yet another way -- if simplicity is desired -- would be
to do nothing (the status quo), and not build legacy semantics into
something new. Any opinions on this?

Jason
