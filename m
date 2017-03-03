Return-Path: peter@lekensteyn.nl
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 422eae03
 for <wireguard@lists.zx2c4.com>; Fri, 3 Mar 2017 16:06:50 +0000 (UTC)
Received: from lekensteyn.nl (lekensteyn.nl [178.21.112.251])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0a9298b
 for <wireguard@lists.zx2c4.com>; Fri, 3 Mar 2017 16:06:50 +0000 (UTC)
Received: by lekensteyn.nl with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <peter@lekensteyn.nl>) id 1cjplC-0007au-5k
 for wireguard@lists.zx2c4.com; Fri, 03 Mar 2017 17:08:54 +0100
Date: Fri, 3 Mar 2017 17:08:45 +0100
From: Peter Wu <peter@lekensteyn.nl>
To: wireguard@lists.zx2c4.com
Subject: Release of Wireshark dissector with decryption support
Message-ID: <20170303160845.GA29450@al>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi all!

I have been working on a WireGuard dissector for Wireshark with
decryption support for both Transport data and handshake messages.

Since the extract-keys utility included with WG is quite limited (needs
CONFIG_DEVKMEM=y and cannot obtain handshake secrets), I took a
different approach using kprobes and am able to obtain the three
handshake secrets too. (Future work includes obtaining just the
ephemeral keys and then deriving the keys from that.)

For code, documentation, screenshots and sample captures, see
https://github.com/Lekensteyn/wireguard-dissector

Dissection is functionally complete. The main remaining tasks include
adding expert info when the protocol is not being followed and
verification/decryption of Cookie Replies.
-- 
Kind regards,
Peter Wu
https://lekensteyn.nl
