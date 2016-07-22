Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id af5f03fb
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 16:13:07 +0000 (UTC)
Date: Fri, 22 Jul 2016 11:13:13 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160722161313.GB648@wolff.to>
References: <20160721205742.GA10312@wolff.to>
 <20160722081821.GA11505@lud.polynome.dn42>
 <20160722090913.GA8383@wolff.to>
 <20160722093211.GA12311@lud.polynome.dn42>
 <20160722113212.GA17578@wolff.to>
 <CAHmME9rX828zTOjCvcHAQgNxofmDxU0WpZcgqPTTMX2v-ZKmgA@mail.gmail.com>
 <20160722151458.GA14212@wolff.to>
 <CAHmME9oDAbN=OW8oLERFJQUnhKua_dSvSBVKz9139ORhEWOU8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9oDAbN=OW8oLERFJQUnhKua_dSvSBVKz9139ORhEWOU8g@mail.gmail.com>
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

On Fri, Jul 22, 2016 at 17:30:37 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
>$ ip rule add to 1.2.3.4 lookup main pref 30
>$ ip rule add to all lookup 80 pref 40
>$ ip route add default dev wg0 table 80

OK. That is more or less what I am doing.

I was trying to name the routing table because I saw that people were doing 
that, but doing that in an idempotent way seems like it will require a hack. 
I'm going to just try using a table number like you do to see if that avoids 
the problem. 

The other issue I am seeing is that the default route generated for the wlan 
connection specifies a gateway in addition to the interface, and it looks 
like routing is checked for the gateway rather than assuming it is at the 
speficied interface because it looks like the routing doesn't work if 
I don't add the wlan route to the wg routing table. I'm going to do some 
more testing around that.
