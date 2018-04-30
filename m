Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ced9b821
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Apr 2018 17:33:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4fe07f7
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Apr 2018 17:33:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88281aaa
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Apr 2018 17:09:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4a0fdcfe
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Apr 2018 17:09:28 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id n1-v6so10363380otf.7
 for <wireguard@lists.zx2c4.com>; Mon, 30 Apr 2018 10:34:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMp63jWKnhfAv4MYxjOeA4k2uFA-tTNzXyCOwFSFeJ1ntEB_Pw@mail.gmail.com>
References: <CAMp63jWKnhfAv4MYxjOeA4k2uFA-tTNzXyCOwFSFeJ1ntEB_Pw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 30 Apr 2018 19:34:37 +0200
Message-ID: <CAHmME9pDYf0AwnW3G85WTycOB=RHFKc_CymvEmN3dBO23cF9Ug@mail.gmail.com>
Subject: Re: Issues with WireGuard on Android (with kernel module)
To: Davide Depau <davide@depau.eu>
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

Hi Davide,

It's possible you mixed up the keys in the config. The next version of
the Android app, which should be out soon, will have the ability to
export configs to .zip files, so you'll be able to test your
configuration on your computer, to verify that the problem is not
Android.

Jason
