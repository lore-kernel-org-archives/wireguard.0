Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 853b57bb
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 04:12:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51c8e59b
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 04:12:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71079ac6
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 04:12:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6b70b6f0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 04:12:43 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id u143so124721532oif.3
 for <wireguard@lists.zx2c4.com>; Mon, 09 Jan 2017 20:22:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170110034729.40733-1-jftucker@gmail.com>
References: <20170110034729.40733-1-jftucker@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Jan 2017 05:22:22 +0100
Message-ID: <CAHmME9or-Xd+w8Hu2+7yC8bFY2fcvrsU_EKAOj6ftPJP-nf3kQ@mail.gmail.com>
Subject: Re: [PATCH] uapi: add bit-field padding for field alignment
To: James Tucker <jftucker@gmail.com>
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

I think I'm going to roll with a flags fix instead, like this:
https://git.zx2c4.com/WireGuard/commit/?id=45bd499f15debb0e2443b15f7ff1d0ef93950acc

This should eliminate all portability issues.
