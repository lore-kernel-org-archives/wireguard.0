Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e496c14a
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:59:04 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ce34982
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:59:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3884ace8
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:59:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3401edd7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:59:03 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id 128so364701849oig.0
 for <wireguard@lists.zx2c4.com>; Wed, 04 Jan 2017 14:08:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1596b7bf859.e783e8a093776.4934627496686115328@hda.me>
References: <1596b7bf859.e783e8a093776.4934627496686115328@hda.me>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 4 Jan 2017 23:08:02 +0100
Message-ID: <CAHmME9qjZcewo97yQopya9ncCs-69TdVKcFGPy__ukZEDLb3rQ@mail.gmail.com>
Subject: Re: distro packaging, makefiles, deps, systemd, new tools
To: Anonymous Anonymous <admin@hda.me>
Content-Type: text/plain; charset=UTF-8
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Jan 4, 2017 at 10:56 PM, Anonymous Anonymous <admin@hda.me> wrote:
> Also, are bash completions for wg-quick came with WITH_BASHCOMPLETION or with WITH_WGQUICK itself?

wg bash completion: WITH_BASHCOMPLETION
wg-quick: WITH_WGQUICK
wg-quick bash completion: WITH_BASHCOMPLETION && WITH_WGQUICK
