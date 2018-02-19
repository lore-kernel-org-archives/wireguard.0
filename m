Return-Path: lists@jave.fr
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8cd6208
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Feb 2018 20:10:43 +0000 (UTC)
Received: from za.albalogic.fr (za.albalogic.fr [178.32.101.6])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2c38d98
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Feb 2018 20:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by za.albalogic.fr (Postfix) with ESMTP id 6412B3E2530
 for <wireguard@lists.zx2c4.com>; Mon, 19 Feb 2018 21:18:14 +0100 (CET)
Received: from za.albalogic.fr ([127.0.0.1])
 by localhost (za.albalogic.fr [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Xbi3La-htYYJ for <wireguard@lists.zx2c4.com>;
 Mon, 19 Feb 2018 21:18:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by za.albalogic.fr (Postfix) with ESMTP id 407BC3E252F
 for <wireguard@lists.zx2c4.com>; Mon, 19 Feb 2018 21:18:14 +0100 (CET)
Received: from za.albalogic.fr ([127.0.0.1])
 by localhost (za.albalogic.fr [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lfP0quYsedGD for <wireguard@lists.zx2c4.com>;
 Mon, 19 Feb 2018 21:18:14 +0100 (CET)
Received: from za.albalogic.fr (za.albalogic.fr [178.32.101.6])
 by za.albalogic.fr (Postfix) with ESMTP id 2FE083E252E
 for <wireguard@lists.zx2c4.com>; Mon, 19 Feb 2018 21:18:14 +0100 (CET)
Date: Mon, 19 Feb 2018 21:18:14 +0100 (CET)
From: Eric Dillmann <lists@jave.fr>
To: wireguard@lists.zx2c4.com
Message-ID: <28272814.1271279.1519071494156.JavaMail.zimbra@jave.fr>
Subject: Alternative to UDP
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

Today i discovered that OVH is limiting UDP rate to 6Mbit/s, i did a test by encapsulating wireguard in an ip/ip tunnel
and got 90Mbit/S. 

Is there a way to make wireguard evolve to use it's own protocol number.

That would prevent the overhead of wireguard over ipip/gre/vxlan ...

Thanks,
Regards,
Eric
