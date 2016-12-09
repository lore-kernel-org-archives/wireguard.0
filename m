Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68041915
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 15:49:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 753cd41f
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 15:49:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad5d40cb
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 15:49:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2e08903f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 15:49:19 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id t196so2897133lff.3
 for <wireguard@lists.zx2c4.com>; Fri, 09 Dec 2016 07:54:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <e15d1fea-8761-fde9-6802-cb483340ebb4@sholland.org>
References: <e15d1fea-8761-fde9-6802-cb483340ebb4@sholland.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 9 Dec 2016 16:54:57 +0100
Message-ID: <CAHmME9rfeOHHYJpPeqrchJUEtAWyq3mT6pPUp-Q7cJRYUcX5OA@mail.gmail.com>
Subject: Re: Kernel Panic
To: Samuel Holland <samuel@sholland.org>
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

Hey Sam,

This will be fixed in 4.9. The fix might be backported to 4.8, but
maybe not. Anyway, I think 4.9 will be out pretty soon, so sit tight.

Jason
