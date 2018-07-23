Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dff23f0
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 16:13:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5217c5f
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 16:13:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 267debac
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 16:12:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3edf7ed6
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Jul 2018 16:12:23 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id l10-v6so2198653oii.0
 for <wireguard@lists.zx2c4.com>; Mon, 23 Jul 2018 09:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <0f15823a-d527-f281-1d4b-735d227e3844@gmail.com>
 <CAHmME9pcN_SyZ5_bYU2H=NjoZ67ETaRaYxbRR673zrk_k36_AQ@mail.gmail.com>
 <3c167a80-6459-7c0e-8935-a98e226fa023@gmail.com>
 <CAHmME9qBDqPUuaz9X=rErROghvc57Rxw7Hejen8XcVMi7NUDZw@mail.gmail.com>
 <4de6eec9-9239-5e4e-60c1-e287b3be336a@gmail.com>
In-Reply-To: <4de6eec9-9239-5e4e-60c1-e287b3be336a@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Jul 2018 18:22:29 +0200
Message-ID: <CAHmME9pNN-V-Et6YaBqDgKmdSpcWYTJSzQFN30Ea2PRtJCvoOw@mail.gmail.com>
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

Hey Matt,

On Mon, Jul 23, 2018 at 5:29 PM Matt Layher <mdlayher@gmail.com> wrote:
> While I will encourage the use of the unified interface, I read that
> there could be future work to allow the netlink interface to support
> something like multicast group notifications.  Would you plan on
> implementing the same functionality for the userspace interface?

Yes, absolutely. We're aiming for full parity with the API.
