Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 951988e6
 for <wireguard@lists.zx2c4.com>; Tue, 8 Nov 2016 16:06:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da5bc041
 for <wireguard@lists.zx2c4.com>; Tue, 8 Nov 2016 16:06:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b009f4f1
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Nov 2016 16:06:09 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id b14so143043180lfg.2
 for <wireguard@lists.zx2c4.com>; Tue, 08 Nov 2016 08:08:01 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 8 Nov 2016 17:07:57 +0100
Message-ID: <CAHmME9o7F9xUpw6j2ggvyS3+3eiKAj-7KpjDhZsJ-H2dtsFEGw@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Subject: [WireGuard] WireGuard on OpenWRT: Success
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey guys,

Using the latest netifd prototype with some modifications that was
posted a few days ago, I've just gotten WireGuard/OpenWRT running on a
cheap MIPS wifi router I found on the internet for =E2=82=AC10. All packets
from the wireless network get pushed over the tunnel to the
demo.wireguard.io WireGuard server. So far it's working pretty well,
and I have no complaints. I'll keep my eyes open for any problems, so
that WireGuard in OpenWRT can be first class.

Regards,
Jason
