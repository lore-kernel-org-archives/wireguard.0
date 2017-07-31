Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec620221
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Jul 2017 15:49:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f062ef3
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Jul 2017 15:49:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1932f7a
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Jul 2017 16:08:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e0fab049
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Jul 2017 16:08:54 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id h199so127836221ith.1
 for <wireguard@lists.zx2c4.com>; Mon, 31 Jul 2017 09:10:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170731180632.51aeed9d@msi.defcon1>
References: <20170731180632.51aeed9d@msi.defcon1>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 31 Jul 2017 18:10:39 +0200
Message-ID: <CAHmME9q2HWQuOciL73HCo+epVbruSO=sP5syAP2GPw5wQ=upKA@mail.gmail.com>
Subject: Re: About compression
To: Bzzzz <lazyvirus@gmx.com>
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

Hi Jean-Yves,

No, not a chance. Compression is really better left for upper layers.
I'm not sure I see the value in adding at layer 3. This is an
especially contentious issue because of the history of complex and
catastrophic interactions between compression and encryption (such as
the CRIME and BREACH attacks against TLS).

What workload are you currently experiencing that would measurably
benefit from having layer 3 compression?

Regards,
Jason
