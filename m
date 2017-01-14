Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a896fbe
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Jan 2017 20:47:56 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9346eac
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Jan 2017 20:47:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00f7430c
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Jan 2017 20:47:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4dc8494b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Jan 2017 20:47:56 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id u143so81808505oif.3
 for <wireguard@lists.zx2c4.com>; Sat, 14 Jan 2017 12:58:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAOnWvx_BCaSO3i=319vCUjKuXG6E+8ReGsFGFFVgJLsdyb4RGg@mail.gmail.com>
References: <CAOnWvx_BCaSO3i=319vCUjKuXG6E+8ReGsFGFFVgJLsdyb4RGg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Jan 2017 21:58:11 +0100
Message-ID: <CAHmME9pr9jEdaPuLfperB3qtTbuAL-cB8c8vRHu+09EC+-Q7uw@mail.gmail.com>
Subject: Re: limitations
To: Wasa Bee <wasabee18@gmail.com>
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

On Sat, Jan 14, 2017 at 8:11 PM, Wasa Bee <wasabee18@gmail.com> wrote:
> Also:
> if there are ongoing sessions with some clients, how would sessions be
> re-established (afaik, the current design is to simply ignore irrelevant
> messages)?

Sorry, missed this last question before.

The session will be dropped when you unload the module, but a peer
will quickly figure out that something is amiss and reinitiate the
session. Downtime is fairly minimal.
