Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3aff6e42
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Apr 2018 18:57:12 +0000 (UTC)
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
 [209.85.128.193])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49d6072a
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Apr 2018 18:57:12 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id s18-v6so30791402wrg.9
 for <wireguard@lists.zx2c4.com>; Sat, 21 Apr 2018 11:57:34 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Message-ID: <1524337049.2059.29.camel@gmail.com>
Subject: Re: Interface's Address is not saved when SaveConfig = true in config
From: ST <smntov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 21 Apr 2018 21:57:29 +0300
In-Reply-To: <CAHmME9q_7DK67f=TakrRimX7fs_ZrKQrNP8wHoauj3r7GwRsyQ@mail.gmail.com>
References: <1524220589.2059.27.camel@gmail.com>
 <CAHmME9q_7DK67f=TakrRimX7fs_ZrKQrNP8wHoauj3r7GwRsyQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Debian 8 Jessie
iproute2/oldstable,now 3.16.0-2 amd64


On Fri, 2018-04-20 at 21:39 +0000, Jason A. Donenfeld wrote:
> Out of date iproute2?
> 
> 
> Which distro? Version?
> 
> --
> Sent from my telephone.
> 
> 
> On Fri, Apr 20, 2018, 12:36 ST <smntov@gmail.com> wrote:
> 
>         Hello,
>         
>         I have 
>         ...
>         Address = 192.168.4.1/24
>         SaveConfig = true
>         in wg0.conf
>         
>         1. if I add a peer with `wg set wg0 peer ...` WG doesn't add
>         it
>         immediately to the wg0.conf file, only after I run `wg-quick
>         down wg0`.
>         Why not? What happens if the system crashes unexpectedly?...
>         The peer
>         will not be saved to the config file and the information will
>         be lost.
>         
>         
>         2. once I run `wg-quick down wg0` I get:
>         
>         Option "-all" is unknown, try "ip -help".
>         cat: /etc/resolvconf/run/interface/wg0: No such file or
>         directory
>         [#] wg showconf wg0
>         sync: ignoring all arguments
>         [#] ip link delete dev wg0
>         
>         Now the wg0.conf is enhanced with the peer details that was
>         added
>         through command line, but the Address = 192.168.4.1/24
>         disappears from
>         the config. So running `wg-quick up wg0` again doesn't assigns
>         IP to the
>         wg0 interface... What's wrong?
>         
>         I'm using version:
>         apt list wireguard
>         wireguard/unstable,now 0.0.20180304-1 all [installed]
>         
>         Thank you!
>         
>         
>         _______________________________________________
>         WireGuard mailing list
>         WireGuard@lists.zx2c4.com
>         https://lists.zx2c4.com/mailman/listinfo/wireguard
