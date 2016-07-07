Return-Path: frederic.gloannec@thegreenbow.com
Received: from key.keymeetingpoint.net (key.keymeetingpoint.net
 [198.57.135.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b967647d
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 09:16:07 +0000 (UTC)
From: =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Gloannec?=
 <frederic.gloannec@thegreenbow.com>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>
References: <577cfed2.c1bd370a.78cba.ffff9b3eSMTPIN_ADDED_BROKEN@mx.google.com>
 <CAHmME9rqC2gbixm6DT7mdW4sYPHSPJv8P1fF6M+x8Z-9HvdF3A@mail.gmail.com>
In-Reply-To: <CAHmME9rqC2gbixm6DT7mdW4sYPHSPJv8P1fF6M+x8Z-9HvdF3A@mail.gmail.com>
Date: Thu, 7 Jul 2016 11:16:19 +0200
Message-ID: <00f401d1d830$399a5320$accef960$@gloannec@thegreenbow.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Cc: 'WireGuard mailing list' <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Which protocol to get network configuration from
	gateway to clients.
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

Thanks for your reply.

We are not looking for a VPN solution, we are actually editing VPN =
Clients Software.
So, at this time, we are just interested to know how mature the =
WireGuard technology is.
If it becomes a standard and embedded in VPN Gateways, for sure we will =
adapt our VPN Clients to support it.

>From our customer experience, we think it's important to have this upper =
layer. Large companies use Mode Config/CP to ease the deployment (the =
VPN Client configuration is the same for all machines, network =
infrastructure changes impact only the Gateway...).

Yes, out-of-band extension could be a solution too (like OpenVPN).

Regards,

F.Gloannec.

-----Message d'origine-----
De : Jason A. Donenfeld [mailto:Jason@zx2c4.com]=20
Envoy=C3=A9 : mercredi 6 juillet 2016 16:28
=C3=80 : Fr=C3=A9d=C3=A9ric Gloannec
Cc : WireGuard mailing list
Objet : Re: [WireGuard] Which protocol to get network configuration from =
gateway to clients.

Hi Fr=C3=A9d=C3=A9ric,

The beauty is: you can use whatever protocol you want. Use =
TLS/HTTP/REST/JSON if that's your style. Use SSH if it suits your fancy. =
Hand code preshared substitution tables onto carrier pigeon parchment, =
if you're feeling ancient. Slip Senator Vandenberg your public key and =
desired IP on microfilm during a secret senate floor handshake too =
subtle for early film cameras to catch. You can do a million different =
things to integrate it directly into your infrastructure and how you =
like doing things.

After WireGuard gets stabilized, I have some plans of my own for making =
upper layer tools for that. But I sort of suspect others will make =
things like that before I get to it, and you shouldn't hesitate to =
integrate it into your infrastructure how you like.

There's also the out-of-band extension idea from this thread [1], that =
could at some point grow into something interesting.

Of course, if you can, it's probably superior to use more static =
configuration, leaving distribution of that to your ordinary =
configuration management system. For example, while you're at it having =
puppet/ansiable/chef/whatever push the ordinary networking config and =
pre-verified SSH host keys, have it push your wireguard configuration =
too. Or maybe this isn't your cup of tea.

By leaving these concerns out of wireguard directly, we aim to make the =
core of the project a lot more usable and integratable. I manage quite a =
few systems myself, so I'm happy to put on my sysadmin/devops/sre hat =
and help you come up with something that fits your environment. And I'm =
sure others on this list have their set of opinions and advice too.

So, what's your environment like? What do you want to do? Let's theorize =
potential solutions for you. And maybe in the exercise of doing that, =
we'll figure out new ways to both use WireGuard and improve it to be =
more robust and fitting for your environment.

Jason

[1] https://lists.zx2c4.com/pipermail/wireguard/2016-June/000038.html
