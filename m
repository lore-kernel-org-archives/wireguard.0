Return-Path: yuanchaosun@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d75135c
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 07:42:18 +0000 (UTC)
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a9ca76f
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 07:42:18 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id w73so11083187wmw.0
 for <wireguard@lists.zx2c4.com>; Mon, 27 Nov 2017 23:48:09 -0800 (PST)
Return-Path: <yuanchaosun@gmail.com>
From: Yuanchao Sun <yuanchaosun@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 0/1] remove '\n' in fscanf format-string
Date: Tue, 28 Nov 2017 15:49:46 +0800
Message-Id: <20171128074947.2212-1-yuanchao.sun@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

fscanf will not return until a non-whitespace
character is read after errno=0\n\n

Yuanchao Sun (1):
  tools: remove '\n' in fscanf format-string

 src/tools/ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.15.0
