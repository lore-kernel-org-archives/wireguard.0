Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eba74b3e
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 01:43:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f72ac90
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 01:43:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22f59f77
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 01:56:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id da7c7817
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 01:56:33 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id c11so118448810wrc.3
 for <wireguard@lists.zx2c4.com>; Sun, 09 Jul 2017 19:01:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170710014834.GA14901@wolff.to>
References: <20170710014834.GA14901@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 10 Jul 2017 04:01:04 +0200
Message-ID: <CAHmME9qHmJCHT8_ZM1CYDbPx62T-Zuf3BfdL_ZpfB6drOsnwFw@mail.gmail.com>
Subject: Re: Looks like 4.13 introduces a new incompatibility
To: Bruno Wolff III <bruno@wolff.to>
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

Hey Bruno,

Thanks for the heads up. Does this fix it?

https://git.zx2c4.com/WireGuard/commit/?id=dd007ad550b3def8a858e57aa718af9b00047a28

Jason
