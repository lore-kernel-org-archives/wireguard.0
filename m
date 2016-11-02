Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb13bcc1
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 10:35:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a248f36
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 10:35:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 67e1d9f8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 10:35:00 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id t196so8743761lff.3
 for <wireguard@lists.zx2c4.com>; Wed, 02 Nov 2016 03:36:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20161102103158.5305-1-Marc-Antoine@Perennou.com>
References: <20161102103158.5305-1-Marc-Antoine@Perennou.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 2 Nov 2016 11:36:04 +0100
Message-ID: <CAHmME9pN4bX=_8D6bKFV7bMJZpLHX_dmW68_fxLwuAarcKHY3w@mail.gmail.com>
To: Marc-Antoine Perennou <Marc-Antoine@perennou.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [PATCH] tools: allow better build system
	configuration
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Marc,

What is the motivation for making -s overrideable? Do different
install versions use different options? Or do you simply want the
ability to not strip?

Jason
