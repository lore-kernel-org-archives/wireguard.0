Return-Path: tuxmealux@protonmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58539e91
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 14:27:44 +0000 (UTC)
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id edb78e74
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 14:27:44 +0000 (UTC)
Date: Mon, 12 Mar 2018 10:37:40 -0400
To: Matthias Urlichs <matthias@urlichs.de>
From: Gianluca Gabrielli <tuxmealux@protonmail.com>
Subject: Re: TCP Wireguard with socat
Message-ID: <XPP6R4g8xCtXsMbJljJf5ScBfx_FobBsPY66Hr7AO3venYsjyGhk0fdjtDnczcQUsMn18vZgB-CLkFCO54Ny-0LnWogx_T48_MdNsNiFd-o=@protonmail.com>
In-Reply-To: <88b9e6e0-1f38-1a20-3fac-372e96f847a3@urlichs.de>
References: <utLzzyzPJsv-W3vVhU4Sdchg_5A07v9qCxR1DeJ5Wu7RzJHcje1cCEjtEWi4j0aCN05ozn9b4VYJQsLovvl6TGPp-kbZ_5kfpReEJHQQXGk=@protonmail.com>
 <e0bff705-f328-0071-0fb7-0367d36f0074@urlichs.de>
 <kvc0wmbZv_OgdINTzQhQnFxt0vFHFoqpVqYTFQkfPYOY_vqZHJN-bEvL9oJYuk-LJHubVyWlP2JCXTbRLK_9fGp7r298KveBFiOsF6P9r4Y=@protonmail.com>
 <88b9e6e0-1f38-1a20-3fac-372e96f847a3@urlichs.de>
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

Do you have any link about documentation which explains this socat's behavi=
or?

SSH should does something similar when is used for tunneling, it just open =
a TCP connection and then forwards everything through it, without wrapping =
every single packet.
BTW on this thread (https://superuser.com/questions/53103/udp-traffic-throu=
gh-ssh-tunnel) they show how to perform UDP over TCP tunnel.
I tried with Secure Socket Funneling (ssf), setting netcat listening on UDP=
-mode (-u) on the server, and I was able to send strings to it from the cli=
ent.
Now I think it would just takes some time before starting to use wireguard =
inside this tunnel.

If someone of you want to make some tests on his own devices, I really appr=
eciate if you'll share your finding with me.
