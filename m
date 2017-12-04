Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd4f522a
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 16:07:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5b91b49
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 16:07:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a09cba7
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 16:07:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9083809f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 16:07:22 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id i1so15154900oth.9
 for <wireguard@lists.zx2c4.com>; Mon, 04 Dec 2017 08:14:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171204160159.GA27666@black.transpect.com>
References: <20171204160159.GA27666@black.transpect.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 4 Dec 2017 17:14:01 +0100
Message-ID: <CAHmME9o3+SBZfsWLUczAxKOxmBcWeJYyx_wpGnk_sXNbb8aZgA@mail.gmail.com>
Subject: Re: What are the options for stopping and starting?
To: Whit Blauvelt <whit@transpect.com>
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

Hi Whit,

See the man page of wg(8):

$ man 8 wg

For your convenience it can be found online here:
https://git.zx2c4.com/WireGuard/about/src/tools/wg.8

Regards,
Jason
