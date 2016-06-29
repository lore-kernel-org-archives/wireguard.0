Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dc47deb
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2016 20:45:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bdd6e93
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2016 20:45:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 10ed04c9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2016 20:45:45 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id h129so41737425lfh.1
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jun 2016 13:48:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160629202228.GA1993@wolff.to>
References: <20160629202228.GA1993@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Jun 2016 22:48:26 +0200
Message-ID: <CAHmME9rSj3+4YB_x0HY26TvATSwL6+gNkjoH+SJCA6q3K-H63g@mail.gmail.com>
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: text/plain; charset=UTF-8
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] wg doesn't build on 4.7 kernels
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Fixed here:
https://git.zx2c4.com/WireGuard/commit/?id=530ee2b2906af4d635d4d5bbabda5250b4a2b33e

Thanks for the report.
