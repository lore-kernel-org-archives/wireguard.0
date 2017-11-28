Return-Path: pageexec@freemail.hu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b4a82dd
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 12:26:17 +0000 (UTC)
Received: from r00tworld.com (r00tworld.com [212.85.137.150])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41ea4d39
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 12:26:17 +0000 (UTC)
From: "PaX Team" <pageexec@freemail.hu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Nov 2017 13:32:01 +0100
MIME-Version: 1.0
Subject: Re: imer_setup() is not compatible with PaX's RAP
Message-ID: <5A1D5741.21951.47BB55BB@pageexec.freemail.hu>
In-reply-to: <CAHmME9oL=p3snOEWevyqHYSy3yjdpDrtyQYViT__9BxJYU=1cw@mail.gmail.com>
References: <20171111080920.GA5705@localhost.localdomain>,
 <5A0ACF98.2734.3D2AE425@pageexec.freemail.hu>,
 <CAHmME9oL=p3snOEWevyqHYSy3yjdpDrtyQYViT__9BxJYU=1cw@mail.gmail.com>
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

On 28 Nov 2017 at 13:20, Jason A. Donenfeld wrote:

> Hey Pipacs,
> 
> A user on IRC found another issue. This time it looks like it might be
> a RAP bug, though. Below is the error output. So far as I can see, the
> function pointer type and the function declaration match fine.
> However, the function itself is implemented in assembly, which means
> it can't itself be instrumented by RAP. What to do?

targets of indirect calls must be marked by the RAP hash which the plugin
will do for code it sees but for asm you'll have to do it yourself, look at
the use of RAP_ENTRY to see how that works.
