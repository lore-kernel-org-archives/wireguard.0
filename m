Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4068324
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 16:56:06 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc652f30
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 16:56:06 +0000 (UTC)
Subject: Re: TCP Wireguard with socat
To: Tim Sedlmeyer <tim@sedlmeyer.org>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
References: <utLzzyzPJsv-W3vVhU4Sdchg_5A07v9qCxR1DeJ5Wu7RzJHcje1cCEjtEWi4j0aCN05ozn9b4VYJQsLovvl6TGPp-kbZ_5kfpReEJHQQXGk=@protonmail.com>
 <e0bff705-f328-0071-0fb7-0367d36f0074@urlichs.de>
 <kvc0wmbZv_OgdINTzQhQnFxt0vFHFoqpVqYTFQkfPYOY_vqZHJN-bEvL9oJYuk-LJHubVyWlP2JCXTbRLK_9fGp7r298KveBFiOsF6P9r4Y=@protonmail.com>
 <88b9e6e0-1f38-1a20-3fac-372e96f847a3@urlichs.de>
 <XPP6R4g8xCtXsMbJljJf5ScBfx_FobBsPY66Hr7AO3venYsjyGhk0fdjtDnczcQUsMn18vZgB-CLkFCO54Ny-0LnWogx_T48_MdNsNiFd-o=@protonmail.com>
 <6UEIqzXriyGvMmVuBKcld9Fp5XzM-oCiMdJtB514oZVXhuFiCQqQtcOkFmqWUkkpz4WHhr9_9q7M9BRpDwdTET41cDJCypfU7vv7jxpJfyk=@protonmail.com>
 <CAK_h9uGiDxZN2rHX=3d-PtEyjYDraOCr7G_GgA+DnKy3jb-UZQ@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <7e3f18b0-cd72-b786-d38e-63cc2ec2f502@urlichs.de>
Date: Mon, 12 Mar 2018 18:05:27 +0100
MIME-Version: 1.0
In-Reply-To: <CAK_h9uGiDxZN2rHX=3d-PtEyjYDraOCr7G_GgA+DnKy3jb-UZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 12.03.2018 16:44, Tim Sedlmeyer wrote:
> On the server side of the connection:
>
> socat -d -d TCP-LISTEN:443,reuseaddr TUN:192.168.255.1/24,up
> socat TCP:server_address:443 TUN:192.168.255.2/24,up

This works if you're lucky, and as long as both sides send few packets.

As soon as your TCP queue fills up or your TCP connection has any packet
loss, all bets are off.

--=20
-- Matthias Urlichs
