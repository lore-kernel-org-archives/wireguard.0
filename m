Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 501d6698
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 20:00:53 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a05c9f86
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 20:00:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86f7711a
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 20:19:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ddf07312
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 20:19:55 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id 76so10473104ith.0
 for <wireguard@lists.zx2c4.com>; Sun, 06 Aug 2017 13:22:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170806210237.4dbbed42@msi.defcon1>
References: <20170806210237.4dbbed42@msi.defcon1>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 6 Aug 2017 22:22:28 +0200
Message-ID: <CAHmME9op6iHuOxRHaRvgmKetoMEM1RtY=x7S_Fug=6m6CpWGfg@mail.gmail.com>
Subject: Re: Many users
To: Bzzzz <lazyvirus@gmx.com>
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

Hey Jean-Yves,

There's an artificial limitation of 65535 peers per interface. This
limitation isn't _entirely_ necessary, and if it becomes a problem for
folks, I could remove it.

There was somebody on this list who set up thousands of peers and
thousands of interfaces a while ago, and after handling some issues
with him, things worked pretty well.

So, to answer your question: WireGuard should scale quite well, and
you shouldn't have many problems. But of course let me know if you do.

Jason
