Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5cc3552c
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Feb 2018 20:03:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9c2ab59
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Feb 2018 20:03:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 391c4015
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Feb 2018 19:54:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2fcc3e9b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Feb 2018 19:54:12 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id l12so3419298otj.7
 for <wireguard@lists.zx2c4.com>; Wed, 28 Feb 2018 12:11:42 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 28 Feb 2018 21:11:41 +0100
Message-ID: <CAHmME9pPRCTf1MyN9RgPKPYZ2Wscnvrgqq9b1gWhMg5ovTu9Xg@mail.gmail.com>
Subject: ephemeral key extraction
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

Hi list,

WireGuard does not provide a userspace interface for getting transport
data session keys, or ephemeral handshake keys. This is by design. No
backdoors!

However, Peter (CC'd) wants to write a Wireshark dissector, so we've
made a little kprobe-based utility to extract just the minimal amount
of cryptographic information from the kernel upon a certain event, and
then this information can be combined with information gathered over
the wire from packets in order to derive every secret used by the
system and decrypt all packets.

We first determine struct offsets using offset-finder [1]. This
exploit-trick is first compiled using the kernel toolchain, and then
compiled again using the normal toolchain, and then the two object
files are linked together [2] and the result prints the struct
offsets. Fortunately these will be stable offsets because they're not
dependent on kernel config values or weird types. Next we install
kprobes on one particular function using extract-handshakes.sh [3],
which then starts dumping output from that probe and writing it to
standard out in base64 format.

>From quick tests, this all is quite reliable.

For a few days, I'll run a simple netcat server on demo.wireguard.com.
Try typing `nc demo.wireguard.com 58812` and then connecting to the
demo box like usual. Basically, it's every cryptographer's girlfriend
Eve's wildest fantasy. All of the key compromises all of the time!

Code lives here:
https://git.zx2c4.com/WireGuard/tree/contrib/examples/extract-handshakes

Enjoy!
Jason


[1] https://git.zx2c4.com/WireGuard/tree/contrib/examples/extract-handshakes/offset-finder.c
[2] https://git.zx2c4.com/WireGuard/tree/contrib/examples/extract-handshakes/Makefile
[3] https://git.zx2c4.com/WireGuard/tree/contrib/examples/extract-handshakes/extract-handshakes.sh
