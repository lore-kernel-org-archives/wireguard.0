Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4930a03c
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 02:45:24 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ec17ab3
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 02:45:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81ad54d4
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 02:45:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 50a040ec
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 02:45:22 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id j24so9183593otb.1
 for <wireguard@lists.zx2c4.com>; Fri, 10 Nov 2017 18:49:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALrp0MGa-0G3-0W5B-inR1Yc6AzMrTWNGmLXdwTi++D=tWPpFA@mail.gmail.com>
References: <CALrp0MGa-0G3-0W5B-inR1Yc6AzMrTWNGmLXdwTi++D=tWPpFA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 11 Nov 2017 11:49:02 +0900
Message-ID: <CAHmME9o0f=K7g84fO_ba2=n_WtsQZHxZR+SvEPAbLKmdJwzhEg@mail.gmail.com>
Subject: Re: wireguard ipv6 conf
To: timsan <timsan@xs4all.nl>
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

You can add v6 addresses to Address= and AllowedIPs=. These take comma
separated lists.
