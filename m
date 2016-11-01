Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 946b42c4
 for <wireguard@lists.zx2c4.com>; Tue, 1 Nov 2016 18:40:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c956c2d
 for <wireguard@lists.zx2c4.com>; Tue, 1 Nov 2016 18:40:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a91ef379
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 1 Nov 2016 18:40:56 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id t196so46815080lff.3
 for <wireguard@lists.zx2c4.com>; Tue, 01 Nov 2016 11:41:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1e33f311-9d18-6822-cf9e-e3d93da0af21@sholland.org>
References: <1e33f311-9d18-6822-cf9e-e3d93da0af21@sholland.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 1 Nov 2016 19:41:55 +0100
Message-ID: <CAHmME9qPjvK_nKA1X8atuAOEskifyk41Mo9OvDxoUwFp9KoCJw@mail.gmail.com>
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

Thanks for reporting this and the two backtraces. Is this issue
repeatable, or was it a one-off event? I'm investigating it now.

Jason
