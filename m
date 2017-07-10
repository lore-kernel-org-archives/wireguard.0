Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7bcb1a7
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 00:35:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8aa4d49c
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 00:35:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7ad6f47
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 00:48:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9a850236
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 00:48:50 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id k67so116892131wrc.2
 for <wireguard@lists.zx2c4.com>; Sun, 09 Jul 2017 17:53:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170708142156.GB13268@tuxmachine.polynome.dn42>
References: <1499116162.70598782@f401.i.mail.ru>
 <20170708142156.GB13268@tuxmachine.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 10 Jul 2017 02:53:20 +0200
Message-ID: <CAHmME9q79erdSUq7uWfT0+Cc09N_HzJ1BBb5-Q5RK2NQXyRnYw@mail.gmail.com>
Subject: Re: Indefinite queuing for unconnected peers (Was: problem wireguard
 + ospf + unconnected tunnels)
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
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

Hey Baptiste,

As alluded to in my other recent reply, WireGuard already does this
actually. It tries the handshake a few times, and only after failing
does it drop the queue. I suppose I could greatly reduce the clearing
condition from dropping after 20 handshakes to dropping after 1
handshake, but I don't think it makes a difference anyway, because new
packets should replace old packets in the queue.

Jason
