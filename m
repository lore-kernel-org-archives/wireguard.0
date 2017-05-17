Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8af82b15
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 15:04:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4eda906b
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 15:04:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a8b7a83
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 15:04:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 85a2459b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 15:04:57 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id h4so19126376oib.3
 for <wireguard@lists.zx2c4.com>; Wed, 17 May 2017 08:16:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9od2sWr4gRk1Py+rHN1QNihser7eHoj317H8V7qYuA5yw@mail.gmail.com>
References: <20170517144709.GA28773@wolff.to>
 <CAHmME9od2sWr4gRk1Py+rHN1QNihser7eHoj317H8V7qYuA5yw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 May 2017 17:16:20 +0200
Message-ID: <CAHmME9pZp52EZRd8HSL_nZcf0OiB+EhzmsHDM7AzLn6_h8msVg@mail.gmail.com>
Subject: Re: Wireguard is not building on Fedora with 4.12 rc1 kernels
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

Hi again,

I think I might have fixed this.

git fetch && git reset --hard origin/master

And then see if it builds now?

Alternatively, find me on IRC (I'm zx2c4) and we can talk in real time.

Jason
