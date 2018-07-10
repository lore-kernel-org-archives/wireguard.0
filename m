Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73912d0b
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 14:50:05 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7fc41266
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 14:50:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d6a497f
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 14:48:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ea324a5b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 14:48:50 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id q11-v6so17590459oic.12
 for <wireguard@lists.zx2c4.com>; Tue, 10 Jul 2018 07:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <b9ab5d4d26c6fe7b@frisell.zx2c4.com>
 <20180710195436.357fb972@natsu>
In-Reply-To: <20180710195436.357fb972@natsu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Jul 2018 16:57:14 +0200
Message-ID: <CAHmME9peVZz_x2tQPGng68N1bphyYMHi4FxK9PV4Tt5XRLf4fQ@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180708` Available
To: Roman Mamedov <rm@romanrm.net>
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

Hey Roman,

Thanks for the update. That's great to hear.

The latest snapshot will still have the same preemption relaxation
with simd_relax(), but gets performance gains by moving to napi, so
it's still faster overall. If you want the simd_relax() to not take a
hit and get maximum throughput, the right way of doing this is
actually to just disable preemption in your kernel with
PREEMPT_NONE=y.

Jason
