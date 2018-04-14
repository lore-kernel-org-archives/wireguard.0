Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47cebc86
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 23:01:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 363e97eb
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 23:01:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79a56048
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 22:52:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 731e2521
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 22:52:10 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id 188-v6so11438035oih.8
 for <wireguard@lists.zx2c4.com>; Sat, 14 Apr 2018 16:15:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJq09z7tm6Cz7RyiO0GTTS7V6oXTVGpdF_ss3eYJT_qMPE=GwA@mail.gmail.com>
References: <CAJq09z7tm6Cz7RyiO0GTTS7V6oXTVGpdF_ss3eYJT_qMPE=GwA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 15 Apr 2018 01:15:20 +0200
Message-ID: <CAHmME9qpEVW3AwDPCUSUA_A4DJi+oTGoMX4V3fVyHk7aXsAZ6Q@mail.gmail.com>
Subject: Re: Sharing peer data
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
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

Hi Luiz,

You could indeed arrange for something like this, either directly --
if both IPs are accessible or if A is able to punch a hole -- or
relayed, if you can't establish a direct session. This is similar to
what Tinc does. Namely, this falls in the category of, "making a full
mesh from a partial mesh." I say, "you could", because currently this
is something people are generally doing manually with WireGuard.
However, there's a GSoC project for making a minimal mesh networking
utility for WireGuard, which I hope pans out, and maybe even Tinc
integration. So we'll see what happens in this space.

Jason
