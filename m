Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7b1c6a2
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 20:09:07 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e95a4fa8
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 20:09:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9419768
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 20:09:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 724935fe
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 20:09:06 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id k4so59407027otc.0
 for <wireguard@lists.zx2c4.com>; Mon, 27 Feb 2017 12:10:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170227180434.GA5702@wolff.to>
References: <20170227180434.GA5702@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 27 Feb 2017 12:10:41 -0800
Message-ID: <CAHmME9o+dDEtxdgByOZzpWAsE2_t2QF+qDoFYt+NdqXJRXSz=w@mail.gmail.com>
Subject: Re: Kernel commit d35a00b8e33dab7385f724e713ae71c8be0a49f4 breaks
 wireguard
To: Bruno Wolff III <bruno@wolff.to>
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

Hey Bruno,

This has now been fixed in the repo. Note that since rc1 hasn't been
released, you'll need to adjust the kernel's make file to show 4.11
yourself. Alternatively, just wait a few days for rc1.

Jason
