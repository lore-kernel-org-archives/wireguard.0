Return-Path: stefan@agner.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95090e26
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 May 2017 03:23:01 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eeb5a8e0
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 May 2017 03:23:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 14 May 2017 20:33:27 -0700
From: Stefan Agner <stefan@agner.ch>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: WireGuard recipes for OpenEmbedded
In-Reply-To: <CAHmME9qrvAsNTEvW=a8wBQbOu38uTxZE0D2Wa_bbPfM7x45ZyA@mail.gmail.com>
References: <a994fb2505af736da73a956fdee94128@agner.ch>
 <CAHmME9qrvAsNTEvW=a8wBQbOu38uTxZE0D2Wa_bbPfM7x45ZyA@mail.gmail.com>
Message-ID: <a78f7ef04df7ebb7f12e2be5456bd9fb@agner.ch>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

On 2017-04-04 06:28, Jason A. Donenfeld wrote:
> Hey Stefan,
> 
> Very cool! Thanks for posting it. Let me know when it gets accepted,
> and we can add official instructions for the package on
> wireguard.io/install/ .

The recipes are now in the OpenEmbedded pyro and master branch. The pyro
branch should end up in the next Yocto release soon (Yocto 2.3).

As for the "installation instructions", since this is meta distribution
people will have to build from source... Not sure what you would like to
add there. Adding IMAGE_INSTALL_append = " wireguard-tools" to
conf/local.conf and building using "bitbake core-image-minimal" is
probably the shortest path to build a complete image with wireguard.

--
Stefan
