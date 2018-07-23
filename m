Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4cea7b44
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 15:03:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1c4048d
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 15:03:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22fb361a
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 15:02:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a2fa1ecd
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 15:02:11 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id s198-v6so1710950oih.11
 for <wireguard@lists.zx2c4.com>; Mon, 23 Jul 2018 08:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <0f15823a-d527-f281-1d4b-735d227e3844@gmail.com>
 <CAHmME9pcN_SyZ5_bYU2H=NjoZ67ETaRaYxbRR673zrk_k36_AQ@mail.gmail.com>
 <3c167a80-6459-7c0e-8935-a98e226fa023@gmail.com>
In-Reply-To: <3c167a80-6459-7c0e-8935-a98e226fa023@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Jul 2018 17:12:16 +0200
Message-ID: <CAHmME9qBDqPUuaz9X=rErROghvc57Rxw7Hejen8XcVMi7NUDZw@mail.gmail.com>
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

Hi Matt,

> This is super interesting and I actually did not discover it until after
> I pushed the first few commits to my package.  I could see it making
> sense to refactor my current package layout to something like three
> packages:
>
> - wireguardnl: netlink-based communication
> - wireguardcfg: text-based userspace configuration protocol communication
> - wireguard: wrapper for both that detects the module in use and
> seamlessly presents a unified interface

No, that's really not a good approach at all. First of all, do not
take the raw name "wireguard". That's going to cause a lot of
confusion. It's really not appropriate.

But more importantly, you shouldn't expose either the netlink or the
xplatform API distinction to users ever. They should be given one
interface, not three, and that one interface should be able to select
the right thing in 100% of cases.

Jason
