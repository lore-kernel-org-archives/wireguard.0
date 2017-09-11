Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b299863
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Sep 2017 00:26:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44ebaeb0
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Sep 2017 00:26:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54f4a7dd
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Sep 2017 00:45:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1e75ef4d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Sep 2017 00:45:25 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id y123so16933642iod.0
 for <wireguard@lists.zx2c4.com>; Sun, 10 Sep 2017 17:52:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <59B5C95F.50508@gmail.com>
References: <1e1740c3-f8cf-2ee2-d842-749b687cb737@gmail.com>
 <CAHmME9ptrCHRbAXpztbveMrHZ-nSOwadgX0vfnmDgKrGE_ge7g@mail.gmail.com>
 <07621915-a53a-03f3-9c75-b7e7d188d109@gmail.com>
 <CAHmME9qEcQhsCSGxXydOkcJYjWJYw89_36KSuswHPyCu9ixtpg@mail.gmail.com>
 <a96000f1-25ac-03c0-5f07-5a9e0d09d485@gmail.com>
 <CAHmME9pe-91wvf8pCwea7kzzNQoOw4aCn9jACoO=CE+BtA3KVg@mail.gmail.com>
 <59B5C95F.50508@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 Sep 2017 02:52:22 +0200
Message-ID: <CAHmME9ozNXY6xSSLqGR1M6_fJCquGGLjr0P=4XFOnxHefwbg9Q@mail.gmail.com>
Subject: Re: Timing issue (?) with wg-quick up on Raspberry Pi B+
To: Jim Darby <uberscubajim@gmail.com>
Content-Type: multipart/alternative; boundary="001a1141a45cfc29ac0558df560b"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1141a45cfc29ac0558df560b
Content-Type: text/plain; charset="UTF-8"

I figured it out. ifplugd clears all addresses when bringing up an
interface:

void interface_up(int fd, char *iface) {
...
        ((struct sockaddr_in *)(&ifr.ifr_addr))->sin_addr.s_addr =
INADDR_ANY;
        if (ioctl(fd, SIOCSIFADDR, &ifr) < 0) {
...
}

Since wg-quick sets the address before bringing it up, this running in
between is problematic. One workaround in wg-quick would be for me to
reverse the order of setting the IP and bringing it up, but this introduces
other races I'm not very fond of introducing. So, rather, we should address
the larger question: why on earth is ifplugd being started when wg0 is
added?

Sep 10 23:57:51 janus ifplugd(wg0)[14109]: ifplugd 0.28 initializing.
Sep 10 23:57:51 janus ifplugd(wg0)[14109]: Using interface
wg0/00:00:00:00:00:00
Sep 10 23:57:51 janus ifplugd(wg0)[14109]: Using detection mode: IFF_RUNNING

What causes it to be launched here? Digging a bit deeper, it looks like
ifplugd is being launched by a udev rule which calls a Debian file called
ifplugd.agent. It is in here that unholy hotplugging occurs.

I don't actually have a Debian system running to fish around and see, but
my guess is that you have a file /etc/default/ifplugd that has in it
HOTPLUG_INTERFACES=all. If you change this to HOTPLUG_INTERFACES="wlan0
eth0" or something more restrictive, things might work better. Just a guess.

--001a1141a45cfc29ac0558df560b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I figured it out. ifplugd clears all addresses when bringi=
ng up an interface:<div><br></div><div><div>void interface_up(int fd, char =
*iface) {</div><div>...</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((struct sock=
addr_in *)(&amp;ifr.ifr_addr))-&gt;sin_addr.s_addr =3D INADDR_ANY;</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ioctl(fd, SIOCSIFADDR, &amp;ifr) &lt; 0) =
{</div><div>...</div><div>}</div></div><div><br></div><div>Since wg-quick s=
ets the address before bringing it up, this running in between is problemat=
ic. One workaround in wg-quick would be for me to reverse the order of sett=
ing the IP and bringing it up, but this introduces other races I&#39;m not =
very fond of introducing. So, rather, we should address the larger question=
: why on earth is ifplugd being started when wg0 is added?</div><div><div><=
br></div><div>Sep 10 23:57:51 janus ifplugd(wg0)[14109]: ifplugd 0.28 initi=
alizing.</div><div>Sep 10 23:57:51 janus ifplugd(wg0)[14109]: Using interfa=
ce wg0/00:00:00:00:00:00</div><div>Sep 10 23:57:51 janus ifplugd(wg0)[14109=
]: Using detection mode: IFF_RUNNING</div></div><div><br></div><div>What ca=
uses it to be launched here? Digging a bit deeper, it looks like ifplugd is=
 being launched by a udev rule which calls a Debian file called ifplugd.age=
nt. It is in here that unholy hotplugging occurs.</div><div><br></div><div>=
I don&#39;t actually have a Debian system running to fish around and see, b=
ut my guess is that you have a file /etc/default/ifplugd that has in it HOT=
PLUG_INTERFACES=3Dall. If you change this to HOTPLUG_INTERFACES=3D&quot;wla=
n0 eth0&quot; or something more restrictive, things might work better. Just=
 a guess.</div></div>

--001a1141a45cfc29ac0558df560b--
