Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9a68c1c
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 13:42:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74b53b2a
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 13:42:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c142f499
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 13:42:06 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id o141so41536129lff.1
 for <wireguard@lists.zx2c4.com>; Mon, 07 Nov 2016 05:43:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKXLc7cZpjSjUG5X78c6qSGtyrL4g4nRojFug5KNutZD+nBPzA@mail.gmail.com>
References: <CAKXLc7eZ3pPZ2WKtCGQGt2KtpBhZsJdD6jY0D_TBycUxN392Hw@mail.gmail.com>
 <CAHmME9p_mKFupsSLSTW-Tt7embNUTBYtRWudVrj9zFzvgbAzDg@mail.gmail.com>
 <CAKXLc7cZpjSjUG5X78c6qSGtyrL4g4nRojFug5KNutZD+nBPzA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 7 Nov 2016 14:43:48 +0100
Message-ID: <CAHmME9pPERRJUsEXG0+KZD_GBA6PodK3=8OLXsDw-UMr9BjoTw@mail.gmail.com>
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: kernel@gentoo.org, WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] emerge failed once :-|
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

>> I could override this in the ebuild, which I guess I'll do.

https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=70367ea5bdc56fc0ed9ce5f51d7f37459c874a79

Voila.
