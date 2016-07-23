Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id b2bce189
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Jul 2016 17:24:48 +0000 (UTC)
Date: Sat, 23 Jul 2016 12:25:53 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160723172553.GA6236@wolff.to>
References: <20160721205742.GA10312@wolff.to>
 <20160722081821.GA11505@lud.polynome.dn42>
 <20160722090913.GA8383@wolff.to>
 <20160722093211.GA12311@lud.polynome.dn42>
 <20160722113212.GA17578@wolff.to>
 <CAHmME9rX828zTOjCvcHAQgNxofmDxU0WpZcgqPTTMX2v-ZKmgA@mail.gmail.com>
 <20160722151458.GA14212@wolff.to>
 <CAHmME9oDAbN=OW8oLERFJQUnhKua_dSvSBVKz9139ORhEWOU8g@mail.gmail.com>
 <20160722180527.GA14911@wolff.to> <20160723163637.GA3426@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <20160723163637.GA3426@wolff.to>
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

On Sat, Jul 23, 2016 at 11:36:37 -0500,
  Bruno Wolff III <bruno@wolff.to> wrote:
>The explanations for marking and policy routing aren't explicit about 
>how you need to handle the source address issue and why it happens, 
>though there are lots of mentions that there are problems related to 
>the source address.

You also need to turn off rp_filter on interfaces because packets coming 
from the tunnel can look like they should have come from the normal 
gateway and will get dropped locally.
