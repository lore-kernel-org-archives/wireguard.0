Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce5a3631
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 04:19:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb1ef426
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 04:19:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 276eeb22
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 04:19:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2a960480
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 04:19:28 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id t81so6452304oih.13
 for <wireguard@lists.zx2c4.com>; Thu, 07 Dec 2017 20:26:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pL8+FQv_oAKCFpnZQ6ew1xmoKk-RQqtDHktWARvDXH_w@mail.gmail.com>
References: <4B7E0154-039F-4008-9C47-C825E1474731@lonnie.abelbeck.com>
 <CAHmME9pL8+FQv_oAKCFpnZQ6ew1xmoKk-RQqtDHktWARvDXH_w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Dec 2017 05:26:33 +0100
Message-ID: <CAHmME9pk9DzHSCrooOK1+K-eO0Qr2jc98ThAM1g_ih8yAFHzqA@mail.gmail.com>
Subject: Re: [patch] wg: add support for peer names using a file in userspace
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
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

By the way, would you send future patches using git-send-email? It's
impossible to review inline on a mailing list if you do an attachment
like this. Having opened the file after downloading it, the
implementation and configuration syntax you propose are problematic,
but in light of the more broad issues I mentioned a minute ago, I'm
not sure it's productive to start dialing down into those.
