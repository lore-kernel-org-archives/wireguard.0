Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e16244f1
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 21:55:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a11d4591
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 21:55:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ced1664
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 21:47:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a4e011c8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 21:47:05 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id i5-v6so2032124oth.1
 for <wireguard@lists.zx2c4.com>; Fri, 13 Apr 2018 15:10:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACf-YK=UBsAmk9V+3sZR+PcvqYU3tJgo4ASzw08XMJzZaNOvRQ@mail.gmail.com>
References: <CACf-YK=UBsAmk9V+3sZR+PcvqYU3tJgo4ASzw08XMJzZaNOvRQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 00:10:07 +0200
Message-ID: <CAHmME9qG_v5OPE5Ydj8rXxjoeE2VCoDr7BT54CCPL9cLif7x2g@mail.gmail.com>
Subject: Re: Conflict with broadcom component.
To: Jun Gyu Park <naulisreal@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jun,

Fascinating. I really don't know and I'll need to spend some time
looking into what on earth Broadcom has done with this kernel. There
appears to be some kind of data structure added to the skb that isn't
an skb anymore, under CONFIG_BCM_KF_NBUFF. "KuffinBuff"? I imagine the
correct fields aren't being reinitialized by skb_scrub_packet or the
like. Ubiquiti had a similar issue, which we were able to patch around
in compat.h. So hopefully there's a similarly simple fix for this
kernel here. Off the top of my head, though, I don't see exactly
what's up and I'll need to actually try to wrap my mind around
Broadcom's castle.

Jason
