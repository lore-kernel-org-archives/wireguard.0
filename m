Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e35b550
 for <wireguard@lists.zx2c4.com>; Tue, 6 Feb 2018 11:47:30 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 484606b8
 for <wireguard@lists.zx2c4.com>; Tue, 6 Feb 2018 11:47:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf0cb584
 for <wireguard@lists.zx2c4.com>; Tue, 6 Feb 2018 11:38:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 67435dbb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Feb 2018 11:38:38 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id f56so1436495otj.13
 for <wireguard@lists.zx2c4.com>; Tue, 06 Feb 2018 03:53:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <3cfc3270-9a30-a6ce-cf80-76e2d5f1fe21@posteo.net>
References: <3cfc3270-9a30-a6ce-cf80-76e2d5f1fe21@posteo.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Feb 2018 12:53:18 +0100
Message-ID: <CAHmME9rsc52ffc07jfrX39+ET3qKs5WaUtsdirz5Qs2EUM8OoA@mail.gmail.com>
Subject: Re: Strange behaviour with interface name
To: Nicholas Joll <najoll@posteo.net>
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

Hi Nick,

Thanks for the bug report. Fixed here:

https://git.zx2c4.com/WireGuard/commit/?id=dd85f27b6ec98de1527a935a7f0930c2111d7930

Jason
