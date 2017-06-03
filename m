Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dfd68b3
 for <wireguard@lists.zx2c4.com>; Sat, 3 Jun 2017 01:17:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7fb1563
 for <wireguard@lists.zx2c4.com>; Sat, 3 Jun 2017 01:17:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c6eeac9
 for <wireguard@lists.zx2c4.com>; Sat, 3 Jun 2017 01:29:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ab0b9bc0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 3 Jun 2017 01:29:16 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id o65so86155475oif.1
 for <wireguard@lists.zx2c4.com>; Fri, 02 Jun 2017 18:31:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKgwHq-d0vMPLsQ7p1WjW4yiUehDG3vCKYZkodDx+P8yamkCNw@mail.gmail.com>
References: <c04b7a897d9fce0a@frisell.zx2c4.com>
 <CAKgwHq-d0vMPLsQ7p1WjW4yiUehDG3vCKYZkodDx+P8yamkCNw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 3 Jun 2017 03:31:16 +0200
Message-ID: <CAHmME9oGkubUS-cvcepvF4-JDo8-J8Pdfg7fDoOj=dNE-hsa1w@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20170531` Available
To: Le Sandie <lesandie@gmail.com>
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

On Sat, Jun 3, 2017 at 12:47 AM, Le Sandie <lesandie@gmail.com> wrote:
> I have tested the WireGuard-0.0.20170531 snapshot between two ARM peers (a
> couple of rpi3s with the same snapshot) and it works nice. I haven't had
> time to iperf but will do to check that performance raise in ARM SoCs.

Great, please do let me know.

>
> Also i tested this snapshot with one ARM peer and the other peer with a LEDE
> (17.01.1) router with wireguard and the handshake goes well but no
> connectivity between peers. If i downgrade the ARM peer snapshot to
> WireGuard-0.0.20170421, both peers see each other with connectivity.
> Probably when the openwrt/LEDE package maintainer bump up the package to the
> new snapshot it will work.

Yes indeed there was a backwards incompatible change made. The
openwrt/lede package already has been bumped, however, so just update
your system.
https://github.com/openwrt/packages/blob/master/net/wireguard/Makefile
