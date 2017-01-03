Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 854927d5
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 21:01:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7127fef0
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 21:01:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 273cf5b5
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 21:01:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id faca98f9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 21:01:55 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id 3so339564713oih.1
 for <wireguard@lists.zx2c4.com>; Tue, 03 Jan 2017 13:10:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pnrjo8QcZs44xuGAwZ9TXDkRri68-LZXamuvw9sgwb5g@mail.gmail.com>
References: <CAHmME9pnrjo8QcZs44xuGAwZ9TXDkRri68-LZXamuvw9sgwb5g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 3 Jan 2017 22:10:46 +0100
Message-ID: <CAHmME9qg9DvW1GdBtsHF76KGwPoLKpu=+hC==FLJzcEuepY4qQ@mail.gmail.com>
Subject: Re: [TOOL] wg-config graduates to src/tools, becomes wg-auto-config
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Jan 3, 2017 at 7:57 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> So, it seems like thing to do at this point would be to open this
> thread up for bike-shedding over the name. What might we call this
> tool to convey what it does?
>
> - wg-helper
> - wg-quick-setup
> - wg-ezconfig
> - wg-wrapper
> - wg+ip+magic
> - ??

Someone has suggested `wgupdown`, with the wgup -> wgupdown, wgdown ->
wgupdown symlinks, so that

   $ wgup wgdemo0

could work.

This seems elegant, though it does establish the tool with a bit too
much authority for a dinky bash script.

Opinions?
Bikesheds?
