Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c4e8cc7
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 14:19:35 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3c0dbb6
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 14:19:35 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w11-v6so17556837wrc.5
 for <wireguard@lists.zx2c4.com>; Sat, 08 Sep 2018 07:20:04 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
Subject: Re: [PATCH 5/7] netlink: allow setting of transit net
To: Aaron Jones <aaronmdjones@gmail.com>
References: <20180908121841.8372-1-ju.orth@gmail.com>
 <20180908121841.8372-6-ju.orth@gmail.com>
 <a6d8b0be-1d69-c803-17f4-e23d49073c28@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
Message-ID: <a5352639-fe6b-7417-dd44-3cf893dcd020@gmail.com>
Date: Sat, 8 Sep 2018 16:20:02 +0200
MIME-Version: 1.0
In-Reply-To: <a6d8b0be-1d69-c803-17f4-e23d49073c28@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 9/8/18 4:03 PM, Aaron Jones wrote:
> Does this handle file descriptor 0 (unlikely, but perfectly valid) ?

I believe so.
