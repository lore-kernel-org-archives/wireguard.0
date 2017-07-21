Return-Path: eric@ericlight.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d167c22e
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2017 23:14:23 +0000 (UTC)
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acec6f10
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2017 23:14:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4BE40120B
 for <wireguard@lists.zx2c4.com>; Fri, 21 Jul 2017 19:33:59 -0400 (EDT)
Message-Id: <1500680038.1009000.1048775720.4A6974DA@webmail.messagingengine.com>
From: Eric Light <eric@ericlight.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
References: <CAA8CD9vTW5XJVDjhE=5t6e8midm6LivLYqLHBrT98riTYnP3kQ@mail.gmail.com>
 <CAA8CD9s67yT1esUYwyo5rmsZAKahoXn86AAX8faccgvTcA8_xw@mail.gmail.com>
 <CAHmME9pQR3hmHJjV-wUah2wqYGKqSw+HipuQH6F92hVgD4FBrg@mail.gmail.com>
Subject: Re: Not able to ping the host as per demo of wireguard.
Date: Sat, 22 Jul 2017 11:33:58 +1200
In-Reply-To: <CAHmME9pQR3hmHJjV-wUah2wqYGKqSw+HipuQH6F92hVgD4FBrg@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Sahil,

Both of your wg0 interfaces are set to 10.0.0.1/24, but both of your
AllowedIPs are set to 10.0.0.2/32 -- so neither of them are routing to
the other.  For me, I'd set AllowedIPs to 10.0.0.1/24 on both laptops,
so they can each talk to  10.0.0.x.

Also, your Endpoints are both set to 192.168.2.170, but neither of your
wlp1s0 interfaces are set to this IP address... this means they're each
throwing their wg packets to some unknown third device.

And then there's the Listening Port thing that Jason already
mentioned... If computer A is listening on 12345, computer B must be
talking to 12345 as well.

Hope this helps
E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Sat, 22 Jul 2017, at 10:22, Jason A. Donenfeld wrote:
> You need to set the correct listening port. If you want to use port
> 51820, set it as such:
> 
> $ wg set wg0 listen-port 51820
> 
> Then adjust your endpoint to 'endpoint 1.2.3.4:51820'.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
