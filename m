Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4d63ce9
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 22:08:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9fe53195
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 22:08:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f691fb3
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 22:10:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 50435441
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 22:10:03 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id t1-v6so29971390oth.8
 for <wireguard@lists.zx2c4.com>; Sun, 06 May 2018 15:10:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c568bd35-6449-ce60-d075-87ba3346964a@mib-infotech.co.nz>
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
 <CAHmME9r5cwdfDaHCbO50UhREG9z2zv39y+32YYwAYJEfsGDgVA@mail.gmail.com>
 <ad56c93f-5e36-e9a4-42c2-8632c7df86af@gmx.net>
 <4ZK0EJ5btb88Qoa6vz0bpYJHCbhF7h4Z-BBh0ARD4tdwxcwcmdGeUPFuiPrGcdTNmp8Q8p6t4c4vMo7vKwnEIrXdVe56ovqOhiBXi4PdPxs=@protonmail.ch>
 <825a636f-9311-688d-6f30-9ae8d12ea44a@gmx.net> <874ljk24jh.fsf@toke.dk>
 <dfcc55c3-795b-dfa2-7034-74b537519ea4@gmx.net>
 <7qQvJLeSZV3rJnkg9rIdA6yznDPzhIFVR_qUa0hBhmCdr_onJsjzXvKVIlp-ovJiRaX1eENGmtrtcZ_7xsHY7heX2qOvouN8pXTt_J3RurQ=@protonmail.ch>
 <d8bb14e2-43f6-812b-ad5d-3d7b143ae518@gmx.net>
 <c568bd35-6449-ce60-d075-87ba3346964a@mib-infotech.co.nz>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 7 May 2018 00:10:24 +0200
Message-ID: <CAHmME9rMkeH0y_oQsFmNfergzkKJp8XZHGF_nmxGO1GS27QcWA@mail.gmail.com>
Subject: Re: Android Configuration File
To: John Huttley <john@mib-infotech.co.nz>
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

Hey John,

Sorry about that. I actually fixed this a few days ago, but we haven't
yet put out a new alpha release apk.

https://git.zx2c4.com/wireguard-android/commit/?id=8ef4a2f2f0216d5bd716d990dbf89b80868b9103

I'll get something released soon that should fix this issue for you.

In the mean time, just remove the leading spaces of each line.

Jason
