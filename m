Return-Path: nicolas@eisfunke.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b00e8fcb
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 14:30:58 +0000 (UTC)
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31b14fe9
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 14:30:58 +0000 (UTC)
From: Eisfunke <nicolas@eisfunke.com>
To: wireguard@lists.zx2c4.com
Subject: Re: Reflections on WireGuard Design Goals
Date: Fri, 10 Aug 2018 16:42:15 +0200
Message-ID: <1898878.xtpBxs3Iqk@miranda>
In-Reply-To: <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: Brian Candler <b.candler@pobox.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello together,

> In the absence of that, it would be nice if the private key which is
> stored on the laptop were encrypted with a passphrase.  Simplest option
> may be to extend wg-quick so that the entire config file can be
> pgp-encrypted.

one can already do that via the wg-quick PostUp hook, check out the Arch Linux 
wiki:
https://wiki.archlinux.org/index.php/
WireGuard#Store_private_keys_in_encrypted_form

The example is using pass, switching it for direct GPG (or keepassxc or 
anything, really) should be easily possible.

Considering that possibility, I don't think adding GnuPG directly into 
Wireguard would be a good idea. It would just add complexity for little to no 
benefit.

Greetings,
NIcolas Lenz
