Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8d2c646
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Feb 2017 18:27:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59529271
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Feb 2017 18:27:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce2e315f
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Feb 2017 18:27:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 14b35d52
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Feb 2017 18:27:13 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id 62so30006350oih.2
 for <wireguard@lists.zx2c4.com>; Sun, 26 Feb 2017 10:28:42 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 26 Feb 2017 19:28:41 +0100
Message-ID: <CAHmME9q1-uOmHHCQZR3WcS77MuehH8dLmbMCJKtMrw_mh+im_Q@mail.gmail.com>
Subject: wg-quick rule bypasses [Was: Re: Announcement: Public Wireguard
 server for testing]
To: =?UTF-8?Q?J=C3=B6rg_Thalheim?= <joerg@thalheim.io>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Jorg,

Moving this to a new thread.

On Sun, Feb 26, 2017 at 7:25 PM, J=C3=B6rg Thalheim <joerg@thalheim.io> wro=
te:
> In this context, I found the following rules useful to bypass the vpn for=
 some routes:
>
> #!/usr/bin/env bash
> # /etc/wireguard/<profile>.sh
>
> if [ "${1:-down}" =3D "up" ]; then
>   action=3D"add"
> else
>   action=3D"del"
> fi
>
> ip rule $action priority 32763 to 192.168.0.0/16 lookup main
> ip rule $action priority 32763 to 172.16.0.0/12 lookup main
> ip rule $action priority 32763 to 10.0.0.0/8 lookup main
> ip -6 rule $action priority 32763 to fd::/8 lookup main
> ip -6 rule $action priority 32763 to 2000::/3 unreachable
>
> #/etc/wireguard/<profile>.conf
>
> [Interface]
>
> #....
>
> PostUp=3D/etc/wireguard/<profile>.sh up
> PostDown=3D/etc/wireguard/<profile>.sh down

If any of those routes are already explicitly listed on the main
routing table (more specific than a /0 match), then this will already
happen. This is due to wg-quick's use of suppress_prefix 0.

Jaosn
