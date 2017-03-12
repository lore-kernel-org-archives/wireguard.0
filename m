Return-Path: dpx.infinity@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02f1abb7
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Mar 2017 23:06:48 +0000 (UTC)
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
 [209.85.215.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad8d7902
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Mar 2017 23:06:48 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id j90so57498771lfk.2
 for <wireguard@lists.zx2c4.com>; Sun, 12 Mar 2017 16:10:03 -0700 (PDT)
Return-Path: <dpx.infinity@gmail.com>
Received: from diamond.local ([176.15.113.42])
 by smtp.googlemail.com with ESMTPSA id h140sm3261589lfg.39.2017.03.12.16.10.00
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 12 Mar 2017 16:10:01 -0700 (PDT)
Message-ID: <1489360183.27524.3.camel@gmail.com>
Subject: Re: Rust implementation status
From: Vladimir Matveev <dpx.infinity@gmail.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Date: Mon, 13 Mar 2017 03:09:43 +0400
In-Reply-To: <E63B612D-BFAA-48FE-A352-25B4C11B8E05@icloud.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi, Sascha,

I'm a Rust programmer, and I really like that there is now a Rust
implementation of the Wireguard daemon!

I have a few question and suggestions.

1. Instead of hand-rolling your own error management implementation,
consider using the error-chain[1] crate. It seems that many popular
crates now depend on it[2]. It would make the Wireguard crate more
interoperable and more readable for those who is already accustomed
with error-chain. On the first glance, your custom implementation
resembles error-chain very much.

2. Consider publishing the project on some hosting service like Github
or Gitlab or something else, which would allow easier community
participation. I would very much like to help with its development, but
I never participated in any mailing-list based projects and I
personally find it very inconvenient, and I think that the pull
requests mechanics is greatly superior. Also, almost all Rust ecosystem
lives on Github, so lots of Rust developers are quite accustomed to it,
and you will most certainly attract more contributors that way.

3. On a related note, consider publishing a link to this project in the
Rust community, in particular, in the Rust subreddit[3] and maybe on
The Rust Programming Language Forum[4]. I think that many people there
will be very interested in a project like this, because it is network-
related, it is pretty low level, and it will probably depend on the
current "hot" crates in the Rust community, like tokio.

4. I think it would be quite idiomatic to split the interface to WG
into a separate library crate, which the main binary would depend on.

5. I wonder, is it really necessary to perform daemonization manually?
As far as I understand the current situation in the daemon writing and
init systems, it is expected that daemons won't fork themselves and
will continue working in foreground when started, while service
management systems like systemd or launchd will take care of keeping
them alive, collecting logs, starting, restarting, etc. Daemonizing
also seems quite unidiomatic on Windows. I also personally think that
avoiding manual daemonization will make the code and architecture
simpler and more manageable.

6. Have you decided which cryptographic libraries you are going to use?
Or are you planning to implement the necessary primitives in this
project?

I'm really looking forward to the further development of this project,
and I'm willing to participate in it if you're looking for
contributors.

Best regards,
Vladimir

  [1]: https://crates.io/crates/error-chain
  [2]: https://crates.io/crates/error-chain/reverse_dependencies
  [3]: https://www.reddit.com/r/rust/
  [4]: https://users.rust-lang.org/
