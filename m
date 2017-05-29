Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b25b0c5f
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 20:49:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f367fea
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 20:49:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fde389e5
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 21:00:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 04a2dbd2
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 21:00:47 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id b204so89900289oii.1
 for <wireguard@lists.zx2c4.com>; Mon, 29 May 2017 14:02:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3aee46648bd2d8c49fd13e1fd140d3d3@nickmaleao.stream>
References: <3aee46648bd2d8c49fd13e1fd140d3d3@nickmaleao.stream>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 29 May 2017 23:02:16 +0200
Message-ID: <CAHmME9p5eZ9gv0rE_cre82Jw+FjOorz0dU+AdUQS1VcqiU0+8g@mail.gmail.com>
Subject: Re: TCP traffic in ipip tunnel inside wireguard connection
To: Ivan Leonardo <ivan.leonardo@nickmaleao.stream>
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

Hi Ivan,

I'll try to reproduce in order to determine whether or not there's a
checksum bug with nested tunnels. However, all of this seems quite
unnecessary:

Just set allowed-ips to be your /30 for each peer. If you need one to
be 0.0.0.0/0 at one time or another, you can change these at runtime.
Alternatively, if you _must_ have multiple 0.0.0.0/0 just use two
different wireguard interfaces running on different UDP ports, and
then you'll have the full power of the ordinary linux routing table
for this sort of craziness.

Jason
