Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdea52bc
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 16:57:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id adc173ef
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 16:57:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83e916de
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 16:48:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id af63043e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 16:48:26 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id y20-v6so3771459oix.5
 for <wireguard@lists.zx2c4.com>; Mon, 16 Apr 2018 10:11:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1517864406.3150045.1260465240.2EC06D52@webmail.messagingengine.com>
References: <1517864406.3150045.1260465240.2EC06D52@webmail.messagingengine.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 16 Apr 2018 19:11:49 +0200
Message-ID: <CAHmME9p81KM-WRKLBu54nA-tvPt5631F=t=ks1OAjZkGrNcQnw@mail.gmail.com>
Subject: Re: [WireGuard] Nesting WireGuard tunnels
To: Justin Kilpatrick <justin@altheamesh.com>
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

Hi Justin,

WireGuard listens on all ports, so this shouldn't be a problem to do
with multiple interfaces.

It does not currently support tunneling packets from one peer through
another, because it's difficult to avoid loops that way, but if you
think this would be useful it could be worked out in greater detail.

Regards,
Jason
