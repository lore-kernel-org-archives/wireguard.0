Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 77b9246a
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 11:32:06 +0000 (UTC)
Date: Fri, 22 Jul 2016 06:32:12 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Message-ID: <20160722113212.GA17578@wolff.to>
References: <20160721205742.GA10312@wolff.to>
 <20160722081821.GA11505@lud.polynome.dn42>
 <20160722090913.GA8383@wolff.to>
 <20160722093211.GA12311@lud.polynome.dn42>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <20160722093211.GA12311@lud.polynome.dn42>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] Using wireguard link as a proxy?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Jul 22, 2016 at 11:32:11 +0200,
  Baptiste Jonglez <baptiste@bitsofnetworks.org> wrote:
>
>Ok, excellent!  Wireguard really doesn't care or even know about the
>source NAT you may apply on the server (well, at least when thinking about
>it at a high level).

I got this working now. I need to work a bit on setting up the routing 
so it comes up correctly at boot without manually issuing ip commands.

What I am trying to experiment with is increase privacy on an upcoming trip 
where I will be using a laptop on hotel wifi and I want to route all traffic 
through my home server via a wireguard tunnel. Depending on how they do their 
wifi I may need to do some tweaks to be able to authenticate.

Later I may have use for a similar, but more restricted, set up to help me 
work from home. I need to be careful not to open up unintended holes when 
I do that.
