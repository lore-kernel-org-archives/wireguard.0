Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8b0745a
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 20:12:40 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a45181b2
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 20:12:39 +0000 (UTC)
Date: Sun, 6 Aug 2017 22:34:12 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Many users
Message-ID: <20170806223412.0f22e55a@msi.defcon1>
In-Reply-To: <CAHmME9op6iHuOxRHaRvgmKetoMEM1RtY=x7S_Fug=6m6CpWGfg@mail.gmail.com>
References: <20170806210237.4dbbed42@msi.defcon1>
 <CAHmME9op6iHuOxRHaRvgmKetoMEM1RtY=x7S_Fug=6m6CpWGfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, 6 Aug 2017 22:22:28 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> Hey Jean-Yves,

Hey Jay,

> There's an artificial limitation of 65535 peers per interface. This

It should fit in ("only" ~10,000) ;)

> There was somebody on this list who set up thousands of peers and
> thousands of interfaces a while ago, and after handling some issues
> with him, things worked pretty well.

I guess, when you're talking about "thousands of interfaces", you mean
virtual ones ? Do you recall how many machines he was using ?

BTW, for such cases may be it could be interesting to link WG to a
sqlite DB ?

> So, to answer your question: WireGuard should scale quite well, and
> you shouldn't have many problems. But of course let me know if you do.

OK, thanks, that's good to know that it has already be done and help is
around.

JY
