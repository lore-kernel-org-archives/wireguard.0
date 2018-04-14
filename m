Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34d4d9fc
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 13:02:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1a9eb11
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 13:02:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9b18e4b
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 12:53:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 949c4420
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 12:53:49 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id 23-v6so12748532otj.0
 for <wireguard@lists.zx2c4.com>; Sat, 14 Apr 2018 06:16:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180414024017.GA14470@zx2c4.com>
References: <20180316142547.2ecb70de@natsu>
 <CAHmME9rVba9Zzv65guftwxZcRGWBY0uaP=_GhHVnBz=8+L6Y3A@mail.gmail.com>
 <20180414024017.GA14470@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 15:16:56 +0200
Message-ID: <CAHmME9ru0iQeYMv_Y5dBZ1GoJvT_=UK8V74wWYNz2jtZWRFhfw@mail.gmail.com>
Subject: Re: Mixed MTU hosts on a network
To: Roman Mamedov <rm.wg@romanrm.net>
Content-Type: text/plain; charset="UTF-8"
Cc: Luis Ressel <aranea@aixah.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Roman,

This commit should fix it. It now has a unit test too so that we don't
hit this issue again. Thanks for reporting it in such detail.

https://git.zx2c4.com/WireGuard/commit/?id=a88a067d5477f877003d3703bb3b95cb4e94bc46

Let me know if that fixes it on your end.

Jason
