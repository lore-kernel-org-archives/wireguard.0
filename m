Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1945ef3
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jun 2018 16:40:21 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2ccb183
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jun 2018 16:40:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2dc738f
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jun 2018 16:39:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4b0de323
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jun 2018 16:39:06 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id t22-v6so19582734oih.6
 for <wireguard@lists.zx2c4.com>; Fri, 01 Jun 2018 09:42:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180601163852.bjlmnqjeqd5eidvo@kajt.de>
References: <20180601163852.bjlmnqjeqd5eidvo@kajt.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 1 Jun 2018 18:42:41 +0200
Message-ID: <CAHmME9oR380gmce39SrdocWCR37NSRCAqUdm6-_qRQdCqoyqnA@mail.gmail.com>
Subject: Re: Wireguard on android w/o kernel module
To: Maximilian Eschenbacher <maximilian@eschenbacher.email>
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

Hello Maximilian,

This happens when either:

a) You reject the permissions prompt shown when the app opens.
b) Another VPN application is set to "always on" mode.

You can investigate (b) by fishing around in the system VPN settings
and seeing what's there, possibly removing authorization for those.
Afterwards, close the application, reopen it, and it should prompt you
to accept permissions.

We'll happily accept a patch automating this kind of thing, if the
Android frameworks allow it.

Jason
