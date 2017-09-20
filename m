Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb1bdfe4
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 20:50:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4be53175
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 20:50:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 879e7adb
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 21:09:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 570f2fb0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Sep 2017 21:09:17 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id v36so6698582ioi.1
 for <wireguard@lists.zx2c4.com>; Wed, 20 Sep 2017 14:17:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADdae-j5Xr0jqB+dHcX7aYat60tahMCBTKiWVnSm_A-cQuf=qA@mail.gmail.com>
References: <CADdae-hw0VGaCDGmsVpVT5g56xM3vs+AeOS8MYLwFo5pnf1N8Q@mail.gmail.com>
 <CAHmME9qrtSm1Y-h9FfyXWVCmrvmtciFau0jG2144Yrwu=BRMig@mail.gmail.com>
 <CAHmME9r0hXW8CT5wO10X-b-9HUBDzzvSAbnn69aFav+6ovxQGA@mail.gmail.com>
 <CAHmME9rWpuWBRzZLFeaOG4zG-VxHUEi8wbXe4iL7xYguk0TMFw@mail.gmail.com>
 <CADdae-j5Xr0jqB+dHcX7aYat60tahMCBTKiWVnSm_A-cQuf=qA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 Sep 2017 23:17:30 +0200
Message-ID: <CAHmME9oaM+n6DNN-pVfx+4D2_r=FEo=D9hEKyuLrO7rJu1tY9g@mail.gmail.com>
Subject: Re: [wireguard-dev] Help about configuration
To: nicolas prochazka <prochazka.nicolas@gmail.com>
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

Hi Nicolas,

Great that fixed it. Sometimes WireGuard can be a good diagnostic for
figuring out various network misconfigurations, because WireGuard's
allowed-ips binding is very strict and explicit.

By the way, you might want to change your private key to something
new, since your first email contained these in plaintext.

Jason
