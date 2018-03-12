Return-Path: tuxmealux@protonmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e84e1f04
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 15:04:57 +0000 (UTC)
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b15105a
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 15:04:57 +0000 (UTC)
Date: Mon, 12 Mar 2018 11:14:52 -0400
To: Matthias Urlichs <matthias@urlichs.de>
From: Gianluca Gabrielli <tuxmealux@protonmail.com>
Subject: Re: TCP Wireguard with socat
Message-ID: <6UEIqzXriyGvMmVuBKcld9Fp5XzM-oCiMdJtB514oZVXhuFiCQqQtcOkFmqWUkkpz4WHhr9_9q7M9BRpDwdTET41cDJCypfU7vv7jxpJfyk=@protonmail.com>
In-Reply-To: <XPP6R4g8xCtXsMbJljJf5ScBfx_FobBsPY66Hr7AO3venYsjyGhk0fdjtDnczcQUsMn18vZgB-CLkFCO54Ny-0LnWogx_T48_MdNsNiFd-o=@protonmail.com>
References: <utLzzyzPJsv-W3vVhU4Sdchg_5A07v9qCxR1DeJ5Wu7RzJHcje1cCEjtEWi4j0aCN05ozn9b4VYJQsLovvl6TGPp-kbZ_5kfpReEJHQQXGk=@protonmail.com>
 <e0bff705-f328-0071-0fb7-0367d36f0074@urlichs.de>
 <kvc0wmbZv_OgdINTzQhQnFxt0vFHFoqpVqYTFQkfPYOY_vqZHJN-bEvL9oJYuk-LJHubVyWlP2JCXTbRLK_9fGp7r298KveBFiOsF6P9r4Y=@protonmail.com>
 <88b9e6e0-1f38-1a20-3fac-372e96f847a3@urlichs.de>
 <XPP6R4g8xCtXsMbJljJf5ScBfx_FobBsPY66Hr7AO3venYsjyGhk0fdjtDnczcQUsMn18vZgB-CLkFCO54Ny-0LnWogx_T48_MdNsNiFd-o=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Reply-To: Gianluca Gabrielli <tuxmealux@protonmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Yes, I can confirm now. Wireguard + ssf[1] (UDP forwarding) works very well=
.
I will proceed doing some benchmark to understand how much this solution is=
 downgrading performance.=20

[1] https://github.com/securesocketfunneling/ssf=20

Cheers,
Gianluca
