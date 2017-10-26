Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e1fa8b1
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 13:09:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53383fcf
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 13:09:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f62b3f58
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 13:09:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id aec58e3f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 13:09:26 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id f66so5530576oib.2
 for <wireguard@lists.zx2c4.com>; Thu, 26 Oct 2017 06:11:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Oct 2017 15:11:08 +0200
Message-ID: <CAHmME9oasp-4Y0v_b=+mQtnZ8ydjZo-Wgxi4ZjrvHv10AYRKVA@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Oct 26, 2017 at 12:43 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> The hatchet works as follows. On interface addition:
>
> # echo nameserver 1.2.3.4 > /etc/resolv.conf.wg-quick.wg0
> # [ -f /etc/resolv.conf ] || touch /etc/resolv.conf
> # mount -o ro --bind /etc/resolv.conf.wg-quick.wg0 /etc/resolv.conf
> # unlink /etc/resolv.conf.wg-quick.wg0
>
> On interface removal:
>
> # umount /etc/resolv.conf

Alternative version:

echo nameserver 1.2.3.4 | unshare -m --propagation shared sh -c "mount
--make-private /tmp && mount -t tmpfs none /tmp && cat >
/tmp/resolv.conf && mount -o remount,ro /tmp && mount -B
/tmp/resolv.conf /etc/resolv.conf"

This has the advantage of not using any disk temporary files or
creating dangling inodes, and it means that users can still bind mount
/etc/resolv.conf to other places, such as when they enter a chroot,
which is usually important to allow. The one maybe disadvantage is
that it still allows for people binding _on top_ of /etc/resolv.conf,
which may or may not be a good thing.
