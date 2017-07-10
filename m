Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4c798bc
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 03:08:45 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8849af47
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 03:08:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51557ae5
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 03:22:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 431c716e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 03:22:19 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id c11so120011053wrc.3
 for <wireguard@lists.zx2c4.com>; Sun, 09 Jul 2017 20:26:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170710031744.GA18054@wolff.to>
References: <20170710014834.GA14901@wolff.to>
 <CAHmME9qHmJCHT8_ZM1CYDbPx62T-Zuf3BfdL_ZpfB6drOsnwFw@mail.gmail.com>
 <20170710025614.GA17552@wolff.to>
 <CAHmME9pbky9H=+QkXA2VMeZ3OQonxxZ_H2-Jiz8Gy6FeYuR+7g@mail.gmail.com>
 <20170710031744.GA18054@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 10 Jul 2017 05:26:50 +0200
Message-ID: <CAHmME9qTDJJmUG8rtZ53sof+NNGTub=kcVzVv6817acw0HMp=w@mail.gmail.com>
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

These two commits:

https://git.kernel.org/pub/scm/linux/kernel/git/tytso/random.git/patch/?id=e297a783e41560b44e3c14f38e420cba518113b8
https://git.kernel.org/pub/scm/linux/kernel/git/tytso/random.git/patch/?id=da9ba564bd683374b8d319756f312821b8265b06
