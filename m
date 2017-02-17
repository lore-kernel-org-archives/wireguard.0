Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11c7299e
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:48:32 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd841a06
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:48:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd7ba626
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:48:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0ca84cf0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:48:32 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id 45so31600530otd.2
 for <wireguard@lists.zx2c4.com>; Fri, 17 Feb 2017 05:48:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CADdae-jq5UET3utsK=gzpWig=MK3ts2KjF7=UYbAec0_Y08MGQ@mail.gmail.com>
References: <CADdae-jq5UET3utsK=gzpWig=MK3ts2KjF7=UYbAec0_Y08MGQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 17 Feb 2017 14:48:51 +0100
Message-ID: <CAHmME9popejSYDF-yHB+FxX-dSo9PVqMwo-MOG7mQj56QiA4EQ@mail.gmail.com>
Subject: Re: Some questions about wireguard
To: Nicolas Prochazka <nicolas.prochazka@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Feb 15, 2017 at 11:12 AM, Nicolas Prochazka
<nicolas.prochazka@gmail.com> wrote:
> - how many tunnels a peer can manage ?
> In our environnement, ~ 10 000 clients --> "server"|peer

Each interface can have 65536 peers. Each linux system can have
multiple interfaces.

(If that peer limit becomes a problem for somebody, it wouldn't be
difficult to remove it and expand it to 4294967296.)

> how wireguard manage this ( udp tunnel from kernel ? )

Not sure I understand your question. Could you rephrase?

>
> - about peer key management ?
> with 10 000 peer keys, how can we manage it

You can load the keys into the interface using wg(8). At some later
date there may be support for dynamic database stuff.
