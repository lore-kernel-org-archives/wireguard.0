Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e3ec56d
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 21:44:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6cc3c56
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 21:44:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad0c11b5
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 21:44:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8937a801
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 21:44:41 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id l18so10429885oig.2
 for <wireguard@lists.zx2c4.com>; Wed, 10 May 2017 14:55:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170510215728.23275d88@msi.defcon1>
References: <20170510003254.2f810c1d@msi.defcon1>
 <196a1f14-d30b-3926-561c-baf3c8c73c58@york.ac.uk>
 <20170510101013.715986f0@msi.defcon1>
 <CAHmME9qM7i=JCz7NSbSPk8_s1wy1tvYAdudBJwEx6sutqBX4xQ@mail.gmail.com>
 <20170510200501.1126bb62@msi.defcon1>
 <CAHmME9rWXev+=cp6FLgwSh+_01nHp7uyRXWGZms9JjfVamhMeg@mail.gmail.com>
 <20170510215728.23275d88@msi.defcon1>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 10 May 2017 23:55:14 +0200
Message-ID: <CAHmME9oD6mUdnG6_p-C+H5GhwiVLJycQY73ydDqg7WZ9r1iU0g@mail.gmail.com>
Subject: Re: SSH stuck
To: Bzzzz <lazyvirus@gmx.com>
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

On Wed, May 10, 2017 at 9:57 PM, Bzzzz <lazyvirus@gmx.com> wrote:
> You're right, seems tied to the 4.9 kernel &| the ifconfig program
> as it does the same weird thing to my eth0 I/F :/

$ ip link set mtu 1416 dev wg0
