Return-Path: jaapbuurman@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1099decb
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 08:01:09 +0000 (UTC)
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f54013e
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 08:01:09 +0000 (UTC)
Received: by mail-it0-x235.google.com with SMTP id l6-v6so4041297iti.2
 for <wireguard@lists.zx2c4.com>; Tue, 29 May 2018 01:03:06 -0700 (PDT)
MIME-Version: 1.0
From: Jaap Buurman <jaapbuurman@gmail.com>
Date: Tue, 29 May 2018 10:03:05 +0200
Message-ID: <CAN-r--kLC4bAG0oAGp0gDO7Q2Ro0X9J5L-HY3sXaRz-zeZDR6Q@mail.gmail.com>
Subject: Wireguard & hw flow offload incompatibility
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Dear all,

When running a wireguard interface on the latest Lede master branch,
the router will crash as soon as traffic hits the wireguard interface
while (hw) flow offloading is enabled. I am not sure whether this is a
bug with wireguard, hw flow offload, both or neither, so I am
reporting the bug to both mailinglists. A more detailed description
plus a properly formatted stack trace can be found on Lede's bug
tracker: https://bugs.openwrt.org/index.php?do=details&task_id=1539

If you require any additional information, please do not hesitate to
contact me. Thank you very much in advance.

Yours sincerely,

Jaap Buurman
