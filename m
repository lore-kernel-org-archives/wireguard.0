Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 784b10f3
 for <wireguard@lists.zx2c4.com>; Thu, 4 Aug 2016 22:13:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b203b705
 for <wireguard@lists.zx2c4.com>; Thu, 4 Aug 2016 22:13:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c39161c7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Aug 2016 22:13:33 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id g62so191404140lfe.3
 for <wireguard@lists.zx2c4.com>; Thu, 04 Aug 2016 15:17:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qm6U4hWXe=+tkRrDi7+=L=yGkCoWGm_mhfKnDsWPna2w@mail.gmail.com>
References: <CAHmME9qm6U4hWXe=+tkRrDi7+=L=yGkCoWGm_mhfKnDsWPna2w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 5 Aug 2016 00:17:12 +0200
Message-ID: <CAHmME9oNc5j610rrMd47arDbTOSc0Ccvev+VtHcEYCvE5zLm4g@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Subject: Re: [WireGuard] Continuous Integration Server
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi folks,

> If you feel like downloading that `ci.sh` script above, putting it in
> a `* * * * *` cronjob, and pointing a webserver to the `builds/`
> directory, I'd be happy to point the "builds-status" sub-domain to
> your faster hardware.

Hours after writing this, a community member very kindly stepped up
and offered hosting on a 12 core VM. So, it seems we're all set!

Enjoy the build status at http://build-status.wireguard.io/ !

Regards,
Jason
