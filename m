Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52c2b20d
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 18:37:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2cf3ab1e
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 18:37:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9b9a4e13
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 18:37:09 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id q132so105284781lfe.3
 for <wireguard@lists.zx2c4.com>; Sun, 03 Jul 2016 11:40:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467473657-10023-1-git-send-email-dkg@fifthhorseman.net>
References: <1467473657-10023-1-git-send-email-dkg@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 3 Jul 2016 20:40:20 +0200
Message-ID: <CAHmME9p6eWhq2AeKymx1k_nA7CvZm1s-CDp7th0f47dB75mqdQ@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [PATCH] use runtime check for getrandom syscall
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I implemented this a bit differently:
https://git.zx2c4.com/WireGuard/commit/?id=b86c51ed5cdd1f9df180ed6b6ab8280083133747
