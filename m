Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6604659c
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 00:59:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b019c479
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 00:59:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb77a76c
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 00:50:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id be69dbce
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 00:50:34 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id a14-v6so8171393otf.6
 for <wireguard@lists.zx2c4.com>; Thu, 12 Apr 2018 18:13:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANhj9oyqrDT-1BNe6ZFr=fAcW7+PJ+8GjvhTJP23vyjpJ8iO4w@mail.gmail.com>
References: <CANhj9oyqrDT-1BNe6ZFr=fAcW7+PJ+8GjvhTJP23vyjpJ8iO4w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 13 Apr 2018 03:13:30 +0200
Message-ID: <CAHmME9pKwS+vvL5b1wqBT6aFYN0ddT75aduBd=Se7N8twF77Lw@mail.gmail.com>
Subject: Re: Question about peers count
To: Tiraen <tiraen@gmail.com>
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

The max is 1048576 per interface, but if this becomes a problem, I can
increase this significantly.

[PS: I'm back from holidays now and I'll be working through the
mailing list backlog over the next few days.]
