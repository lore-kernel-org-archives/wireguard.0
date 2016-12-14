Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7ffa5e3
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:08:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d68308b
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:08:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbc71802
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:08:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e295b424
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:08:50 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id a197so133300298wmd.0
 for <wireguard@lists.zx2c4.com>; Wed, 14 Dec 2016 13:15:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AE381473-7783-4828-9297-874E831F3244@danrl.com>
References: <AD79A695-30E3-425D-9D7F-51AE2A25384D@danrl.com>
 <CAHmME9pePj0thgb_NDVr_iN9rcvdwQMz=4_zRtP_57g=QO4_ow@mail.gmail.com>
 <AE381473-7783-4828-9297-874E831F3244@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 14 Dec 2016 22:15:08 +0100
Message-ID: <CAHmME9rFn_ntXsG8O5bkvrPvqkY=-5+WEHppQ_tgdLX6RNsuxg@mail.gmail.com>
Subject: Re: Structure(d) output of wg?
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
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

Hey Dan,

Yea, but that's usually the case with command line tools and shell
processing. If you're in a position to be calling json, then why not
just also call the ioctl directly? I guess json might be easier for
some consumers? Hmm...

> Nice bandwidth, though :)

That's just the first ten too...
[zx2c4@demo ~]$ sudo wg show wg0 peers | wc -l
232

Jason
