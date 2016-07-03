Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f164d0e8
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 17:45:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4b7e516
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 17:45:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eed1948c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 17:45:42 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id l188so104902410lfe.2
 for <wireguard@lists.zx2c4.com>; Sun, 03 Jul 2016 10:48:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8760snzxk6.fsf@alice.fifthhorseman.net>
References: <8760snzxk6.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 3 Jul 2016 19:48:52 +0200
Message-ID: <CAHmME9of+yaYna73cd+H-Mr+6q8c6QT_+mg==M4VGHX6ESckwQ@mail.gmail.com>
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

> + memcpy(private_key_normalized, private_key, sizeof(private_key_normalized));
> + curve25519_normalize_secret(private_key_normalized);
> + if (memcmp(private_key_normalized, private_key, sizeof(private_key_normalized))) {
> + fprintf(stderr, "%s %s: private key was not in normalized form\n", PROG_NAME, argv[0]);
> + return 1;
> + }


Do you have a justification for requiring normalized form?
curve25519-donna doesn't care either way.
