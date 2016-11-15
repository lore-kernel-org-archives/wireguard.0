Return-Path: egbert@eggiecode.org
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5af1cd0
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Nov 2016 23:38:50 +0000 (UTC)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAHmME9r24tV2RmNYQfxvdF_0L_egYFek0xeqNZS5UNuZjN5N4Q@mail.gmail.com>
From: Egbert Verhage <egbert@eggiecode.org>
Message-ID: <7a9a422b-ad5e-f6a2-7078-26930f2177f5@eggiecode.org>
Date: Wed, 16 Nov 2016 00:41:25 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9r24tV2RmNYQfxvdF_0L_egYFek0xeqNZS5UNuZjN5N4Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------36131C1A6A8CC2C53F14FDCB"
Subject: Re: [WireGuard] Seeking Ubuntu PPA Maintainer
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------36131C1A6A8CC2C53F14FDCB
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 2016-11-15 21:44, Jason A. Donenfeld wrote:
> Hey folks,
>
> Looks like there are various Ubuntu PPAs for WireGuard floating
> around. I'd like to officially endorse one on the install section of
> the website. Is anybody interested in being the Ubuntu downstream for
> WireGuard?
>
> Thanks,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard

Hey Jason,

I'm trying to maintain one now, but it is my first one and trying to
keep it up to date.
https://launchpad.net/~eggiecode/+archive/ubuntu/wireguard

Testing it constantly on 4 of my servers and works it great!
Even added a patch for ifupdown to setup WireGuard in
/etc/network/interfaces

The only downside is that I disabled AVX2 cpu extention in the code,
because of kernel panics on VPS's by a hosting company
(https://eggiecode.org/wg-kernel-panic.png).

Greetz,
Egbert Verhage

Below example config of wireguard in network/interfaces

iface wg0 inet wireguard
        netmask 255.255.255.0
        address 192.168.2.254
        wg_config /etc/network/wg0.ini

        up ip -4 route add 10.20.1.0/24 dev wg0
        pre-down ip -4 route del 10.20.1.0/24 dev wg0
        up ip -4 route add 10.20.3.0/24 dev wg0
        pre-down ip -4 route del 10.20.3.0/24 dev wg0
        up ip -4 route add 10.20.2.0/24 dev wg0
        pre-down ip -4 route del 10.20.2.0/24 dev wg0

iface wg0 inet6 wireguard
        netmask 64
        address fd4a:2831:fc20:f528:fe::1

        up ip -6 route add 2001:41d0:2:5c39::/64 dev wg0
        pre-down ip -6 route del 2001:41d0:2:5c39::/64 dev wg0
        up ip -6 route add 2a00:f10:700:5f::/60 dev wg0
        pre-down ip -6 route del 2a00:f10:700:5f::/60 dev wg0
        up ip -6 route add 2001:41d0:d:2a83::/64 dev wg0
        pre-down ip -6 route del 2001:41d0:d:2a83::/64 dev wg0

(Forgot to send it to the mailinglist.)


--------------36131C1A6A8CC2C53F14FDCB
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 2016-11-15 21:44, Jason A. Donenfeld wrote:<br>
    <blockquote
cite="mid:CAHmME9r24tV2RmNYQfxvdF_0L_egYFek0xeqNZS5UNuZjN5N4Q@mail.gmail.com"
      type="cite">
      <pre wrap="">Hey folks,

Looks like there are various Ubuntu PPAs for WireGuard floating
around. I'd like to officially endorse one on the install section of
the website. Is anybody interested in being the Ubuntu downstream for
WireGuard?

Thanks,
Jason
_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="http://lists.zx2c4.com/mailman/listinfo/wireguard">http://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
    <br>
    <pre wrap="">Hey Jason,

I'm trying to maintain one now, but it is my first one and trying to
keep it up to date.
<a class="moz-txt-link-freetext" href="https://launchpad.net/%7Eeggiecode/+archive/ubuntu/wireguard">https://launchpad.net/~eggiecode/+archive/ubuntu/wireguard</a>

Testing it constantly on 4 of my servers and works it great!
Even added a patch for ifupdown to setup WireGuard in
/etc/network/interfaces

The only downside is that I disabled AVX2 cpu extention in the code,
because of kernel panics on VPS's by a hosting company
(<a class="moz-txt-link-freetext" href="https://eggiecode.org/wg-kernel-panic.png">https://eggiecode.org/wg-kernel-panic.png</a>).

Greetz,
Egbert Verhage

Below example config of wireguard in network/interfaces

iface wg0 inet wireguard
        netmask 255.255.255.0
        address 192.168.2.254
        wg_config /etc/network/wg0.ini

        up ip -4 route add 10.20.1.0/24 dev wg0
        pre-down ip -4 route del 10.20.1.0/24 dev wg0
        up ip -4 route add 10.20.3.0/24 dev wg0
        pre-down ip -4 route del 10.20.3.0/24 dev wg0
        up ip -4 route add 10.20.2.0/24 dev wg0
        pre-down ip -4 route del 10.20.2.0/24 dev wg0

iface wg0 inet6 wireguard
        netmask 64
        address fd4a:2831:fc20:f528:fe::1

        up ip -6 route add 2001:41d0:2:5c39::/64 dev wg0
        pre-down ip -6 route del 2001:41d0:2:5c39::/64 dev wg0
        up ip -6 route add 2a00:f10:700:5f::/60 dev wg0
        pre-down ip -6 route del 2a00:f10:700:5f::/60 dev wg0
        up ip -6 route add 2001:41d0:d:2a83::/64 dev wg0
        pre-down ip -6 route del 2001:41d0:d:2a83::/64 dev wg0

(Forgot to send it to the mailinglist.)</pre>
  </body>
</html>

--------------36131C1A6A8CC2C53F14FDCB--
