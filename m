Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09d849b2
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 18:29:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31eebf4d
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 18:29:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 74cccb98
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 18:29:27 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id f6so105229662lfg.0
 for <wireguard@lists.zx2c4.com>; Sun, 03 Jul 2016 11:32:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8760snzxk6.fsf@alice.fifthhorseman.net>
References: <8760snzxk6.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 3 Jul 2016 20:32:38 +0200
Message-ID: <CAHmME9pfWqDqfEgd4C-bsVd1DfPCSrUe=Gae4wyb2Pw9f0Uw9A@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] stricter inputs for wg genkey, genpsk, and pubkey
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I've made a few commits implementing something inspired by this patchset.
