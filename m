Return-Path: pageexec@freemail.hu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69c9887e
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 11:08:30 +0000 (UTC)
Received: from r00tworld.com (r00tworld.com [212.85.137.150])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43c2d1f7
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 11:08:29 +0000 (UTC)
From: "PaX Team" <pageexec@freemail.hu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 14 Nov 2017 12:12:24 +0100
MIME-Version: 1.0
Subject: Re: imer_setup() is not compatible with PaX's RAP
Message-ID: <5A0ACF98.2734.3D2AE425@pageexec.freemail.hu>
In-reply-to: <CAHmME9prMg_RuEUaO1XNy4Aj6MH3Cu=16kp=F_B-kKbSwO+qdQ@mail.gmail.com>
References: <20171111080920.GA5705@localhost.localdomain>,
 <5A0A3587.25804.3AD10FF8@pageexec.freemail.hu>,
 <CAHmME9prMg_RuEUaO1XNy4Aj6MH3Cu=16kp=F_B-kKbSwO+qdQ@mail.gmail.com>
Content-type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: pageexec@freemail.hu
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 14 Nov 2017 at 10:29, Jason A. Donenfeld wrote:

> I fixed things up here:
> https://git.zx2c4.com/WireGuard/commit/?id=df318d1f0526663a2d92439376379e32ebcfef1a

works fine, thanks.

> > speaking of PaX support, you recently added some __ro_after_init wrapper
> > to wireguard which breaks under KERNEXEC when it's used on ops structs
> > (my __read_only has different semantics) so i have to revert it here but
> > it'd be nicer if you didn't define it when KERNEXEC is active.
> 
> So what exactly should I be fixing? I think in that last patch I
> forgot to redefine it to be empty. Would this do what you have in
> mind:

i said 'don't define it', not 'redefine it' ;). the difference is that the
latter removes the definition provided under KERNEXEC.
