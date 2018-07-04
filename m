Return-Path: stefan@agner.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7024930
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jul 2018 21:58:15 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2979d47f
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jul 2018 21:58:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 05 Jul 2018 00:04:51 +0200
From: Stefan Agner <stefan@agner.ch>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Android: TCP connection drop when disabling WiFi
In-Reply-To: <CAHmME9odvkuvmpA6Fg0D-Cwy7zzokFDcaB7QP384AHL6VOd9RA@mail.gmail.com>
References: <fada85c8aea2e15480602784fba3eeeb@agner.ch>
 <CAHmME9odvkuvmpA6Fg0D-Cwy7zzokFDcaB7QP384AHL6VOd9RA@mail.gmail.com>
Message-ID: <ef108e2dcc403e0e3aaf0d4b44df9568@agner.ch>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 04.07.2018 23:13, Jason A. Donenfeld wrote:
> Hi Stefan,
> 
> I wish this were the case too, but Android sends SOCK_DESTROY to
> everything when networks change, and there isn't a lot that can be
> done about it without rooting the device, as far as I can tell. If
> you've got some Android chops and can think of a way we can suppress
> that, I'd be very interested.

Ugh, so as I expected :-(

Unfortunately, I am not very familiar with Android.

It seems that Android only kills connection when addresses get removed.
The data connection stays on in background, so that is why 4G -> WiFi
works: No addresses get removed.

Same behavior when using "Always-on VPN" or "Block connections without
VPN". It really seems a silly behavior in the light of VPNs.

With SOCK_DESTROY I pretty quickly found netd and the code which
actually causes the connection drop. It seems to me that only
connections with an address which actually gets removed get dropped
NetlinkHandler::onEvent), but maybe I don't understand the full picture.

And after some more digging I found this commit with the promising title
"Do not destroy socket when VPN interface address is still in use":
https://android.googlesource.com/platform/system/netd/+/6c00b61656da32ce3223a2fc711f5649b6b7b5ac

However, it seems to me that this is not relly applicable in the
Wireguard case...

--
Stefan
