Return-Path: bounce+1a9445.bb0-wireguard=lists.zx2c4.com@poorlab.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50616a13
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 19:44:56 +0000 (UTC)
Received: from m32-4.eu.mailgun.net (m32-4.eu.mailgun.net [141.193.32.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d9ea3b1
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 19:44:56 +0000 (UTC)
Sender: coder@poorlab.com
Received: by mail-qk0-f182.google.com with SMTP id 191-v6so9651703qki.13
 for <wireguard@lists.zx2c4.com>; Sun, 12 Aug 2018 12:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7UkwLpoa_n87PKghohdGc5JVpYJdjAB1a8NUpYjx35o5nPWw@mail.gmail.com>
 <20180813000611.3296fa66@natsu>
In-Reply-To: <20180813000611.3296fa66@natsu>
From: StarBrilliant <coder@poorlab.com>
Date: Mon, 13 Aug 2018 05:55:59 +1000
Message-ID: <CA+7UkwKAHjQupRegijs-N6Jxp6r=hmZCt7Kj2goYPdziREeANA@mail.gmail.com>
Subject: Re: Fragmentation on UDP layer possible?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Aug 13, 2018 at 5:06 AM Roman Mamedov <rm@romanrm.net> wrote:
>
> On Mon, 13 Aug 2018 02:53:44 +1000
> StarBrilliant <coder@poorlab.com> wrote:
>
> > I know Wireguard can already do IP layer fragmentation. (Just set
> > tunnel MTU >= 1441 then fragmentation will be turned on)
>
> Is that really expected to work? I tried setting MTU 9000 on both ends of a WG
> tunnel, but large packets still do not seem to come through properly. Did you
> try using it like that in any kind of environment (aside from that one
> restrictive network)?
>
> In theory using MTU 9000 or such would help lower the huge overhead percentage
> of running IP over VXLAN over IP over WG over IP. I was looking into that the
> other day, but my idea was to fragment VXLAN packets across multiple WG ones,
> which turned out to be impossible (VXLAN RFC forbids fragmentation).

I have succeeded in setting a MTU of 1966 bytes inside VXLAN with a
non-restrictive Ethernet.
Due to a Linux bug, you need to do "sudo ethtool -K vxlan0 rx off tx
off", or all UDP packets will have wrong checksums and being dropped.

You might want to check my project on generating a Wireguard+VXLAN
with a tool https://github.com/m13253/VxWireguard-Generator
(Note that this is not production-ready. In other words, please back
up your main database often)
