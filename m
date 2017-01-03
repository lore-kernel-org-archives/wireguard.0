Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b9a0723
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 01:43:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b92c685
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 01:43:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6161dbe
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 01:43:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 836aa841
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 01:43:07 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id 3so312111260oih.1
 for <wireguard@lists.zx2c4.com>; Mon, 02 Jan 2017 17:51:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20471f2b-0bf3-33c0-712a-3d9e20611982@createc.ro>
References: <9fe139f0-a635-76ef-90b0-56b1a968c565@createc.ro>
 <CAHmME9qJR-Y6gwULoGfBcORwcDthut37yVeiX_bFBKzHzHpu3A@mail.gmail.com>
 <20471f2b-0bf3-33c0-712a-3d9e20611982@createc.ro>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 3 Jan 2017 02:51:52 +0100
Message-ID: <CAHmME9qC2sL_n59H1Mkg9j5wEX52v5EQXmVTA+b8TRx4-utqfg@mail.gmail.com>
Subject: Re: centos 6 build error
To: Lucian Cristian <luci@createc.ro>
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

Hi Lucian,

This is because your kernel is also built with an old gcc. Either
rebuild the kernel and the module with a new gcc, or just make the
source change I suggested and use your old gcc.

Jason
