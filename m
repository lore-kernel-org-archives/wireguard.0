Return-Path: jungleboogie0@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a92d21a2
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 17:14:24 +0000 (UTC)
Received: from mail-it0-x22b.google.com (mail-it0-x22b.google.com
 [IPv6:2607:f8b0:4001:c0b::22b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 471a46b8
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 17:14:23 +0000 (UTC)
Received: by mail-it0-x22b.google.com with SMTP id d70-v6so5257863ith.1
 for <wireguard@lists.zx2c4.com>; Fri, 10 Aug 2018 10:25:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ef3a4875-25d2-8e05-2c75-bd77fa6d2828@gmail.com>
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
 <20180810200346.0e9646ac@natsu>
 <1dfc3b75-5737-0961-ba41-81d07e1e5c14@pobox.com>
 <CAKE2PDt5JNSP50bFcoai-pUYE1zeCtaRQKQZ6X+jH4yiNOcUBA@mail.gmail.com>
 <ef3a4875-25d2-8e05-2c75-bd77fa6d2828@gmail.com>
From: jungle Boogie <jungleboogie0@gmail.com>
Date: Fri, 10 Aug 2018 10:25:46 -0700
Message-ID: <CAKE2PDv3vuJuDyHiusmDyExDmu1Q9U+JDDD8i7Q8Lc-uBFJzDA@mail.gmail.com>
Subject: Re: Reflections on WireGuard Design Goals
To: Aaron Jones <aaronmdjones@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

>
> On 10/08/18 16:40, jungle Boogie wrote:
>> If someone already has my ssh key, I'd revoke it - regardless if
>> they had the password or not. Same with the WG key - shutdown the
>> tunnel, remove the affected peer and start it back up.
>
> No need to interrupt the tunnel.
>
> # wg set <interface> peer <publickey> remove
>

Dang, that's cool! That's for the info.
