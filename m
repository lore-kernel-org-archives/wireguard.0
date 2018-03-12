Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6428f027
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 18:38:06 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a6b69fc
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 18:38:06 +0000 (UTC)
Subject: Re: TCP Wireguard with socat
To: Gianluca Gabrielli <tuxmealux@protonmail.com>
References: <utLzzyzPJsv-W3vVhU4Sdchg_5A07v9qCxR1DeJ5Wu7RzJHcje1cCEjtEWi4j0aCN05ozn9b4VYJQsLovvl6TGPp-kbZ_5kfpReEJHQQXGk=@protonmail.com>
 <e0bff705-f328-0071-0fb7-0367d36f0074@urlichs.de>
 <kvc0wmbZv_OgdINTzQhQnFxt0vFHFoqpVqYTFQkfPYOY_vqZHJN-bEvL9oJYuk-LJHubVyWlP2JCXTbRLK_9fGp7r298KveBFiOsF6P9r4Y=@protonmail.com>
 <88b9e6e0-1f38-1a20-3fac-372e96f847a3@urlichs.de>
 <XPP6R4g8xCtXsMbJljJf5ScBfx_FobBsPY66Hr7AO3venYsjyGhk0fdjtDnczcQUsMn18vZgB-CLkFCO54Ny-0LnWogx_T48_MdNsNiFd-o=@protonmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <5e7ded44-d128-ed3a-c9e2-0b0480b4d89f@urlichs.de>
Date: Mon, 12 Mar 2018 19:47:35 +0100
MIME-Version: 1.0
In-Reply-To: <XPP6R4g8xCtXsMbJljJf5ScBfx_FobBsPY66Hr7AO3venYsjyGhk0fdjtDnczcQUsMn18vZgB-CLkFCO54Ny-0LnWogx_T48_MdNsNiFd-o=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 12.03.2018 15:37, Gianluca Gabrielli wrote:
> BTW on this thread (https://superuser.com/questions/53103/udp-traffic-through-ssh-tunnel) they show how to perform UDP over TCP tunnel.

Yeah, and in the comments people explain why this is a bad idea.

Look, this is fairly easy to understand. TCP is a byte stream. It does
not know about packets; if you read from it you get N of the bytes the
other side has written, no matter in what chunks. TUN/TAP on the other
hand is a packet interface. It doesn't understand partial or aggregated
packets – it wants exactly one complete packet per write() call.

It's like pouring multiple cups of water at a time through a funnel. If
you pour slowly enough, each distinct chunk of water arrives at the
other end so that you can distinguish the original amounts, but if you
pour too fast or if there's an obstruction in the flow the distinction
gets lost and you lose packets (or, worse, the receiver sees additional
gibberish at their end).

Just use ssf. It's a tool that's built to do the job right. socat is
not, and it will not.

-- 
-- Matthias Urlichs
