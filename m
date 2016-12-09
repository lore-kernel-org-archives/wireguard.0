Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bb0e815
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 10:40:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0050784
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 10:40:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c01ad0b
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 10:40:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3cf75791
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 10:40:49 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id g23so20697551wme.1
 for <wireguard@lists.zx2c4.com>; Fri, 09 Dec 2016 02:46:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <158e27c9da7.122ca5a7e30441.7068723817806019547@hda.me>
References: <158e27c9da7.122ca5a7e30441.7068723817806019547@hda.me>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 9 Dec 2016 11:46:26 +0100
Message-ID: <CAHmME9pXcgRY6-kQgwoSm8-Jni8WnmJx71F7ZL7zHGvYku8LxA@mail.gmail.com>
Subject: Re: New contrib/ Utility: wg-config
To: Anonymous Anonymous <admin@hda.me>
Content-Type: text/plain; charset=UTF-8
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I guess. But keep in mind that wg-config is an _example_, not
something meant to be standardized. It's a tiny bash script! I'd hate
for my terrible bash script to become some kind of "standard". It's
meant mostly as inspiration for people who want to build real tools,
which is why it's in the examples directory. (I added the makefile
install target specifically for Christian, I suppose, since he seems
to have some wild ideas of his own...)

But here, I added CONFIG_FILE_CONTENTS, so you don't need an extra
file. What a hack. But it actually works pretty cleanly.

/etc/wireguard/wg-vpn-gateway.env:

       CONFIG_FILE_CONTENTS="
       [Interface]
       PrivateKey = 6JiA3fa+NG+x5m6aq7+lxlVaVqVf1mxK6/pDOZdNuXc=

       [Peer]
       PublicKey = 6NagfTu+s8+TkEKpxX7pNjJuTf4zYtoJme7iQFYIw0A=
       AllowedIPs = 0.0.0.0/0
       Endpoint = demo.wireguard.io:29912
       "

       ADDRESSES=( 10.200.100.2/32 )

       post_add() {
               printf 'nameserver 10.200.100.1' | cmd resolvconf -a
"$INTERFACE" -m 0
       }
       post_del() {
               cmd resolvconf -d "$INTERFACE"
       }

Run to flip on the VPN:
# wg-config add wgvpn0 --env-file=/etc/wireguard/wg-vpn-gateway.env
Run to flip off the VPN:
# wg-config del wgvpn0 --env-file=/etc/wireguard/wg-vpn-gateway.env
