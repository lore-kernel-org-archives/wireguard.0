Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b66b556d
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jun 2018 21:31:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c44898d
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jun 2018 21:31:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1243ca67
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jun 2018 21:30:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ddfd5fd7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jun 2018 21:30:18 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id c6-v6so448139oiy.0
 for <wireguard@lists.zx2c4.com>; Tue, 12 Jun 2018 14:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <46bd903565f6b1114b1d9f6bafa7db77bf3b5090.camel@mjr.org>
In-Reply-To: <46bd903565f6b1114b1d9f6bafa7db77bf3b5090.camel@mjr.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 12 Jun 2018 23:35:07 +0200
Message-ID: <CAHmME9rtHVwfSdy4DDFYmgw06zVerbN8oP88ZZ5ahoJB3PPTFw@mail.gmail.com>
Subject: Re: Kernel lockup with (debian) 4.16.0-2-rt-amd64
To: paul@mjr.org
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

Hi Paul,

Thanks for the useful bug report. I'll have a fix for it soon.

Thanks, also, for bringing Debian's rt kernel to my attention. Seems
like this might be a good testing platform.

Jason
