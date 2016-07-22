Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3044370
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 15:28:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b3e4dc4
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 15:28:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 293f70e7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 15:28:36 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id l69so88015600lfg.1
 for <wireguard@lists.zx2c4.com>; Fri, 22 Jul 2016 08:30:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160722151458.GA14212@wolff.to>
References: <20160721205742.GA10312@wolff.to>
 <20160722081821.GA11505@lud.polynome.dn42>
 <20160722090913.GA8383@wolff.to> <20160722093211.GA12311@lud.polynome.dn42>
 <20160722113212.GA17578@wolff.to>
 <CAHmME9rX828zTOjCvcHAQgNxofmDxU0WpZcgqPTTMX2v-ZKmgA@mail.gmail.com>
 <20160722151458.GA14212@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Jul 2016 17:30:37 +0200
Message-ID: <CAHmME9oDAbN=OW8oLERFJQUnhKua_dSvSBVKz9139ORhEWOU8g@mail.gmail.com>
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Using wireguard link as a proxy?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Jul 22, 2016 at 5:14 PM, Bruno Wolff III <bruno@wolff.to> wrote:
> On Fri, Jul 22, 2016 at 14:42:52 +0200,
> The idea I am working on now is to use policy writing and rules, so that
> packets sent to the proxy server are routed using the normal routing table
> which includes the default route supplied by dhcp, but eveything else (well
> not 127/8) uses an alternate routing table that has a default route through
> wg0. This way I can use a fixed set up and not have to parse the routing
> info setup after a wireless connection is made.
>
> I need to do some reading to get the details for creating routing tables and
> rules for picking them, but expect this will work.

1.2.3.4 is proxyserver.wireguard.io:

$ ip rule add to 1.2.3.4 lookup main pref 30
$ ip rule add to all lookup 80 pref 40
$ ip route add default dev wg0 table 80


This thread might interest you:
http://marc.info/?l=linux-netdev&m=145452157719655&w=2
