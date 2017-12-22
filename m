Return-Path: outbackdingo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbf389fa
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Dec 2017 14:17:42 +0000 (UTC)
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
 [209.85.128.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33d3ec18
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Dec 2017 14:17:42 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id v21so17342418wrc.0
 for <wireguard@lists.zx2c4.com>; Fri, 22 Dec 2017 06:17:45 -0800 (PST)
MIME-Version: 1.0
From: Outback Dingo <outbackdingo@gmail.com>
Date: Fri, 22 Dec 2017 09:17:04 -0500
Message-ID: <CAKYr3zyw829Ed3Dxi1eACQJvQrgPe+H6FTOdNNBNAJVxDeKnxw@mail.gmail.com>
Subject: wireguard on embedded / no bash
To: WireGuard <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

ok enlighten me... embedded platform, no bash, simply bb sh

is there a wg / wg-quick source i can cross compile for the target

i have wireguard in-kernel on the device built from patched kernel sources

CONFIG_WIREGUARD=y

amongst the other kernel prereqs.
