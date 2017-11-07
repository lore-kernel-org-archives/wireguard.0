Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 751dc2c6
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:50:05 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2fd0ab70
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:50:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5bfcb42a
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:50:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2d36a3c1
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:50:05 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id w8so4770070otw.11
 for <wireguard@lists.zx2c4.com>; Tue, 07 Nov 2017 01:53:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171107093446.GA7891@kroah.com>
References: <20171107043817.9050-1-aurelien@chabot.fr>
 <20171107043817.9050-2-aurelien@chabot.fr>
 <20171107093446.GA7891@kroah.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 7 Nov 2017 18:53:16 +0900
Message-ID: <CAHmME9qppEg8i=sgG6_RtNr=gv+dWOjWY1Sk4T-N_sWMR1OWvA@mail.gmail.com>
Subject: Re: [PATCH 1/4] Add wireguard-go as submodule
To: Greg KH <greg@kroah.com>
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

For the purposes of the Android app, a submodule is likely exactly what we want.
