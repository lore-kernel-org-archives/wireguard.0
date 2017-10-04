Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd9db357
 for <wireguard@lists.zx2c4.com>; Wed, 4 Oct 2017 10:49:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3604d5fb
 for <wireguard@lists.zx2c4.com>; Wed, 4 Oct 2017 10:49:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1204cbbb
 for <wireguard@lists.zx2c4.com>; Wed, 4 Oct 2017 11:08:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1ea35db8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Oct 2017 11:08:28 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id n82so11743067oig.3
 for <wireguard@lists.zx2c4.com>; Wed, 04 Oct 2017 04:18:25 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 4 Oct 2017 13:18:24 +0200
Message-ID: <CAHmME9qPYL-wzyX0Q7RG7Uk9kAeWbzNN5=0YrmbniUR2O3rSxA@mail.gmail.com>
Subject: multi producer / multi consumer lock-free queue with ptr_ring
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Michael,

Thanks for your work on ptr_ring.h. I'm interested in using it, but in
a multi-producer, multi-consumer context. I realize it's been designed
for a single-producer, single-consumer context, and thus uses a
spinlock. I'm wondering if you'd be happy to receive patches that
implement things in a lock-free way, in order to make the data
structure more broadly usable.

In case you're curious, this would be used for the multi-core
algorithms in WireGuard.

Thanks,
Jason
