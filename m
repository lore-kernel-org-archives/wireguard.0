Return-Path: uberscubajim@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e2aa285
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 22:57:46 +0000 (UTC)
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
 [209.85.128.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd140790
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 22:57:46 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id k20so11429359wre.4
 for <wireguard@lists.zx2c4.com>; Sun, 10 Sep 2017 16:23:48 -0700 (PDT)
Return-Path: <uberscubajim@gmail.com>
Message-ID: <59B5C95F.50508@gmail.com>
Date: Mon, 11 Sep 2017 00:23:11 +0100
From: Jim Darby <uberscubajim@gmail.com>
MIME-Version: 1.0
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Timing issue (?) with wg-quick up on Raspberry Pi B+
References: <1e1740c3-f8cf-2ee2-d842-749b687cb737@gmail.com>
 <CAHmME9ptrCHRbAXpztbveMrHZ-nSOwadgX0vfnmDgKrGE_ge7g@mail.gmail.com>
 <07621915-a53a-03f3-9c75-b7e7d188d109@gmail.com>
 <CAHmME9qEcQhsCSGxXydOkcJYjWJYw89_36KSuswHPyCu9ixtpg@mail.gmail.com>
 <a96000f1-25ac-03c0-5f07-5a9e0d09d485@gmail.com>
 <CAHmME9pe-91wvf8pCwea7kzzNQoOw4aCn9jACoO=CE+BtA3KVg@mail.gmail.com>
In-Reply-To: <CAHmME9pe-91wvf8pCwea7kzzNQoOw4aCn9jACoO=CE+BtA3KVg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------080505040809050809020201"
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
--------------080505040809050809020201
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/09/17 23:25, Jason A. Donenfeld wrote:
> I just wrote the attached script, which will tell you all the
> processes that have an open netlink socket...
>
> There's a bit too much fluff in there on a desktop system, but I
> imagine the pi might help boil it down to a few candidates. Probably
> we'll determine it's an ifplugd/ifupdown.action thing, but we'll see.

Many thanks again for such great work. Here's the output of the 
netlistenerwho.sh program. It's awash with potential culprits!

   PID TTY      STAT   TIME COMMAND
     1 ?        Ss     2:35 /sbin/init
   128 ?        Ss     0:01 /lib/systemd/systemd-udevd
   770 ?        Ss     2:24 /sbin/dhcpcd -q -b
   783 ?        Ss     0:15 avahi-daemon: running [janus.local]
   840 ?        Ss     0:32 /lib/systemd/systemd-logind
   896 ?        Ss    10:19 /usr/sbin/ntpd -p /var/run/ntpd.pid -g -u 
107:112
   906 ?        S      0:02 /usr/sbin/dnsmasq -x 
/run/dnsmasq/dnsmasq.pid -u dnsmasq -r /run/dnsmasq/resolv.conf -7 
/etc/dnsmasq.
  1204 ?        Ss     0:00 /lib/systemd/systemd --user
18942 ?        Ss     0:00 /lib/systemd/systemd --user

I also made a great mistake earlier: the problematic system is the 
version of Raspbian based on begin *8* and /not/ *9*. Debian 9 works fine!

I've tweaked the /etc/network/interfaces file to have the line “iface 
wg0 inet manual” in it so we /shouldn't/ get DHCP running or anything…

I tried the nlmon trick but I got the response “RTNETLINK answers: 
Operation not supported” which isn't too helpful.

After some more playing I've found that running the wg-quick script's 
commands by hand works. But then, I'm /manually/ entering them and that 
affects timing.

I note you perform the ”ip link set wg0 up” /after/ the “ip address add 
192.168.2.3/32 dev wg0” and “ip link set mtu 1420 dev wg0”. /However, 
/the act of creating the interface with the “ip link add wg0 type 
wireguard” seems to trigger the ip up automatically. The log files give:

Sep 10 23:57:51 janus kernel: wireguard: WireGuard 0.0.20170907 loaded. 
See www.wireguard.com for information.
Sep 10 23:57:51 janus kernel: wireguard: Copyright (C) 2015-2017 Jason 
A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
Sep 10 23:57:51 janus ifplugd(wg0)[14109]: ifplugd 0.28 initializing.
Sep 10 23:57:51 janus ifplugd(wg0)[14109]: Using interface 
wg0/00:00:00:00:00:00
Sep 10 23:57:51 janus ifplugd(wg0)[14109]: Using detection mode: IFF_RUNNING
Sep 10 23:57:51 janus ifplugd(wg0)[14109]: Initialization complete, link 
beat detected.
Sep 10 23:57:52 janus ifplugd(wg0)[14109]: Executing 
'/etc/ifplugd/ifplugd.action wg0 up'.
Sep 10 23:57:52 janus ifplugd(wg0)[14109]: client: /sbin/ifup: interface 
wg0 already configured
Sep 10 23:57:52 janus ifplugd(wg0)[14109]: Program executed successfully.

Which could well be interesting. I manually ran ifdown then ifup on wg0 
and it /didn't/ lose its IP address.

Most perplexing!

Jim.

--------------080505040809050809020201
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 10/09/17 23:25, Jason A. Donenfeld
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAHmME9pe-91wvf8pCwea7kzzNQoOw4aCn9jACoO=CE+BtA3KVg@mail.gmail.com"
      type="cite">
      <pre wrap="">I just wrote the attached script, which will tell you all the
processes that have an open netlink socket...

There's a bit too much fluff in there on a desktop system, but I
imagine the pi might help boil it down to a few candidates. Probably
we'll determine it's an ifplugd/ifupdown.action thing, but we'll see.
</pre>
    </blockquote>
    <br>
    Many thanks again for such great work. Here's the output of the
    netlistenerwho.sh program. It's awash with potential culprits!<br>
    <br>
    <tt>  PID TTY      STAT   TIME COMMAND</tt><tt><br>
    </tt><tt>    1 ?        Ss     2:35 /sbin/init</tt><tt><br>
    </tt><tt>  128 ?        Ss     0:01 /lib/systemd/systemd-udevd</tt><tt><br>
    </tt><tt>  770 ?        Ss     2:24 /sbin/dhcpcd -q -b</tt><tt><br>
    </tt><tt>  783 ?        Ss     0:15 avahi-daemon: running
      [janus.local]</tt><tt><br>
    </tt><tt>  840 ?        Ss     0:32 /lib/systemd/systemd-logind</tt><tt><br>
    </tt><tt>  896 ?        Ss    10:19 /usr/sbin/ntpd -p
      /var/run/ntpd.pid -g -u 107:112</tt><tt><br>
    </tt><tt>  906 ?        S      0:02 /usr/sbin/dnsmasq -x
      /run/dnsmasq/dnsmasq.pid -u dnsmasq -r /run/dnsmasq/resolv.conf -7
      /etc/dnsmasq.</tt><tt><br>
    </tt><tt> 1204 ?        Ss     0:00 /lib/systemd/systemd --user</tt><tt><br>
    </tt><tt>18942 ?        Ss     0:00 /lib/systemd/systemd --user</tt><br>
    <br>
    I also made a great mistake earlier: the problematic system is the
    version of Raspbian based on begin <b>8</b> and <i>not</i> <b>9</b>.
    Debian 9 works fine!<br>
    <br>
    I've tweaked the /etc/network/interfaces file to have the line
    “iface wg0 inet manual” in it so we <i>shouldn't</i> get DHCP
    running or anything…<br>
    <br>
    I tried the nlmon trick but I got the response “RTNETLINK answers:
    Operation not supported” which isn't too helpful.<br>
    <br>
    After some more playing I've found that running the wg-quick
    script's commands by hand works. But then, I'm <i>manually</i>
    entering them and that affects timing.<br>
    <br>
    I note you perform the ”ip link set wg0 up” <i>after</i> the “ip
    address add 192.168.2.3/32 dev wg0” and “ip link set mtu 1420 dev
    wg0”. <i>However, </i>the act of creating the interface with the
    “ip link add wg0 type wireguard” seems to trigger the ip up
    automatically. The log files give:<br>
    <br>
    <tt>Sep 10 23:57:51 janus kernel: wireguard: WireGuard 0.0.20170907
      loaded. See <a class="moz-txt-link-abbreviated" href="http://www.wireguard.com">www.wireguard.com</a> for information.</tt><tt><br>
    </tt><tt>Sep 10 23:57:51 janus kernel: wireguard: Copyright (C)
      2015-2017 Jason A. Donenfeld <a class="moz-txt-link-rfc2396E" href="mailto:Jason@zx2c4.com">&lt;Jason@zx2c4.com&gt;</a>. All Rights
      Reserved.</tt><tt><br>
    </tt><tt>Sep 10 23:57:51 janus ifplugd(wg0)[14109]: ifplugd 0.28
      initializing.</tt><tt><br>
    </tt><tt>Sep 10 23:57:51 janus ifplugd(wg0)[14109]: Using interface
      wg0/00:00:00:00:00:00</tt><tt><br>
    </tt><tt>Sep 10 23:57:51 janus ifplugd(wg0)[14109]: Using detection
      mode: IFF_RUNNING</tt><tt><br>
    </tt><tt>Sep 10 23:57:51 janus ifplugd(wg0)[14109]: Initialization
      complete, link beat detected.</tt><tt><br>
    </tt><tt>Sep 10 23:57:52 janus ifplugd(wg0)[14109]: Executing
      '/etc/ifplugd/ifplugd.action wg0 up'.</tt><tt><br>
    </tt><tt>Sep 10 23:57:52 janus ifplugd(wg0)[14109]: client:
      /sbin/ifup: interface wg0 already configured</tt><tt><br>
    </tt><tt>Sep 10 23:57:52 janus ifplugd(wg0)[14109]: Program executed
      successfully.</tt><br>
    <br>
    Which could well be interesting. I manually ran ifdown then ifup on
    wg0 and it <i>didn't</i> lose its IP address.<br>
    <br>
    Most perplexing!<br>
    <br>
    Jim.<br>
  </body>
</html>

--------------080505040809050809020201--
