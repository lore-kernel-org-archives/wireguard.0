Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d40aaf45
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 16:14:04 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 412b7847
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 16:14:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da4d6cbc
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 16:12:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id da354d45
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 16:12:48 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id n21-v6so2190350oig.3
 for <wireguard@lists.zx2c4.com>; Mon, 23 Jul 2018 09:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <0f15823a-d527-f281-1d4b-735d227e3844@gmail.com>
 <CAHmME9pcN_SyZ5_bYU2H=NjoZ67ETaRaYxbRR673zrk_k36_AQ@mail.gmail.com>
 <3c167a80-6459-7c0e-8935-a98e226fa023@gmail.com>
 <CAHmME9qBDqPUuaz9X=rErROghvc57Rxw7Hejen8XcVMi7NUDZw@mail.gmail.com>
 <4de6eec9-9239-5e4e-60c1-e287b3be336a@gmail.com>
 <ba866611-cd70-5183-bcd4-1ea1e7cc36a5@gmail.com>
In-Reply-To: <ba866611-cd70-5183-bcd4-1ea1e7cc36a5@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Jul 2018 18:22:54 +0200
Message-ID: <CAHmME9r=-vxc3NiQcpZ=hBDZFUMaBWrQGnrHiGq-r2EGGFXQ4g@mail.gmail.com>
Subject: Re: wireguardnl: Go package for interacting with WireGuard via
 generic netlink
To: mdlayher@gmail.com
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

On Mon, Jul 23, 2018 at 5:59 PM Matt Layher <mdlayher@gmail.com> wrote:
>
> An update for those on the list, I've implemented Jason's requested name
> change and the API is now set up to allow seamless kernel and userspace
> implementations via https://godoc.org/github.com/mdlayher/wireguardctrl.
>
> I will explicitly encourage callers to use this interface rather than
> the "wireguardnl" package, unless we do end up with useful
> netlink-specific functionality like the situation I described previously.
>
> I'll keep working on this for now and report back when I have a working
> userspace implementation.  Should be quite straightforward compared to
> dealing with netlink! :)

Wonderful! Thanks Matt!
