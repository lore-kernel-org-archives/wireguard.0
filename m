Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc8b2d5c
 for <wireguard@lists.zx2c4.com>; Mon, 2 Oct 2017 10:38:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b053292d
 for <wireguard@lists.zx2c4.com>; Mon, 2 Oct 2017 10:38:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5097e6a5
 for <wireguard@lists.zx2c4.com>; Mon, 2 Oct 2017 10:57:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b610027f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 2 Oct 2017 10:57:42 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id n82so1174743oig.3
 for <wireguard@lists.zx2c4.com>; Mon, 02 Oct 2017 04:07:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <f220e737-a703-433e-8761-8db3584bb7d8@me.com>
References: <f220e737-a703-433e-8761-8db3584bb7d8@me.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 2 Oct 2017 13:07:23 +0200
Message-ID: <CAHmME9qr7u_QNkvPotVRE3xNDWuD1R1Y5UvihdN_gf31J--dNw@mail.gmail.com>
Subject: Re: Build failure on macOS for wireguard tools 0.0.20171001
To: ilove zfs <ilovezfs@icloud.com>
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

Rats, sorry about that. Thanks for sending this my way. The fix will
be in the next snapshot. But for now, you can simply use this:

https://git.zx2c4.com/WireGuard/patch/?id=eb578ac0cbfa0e9b6fd5f8f56ccdc407ca860e96
