Return-Path: dpx.infinity@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1378453e
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Mar 2017 10:08:38 +0000 (UTC)
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
 [209.85.215.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21cb5b7b
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Mar 2017 10:08:38 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id j90so74383000lfk.2
 for <wireguard@lists.zx2c4.com>; Tue, 14 Mar 2017 03:12:04 -0700 (PDT)
Return-Path: <dpx.infinity@gmail.com>
Message-ID: <1489486302.24652.2.camel@gmail.com>
Subject: Re: Rust implementation status
From: Vladimir Matveev <dpx.infinity@gmail.com>
To: Sascha Grunert <saschagrunert@icloud.com>
Date: Tue, 14 Mar 2017 14:11:42 +0400
In-Reply-To: <80387df1-3237-43a0-adaa-09ffeebbef01@me.com>
References: <80387df1-3237-43a0-adaa-09ffeebbef01@me.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> I just read that there is another WireGuard Rust implementation here:
> https://github.com/sopium/titun/tree/wg

I see. I think that joining efforts would be nice, but, if I understand
it correctly, that project is intended to provide a different
interface, using WG as an underlying protocol. I personally think that
it would be better to separate these layers, providing the connectivity
daemon and higher-level features separately. I may be wrong though, it
is quite possible that the combined approach will be more useful.

> This sounds great, I or we can go forward with that crate if it
> provides
> better error handling.

I have actually submitted a pull request to the github repository
already which does exactly that :)

> I already thought about this but the project owner wants to have a
> single
> place where the sources lives. But mirroring code is possible as
> well,
> like we already do on github: https://github.com/WireGuard/wireguard-
> rs

This is understandable, I think. But still, maybe doing development on
Github and publishing the contents of the repository there to the main
repository is possible? I believe that taking advantage of the issue
tracker and the pull requests system there would be very useful and
convenient.

I actually suggest putting TODO items as issues on Github as the first
step, so it would be clear what should be done next.

> > 4. I think it would be quite idiomatic to split the interface to WG
> > into a separate library crate, which the main binary would depend
> > on.
> 
> Yeah sounds reasonable. Lets look forward to this.

There are several ways to do it, actually. If you don't mind, I may
send a pull request which implements one later.

> The actual implementation follows strictly this guideline:
> https://www.wireguard.io/xplatform/
> Usually I agree in letting the daemon stuff to systemd or something
> else,
> but we want to avoid fragmentation, that different implementations
> behave
> differently.

I'm pretty sure that when WG get popuar, differences in behavior will
be unavoidable. Also, since all of the userspace WG projects seem to be
in quite a flux state now, maybe it is worth considering to change
these guidelines when it is not late yet?

> > 6. Have you decided which cryptographic libraries you are going to
> > use?
> > Or are you planning to implement the necessary primitives in this
> > project?
> 
> Not now, there is no such decision done yet.
> 
> I am looking really further for your contribution, since it is
> currently a "one man show",
> which is pretty though for me.
> 
> I know that a main development on GitHub would spread the project
> better into the
> open source world. Maybe we need to discuss this point at some time.
> 
> Best regards,
> Sascha
> 
> Am 13. März 2017 um 00:10 schrieb Vladimir Matveev <dpx.infinity@gmai
> l.com>:
> 
> > Hi, Sascha,
> > 
> > I'm a Rust programmer, and I really like that there is now a Rust
> > implementation of the Wireguard daemon!
> > 
> > I have a few question and suggestions.
> > 
> > 1. Instead of hand-rolling your own error management
> > implementation,
> > consider using the error-chain[1] crate. It seems that many popular
> > crates now depend on it[2]. It would make the Wireguard crate more
> > interoperable and more readable for those who is already accustomed
> > with error-chain. On the first glance, your custom implementation
> > resembles error-chain very much.
> > 
> > 2. Consider publishing the project on some hosting service like
> > Github
> > or Gitlab or something else, which would allow easier community
> > participation. I would very much like to help with its development,
> > but
> > I never participated in any mailing-list based projects and I
> > personally find it very inconvenient, and I think that the pull
> > requests mechanics is greatly superior. Also, almost all Rust
> > ecosystem
> > lives on Github, so lots of Rust developers are quite accustomed to
> > it,
> > and you will most certainly attract more contributors that way.
> > 
> > 3. On a related note, consider publishing a link to this project in
> > the
> > Rust community, in particular, in the Rust subreddit[3] and maybe
> > on
> > The Rust Programming Language Forum[4]. I think that many people
> > there
> > will be very interested in a project like this, because it is
> > network-
> > related, it is pretty low level, and it will probably depend on the
> > current "hot" crates in the Rust community, like tokio.
> > 
> > 4. I think it would be quite idiomatic to split the interface to WG
> > into a separate library crate, which the main binary would depend
> > on.
> > 
> > 5. I wonder, is it really necessary to perform daemonization
> > manually?
> > As far as I understand the current situation in the daemon writing
> > and
> > init systems, it is expected that daemons won't fork themselves and
> > will continue working in foreground when started, while service
> > management systems like systemd or launchd will take care of
> > keeping
> > them alive, collecting logs, starting, restarting, etc. Daemonizing
> > also seems quite unidiomatic on Windows. I also personally think
> > that
> > avoiding manual daemonization will make the code and architecture
> > simpler and more manageable.
> > 
> > 6. Have you decided which cryptographic libraries you are going to
> > use?
> > Or are you planning to implement the necessary primitives in this
> > project?
> > 
> > I'm really looking forward to the further development of this
> > project,
> > and I'm willing to participate in it if you're looking for
> > contributors.
> > 
> > Best regards,
> > Vladimir
> > 
> > [1]: https://crates.io/crates/error-chain
> > [2]: https://crates.io/crates/error-chain/reverse_dependencies
> > [3]: https://www.reddit.com/r/rust/
> > [4]: https://users.rust-lang.org/
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
