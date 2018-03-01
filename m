Return-Path: chm.duquesne@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8ec1ef2
 for <wireguard@lists.zx2c4.com>; Thu, 1 Mar 2018 21:29:32 +0000 (UTC)
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
 [209.85.220.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91f0b7f2
 for <wireguard@lists.zx2c4.com>; Thu, 1 Mar 2018 21:29:32 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id v124so9511806qkh.11
 for <wireguard@lists.zx2c4.com>; Thu, 01 Mar 2018 13:38:19 -0800 (PST)
MIME-Version: 1.0
Sender: chm.duquesne@gmail.com
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Thu, 1 Mar 2018 22:37:58 +0100
Message-ID: <CAHLp1YmDybu01qzrH4-=8U0Cm7__3myF4p75iejBB5Zd+AKs8g@mail.gmail.com>
Subject: Assigning addresses with avahi-autoipd
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

Hi,

I have been using tinc in the past, and they had a super convenient
mode called "switch", which could be used to assign ip addresses with
avahi:

https://www.tinc-vpn.org/examples/zeroconf-ip-and-dns/

I was wondering if there was a way to do the same with wireguard.

Similarly, I was wondering if dns-sd (resolving ".local" hostnames) would work.

Has anyone attempted to do this?

Best,
Christophe-Marie
