Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 676caaaa
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 23:41:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42fef78e
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 23:41:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 952104ea
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 23:41:52 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id f6so124616190lfg.0
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jul 2016 16:45:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160704225300.GC9424@c3po>
References: <20160704225300.GC9424@c3po>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 5 Jul 2016 01:45:11 +0200
Message-ID: <CAHmME9r33BJHwbx2G-ANf02+ED4TJOs_Go+Ad3xoCX9L8DJY0g@mail.gmail.com>
To: Michael Gerlach <n3ph@terminal21.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] wireguard on gentoo (4.6.3)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Your kernel is missing CONFIG_NET_UDP_TUNNEL. For instructions on how
to enable it, see this section:

https://www.wireguard.io/install/#kernel-requirements
