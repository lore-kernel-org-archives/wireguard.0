Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd4a53a6
 for <wireguard@lists.zx2c4.com>; Fri, 3 Nov 2017 15:35:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 544ee2d6
 for <wireguard@lists.zx2c4.com>; Fri, 3 Nov 2017 15:35:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dd92d60
 for <wireguard@lists.zx2c4.com>; Fri, 3 Nov 2017 15:35:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3ff6e9b6
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Nov 2017 15:35:54 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id v9so2308974oif.13
 for <wireguard@lists.zx2c4.com>; Fri, 03 Nov 2017 08:38:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALzTOmKz1qKVC=g4We51da6ZeGL-MxZudNC1eqwX5jYMaU47ZQ@mail.gmail.com>
References: <CALzTOmKz1qKVC=g4We51da6ZeGL-MxZudNC1eqwX5jYMaU47ZQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 3 Nov 2017 16:38:36 +0100
Message-ID: <CAHmME9oxQw=WFkiw9dXRarF9bJxPoNRJ0V1aSC1+VxbCYFw=VQ@mail.gmail.com>
Subject: Re: Multi Link / VPN Bonding
To: Stephen Major <smajor@gmail.com>
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

Hey Stephen,

You could in fact use WireGuard for this sort of thing, if you want
the various connections to have authentication and encryption.

I had success doing this a few years ago with MPTCP, with 7 different
connections. It successfully aggregated them and dealt with failures
gracefully.

Jason
