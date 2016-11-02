Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id abaf81cf
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 05:38:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1ae3666
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 05:38:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 992cefb4
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 05:38:53 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id b81so3647471lfe.1
 for <wireguard@lists.zx2c4.com>; Tue, 01 Nov 2016 22:39:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qPjvK_nKA1X8atuAOEskifyk41Mo9OvDxoUwFp9KoCJw@mail.gmail.com>
References: <1e33f311-9d18-6822-cf9e-e3d93da0af21@sholland.org>
 <CAHmME9qPjvK_nKA1X8atuAOEskifyk41Mo9OvDxoUwFp9KoCJw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 2 Nov 2016 06:39:56 +0100
Message-ID: <CAHmME9pidMFxVh9CaVWS0PHyyzzNZrNAqdBT43Mmk80WzU00+g@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Kernel warning from WireGuard module
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Samuel,

I believe it's fixed now with the current commits in master. I'll tag
a new snapshot if the problems go away.

My question still stands, though -- is this issue
repeatable, or was it a one-off event?

Thanks,
Jason
