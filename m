Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92e5b2f2
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 16:00:24 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4400eafe
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 16:00:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a5231d4
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 16:00:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8c294c1a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 16:00:24 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id f82so32709678wmf.1
 for <wireguard@lists.zx2c4.com>; Thu, 08 Dec 2016 08:05:57 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 8 Dec 2016 17:05:55 +0100
Message-ID: <CAHmME9onu98F=qP0PM7_82VkxgwOK+nWBokX1iBhwKiGc5uVAg@mail.gmail.com>
Subject: New contrib/ Utility: wg-config
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey guys,

The primary means of configuring wireguard is wg(8) for the
wireguard-specific stuff and ip(8) for the rest. The eventual goal has
always been to fold the wg(8) functionality into ip(8) upstream. This
goal still remains, but the time for that is not yet now. Because of
that, wg(8) remains a pretty barebones utility; it exists to only
control the wireguard-specific aspects of a network interface.
Maintaining that distinction with ip(8) has always been an important
design decision that I believe will benefit us long term.

This means, however, that you can't stick your IP addresses and
additional routes and whatever other interface settings inside a
configuration file, and then call wg(8) on it. You have to also call
ip(8). What a hassle! My general response to this has been that it's
the job of the various project and distribution network managers --
netifd, ifupdown, networkmanager, systemd-networkd, connman, netifrc,
whatever other network manager or shell script you're using. And as a
result there's been good progress getting WireGuard integrated into
the various managers.

That still leaves the DIY segment (which includes myself), who want to
configure their VPNs without managers. There are also people who wish
to bring up WireGuard not from a network manager but rather from an
inits cript or service unit.

For people who want a robust solution for routing _all_ their traffic
over WireGuard, I still recommend using the network namespace tricks,
which I've outlined here -- https://www.wireguard.io/netns/ -- that
includes the wgphys script at the end. This is a really nice solution
that I highly recommend.

For other users who simply want to have config files that list the
usual WireGuard configuration info plus the addresses and routes, I've
made a new utility in contrib/ called `wg-config`. It's a very simple
shell script, which should be useful in a variety of situations. It
lives in examples/ because it's intended mostly as a rough outline of
what you could do and what sort of features you might want. But
perhaps you'll find this useful for something.

https://git.zx2c4.com/WireGuard/tree/contrib/examples/wg-config

Enjoy,
Jason

== Installation ==

    # make install

== Usage ==

wg-config is a very simple utility for adding and configuring WireGuard
interfaces using ip(8) and wg(8).

Usage: wg-config [ add | del ] INTERFACE [arguments...]

  wg-config add INTERFACE --config=CONFIG_FILE [--address=ADDRESS/CIDR...]
               [--route=ROUTE/CIDR...] [--no-auto-route-from-allowed-ips]
               [--env-file=ENV_FILE]

    The add subcommand adds a new WireGuard interface, INTERFACE, replacing
    any existing interfaces of the same name. The --config argument is
    required, and its argument is passed to wg(8)'s setconf subcommand. The
    --address argument(s) is recommended for this utility to be useful. The
    --route argument is purely optional, as by default this utility will
    automatically add routes implied by --address and as implied by the
    allowed-ip entries inside the --config file. To disable this automatic
    route adding, you may use the option entitled
--no-auto-route-from-allowed-ips.

  wg-config del INTERFACE [--config=CONFIG_FILE_TO_SAVE] [--env-file=ENV_FILE]

    The del subcommand removes an existing WireGuard interface. If the
    optional --config is specified, then the existing configuration is
    written out to the file specified, via wg(8)'s showconf subcommand.

Both `add' and del' take the --env-file=ENV_FILE option. If specified,
the contents of ENV_FILE are imported into wg-config. This can be used to
set variables in a file, instead of needing to pass them on the command
line. The following table shows the relation between the command line
options described above, and variables that may be declared in ENV_FILE:

  --address=A, --address=B, --address=C       ADDRESSES=( "A" "B" "C" )
  --route=A, --route=B, --route=C             ADDITIONAL_ROUTES=( "A" "B" "C" )
  --config-file=F                             CONFIG_FILE="F"
  --no-auto-route-from-allowed-ips            AUTO_ROUTE=0


== Helper Tool ==

tungate is a separate utility, developed originally not explicitly for
WireGuard, which acts as a poor man's way of ensuring 0/1 and 128/1 default
route overrides still work with an endpoint going over the original default
route. It's quite handy, and wg-config makes use of it for dealing with
0.0.0.0/0 routes. At the moment it only supports IPv4, but adding IPv6
should be pretty easy.
