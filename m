Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id d4cfb67a
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 16:02:39 +0000 (UTC)
Date: Fri, 22 Jul 2016 11:02:45 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Quan Zhou <quanzhou822@gmail.com>
Message-ID: <20160722160245.GA648@wolff.to>
References: <20160721205742.GA10312@wolff.to>
 <20160722081821.GA11505@lud.polynome.dn42>
 <20160722090913.GA8383@wolff.to>
 <20160722093211.GA12311@lud.polynome.dn42>
 <20160722113212.GA17578@wolff.to>
 <CAHmME9rX828zTOjCvcHAQgNxofmDxU0WpZcgqPTTMX2v-ZKmgA@mail.gmail.com>
 <20160722151458.GA14212@wolff.to>
 <CAMRLKH-wHk+nbvxuqDzYxOHXZVop6yqRf26CbFsWzWrnB=yy3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAMRLKH-wHk+nbvxuqDzYxOHXZVop6yqRf26CbFsWzWrnB=yy3g@mail.gmail.com>
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

On Fri, Jul 22, 2016 at 23:35:02 +0800,
  Quan Zhou <quanzhou822@gmail.com> wrote:
>I happen to have a similar problem, using `AllowedIPs = 0.0.0.0/0` on both
>sides of a wireguard link works, but when I try to add more peers, all but
>one gets `(none)`. I know this is by design, but it would be sweet if I can
>manually set gateways within a wireguarded network.

You only want 0.0.0.0/0 on one side. The proxy server should expect a 
single source IP address the clients can get packets from any address 
through the server.

If the clients are also proxing some local traffic, then you'll probably 
need to do nat on each client so the source addresses don't conflict.
