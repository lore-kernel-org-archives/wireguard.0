Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5771ed1
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Feb 2017 10:29:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f0e55fc
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Feb 2017 10:29:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14c64ac0
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Feb 2017 10:29:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3dbdf0f6
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Feb 2017 10:29:40 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id 73so64341991otj.0
 for <wireguard@lists.zx2c4.com>; Mon, 13 Feb 2017 02:43:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <d6qpul2kg1fyp0sdshfmv137.1486933562582@email.android.com>
References: <d6qpul2kg1fyp0sdshfmv137.1486933562582@email.android.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 13 Feb 2017 11:43:42 +0100
Message-ID: <CAHmME9rG_hER+FxX46=o+K5fvQwgeCJ1RH+M4Qt6ju5H_4CZcw@mail.gmail.com>
Subject: Re: VXLAN
To: info <info@florianb.space>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Florian,

Indeed that's strange, and MTU would be my first guess too, though
fragmentation should be working anyway so perhaps it's not that. You
can try this out by using the -s param to ping to test out the maximum
packet size.

If I understand correctly, you're putting VXLAN _on top of_ WireGuard?

Can you send tcpdump pcaps?

Jason
