Return-Path: bjin@ctrl-d.org
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
 [209.85.215.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e1f9d37
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jul 2016 20:49:44 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id l69so13575779lfg.1
 for <wireguard@lists.zx2c4.com>; Tue, 26 Jul 2016 13:52:18 -0700 (PDT)
MIME-Version: 1.0
From: Bin Jin <bjin@ctrl-d.org>
Date: Tue, 26 Jul 2016 22:51:56 +0200
Message-ID: <CAHQn_MD74m-mHQLCbK7UG72BnCdbVbdUpiD0jF4Jk1NFuJMLAw@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: [WireGuard] Suggestion: Hide private key by default with wg tool
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello Jason,

I think there is a potential security issue regarding the use of "wg"
tool. By default "wg" will print the private keys in plain text to the
console. This isn't going to be a big issue in general, but if I was
showing my friend how to use wireguard, or using my computer in public
places with surveillance camera, without a option to hide private keys
I would very likely get my private keys compromised. IIUC, compromise
of private key won't have security impact assuming a passive attacker,
and an active attacker needs to have private keys from both side to
perform a MitM attack. But nonetheless, I think this could be fixed
very easily, to avoid actual potential security compromise.

Considering that most people would probably type "wg" without any
further options that explicitly hide all private keys (either without
the knowledge of the option, or by accident). I would suggest to hide
the private key by default (showing some text like "(private key
hidden by default)" instead), and add an option to allow user to
explicitly showing the private key like "--show-private-keys".

Thanks!

Bin
