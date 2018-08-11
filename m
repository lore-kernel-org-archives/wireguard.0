Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 297dc578
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Aug 2018 19:07:34 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5cad3319
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Aug 2018 19:07:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43845d87
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Aug 2018 19:06:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9b3f8bcc
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Aug 2018 19:06:19 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id 8-v6so21274490oip.0
 for <wireguard@lists.zx2c4.com>; Sat, 11 Aug 2018 12:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
In-Reply-To: <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 11 Aug 2018 12:18:52 -0700
Message-ID: <CAHmME9pQJ4-1AGGUd63Nsys2_5tVxecH2rWqVScWdMgNyG_zOA@mail.gmail.com>
Subject: Re: Reflections on WireGuard Design Goals
To: Brian Candler <b.candler@pobox.com>
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

On Fri, Aug 10, 2018 at 6:35 AM Brian Candler <b.candler@pobox.com> wrote:
> But I'd feel a lot happier if a second level of authentication were
> required to establish a wireguard connection

I think that given the WireGuard building block, it's certainly
possible to build a 2FA framework around it. And I do generally like
2FA and short-lived credentials and such. Probably after getting the
implementations buttoned up -- kernel mainline, windows, etc -- I'll
turn a bit of attention to expanding tooling and full packages around
the simple wg0 interface.

Jason
