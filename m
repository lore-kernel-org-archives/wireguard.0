Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c7f326d
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Feb 2017 13:28:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 987d60f0
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Feb 2017 13:28:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51f7d7c7
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Feb 2017 13:28:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 21abae9e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Feb 2017 13:28:22 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id 32so53987139oth.3
 for <wireguard@lists.zx2c4.com>; Sun, 12 Feb 2017 05:42:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMx+r7Xk+vVwLq++8gnn1GfSA=jvYr=nM0EaLUjdvHXbjWD1kQ@mail.gmail.com>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <CAHmME9q8+D7y0Hz4xOJv1MiVsq0=bUf3TgENseGEWWF2BEpx4Q@mail.gmail.com>
 <CAMx+r7VgJ0xDAy46d28Qv_Vv7vM8JO0yRbYEh6AHVWT55LEVAw@mail.gmail.com>
 <CAHmME9otoumBPt4VvdM2s4FEpzO_wK86aiRjVOCpUpGam+P64Q@mail.gmail.com>
 <CAMx+r7WMmcGxDLE7Dt2w6S5xj0tx3U22T-HQBhss1SzV0pgbiQ@mail.gmail.com>
 <CAMx+r7Xk+vVwLq++8gnn1GfSA=jvYr=nM0EaLUjdvHXbjWD1kQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 12 Feb 2017 14:42:18 +0100
Message-ID: <CAHmME9rkFc+SKRUepfOsMR=aAP_QGJv0YQrKkxpa0hvPrZbvfg@mail.gmail.com>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
To: David Anderson <dave@natulte.net>
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

On Sun, Feb 12, 2017 at 3:40 AM, David Anderson <dave@natulte.net> wrote:
>
> I'm failing at setting up arm builds, raspbian/rpi emulation is not in a =
great shape these days. In the meantime, debian stable for amd64 is up. Upd=
ated instructions for both debian versions are at https://packagecloud.io/d=
anderson/wireguard#readme-scrollto . In particular, the jessie install requ=
ires first installing a backported kernel. I'll keep poking at arm builds f=
or a bit, but I don't promise anything.


Good idea. I'll link to that instead.
