Return-Path: aranea@aixah.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e72f72d
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 18:54:33 +0000 (UTC)
Received: from wp260.webpack.hosteurope.de (wp260.webpack.hosteurope.de
 [80.237.133.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 215e3082
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 18:54:33 +0000 (UTC)
Date: Mon, 26 Mar 2018 21:06:24 +0200
From: Luis Ressel <aranea@aixah.de>
To: ST <smntov@gmail.com>
Subject: Re: WG: ideas/features
Message-ID: <20180326210624.20c39ed5@vega.skynet.aixah.de>
In-Reply-To: <1522084637.2044.53.camel@gmail.com>
References: <1522084637.2044.53.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, 26 Mar 2018 20:17:17 +0300
ST <smntov@gmail.com> wrote:

> Hello,
> 
> as I mentioned before I'm learning WireGuard and there are certain
> things that I need but didn't find them yet in the docs (either
> because I didn't read enough yet or because it's just not there).
> I'll list them here and you'll tell whether it is worth for a new
> feature or not; or whether I should continue reading...

Don't ask whether you should read the docs. Of course you should,
that's the whole purpose of documentation! :)

> 1. Labels.
> 
> Is it possible to add an optional label to a peer to make it a bit
> more usable for humans (who tend not to remember IPs or keys). A label
> associated with a peer is just a string (could be a first/last name,
> email, "NY Office" or whatever). So if you read through the .conf file
> or query wg for that label - you can get the right IP to SSH to, if
> needed.

This has been suggested a few times already, but so far noone has
bothered to implement it. I don't see any fundamental issues with the
idea, though.

> In the .conf file it could probably be realized through some sort of
> comments before each [Peer] section (didn't check whether # or
> something actually work). But querying wg from command line for a
> label is also handy...

As documented in wg(8), wireguard's config files can indeed contain
comments.

> 
> 2. Includes in .conf files.
> 
> Is it possible to include .conf files in the main wg0.conf file? Like:
> 
> [Interface]
> ...
> 
> Include ./us_peers.conf
> Include ./eu_peers.conf
> 
> [Peer]
> ...
> 
> This way you can group peers into pools, so there will be a bit more
> order/structure...

The config parser doesn't support file inclusion. It doesn't seem to be
worth the hassle to add it either, since there's another way to combine
multiple config files: wg's "addconf" verb. It'll load a config file
without wiping out prior configuration, so you can combine config files
by chaining multiple "wg addconf" verbs.

If atomicity is desired, you could also concatenate the config files to
a temporary file which you then supply to wg setconf (or perhaps even
pipe the concatenated files to "wg setconf /proc/self/fd/0").

Cheers,
Luis
