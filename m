Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8efa2f67
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Apr 2017 11:19:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6337baab
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Apr 2017 11:19:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7bad64f
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Apr 2017 11:19:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8f60deb1
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Apr 2017 11:19:45 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id g204so106267825oib.1
 for <wireguard@lists.zx2c4.com>; Tue, 11 Apr 2017 04:26:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <bb963757-98ea-a107-b402-a4c659d9e0b0@york.ac.uk>
References: <bb963757-98ea-a107-b402-a4c659d9e0b0@york.ac.uk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 11 Apr 2017 13:26:38 +0200
Message-ID: <CAHmME9rSPYXUGzqhBiwg_cc-uj=Q0fwdtJkbw+PsNPT00MJavg@mail.gmail.com>
Subject: Re: DKMS build failure on kernel 3.13 (Ubuntu 14.04)
To: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
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

Hey Jonathon,

3.13, as released from kernel.org, does not have this function, which
is why it's "defined" in the compat.h. It appears you're using
somebody's insane backport. It wouldn't surprise me if Canonical
decided to try and maintain 3.13 past kernel.org's maintenance. Is
this the latest kernel in 14.04?

Regards,
Jason
