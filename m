Return-Path: uberscubajim@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eeed324e
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 14:42:51 +0000 (UTC)
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af79ef83
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 14:42:50 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id i189so25250633wmf.1
 for <wireguard@lists.zx2c4.com>; Sun, 10 Sep 2017 08:08:50 -0700 (PDT)
Return-Path: <uberscubajim@gmail.com>
Subject: Re: Timing issue (?) with wg-quick up on Raspberry Pi B+
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <1e1740c3-f8cf-2ee2-d842-749b687cb737@gmail.com>
 <CAHmME9ptrCHRbAXpztbveMrHZ-nSOwadgX0vfnmDgKrGE_ge7g@mail.gmail.com>
 <07621915-a53a-03f3-9c75-b7e7d188d109@gmail.com>
 <CAHmME9qEcQhsCSGxXydOkcJYjWJYw89_36KSuswHPyCu9ixtpg@mail.gmail.com>
From: Jim Darby <uberscubajim@gmail.com>
Message-ID: <a96000f1-25ac-03c0-5f07-5a9e0d09d485@gmail.com>
Date: Sun, 10 Sep 2017 16:08:48 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9qEcQhsCSGxXydOkcJYjWJYw89_36KSuswHPyCu9ixtpg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------2078686C97A9ACA4CCCDA0C5"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------2078686C97A9ACA4CCCDA0C5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

The plot thickens! Here's the output from ip monitor all:

    [NETCONF]ipv4 dev wg0 forwarding on rp_filter strict mc_forwarding 0
    proxy_neigh off
    [NETCONF]ipv6 dev wg0 forwarding off mc_forwarding 0 proxy_neigh off
    [LINK]27: wg0: <POINTOPOINT,NOARP,200000> mtu 1420 qdisc noop state
    DOWN group default
         link/none
    [ADDR]27: wg0    inet 192.168.2.3/32 scope global wg0
            valid_lft forever preferred_lft forever
    [ROUTE]local 192.168.2.3 dev wg0  table local  proto kernel scope
    host  src 192.168.2.3
    [ADDR]Deleted 27: wg0    inet 192.168.2.3/32 scope global wg0
            valid_lft forever preferred_lft forever
    [ROUTE]Deleted local 192.168.2.3 dev wg0  table local  proto kernel 
    scope host  src 192.168.2.3
    [LINK]27: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc
    noqueue state UNKNOWN group default
         link/none
    [ROUTE]ff00::/8 dev wg0  table local  metric 256
    [LINK]27: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 state UNKNOWN
         link/none
    [LINK]27: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc
    noqueue state UNKNOWN group default
         link/none
    [ROUTE]192.168.2.0/24 dev wg0  scope link

The route delete on the sixth line is most interesting. I wonder where 
it came from? I'll try it one some Debian 8 machines and see what 
happens. So far it's /only/ Debain 9 that seems to have the issue.

Jim.


On 10/09/17 15:26, Jason A. Donenfeld wrote:
> On Sun, Sep 10, 2017 at 3:09 PM, Jim Darby <uberscubajim@gmail.com> wrote:
>> However, your comment about network management daemons running is most
>> interesting. Here's an extract from journalctl's output:
>> Sep 09 21:31:28 janus ifplugd(wg0)[6903]: Executing
>> '/etc/ifplugd/ifplugd.action wg0 up'.
>> Sep 09 21:31:28 janus ifplugd(wg0)[6903]: client: Ignoring unknown interface
>> wg0=wg0.
> That is interesting. Thanks for that. Indeed it looks like ifplugd is
> just calling ifup wg0, and I'm not totally sure why that would remove
> an IP address if there's nothing in /etc/network/interfaces, though
> I'm not a huge Debian person so there could be a detail I'm
> overlooking.
>
> Another more direct way that might help debug this is `ip monitor
> all`. On my (working) system, running `ip monitor all` in one window
> and `wg-quick up martino` in another yields this:
>
> [NETCONF]ipv4 dev martino forwarding off rp_filter loose mc_forwarding
> off proxy_neigh off ignore_routes_with_linkdown off
> [NETCONF]ipv6 dev martino forwarding off mc_forwarding off proxy_neigh
> off ignore_routes_with_linkdown off
> [LINK]107: martino: <POINTOPOINT,NOARP,200000> mtu 1420 qdisc noop
> state DOWN group default
>     link/none
> [ADDR]107: martino    inet 10.10.11.100/32 scope global martino
>        valid_lft forever preferred_lft forever
> [ROUTE]local 10.10.11.100 dev martino table local proto kernel scope
> host src 10.10.11.100
> [ROUTE]ff00::/8 dev martino table local metric 256 linkdown pref medium
> [ROUTE]2a01:e35:8be7:9122:100::/96 dev martino proto kernel metric 256
> linkdown pref medium
> [ADDR]107: martino    inet6 2a01:e35:8be7:9122:100::1/96 scope global
>        valid_lft forever preferred_lft forever
> [ROUTE]local 2a01:e35:8be7:9122:100::1 dev lo table local proto kernel
> metric 0 pref medium
> [LINK]107: martino: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc
> noqueue state UNKNOWN group default
>     link/none
> [ROUTE]default dev martino table 51820 metric 1024 pref medium
> [RULE]32765:    not from all fwmark 0xca6c lookup 51820
> [RULE]32764:    from all lookup main suppress_prefixlength 0
> [ROUTE]default dev martino table 51820 scope link
> [RULE]32765:    not from all fwmark 0xca6c lookup 51820
> [RULE]32764:    from all lookup main suppress_prefixlength 0
>
> If I then type in `ip addr flush dev martino`, I get this:
>
> [ADDR]Deleted 107: martino    inet 10.10.11.100/32 scope global martino
>        valid_lft forever preferred_lft forever
> [ROUTE]Deleted local 10.10.11.100 dev martino table local proto kernel
> scope host src 10.10.11.100
> [NEIGH]Deleted 10.10.11.1 dev martino lladdr 08 NOARP
> [NEIGH]Deleted 66.102.1.127 dev martino lladdr 08 NOARP
> [NEIGH]Deleted 52.205.56.176 dev martino lladdr 08 NOARP
> [ADDR]Deleted 107: martino    inet6 2a01:e35:8be7:9122:100::1/96 scope global
>        valid_lft forever preferred_lft forever
> [ROUTE]Deleted local 2a01:e35:8be7:9122:100::1 dev lo table local
> proto kernel metric 0 pref medium
> [ROUTE]Deleted 2a01:e35:8be7:9122:100::/96 dev martino proto kernel
> metric 256 pref medium
>
> So, it remains to be seen whether or not something else in userspace
> is actually interacting with the interface. Once we figure out what,
> we might be able to monitor all callers of those netlink commands.


--------------2078686C97A9ACA4CCCDA0C5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000099" bgcolor="#FFFFFF">
    <p><font face="Verdana">The plot thickens! Here's the output from ip
        monitor all:</font></p>
    <blockquote>
      <p>[NETCONF]ipv4 dev wg0 forwarding on rp_filter strict
        mc_forwarding 0 proxy_neigh off <br>
        [NETCONF]ipv6 dev wg0 forwarding off mc_forwarding 0 proxy_neigh
        off <br>
        [LINK]27: wg0: &lt;POINTOPOINT,NOARP,200000&gt; mtu 1420 qdisc
        noop state DOWN group default <br>
            link/none <br>
        [ADDR]27: wg0    inet 192.168.2.3/32 scope global wg0<br>
               valid_lft forever preferred_lft forever<br>
        [ROUTE]local 192.168.2.3 dev wg0  table local  proto kernel 
        scope host  src 192.168.2.3 <br>
        [ADDR]Deleted 27: wg0    inet 192.168.2.3/32 scope global wg0<br>
               valid_lft forever preferred_lft forever<br>
        [ROUTE]Deleted local 192.168.2.3 dev wg0  table local  proto
        kernel  scope host  src 192.168.2.3 <br>
        [LINK]27: wg0: &lt;POINTOPOINT,NOARP,UP,LOWER_UP&gt; mtu 1420
        qdisc noqueue state UNKNOWN group default <br>
            link/none <br>
        [ROUTE]ff00::/8 dev wg0  table local  metric 256 <br>
        [LINK]27: wg0: &lt;POINTOPOINT,NOARP,UP,LOWER_UP&gt; mtu 1420
        state UNKNOWN <br>
            link/none <br>
        [LINK]27: wg0: &lt;POINTOPOINT,NOARP,UP,LOWER_UP&gt; mtu 1420
        qdisc noqueue state UNKNOWN group default <br>
            link/none <br>
        [ROUTE]192.168.2.0/24 dev wg0  scope link <br>
      </p>
    </blockquote>
    <p>The route delete on the sixth line is most interesting. I wonder
      where it came from? I'll try it one some Debian 8 machines and see
      what happens. So far it's <i>only</i> Debain 9 that seems to have
      the issue.</p>
    <p>Jim.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 10/09/17 15:26, Jason A. Donenfeld
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAHmME9qEcQhsCSGxXydOkcJYjWJYw89_36KSuswHPyCu9ixtpg@mail.gmail.com">
      <pre wrap="">On Sun, Sep 10, 2017 at 3:09 PM, Jim Darby <a class="moz-txt-link-rfc2396E" href="mailto:uberscubajim@gmail.com">&lt;uberscubajim@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">However, your comment about network management daemons running is most
interesting. Here's an extract from journalctl's output:
Sep 09 21:31:28 janus ifplugd(wg0)[6903]: Executing
'/etc/ifplugd/ifplugd.action wg0 up'.
Sep 09 21:31:28 janus ifplugd(wg0)[6903]: client: Ignoring unknown interface
wg0=wg0.
</pre>
      </blockquote>
      <pre wrap="">
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
[LINK]107: martino: &lt;POINTOPOINT,NOARP,200000&gt; mtu 1420 qdisc noop
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
[LINK]107: martino: &lt;POINTOPOINT,NOARP,UP,LOWER_UP&gt; mtu 1420 qdisc
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
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------2078686C97A9ACA4CCCDA0C5--
