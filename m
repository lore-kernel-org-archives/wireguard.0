Return-Path: jungleboogie0@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d89732b
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 16:29:14 +0000 (UTC)
Received: from mail-it0-x234.google.com (mail-it0-x234.google.com
 [IPv6:2607:f8b0:4001:c0b::234])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85c5cd5f
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 16:29:14 +0000 (UTC)
Received: by mail-it0-x234.google.com with SMTP id s7-v6so3408873itb.4
 for <wireguard@lists.zx2c4.com>; Fri, 10 Aug 2018 09:40:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1dfc3b75-5737-0961-ba41-81d07e1e5c14@pobox.com>
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
 <20180810200346.0e9646ac@natsu>
 <1dfc3b75-5737-0961-ba41-81d07e1e5c14@pobox.com>
From: jungle Boogie <jungleboogie0@gmail.com>
Date: Fri, 10 Aug 2018 09:40:36 -0700
Message-ID: <CAKE2PDt5JNSP50bFcoai-pUYE1zeCtaRQKQZ6X+jH4yiNOcUBA@mail.gmail.com>
Subject: Re: Reflections on WireGuard Design Goals
To: Brian Candler <b.candler@pobox.com>
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

On 10 August 2018 at 09:03, Brian Candler <b.candler@pobox.com> wrote:
> On 10/08/2018 16:03, Roman Mamedov wrote:
>
> But I'd feel a lot happier if a second level of authentication were
> required to establish a wireguard connection, if no packets had been
> flowing for more than a configurable amount of time - say, an hour. It
> would give some comfort around lost/stolen devices.
>
> Couldn't you just encrypt your home directory? Or even the root FS entirely.
> Either of those should be a must on a portable device storing valuable
> information.
>
> But by analogy, would you say that SSH keys and PGP keys don't need
> protection by a passphrase?
>

If someone already has my ssh key, I'd revoke it - regardless if they
had the password or not.
Same with the WG key - shutdown the tunnel, remove the affected peer
and start it back up.
