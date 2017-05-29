Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83c91dee
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 12:08:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16336c2a
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 12:08:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 004be503
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 12:19:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9919f2f0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 May 2017 12:19:41 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id w10so77135406oif.0
 for <wireguard@lists.zx2c4.com>; Mon, 29 May 2017 05:21:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMRLKH9gSCEAcNrw5sougBtRU_VBf0-rqmtGXYkuvjZG_Tf-Uw@mail.gmail.com>
References: <CAMRLKH9gSCEAcNrw5sougBtRU_VBf0-rqmtGXYkuvjZG_Tf-Uw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 29 May 2017 14:21:07 +0200
Message-ID: <CAHmME9pHuxNEwnSdNJxP66GcrseoJTKUCELTMMBaMDieWcuNug@mail.gmail.com>
Subject: Re: Get configuration from SRV records?
To: Quan Zhou <quanzhou822@gmail.com>
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

If you want a CA-like thing, you could just include a short ed25519
signature inside each DNS entry...
