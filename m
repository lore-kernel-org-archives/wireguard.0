Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 836a934f
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 10:23:53 +0000 (UTC)
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
 [209.85.128.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df6ca3d9
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 10:23:53 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id s18-v6so3433702wrg.9
 for <wireguard@lists.zx2c4.com>; Wed, 18 Apr 2018 03:38:39 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Message-ID: <1524047914.9423.5.camel@gmail.com>
Subject: Re: SFTP-based VPN bootstrapping with automatic collision-free IPs
 assignment/peers' public data sharing
From: ST <smntov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 18 Apr 2018 13:38:34 +0300
In-Reply-To: <CAHmME9qy5mNRNHM4qJc-kBVu1+5ryO8fY5sZfCLiXRvc+b9vmw@mail.gmail.com>
References: <1523814593.1990.49.camel@gmail.com>
 <CAHmME9rr7AJ_LGZt62vMAkAFh4Q304PTpHJ3WRug91Xw3Ewb9w@mail.gmail.com>
 <1523995660.9423.4.camel@gmail.com>
 <CAHmME9qy5mNRNHM4qJc-kBVu1+5ryO8fY5sZfCLiXRvc+b9vmw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

What uses unauthenticated TCP - your demo.wireguard.com script or DHCP?

On Wed, 2018-04-18 at 06:04 +0200, Jason A. Donenfeld wrote:
> The problem is that it uses unauthenticated TCP.
