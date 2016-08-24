Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b880e5e
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Aug 2016 22:34:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 509f6e85
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Aug 2016 22:34:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d0769388
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Aug 2016 22:34:06 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id l89so22274325lfi.1
 for <wireguard@lists.zx2c4.com>; Wed, 24 Aug 2016 15:40:18 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 25 Aug 2016 00:40:16 +0200
Message-ID: <CAHmME9oHC47++nLGkFXjtoRgAkoOVfE_4EgQXiBsXmqsq1kTXQ@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Subject: [WireGuard] Session Key Extraction & Request for Dissector
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi folks,

WireGuard symmetric encryption keys are ephemeral, changing quite
frequently to ensure perfect forward secrecy. However, some folks
would like to be able to decrypt WireGuard packets inside of tcpdump
or WireGuard. I didn't want to compromise the integrity of the
ephemeral nature of the session keys by exposing them directly to
userspace, in any direct way at all, so instead I wrote a quick tool
that uses /dev/kmem to extract the session keys:

https://git.zx2c4.com/WireGuard/tree/contrib/examples/extract-keys

    # cd contrib/examples/extract-keys
    # make
    # ./extract-keys wg0
    0x57b56068 tMT...a1rQ= xvQ...KmY=
    0x01662508 LbM...osTs= 4VA...OYI=

The first value is the index, which should match against the index in
the transport packet. Then, the first key is the key used for sending,
and the second key is the key used for receiving. The ciphertext will
decrypt with standard ChaCha20Poly1305, and if you take a look at
wireguard.io/protocol/ you'll see that the nonce is prepended.

In my testing, this method turns out to be quite reliable.

I'm wondering: would anybody be interested in writing a wireshark
dissector to WireGuard packets? You can use the extract-keys/ code as
a jumping off point.

Thanks,
Jason
