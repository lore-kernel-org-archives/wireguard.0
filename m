Return-Path: benedikt.morbach@googlemail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6a31b26
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 12:20:28 +0000 (UTC)
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
 [209.85.214.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a32db5c
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 12:20:28 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id e65so18633714ita.1
 for <wireguard@lists.zx2c4.com>; Thu, 11 May 2017 05:31:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qqPoXpf9-GpRRuQ4mSjGJ_Eh7Pn_vXPbWZXxYoLbRy6A@mail.gmail.com>
References: <20170510213123.8147-1-benedikt.morbach@googlemail.com>
 <CAHmME9qqPoXpf9-GpRRuQ4mSjGJ_Eh7Pn_vXPbWZXxYoLbRy6A@mail.gmail.com>
From: Benedikt Morbach <benedikt.morbach@googlemail.com>
Date: Thu, 11 May 2017 14:30:45 +0200
Message-ID: <CAC-H7H=LfyykpMx=vKQWA2Ag+89JOZ34o_2UF0Nf6pJjsMp1GQ@mail.gmail.com>
Subject: Re: [PATCH] contrib: fix out-of-tree build with jerry-rig.sh
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Hi Jason,

I started doing out-of-tree kernel builds with "make KBUILD_OUTPUT=/foo".
While it does work, it puts wireguards .o files in
/foo/net/../../../..../wireguard/src, which isn't exactly what I
expected/intended. By changing the path in the Makefile the .o files
end up in /foo/net/wireguard.

Thanks
Benedikt
