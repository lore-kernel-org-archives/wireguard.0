Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a663fa9
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 11:35:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 723d9c7c
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 11:35:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c254182
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 11:33:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0a5239a0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 11:33:49 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id l10-v6so558242oii.0
 for <wireguard@lists.zx2c4.com>; Mon, 23 Jul 2018 04:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <emf8caba7e-aff8-451d-9ead-efc6ca4ae091@lee-pc>
 <20180721221805.GD10598@latitude>
 <em2e24e324-b892-408f-b01f-9e4a1e77497f@lee-pc>
In-Reply-To: <em2e24e324-b892-408f-b01f-9e4a1e77497f@lee-pc>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Jul 2018 13:43:53 +0200
Message-ID: <CAHmME9rkYiCij-j-OYeG6jU9P1vUPuAo43tiQh8XRD6QkddCKg@mail.gmail.com>
Subject: Re: Re[2]: Very low throughput in *BSDs (but only as a router)
To: rainmakerraw@icloud.com
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

Hey Lee,

That's surprising to hear. Indeed userspace is slower than kernel
space, but on sufficiently fast hardware you won't notice much of a
difference at those low speeds. Have you checked MTU issues? For
example, perhaps the router is trying to forward packets with 1500
bytes down a 1420 byte pipe?

Regards,
Jason
