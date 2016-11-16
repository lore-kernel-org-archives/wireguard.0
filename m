Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2860aeee
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 16:55:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94c5836e
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 16:55:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8b876164
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 16:55:31 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id n6so109715000qtd.1
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2016 08:58:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9ph6MXEkwTdSgQ5MBRAimOv512zNjipxAo+qXSbLDpscg@mail.gmail.com>
References: <A124E9F5-B1CF-4904-A849-EEAAD788030C@danrl.com>
 <55998A34-BCEC-4693-ABC4-48AC108F7A64@danrl.com>
 <39B38656-DD06-43E8-BC20-BAF5BC622EBA@danrl.com>
 <20161116081527.GB14469@tuxmachine.polynome.dn42>
 <E0BFF696-C9B9-45BC-98E5-E736C1AE11EF@danrl.com>
 <CAHmME9ph6MXEkwTdSgQ5MBRAimOv512zNjipxAo+qXSbLDpscg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Nov 2016 17:58:20 +0100
Message-ID: <CAHmME9pX8iG67Mz_0zN-biOTyGXtm2DjRtQQwJTw9UTxz3ar4w@mail.gmail.com>
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Wireguard in OpenWRT/LEDE: FYI: Pull Request
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Oh, I see, that's not actually a correct suggestion.

The config value has to be the same to correlate them. In that case,
you should show an example with multiple peers, so that it's clear
what's happening.
