Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98542244
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 10:41:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6b02424
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 10:41:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 798c48f0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 10:41:47 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id c13so8912873lfg.0
 for <wireguard@lists.zx2c4.com>; Wed, 02 Nov 2016 03:42:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACpTwpE=YBt3FqyEvc-4dpL5Bn5E1Qrh_Rmt60RGS7d3ekDBug@mail.gmail.com>
References: <20161102103158.5305-1-Marc-Antoine@Perennou.com>
 <CAHmME9pN4bX=_8D6bKFV7bMJZpLHX_dmW68_fxLwuAarcKHY3w@mail.gmail.com>
 <CACpTwpE=YBt3FqyEvc-4dpL5Bn5E1Qrh_Rmt60RGS7d3ekDBug@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 2 Nov 2016 11:42:52 +0100
Message-ID: <CAHmME9r+TgFNfgCpZct9_WcgCfnx218dnSBvdQeq_q+BYuScbw@mail.gmail.com>
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

Okay, I thought that might be the case. That's the situation on Gentoo too.

Secondly, why the pkg-config abstraction? When is it not called
pkg-config and when is it not in PATH?
