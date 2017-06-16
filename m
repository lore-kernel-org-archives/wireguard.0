Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a973c5d
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Jun 2017 12:03:23 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1eed475f
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Jun 2017 12:03:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f76ceaf9
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Jun 2017 12:16:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 73cc43f7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Jun 2017 12:16:56 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id b6so23144664oia.1
 for <wireguard@lists.zx2c4.com>; Fri, 16 Jun 2017 05:18:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170616061331.GA25282@tuxmachine.polynome.dn42>
References: <20170513071040.GC22218@tuxmachine.polynome.dn42>
 <20170616061331.GA25282@tuxmachine.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 16 Jun 2017 14:18:28 +0200
Message-ID: <CAHmME9p9Ywv4kYUqzzuf6nWruGpiCawHxT94htxeONnn_wzDoA@mail.gmail.com>
Subject: Re: Rebasing Wireguard's master branch
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

You might prefer this sequence:

$ git fetch
$ git reset --hard origin/master
