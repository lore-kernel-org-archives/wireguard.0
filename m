Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a15b8358
 for <wireguard@lists.zx2c4.com>; Sat, 2 Dec 2017 13:25:21 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43af2a3f
 for <wireguard@lists.zx2c4.com>; Sat, 2 Dec 2017 13:25:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2352e77
 for <wireguard@lists.zx2c4.com>; Sat, 2 Dec 2017 13:25:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7ed9b6e7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Dec 2017 13:25:21 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id o23so11309281otd.1
 for <wireguard@lists.zx2c4.com>; Sat, 02 Dec 2017 05:31:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2185653B-D592-4179-96D6-2CFC16F3E0B1@ferrisellis.com>
References: <2185653B-D592-4179-96D6-2CFC16F3E0B1@ferrisellis.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 2 Dec 2017 14:31:42 +0100
Message-ID: <CAHmME9q2h_QedDGfmbk-eaniAqB1DV7JUJZ0r36fYmM0Jr8Vow@mail.gmail.com>
Subject: Re: Rolling keys without service interuption
To: Ferris Ellis <ferris@ferrisellis.com>
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

Hi Ferris,

Firstly, WireGuard already has forward secrecy, which means every new
session (negotiated every 2 minutes) has fresh keys that are
forgotten, so old recorded traffic cannot be compromised.

It sounds like, however, you want to rotate the long term static
"identity" keys. This is possible to do gracefully. If you change the
private key of an interface, it won't actually be used until the next
handshake occurs, which means you can rollover gracefully. Likewise
you can add new peers (via public keys) dynamically at runtime. Moving
a distinct allowed IP from one peer to another is an atomic operation
as well.

Hope this helps!

Regards,
Jason
