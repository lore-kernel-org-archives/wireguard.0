Return-Path: uberscubajim@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da588ee9
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Sep 2017 12:09:50 +0000 (UTC)
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
 [209.85.128.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d84a1dc
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Sep 2017 12:09:50 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id o42so14280194wrb.3
 for <wireguard@lists.zx2c4.com>; Mon, 11 Sep 2017 05:35:56 -0700 (PDT)
Return-Path: <uberscubajim@gmail.com>
Subject: Re: Timing issue (?) with wg-quick up on Raspberry Pi B+
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <1e1740c3-f8cf-2ee2-d842-749b687cb737@gmail.com>
 <CAHmME9ptrCHRbAXpztbveMrHZ-nSOwadgX0vfnmDgKrGE_ge7g@mail.gmail.com>
 <07621915-a53a-03f3-9c75-b7e7d188d109@gmail.com>
 <CAHmME9qEcQhsCSGxXydOkcJYjWJYw89_36KSuswHPyCu9ixtpg@mail.gmail.com>
 <a96000f1-25ac-03c0-5f07-5a9e0d09d485@gmail.com>
 <CAHmME9pe-91wvf8pCwea7kzzNQoOw4aCn9jACoO=CE+BtA3KVg@mail.gmail.com>
 <59B5C95F.50508@gmail.com>
 <CAHmME9ozNXY6xSSLqGR1M6_fJCquGGLjr0P=4XFOnxHefwbg9Q@mail.gmail.com>
From: Jim Darby <uberscubajim@gmail.com>
Message-ID: <a4c43cd5-7792-b11f-479a-046b5c4fd048@gmail.com>
Date: Mon, 11 Sep 2017 13:35:54 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9ozNXY6xSSLqGR1M6_fJCquGGLjr0P=4XFOnxHefwbg9Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------C49051A3A7A4AA368735E5AC"
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
--------------C49051A3A7A4AA368735E5AC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Nailed it!

Specifically, you were spot on about the /etc/default/ifplugd file and 
its HOTPLUG_INTERFACES line. Changing that to HOTPLUG_INTERFACES="eth0 
eth1" meant that it just worked out of the box.

In fact, I suspect that eth0 could be omitted because it's part of the 
hardware (eth1 is a USB dongle so hotplugging may be useful). I'd prefer 
a way to specifically /exclude/ wg* interfaces rather then include the 
known ones but that may be too complex.

I hope this discussion and its solution will be a useful part of the 
WireGuard documentation. It'll hopefully stop others becoming confused 
in the future.

Many thanks for your help in resolving this! I'm very much enjoying 
playing with WireGuard. I heard about it during your talk at FOSDEM by 
the way.

Regards,

Jim.


On 11/09/17 01:52, Jason A. Donenfeld wrote:
> I figured it out. ifplugd clears all addresses when bringing up an 
> interface:
>
> void interface_up(int fd, char *iface) {
> ...
>         ((struct sockaddr_in *)(&ifr.ifr_addr))->sin_addr.s_addr = 
> INADDR_ANY;
>         if (ioctl(fd, SIOCSIFADDR, &ifr) < 0) {
> ...
> }
>
> Since wg-quick sets the address before bringing it up, this running in 
> between is problematic. One workaround in wg-quick would be for me to 
> reverse the order of setting the IP and bringing it up, but this 
> introduces other races I'm not very fond of introducing. So, rather, 
> we should address the larger question: why on earth is ifplugd being 
> started when wg0 is added?
>
> Sep 10 23:57:51 janus ifplugd(wg0)[14109]: ifplugd 0.28 initializing.
> Sep 10 23:57:51 janus ifplugd(wg0)[14109]: Using interface 
> wg0/00:00:00:00:00:00
> Sep 10 23:57:51 janus ifplugd(wg0)[14109]: Using detection mode: 
> IFF_RUNNING
>
> What causes it to be launched here? Digging a bit deeper, it looks 
> like ifplugd is being launched by a udev rule which calls a Debian 
> file called ifplugd.agent. It is in here that unholy hotplugging occurs.
>
> I don't actually have a Debian system running to fish around and see, 
> but my guess is that you have a file /etc/default/ifplugd that has in 
> it HOTPLUG_INTERFACES=all. If you change this to 
> HOTPLUG_INTERFACES="wlan0 eth0" or something more restrictive, things 
> might work better. Just a guess.


--------------C49051A3A7A4AA368735E5AC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000099" bgcolor="#FFFFFF">
    <p><font face="Verdana">Nailed it!</font></p>
    <p><font face="Verdana">Specifically, you were spot on about the
        /etc/default/ifplugd file and its HOTPLUG_INTERFACES line.
        Changing that to </font>HOTPLUG_INTERFACES="eth0 eth1" meant
      that it just worked out of the box.</p>
    <p>In fact, I suspect that eth0 could be omitted because it's part
      of the hardware (eth1 is a USB dongle so hotplugging may be
      useful). I'd prefer a way to specifically <i>exclude</i> wg*
      interfaces rather then include the known ones but that may be too
      complex.<br>
    </p>
    <p>I hope this discussion and its solution will be a useful part of
      the WireGuard documentation. It'll hopefully stop others becoming
      confused in the future.<br>
    </p>
    <p>Many thanks for your help in resolving this! I'm very much
      enjoying playing with WireGuard. I heard about it during your talk
      at FOSDEM by the way.</p>
    <p>Regards,</p>
    <p>Jim.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/09/17 01:52, Jason A. Donenfeld
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAHmME9ozNXY6xSSLqGR1M6_fJCquGGLjr0P=4XFOnxHefwbg9Q@mail.gmail.com">
      <div dir="ltr">I figured it out. ifplugd clears all addresses when
        bringing up an interface:
        <div><br>
        </div>
        <div>
          <div>void interface_up(int fd, char *iface) {</div>
          <div>...</div>
          <div>        ((struct sockaddr_in
            *)(&amp;ifr.ifr_addr))-&gt;sin_addr.s_addr = INADDR_ANY;</div>
          <div>        if (ioctl(fd, SIOCSIFADDR, &amp;ifr) &lt; 0) {</div>
          <div>...</div>
          <div>}</div>
        </div>
        <div><br>
        </div>
        <div>Since wg-quick sets the address before bringing it up, this
          running in between is problematic. One workaround in wg-quick
          would be for me to reverse the order of setting the IP and
          bringing it up, but this introduces other races I'm not very
          fond of introducing. So, rather, we should address the larger
          question: why on earth is ifplugd being started when wg0 is
          added?</div>
        <div>
          <div><br>
          </div>
          <div>Sep 10 23:57:51 janus ifplugd(wg0)[14109]: ifplugd 0.28
            initializing.</div>
          <div>Sep 10 23:57:51 janus ifplugd(wg0)[14109]: Using
            interface wg0/00:00:00:00:00:00</div>
          <div>Sep 10 23:57:51 janus ifplugd(wg0)[14109]: Using
            detection mode: IFF_RUNNING</div>
        </div>
        <div><br>
        </div>
        <div>What causes it to be launched here? Digging a bit deeper,
          it looks like ifplugd is being launched by a udev rule which
          calls a Debian file called ifplugd.agent. It is in here that
          unholy hotplugging occurs.</div>
        <div><br>
        </div>
        <div>I don't actually have a Debian system running to fish
          around and see, but my guess is that you have a file
          /etc/default/ifplugd that has in it HOTPLUG_INTERFACES=all. If
          you change this to HOTPLUG_INTERFACES="wlan0 eth0" or
          something more restrictive, things might work better. Just a
          guess.</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------C49051A3A7A4AA368735E5AC--
