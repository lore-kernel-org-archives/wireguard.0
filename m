Return-Path: bounce+1a9445.bb0-wireguard=lists.zx2c4.com@poorlab.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 167f4614
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Aug 2018 06:42:38 +0000 (UTC)
Received: from m32-4.eu.mailgun.net (m32-4.eu.mailgun.net [141.193.32.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bc418d3
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Aug 2018 06:42:38 +0000 (UTC)
Sender: coder@poorlab.com
Received: by mail-qk0-f177.google.com with SMTP id n85-v6so10281290qke.8
 for <wireguard@lists.zx2c4.com>; Sun, 12 Aug 2018 23:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7UkwLpoa_n87PKghohdGc5JVpYJdjAB1a8NUpYjx35o5nPWw@mail.gmail.com>
 <CAHmME9oUWgtyBHK9WRT7oKe0Ud5ooTmGuOnkyMPRWpMBFGxV4Q@mail.gmail.com>
In-Reply-To: <CAHmME9oUWgtyBHK9WRT7oKe0Ud5ooTmGuOnkyMPRWpMBFGxV4Q@mail.gmail.com>
From: StarBrilliant <coder@poorlab.com>
Date: Mon, 13 Aug 2018 16:53:41 +1000
Message-ID: <CA+7UkwL94VsvX0aUJVejNT1JTdCKpOEFDibSwZKRatcPkQnCVA@mail.gmail.com>
Subject: Re: Fragmentation on UDP layer possible?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Aug 13, 2018 at 4:41 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> WireGuard's socket.c calls udp_tunnel_xmit with the DF bit set to 0,
> which means if the underlying endpoint's path has an MTU that is too
> small, the UDP packet will simply be fragmented, not dropped.

Hi Jason,

Thank you for your answer.

Yes. This is how Wireguard handles fragmenting on IP layer. And thanks
to this feature I can build my network with high MTU inside.

For Roman Mamedov's question, I said there is such bug if you use
VXLAN inside Wireguard: You need to turn checksum offload off if
fragment is on.

But my doubt is "can we do fragment on UDP layer", or "on application
layer". That is because I found some public Wi-Fi simply does not
allow me to transmit any fragmented IP packets. Would you please
comment on this question? (For details, you may see my first post.)

Thanks!
