Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7324d543
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 18:43:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36d35d79
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 18:43:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f74cb18
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 18:43:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b02cea69
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 18:43:15 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id u193so12445418oie.1
 for <wireguard@lists.zx2c4.com>; Mon, 04 Dec 2017 10:49:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171204183753.GA5311@black.transpect.com>
References: <20171204160159.GA27666@black.transpect.com>
 <CAHmME9o3+SBZfsWLUczAxKOxmBcWeJYyx_wpGnk_sXNbb8aZgA@mail.gmail.com>
 <20171204172937.GA11936@black.transpect.com>
 <0e21b9be-bb38-427c-629b-a45473d6e223@gmail.com>
 <20171204183753.GA5311@black.transpect.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 4 Dec 2017 19:49:54 +0100
Message-ID: <CAHmME9pYX+1t90dWe9HCmjn_g51USh2gCZ+Stre+5_1W6ej0iA@mail.gmail.com>
Subject: Re: What are the options for stopping and starting?
To: Whit Blauvelt <whit@transpect.com>
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

On Mon, Dec 4, 2017 at 7:37 PM, Whit Blauvelt <whit@transpect.com> wrote:
> Yes, removing the link should disable it. But that's overkill. Assuming I
> want to leave the device in place, and the IP assignments there for
> subsequent use by WireGuard, is there a simple way to shut WireGuard off,
> without tearing down more than required?

Answered earlier: `ip link set wg0 down`.

Come on into #wireguard and we can give you a hand with your
particular configuration needs.

Jason
