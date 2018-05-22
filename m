Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03da2fd2
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 22:00:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d32d0488
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 22:00:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7776381d
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 21:59:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 879fb18e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 21:59:05 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id h8-v6so22853603otb.2
 for <wireguard@lists.zx2c4.com>; Tue, 22 May 2018 15:01:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABcNfLs4Z8uLu+Bn-3RCeAXkowB1ty0P_7hfGrAy_taS75CRdA@mail.gmail.com>
References: <CABcNfLs4Z8uLu+Bn-3RCeAXkowB1ty0P_7hfGrAy_taS75CRdA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 23 May 2018 00:01:26 +0200
Message-ID: <CAHmME9oMyS-AYVz+GRgE4BOGKpcSCmuNtEkWG8OzoJcAcim0SQ@mail.gmail.com>
Subject: Re: Key distribution and rotation tools?
To: Giacomo Bernardi <mino@minux.it>
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

The Mullvad people have this interesting repo:
https://github.com/mullvad/oqs-rs/tree/master/mullvad-wg-establish-psk

The idea is to run some slow and miserable post quantum key exchange
over TCP from inside the wireguard tunnel, and then pop the result
into the PSK slot on both ends.

It'd be interesting to see someone build something similar around the
recently released libpqcrypto - https://libpqcrypto.org
