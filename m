Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f3f422a
 for <wireguard@lists.zx2c4.com>; Sat, 5 May 2018 03:42:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89e37a05
 for <wireguard@lists.zx2c4.com>; Sat, 5 May 2018 03:42:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f806a3e
 for <wireguard@lists.zx2c4.com>; Sat, 5 May 2018 03:44:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 77e4110f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 5 May 2018 03:44:37 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id 77-v6so26633182otd.4
 for <wireguard@lists.zx2c4.com>; Fri, 04 May 2018 20:44:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8d2259a4-15cf-d036-7dd8-fb18e8311aac@gmx.net>
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q-wmyXw7pyLRK3YLDZxCHgKaPbx2ZJe75Yrnb4BQzwCQ@mail.gmail.com>
 <8d2259a4-15cf-d036-7dd8-fb18e8311aac@gmx.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 5 May 2018 05:44:43 +0200
Message-ID: <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
Subject: Re: WG interface to ipv4
To: vtol@gmx.net
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

If v6 is disabled, then no packets will make it to that socket, and it
won't be used. Nothing to worry about.
