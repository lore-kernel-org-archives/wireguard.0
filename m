Return-Path: ygh@mysterious.site
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2d58fa6
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Mar 2017 16:25:53 +0000 (UTC)
Received: from sender-of-o52.zoho.com (sender-of-o52.zoho.com [135.84.80.217])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5b72905
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Mar 2017 16:25:53 +0000 (UTC)
Date: Wed, 15 Mar 2017 01:29:12 +0900
From: sopium <sopium@mysterious.site>
To: "Sascha Grunert" <saschagrunert@icloud.com>
Message-ID: <15acda6e9bc.b852f6478142.4195445703657110954@mysterious.site>
In-Reply-To: <E63B612D-BFAA-48FE-A352-25B4C11B8E05@icloud.com>
References: <E63B612D-BFAA-48FE-A352-25B4C11B8E05@icloud.com>
Subject: Re: Rust implementation status
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Sascha and folks,

 ---- On Sun, 05 Mar 2017 20:42:00 +0900 Sascha Grunert <saschagrunert@iclo=
ud.com> wrote ----=20
 > Hey folks,=20
 > =20
 > I want to call for participation of the Rust userspace implementation of=
 WireGuard. The template for the initial implementation was this: https://w=
ww.wireguard.io/xplatform/ and can be found here: https://git.zx2c4.com/wir=
eguard-rs/.=20
 > =20
 > What works for now:=20
 > =20
 > - A main working executable (`cargo run -- -h`) which parses the command=
 line parameters via the `clap` crate=20
 > - General debug and tracing support via the `log` crate=20
 > - Daemonizing support=20
 > - The wireguard library which creates a local socket and waits for incom=
ing connections (reference implementation)=20
 >
 > [...]

I have kept an eye on this. It seems that you were mostly working
on the `xplatform` stuff, and haven't started on the actual
implementation of the protocol yet. My code has (partly)
implemented the protocol, but lacks the `xplatform` ui. So it
seems like a perfect time to merge efforts. What do you think?

And to all who are interested in userspace WG impls, in
particular Rust impls, I have adjusted the goal of my project to
=E2=80=9Cto write a secure, compatible, cross-platform and reasonably
fast user-space implementation of WireGuard in Rust=E2=80=9D. I am also
committed to finishing and maintaining it. There is a big TODO
list, and contribution is welcome!

For those not closely following this thread, the project is at:

  https://github.com/sopium/titun/tree/wg

Regards,
Sopium
