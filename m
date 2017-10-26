Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a75719dc
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 01:52:24 +0000 (UTC)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
 [209.85.218.51])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbd99fd7
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 01:52:24 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id c202so3189642oih.9
 for <wireguard@lists.zx2c4.com>; Wed, 25 Oct 2017 18:54:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171026013240.13503-1-Jason@zx2c4.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <20171026013240.13503-1-Jason@zx2c4.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Thu, 26 Oct 2017 03:53:43 +0200
Message-ID: <CAKXLc7fhJR8X6P6xDCuANkA+6wT2nkprg6ODdudwKmSH+zHd5g@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: use bind mount for DNS when no openresolv
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Just nitpicking on your spellchecker...

On Thu, Oct 26, 2017 at 3:32 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> +                 echo "# poses problems, run \`unmount /etc/resolv.conf\`."
should be
+                 echo "# poses problems, run \`umount /etc/resolv.conf\`."

Kalin.
