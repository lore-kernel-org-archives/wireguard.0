Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1597c5c0
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 08:17:04 +0000 (UTC)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
 [209.85.218.51])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 653c9b73
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 08:17:04 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id e79so4012102oih.1
 for <wireguard@lists.zx2c4.com>; Fri, 16 Mar 2018 01:27:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180316130222.3a9d0611@natsu>
References: <20180316130222.3a9d0611@natsu>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Fri, 16 Mar 2018 09:27:19 +0100
Message-ID: <CAKXLc7eHSYh0oUBA+5U0LeyBDytAPfGvveHkhV4XbNy7c_C48g@mail.gmail.com>
Subject: Re: Include directive to support "conf.d/*" and the like
To: Roman Mamedov <rm.wg@romanrm.net>
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

On Fri, Mar 16, 2018 at 9:02 AM, Roman Mamedov <rm.wg@romanrm.net> wrote:
> I would like to be able to split the [Interface] and [Peer] parts of the config
> file into separate files. The reason is that currently I manage configurations
> of my various hosts at a central location, then push out common configs to all
> hosts.
>
BTW, this is the default in Gentoo at the moment... e.g.
# fgrep wg49 /etc/conf.d/net
/etc/conf.d/net:config_wg49="10.1.8.1/16"
/etc/conf.d/net:wireguard_wg49="/etc/wireguard/wg49.conf"

... and I often hate it :-)
In a way it is in a way "include", basically IP address and additional
routing is configured as with any other interface, but WG specific
part (ListenPort,PrivateKey,PublicKey,AllowedIPs,Endpoint) in another,
_interface_specific_ file...

This currently seems to make impossible to use standard
`/etc/init.d/net.wg?? start|stop` mechanism along `wg-quick` commands
(e.g. Address cannot be specified in "/etc/wireguard/wg49.conf").

There was somewhat related discussion few months ago about the
difference between configuration and state (`running config` as Cisco
names it) and them being somewhat mixed.

I guess this part may need reworking, but that should involve at least
a few distributions with a few subsystems (e.g. initrc and systemd
alonng wg-quick) that may be incompatible, so it is a hard task.

Cheers,
Kalin.
