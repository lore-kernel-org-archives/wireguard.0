Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a1e3aad
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Oct 2017 18:13:22 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 8edc588b
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Oct 2017 18:13:22 +0000 (UTC)
Date: Fri, 20 Oct 2017 13:06:03 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: crypto routing with subnets?
Message-ID: <20171020180603.GA24912@wolff.to>
References: <20171020173941.GA23750@wolff.to>
 <CAHmME9rf2+S_pJqpGPPq+BXzMWTVyF92W2bVT904teHhVhJHoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9rf2+S_pJqpGPPq+BXzMWTVyF92W2bVT904teHhVhJHoQ@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Oct 20, 2017 at 20:02:43 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>Hi Bruno,
>
>Fortunately the inquires of this email are things that you could
>figure out simply by trying, so if you want to learn-by-doing, you can
>stop reading here and finish reading afterward.

I'm doing that too. Though I can't test the full set up right now as I 
can't safely change the router firmware until I get home.

>
>Here are the solutions:
>
>1. A peer is its public key, which means you can't have two different
>peers with the same key, since they'd be the same peer. In essence
>you're asking for a==a&&a!=a, which is always false.

I mostly wanted to make sure I had a correct mental model for how this 
worked. It seemed like it had to be that way.

>2. Traffic will always go to the most specific route, which means the
>/32 will take precedence over the /16.

For this one, I was a bit worried that it might work sometimes, but have 
problems later as I couldn't find an explicit answer in the documentation 
(I might have missed it.) saying it worked like normal network routing. The 
examples I saw were all disjoint networks.

Thank you for the clarifications.
