Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 310bbe6e
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:33:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c78d448b
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:33:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fff1105b
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:24:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2b4f5c76
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:24:53 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id f63-v6so9984998oic.4
 for <wireguard@lists.zx2c4.com>; Fri, 13 Apr 2018 18:47:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87y3isxp3w.fsf@fifthhorseman.net>
References: <20180316130222.3a9d0611@natsu> <87y3isxp3w.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 03:47:57 +0200
Message-ID: <CAHmME9q8Vp6GTH3u0Lu21HSoBUny58yfdDUB17yss9sq8wzpyg@mail.gmail.com>
Subject: Re: Include directive to support "conf.d/*" and the like
To: Roman Mamedov <rm.wg@romanrm.net>
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

Hi Roman,

This also came up in another thread I was replying to earlier tonight.
While one way indeed is to have an 'include' directive, it seems
simple enough to just do something like:

$ wg setconf wg0 <(cat /etc/wireguard/mysite.conf.d/*.conf)

And then you can have various fragments in there like:

000-interface.conf
001-peergroupA.conf
001-peergroupB.conf
001-peergroupC.conf

And so forth. Would this be an acceptable solution for you?

Jason
