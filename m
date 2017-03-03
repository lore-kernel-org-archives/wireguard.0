Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1c19c00
 for <wireguard@lists.zx2c4.com>; Fri, 3 Mar 2017 17:35:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 778f297a
 for <wireguard@lists.zx2c4.com>; Fri, 3 Mar 2017 17:35:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id effdaf67
 for <wireguard@lists.zx2c4.com>; Fri, 3 Mar 2017 17:35:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8c36ecf6
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Mar 2017 17:35:33 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id 126so7580732oig.3
 for <wireguard@lists.zx2c4.com>; Fri, 03 Mar 2017 09:37:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170303160845.GA29450@al>
References: <20170303160845.GA29450@al>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 3 Mar 2017 09:37:37 -0800
Message-ID: <CAHmME9pTFC39=+eUa4P7WXiZH1dSc26b8RpfJ6kYRxSgaxL43g@mail.gmail.com>
Subject: Re: Release of Wireshark dissector with decryption support
To: Peter Wu <peter@lekensteyn.nl>
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

Hey Peter,

This is wonderful news! Congrats on the release.

I look forward to a simplified version that merely extracts ephemerals
and derives all the rest, so that intermediate values can be
decrypted.

Regards,
Jason
