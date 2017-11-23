Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ddc968c
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Nov 2017 11:47:24 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6100848e
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Nov 2017 11:47:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a212da2c
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Nov 2017 11:47:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1e6a564c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Nov 2017 11:47:24 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id v123so12989015oif.12
 for <wireguard@lists.zx2c4.com>; Thu, 23 Nov 2017 03:52:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CADdae-gxRdskDLWaHhGF8otRDV4ps_VQ4qfabw9njLRnnYNNmQ@mail.gmail.com>
References: <CADdae-gxRdskDLWaHhGF8otRDV4ps_VQ4qfabw9njLRnnYNNmQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 23 Nov 2017 12:52:37 +0100
Message-ID: <CAHmME9rng4iyqHmWVB3HbizD-7bvRZQUe_Zhc-LHo-vaiz5D2A@mail.gmail.com>
Subject: Re: about high availibity
To: nicolas prochazka <prochazka.nicolas@gmail.com>
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

Hi Nicolas,

You can't change that parameter, and I won't ever add that option.
This isn't negotiable.

However, I'll at some point be adding netlink event notifications, so
that you learn when WireGuard itself has detected connectivity
problems (usually in about 15 seconds), and react accordingly.

Jason
