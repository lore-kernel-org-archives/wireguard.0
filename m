Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43445a86
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Aug 2018 06:29:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79f8b16b
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Aug 2018 06:29:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4b3f6f0
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Aug 2018 06:28:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d46816c9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Aug 2018 06:28:14 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id d189-v6so25465998oib.6
 for <wireguard@lists.zx2c4.com>; Sun, 12 Aug 2018 23:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7UkwLpoa_n87PKghohdGc5JVpYJdjAB1a8NUpYjx35o5nPWw@mail.gmail.com>
In-Reply-To: <CA+7UkwLpoa_n87PKghohdGc5JVpYJdjAB1a8NUpYjx35o5nPWw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 12 Aug 2018 23:40:59 -0700
Message-ID: <CAHmME9oUWgtyBHK9WRT7oKe0Ud5ooTmGuOnkyMPRWpMBFGxV4Q@mail.gmail.com>
Subject: Re: Fragmentation on UDP layer possible?
To: coder@poorlab.com
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

WireGuard's socket.c calls udp_tunnel_xmit with the DF bit set to 0,
which means if the underlying endpoint's path has an MTU that is too
small, the UDP packet will simply be fragmented, not dropped.
