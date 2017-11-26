Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6cbbad1
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Nov 2017 01:16:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91601470
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Nov 2017 01:16:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88399731
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Nov 2017 01:16:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7ed9cead
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Nov 2017 01:16:45 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id e142so17242169oih.2
 for <wireguard@lists.zx2c4.com>; Sat, 25 Nov 2017 17:22:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1511643588-12378-1-git-send-email-agk@godking.net>
References: <1511643588-12378-1-git-send-email-agk@godking.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 26 Nov 2017 02:22:18 +0100
Message-ID: <CAHmME9p82u0NznsZraq41tqAKzh=2PfOgvzVuRZPXN6x+vTT2Q@mail.gmail.com>
Subject: Re: [PATCH] address kernel commit
 0a833c29d89656025443cb9f0ebff7052dd95ce0
To: Alexander Kappner <agk@godking.net>
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

Hi Alexander,

Thanks for the patch. I have something similar to this queued up for
when 4.15-rc1 lands, which should be pretty soon. At that point expect
to see this land in addition to compat layers for <4.15.

Jason
