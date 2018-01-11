Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a1beef2
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 14:58:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c472021
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 14:58:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b80d5ca0
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 14:49:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c67db9ec
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 14:49:31 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id 37so2303270otv.6
 for <wireguard@lists.zx2c4.com>; Thu, 11 Jan 2018 07:00:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87efmy42c0.fsf@fifthhorseman.net>
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
 <871siz6ouv.fsf@fifthhorseman.net>
 <CAHmME9qrfy4Lf78NkChdv6tPnSFTcGArwgsizAaapL9k=Tc31w@mail.gmail.com>
 <87efmy42c0.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 11 Jan 2018 16:00:55 +0100
Message-ID: <CAHmME9o4oMAuW5n0f06-XAF+=kovi7BEi4GE3xjQ1-awrxgNvA@mail.gmail.com>
Subject: Re: WireGuard in systemd-networkd
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

Hey Daniel,

On Wed, Jan 10, 2018 at 8:09 AM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> cool.  this sounds very much like you've decided that the netlink
> interface is now stable, which is good to hear

Yep!

>   0)  Recommends: wireguard-tools
>   4)  Recommends: wireguard-tools
>       Suggests: systemd
>
>
> Of the above, i think i'll probably either stick with 0 or move to 4.
> given what you said above, i don't really like the idea of using the
> disjunction; people already running systemd will have systemd-networkd
> available; and i don't want the wireguard-dkms package to encourage
> people to install systemd if they've already made a decision to avoid
> the default and not use it.

I think it probably makes most sense to stick with 0.


Jason
