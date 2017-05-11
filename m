Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 947346b8
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 10:15:21 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2db7748
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 10:15:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bcdf442c
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 10:15:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c7205208
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 May 2017 10:15:21 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id w10so24821589oif.0
 for <wireguard@lists.zx2c4.com>; Thu, 11 May 2017 03:25:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170510213123.8147-1-benedikt.morbach@googlemail.com>
References: <20170510213123.8147-1-benedikt.morbach@googlemail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 11 May 2017 12:25:57 +0200
Message-ID: <CAHmME9qqPoXpf9-GpRRuQ4mSjGJ_Eh7Pn_vXPbWZXxYoLbRy6A@mail.gmail.com>
Subject: Re: [PATCH] contrib: fix out-of-tree build with jerry-rig.sh
To: Benedikt Morbach <benedikt.morbach@googlemail.com>
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

Hey,

Interesting patch. Is the idea here that using a symlink fixes some
issue with just putting all the ../../../../.. stuff in the file
directly? If so, what was the problem exactly? I use the existing
jerry-rig.sh thing successfully, so I'm wondering under what
circumstances it breaks.

Thanks,
Jason
