Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90801885
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 16:51:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b69fdb1f
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 16:51:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a75ec53
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 17:04:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a85d2f21
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 17:04:50 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id k67so146553655wrc.2
 for <wireguard@lists.zx2c4.com>; Mon, 10 Jul 2017 10:09:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1499706363.749987194@f388.i.mail.ru>
References: <1499116162.70598782@f401.i.mail.ru>
 <e3a0ff13-fea4-e5e3-7529-ae746d74a17a@roelf.org>
 <CAHmME9qUHN_G2vf7A_haTpk+yMK6rVe42B56N9LFLP7tBh-VkQ@mail.gmail.com>
 <1499706363.749987194@f388.i.mail.ru>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 10 Jul 2017 19:09:25 +0200
Message-ID: <CAHmME9rBDRRnQ1z4+OFRrYjB5c+01oDAqxzdipx9TH4exhdg+w@mail.gmail.com>
Subject: Re: Re[2]: problem wireguard + ospf + unconnected tunnels
To: ae <aeforeve@mail.ru>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Roelf Wichertjes <roelf@roelf.org>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Jul 10, 2017 at 7:06 PM, ae <aeforeve@mail.ru> wrote:
> yes - work
Great to hear! This will be a part of the next snapshot.

> + Pair of missing functionality - which I lacked when replacing with wireguard
>
> 1) src addr tunnel
What is this? Can you elaborate on what you mean?

> 2) work in only preshared crypto
WireGuard has a preshared-key mode, but it's in addition to the normal
EC-based crypto, not instead of. Welcome to the future!
