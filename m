Return-Path: tim@sedlmeyer.us
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e145c2bf
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 15:34:12 +0000 (UTC)
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
 [209.85.214.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aeff228a
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 15:34:12 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id c11so11737219ith.4
 for <wireguard@lists.zx2c4.com>; Mon, 12 Mar 2018 08:44:20 -0700 (PDT)
Return-Path: <tim@sedlmeyer.us>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com.
 [209.85.223.177])
 by smtp.gmail.com with ESMTPSA id u77sm3703033ita.30.2018.03.12.08.44.19
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Mar 2018 08:44:19 -0700 (PDT)
Sender: Timothy Sedlmeyer <tim@sedlmeyer.us>
Received: by mail-io0-f177.google.com with SMTP id u84so11959404iod.9
 for <wireguard@lists.zx2c4.com>; Mon, 12 Mar 2018 08:44:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6UEIqzXriyGvMmVuBKcld9Fp5XzM-oCiMdJtB514oZVXhuFiCQqQtcOkFmqWUkkpz4WHhr9_9q7M9BRpDwdTET41cDJCypfU7vv7jxpJfyk=@protonmail.com>
References: <utLzzyzPJsv-W3vVhU4Sdchg_5A07v9qCxR1DeJ5Wu7RzJHcje1cCEjtEWi4j0aCN05ozn9b4VYJQsLovvl6TGPp-kbZ_5kfpReEJHQQXGk=@protonmail.com>
 <e0bff705-f328-0071-0fb7-0367d36f0074@urlichs.de>
 <kvc0wmbZv_OgdINTzQhQnFxt0vFHFoqpVqYTFQkfPYOY_vqZHJN-bEvL9oJYuk-LJHubVyWlP2JCXTbRLK_9fGp7r298KveBFiOsF6P9r4Y=@protonmail.com>
 <88b9e6e0-1f38-1a20-3fac-372e96f847a3@urlichs.de>
 <XPP6R4g8xCtXsMbJljJf5ScBfx_FobBsPY66Hr7AO3venYsjyGhk0fdjtDnczcQUsMn18vZgB-CLkFCO54Ny-0LnWogx_T48_MdNsNiFd-o=@protonmail.com>
 <6UEIqzXriyGvMmVuBKcld9Fp5XzM-oCiMdJtB514oZVXhuFiCQqQtcOkFmqWUkkpz4WHhr9_9q7M9BRpDwdTET41cDJCypfU7vv7jxpJfyk=@protonmail.com>
From: Tim Sedlmeyer <tim@sedlmeyer.org>
Date: Mon, 12 Mar 2018 11:44:18 -0400
Message-ID: <CAK_h9uGiDxZN2rHX=3d-PtEyjYDraOCr7G_GgA+DnKy3jb-UZQ@mail.gmail.com>
Subject: Re: TCP Wireguard with socat
To: Gianluca Gabrielli <tuxmealux@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Glad you got it working with ssf. If you are still interested in
getting it to work with socat, I have done so and it is pretty easy to
do.

On the server side of the connection:

socat -d -d TCP-LISTEN:443,reuseaddr TUN:192.168.255.1/24,up

On the client side:

socat TCP:server_address:443 TUN:192.168.255.2/24,up

This will create tunnel interfaces on each side which forwards any
data flowing through them over a socat established TCP connection
between the machines. Running 'ip link show' on either end will show
the new tun interface.

In your wireguard configuration set the server to listen on any port
besides 443 since socat is using this port for the TCP connection. On
the client side configure the endpoint for the server peer to be
192.168.255.1:server_listenport


On Mon, Mar 12, 2018 at 11:14 AM, Gianluca Gabrielli
<tuxmealux@protonmail.com> wrote:
> Yes, I can confirm now. Wireguard + ssf[1] (UDP forwarding) works very well.
> I will proceed doing some benchmark to understand how much this solution is downgrading performance.
>
> [1] https://github.com/securesocketfunneling/ssf
>
> Cheers,
> Gianluca
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
