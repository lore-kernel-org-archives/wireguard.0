Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id dabee83d
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 15:14:52 +0000 (UTC)
Date: Fri, 22 Jul 2016 10:14:58 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160722151458.GA14212@wolff.to>
References: <20160721205742.GA10312@wolff.to>
 <20160722081821.GA11505@lud.polynome.dn42>
 <20160722090913.GA8383@wolff.to>
 <20160722093211.GA12311@lud.polynome.dn42>
 <20160722113212.GA17578@wolff.to>
 <CAHmME9rX828zTOjCvcHAQgNxofmDxU0WpZcgqPTTMX2v-ZKmgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9rX828zTOjCvcHAQgNxofmDxU0WpZcgqPTTMX2v-ZKmgA@mail.gmail.com>
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

On Fri, Jul 22, 2016 at 14:42:52 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>I usually do something like:
>
>wg set wg0 peer ABCD allowed-ips 0.0.0.0/0
>ip route add 0/1 dev wg0
>ip route add 128/1 dev wg0

The idea I am working on now is to use policy writing and rules, so that 
packets sent to the proxy server are routed using the normal routing 
table which includes the default route supplied by dhcp, but eveything 
else (well not 127/8) uses an alternate routing table that has a default 
route through wg0. This way I can use a fixed set up and not have to 
parse the routing info setup after a wireless connection is made.

I need to do some reading to get the details for creating routing tables 
and rules for picking them, but expect this will work.
