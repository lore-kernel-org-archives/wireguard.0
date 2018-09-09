Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 394b645a
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 09:39:59 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22b41d15
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 09:39:59 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z96-v6so18843155wrb.8
 for <wireguard@lists.zx2c4.com>; Sun, 09 Sep 2018 02:40:34 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
Subject: Re: Should setting the listen-port require CAP_SYS_ADMIN in the
 socket namespace?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <dd90475d-b9be-95a7-d23d-9d9c89cb4f2c@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
Message-ID: <cbe7e13a-3155-ded7-9dc1-3c8f467d909b@gmail.com>
Date: Sun, 9 Sep 2018 11:40:32 +0200
MIME-Version: 1.0
In-Reply-To: <dd90475d-b9be-95a7-d23d-9d9c89cb4f2c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

To be clear: The solution described for the transit-net case also applies to 
the listen-port case:

Trying to change listen-port and/or transit-net should require CAP_SYS_ADMIN 
in the transit namespace unless the user also proves access to that namespace 
by passing an UDP socket from that namespace in the same call.
