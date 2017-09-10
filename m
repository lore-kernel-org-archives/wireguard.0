Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2702cfc
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 14:00:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5613fbd
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 14:00:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 859b3db1
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 14:19:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id aee55069
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 14:19:19 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id r20so34892545oie.0
 for <wireguard@lists.zx2c4.com>; Sun, 10 Sep 2017 07:26:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <07621915-a53a-03f3-9c75-b7e7d188d109@gmail.com>
References: <1e1740c3-f8cf-2ee2-d842-749b687cb737@gmail.com>
 <CAHmME9ptrCHRbAXpztbveMrHZ-nSOwadgX0vfnmDgKrGE_ge7g@mail.gmail.com>
 <07621915-a53a-03f3-9c75-b7e7d188d109@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 10 Sep 2017 16:26:14 +0200
Message-ID: <CAHmME9qEcQhsCSGxXydOkcJYjWJYw89_36KSuswHPyCu9ixtpg@mail.gmail.com>
Subject: Re: Timing issue (?) with wg-quick up on Raspberry Pi B+
To: Jim Darby <uberscubajim@gmail.com>
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

On Sun, Sep 10, 2017 at 3:09 PM, Jim Darby <uberscubajim@gmail.com> wrote:
> However, your comment about network management daemons running is most
> interesting. Here's an extract from journalctl's output:
> Sep 09 21:31:28 janus ifplugd(wg0)[6903]: Executing
> '/etc/ifplugd/ifplugd.action wg0 up'.
> Sep 09 21:31:28 janus ifplugd(wg0)[6903]: client: Ignoring unknown interface
> wg0=wg0.

That is interesting. Thanks for that. Indeed it looks like ifplugd is
just calling ifup wg0, and I'm not totally sure why that would remove
an IP address if there's nothing in /etc/network/interfaces, though
I'm not a huge Debian person so there could be a detail I'm
overlooking.

Another more direct way that might help debug this is `ip monitor
all`. On my (working) system, running `ip monitor all` in one window
and `wg-quick up martino` in another yields this:

[NETCONF]ipv4 dev martino forwarding off rp_filter loose mc_forwarding
off proxy_neigh off ignore_routes_with_linkdown off
[NETCONF]ipv6 dev martino forwarding off mc_forwarding off proxy_neigh
off ignore_routes_with_linkdown off
[LINK]107: martino: <POINTOPOINT,NOARP,200000> mtu 1420 qdisc noop
state DOWN group default
   link/none
[ADDR]107: martino    inet 10.10.11.100/32 scope global martino
      valid_lft forever preferred_lft forever
[ROUTE]local 10.10.11.100 dev martino table local proto kernel scope
host src 10.10.11.100
[ROUTE]ff00::/8 dev martino table local metric 256 linkdown pref medium
[ROUTE]2a01:e35:8be7:9122:100::/96 dev martino proto kernel metric 256
linkdown pref medium
[ADDR]107: martino    inet6 2a01:e35:8be7:9122:100::1/96 scope global
      valid_lft forever preferred_lft forever
[ROUTE]local 2a01:e35:8be7:9122:100::1 dev lo table local proto kernel
metric 0 pref medium
[LINK]107: martino: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc
noqueue state UNKNOWN group default
   link/none
[ROUTE]default dev martino table 51820 metric 1024 pref medium
[RULE]32765:    not from all fwmark 0xca6c lookup 51820
[RULE]32764:    from all lookup main suppress_prefixlength 0
[ROUTE]default dev martino table 51820 scope link
[RULE]32765:    not from all fwmark 0xca6c lookup 51820
[RULE]32764:    from all lookup main suppress_prefixlength 0

If I then type in `ip addr flush dev martino`, I get this:

[ADDR]Deleted 107: martino    inet 10.10.11.100/32 scope global martino
      valid_lft forever preferred_lft forever
[ROUTE]Deleted local 10.10.11.100 dev martino table local proto kernel
scope host src 10.10.11.100
[NEIGH]Deleted 10.10.11.1 dev martino lladdr 08 NOARP
[NEIGH]Deleted 66.102.1.127 dev martino lladdr 08 NOARP
[NEIGH]Deleted 52.205.56.176 dev martino lladdr 08 NOARP
[ADDR]Deleted 107: martino    inet6 2a01:e35:8be7:9122:100::1/96 scope global
      valid_lft forever preferred_lft forever
[ROUTE]Deleted local 2a01:e35:8be7:9122:100::1 dev lo table local
proto kernel metric 0 pref medium
[ROUTE]Deleted 2a01:e35:8be7:9122:100::/96 dev martino proto kernel
metric 256 pref medium

So, it remains to be seen whether or not something else in userspace
is actually interacting with the interface. Once we figure out what,
we might be able to monitor all callers of those netlink commands.
