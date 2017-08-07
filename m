Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 969ccafc
 for <wireguard@lists.zx2c4.com>; Mon, 7 Aug 2017 18:43:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c279685
 for <wireguard@lists.zx2c4.com>; Mon, 7 Aug 2017 18:43:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3a2f707
 for <wireguard@lists.zx2c4.com>; Mon, 7 Aug 2017 19:02:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 66f03c48
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Aug 2017 19:02:29 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id f16so925718itb.0
 for <wireguard@lists.zx2c4.com>; Mon, 07 Aug 2017 12:05:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9op6iHuOxRHaRvgmKetoMEM1RtY=x7S_Fug=6m6CpWGfg@mail.gmail.com>
References: <20170806210237.4dbbed42@msi.defcon1>
 <CAHmME9op6iHuOxRHaRvgmKetoMEM1RtY=x7S_Fug=6m6CpWGfg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 7 Aug 2017 21:05:09 +0200
Message-ID: <CAHmME9qVgzNiyRx2TOionk7vhXC=4zQZBi0LVTM3KFnKWgTzPA@mail.gmail.com>
Subject: Re: Many users
To: Bzzzz <lazyvirus@gmx.com>
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

On Sun, Aug 6, 2017 at 10:22 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> There's an artificial limitation of 65535 peers per interface.

I've just increased this to 2^{20}, which is roughly 1 million peers.

(I can increase it more, should the need arise.)
