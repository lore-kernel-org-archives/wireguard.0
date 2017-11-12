Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f5097bf
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Nov 2017 03:10:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d9f8a70
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Nov 2017 03:10:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf08c642
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Nov 2017 03:10:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 024bf5e3
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Nov 2017 03:10:04 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id e142so1483581oih.2
 for <wireguard@lists.zx2c4.com>; Sat, 11 Nov 2017 19:13:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qYobSS1aaj4ahqprmf_CFX49puiSVSg-WGdT9vzNZ-Ww@mail.gmail.com>
References: <20171111080920.GA5705@localhost.localdomain>
 <CAHmME9qYobSS1aaj4ahqprmf_CFX49puiSVSg-WGdT9vzNZ-Ww@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 12 Nov 2017 12:13:50 +0900
Message-ID: <CAHmME9oPh0G_2f3v7GjSis30wqxWAF805aeDBj+nb2_xVMhfCw@mail.gmail.com>
Subject: Re: imer_setup() is not compatible with PaX's RAP
To: Pipacs <pageexec@gmail.com>
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

In other words, can I do better than this?

https://git.zx2c4.com/WireGuard/commit/?id=01eebded60497528249962d03582a163a90d3b22
