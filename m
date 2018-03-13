Return-Path: tuxmealux@protonmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c409ff62
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Mar 2018 09:09:17 +0000 (UTC)
Received: from mail3.protonmail.ch (mail3.protonmail.ch [185.70.40.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e618eb09
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Mar 2018 09:09:17 +0000 (UTC)
Date: Tue, 13 Mar 2018 05:19:18 -0400
To: Matthias Urlichs <matthias@urlichs.de>
From: Gianluca Gabrielli <tuxmealux@protonmail.com>
Subject: Re: TCP Wireguard with socat
Message-ID: <2LLzGYJnMQQE8ZVLLI49kcqDj8mQIdytgKD08XsZHwPaBjfN8f3WkcJZA3j4XFXW6sS1UnXfCY2GyS2PIUSGJOfPUZweZQa-tnWcUcPKzFM=@protonmail.com>
In-Reply-To: <5e7ded44-d128-ed3a-c9e2-0b0480b4d89f@urlichs.de>
References: <utLzzyzPJsv-W3vVhU4Sdchg_5A07v9qCxR1DeJ5Wu7RzJHcje1cCEjtEWi4j0aCN05ozn9b4VYJQsLovvl6TGPp-kbZ_5kfpReEJHQQXGk=@protonmail.com>
 <e0bff705-f328-0071-0fb7-0367d36f0074@urlichs.de>
 <kvc0wmbZv_OgdINTzQhQnFxt0vFHFoqpVqYTFQkfPYOY_vqZHJN-bEvL9oJYuk-LJHubVyWlP2JCXTbRLK_9fGp7r298KveBFiOsF6P9r4Y=@protonmail.com>
 <88b9e6e0-1f38-1a20-3fac-372e96f847a3@urlichs.de>
 <XPP6R4g8xCtXsMbJljJf5ScBfx_FobBsPY66Hr7AO3venYsjyGhk0fdjtDnczcQUsMn18vZgB-CLkFCO54Ny-0LnWogx_T48_MdNsNiFd-o=@protonmail.com>
 <5e7ded44-d128-ed3a-c9e2-0b0480b4d89f@urlichs.de>
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

Thanks Matthias, now I see your point.

I'm wondering why we should prepend a length to each datagram. On the datag=
ram's header the payload length is already present, should not be enough to=
 reconstruct the original datagram after the stream has been unwrapped?

Cheers,
Gianluca
