Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e15b378
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:53:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 714f9dc3
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:53:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae348be3
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:53:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 44714657
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:53:55 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id g125so9681772oib.12
 for <wireguard@lists.zx2c4.com>; Tue, 07 Nov 2017 01:57:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171107043817.9050-1-aurelien@chabot.fr>
References: <20171107043817.9050-1-aurelien@chabot.fr>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 7 Nov 2017 18:57:06 +0900
Message-ID: <CAHmME9pijXJYSO0RcwEidKS8RvNtKUVn-UNwYyDbYzKWmrbWww@mail.gmail.com>
Subject: Re: WireGuard root-less support for android
To: =?UTF-8?Q?Aur=C3=A9lien_Chabot?= <aurelien@chabot.fr>,
 Mathias <mathias@hall-andersen.dk>, Samuel Holland <samuel@sholland.org>
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

Hi Aur=C3=A9lien,

Thanks for this patchset. I'll review it ASAP.

As an administrative situation, your set of Go changes will likely
need to be merged back up with the official Go repository; putting
your fork in the Android one isn't really tenable.

So please submit your changes to the wireguard-go project to this list too.

I intend to give a pass at this patchset as soon as I'm back from netdevcon=
f.

Mathias, CCd will also review the Go code, and Samuel, CCd will review
the Java code.

Thanks for this contribution!

By the way, please poke me on IRC; it'd be nice to coordinate this
terrific development you're doing; this was a pleasant surprise out of
the blue.

Jason
