Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ce422e7
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 21:11:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b139ee4c
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 21:11:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40daf075
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 21:11:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id df3f4f19
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 21:11:05 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id u193so12616768oie.1
 for <wireguard@lists.zx2c4.com>; Mon, 11 Dec 2017 13:18:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <871sk1xcxh.fsf@fifthhorseman.net>
References: <20171210134805.3441-1-manuel.schoelling@gmx.de>
 <871sk1xcxh.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 Dec 2017 22:18:39 +0100
Message-ID: <CAHmME9rKkTbrmaSzrPb7uvNcQfpcZi1JMYW0K0wz9A0YwZ7GXQ@mail.gmail.com>
Subject: Re: [PATCH] tools: Use '-' to read from stdin instead of file
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

On Mon, Dec 11, 2017 at 8:49 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> I'm not sure why it's important to avoid closing stdin when you don't
> plan on reading from it any more, though.  Isn't it more parsimonious to
> go ahead and explicitly close it so that anything writing additional
> data to stdin will get an error?

You could theoretically have a line like this:

{ echo private....;echo public...;} |
wg set wg0 private-key - peer ABCD= preshared-key -

in which case I guess you might not want to close stdin. However the
eof loop here prevents that from actually working:
https://git.zx2c4.com/WireGuard/tree/src/tools/config.c#n147

In light of multiple things potentially being from stdin, maybe - only
makes sense in the context of setconf, but not set? Not sure one way
or another.
