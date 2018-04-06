Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad6a8fc1
 for <wireguard@lists.zx2c4.com>; Fri, 6 Apr 2018 17:46:38 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efbbd2d5
 for <wireguard@lists.zx2c4.com>; Fri, 6 Apr 2018 17:46:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d34ffe7c
 for <wireguard@lists.zx2c4.com>; Fri, 6 Apr 2018 17:37:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 63b2244c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Apr 2018 17:37:46 +0000 (UTC)
Received: by mail-ot0-f178.google.com with SMTP id 23-v6so2091001otj.0
 for <wireguard@lists.zx2c4.com>; Fri, 06 Apr 2018 10:59:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
References: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Apr 2018 19:59:54 +0200
Message-ID: <CAHmME9racrutSPmM_Oy6eHAx3B=ah1=xzchzb_msZ5F9Zf-rGA@mail.gmail.com>
Subject: Re: Using WG for transport security in a p2p network
To: Ximin Luo <ximin@dfinity.org>
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

Hi Ximin,

On Thu, Apr 5, 2018 at 5:22 AM, Ximin Luo <ximin@dfinity.org> wrote:
> Our usage would indeed involve setting up and tearing down interfaces ~30
> times
> a week in an automated fashion, which might be "strange" going by the above.

No certainly not strange. Actually, there's no amount of setting up
and tearing down that should be considered a bad thing. I have a
script I run during development that sets up thousands of interfaces,
each with hundreds of thousands of peers, connects them to each other,
and then toggles everything up and down over and over. I have another
script that just adds and removes interfaces really fast. The purpose
is to stress test WireGuard to ensure it's resilient in these types of
configurations. So... I think you should be good with a mere 30 a week
;-).

>
> I'm also wondering how easy this would be to program. It would clearly be
> much
> more heavyweight than simply opening a socket, but I guess it can be done
> via
> invocations of the `wg` or `wg-quick` tools. Has anyone had any experience
> with
> this level of WG automation, could you share your thoughts? Would the
> program
> need any extra system-level privileges? Ideally we wouldn't need root, of
> course - does that mean we're forced to wait for a userspace WG library such
> as
> wireguard-rs? I understand there is a performance penalty here, but I'd have
> to
> run benchmarks to know if this affects our use-case significantly.

The overhead and performance penalty is minimal, and you should easily
be able to get away with doing this. You can script it pretty easily
using wg (it needs only CAP_NET_ADMIN), or if you want closer
integration and more sophisticated priv separation, you could open the
netlink socket, then drop privs, and use something like the
embeddable-wg-library to automate everything:
https://git.zx2c4.com/WireGuard/tree/contrib/examples/embeddable-wg-library


Let me know if you have any more questions or ways in which I can help
you guys out with the p2p protocol.

Regards,
Jason
