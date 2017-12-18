Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ad71d29
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Dec 2017 14:39:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c137e6a
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Dec 2017 14:39:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7851526d
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Dec 2017 14:39:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4de1ec00
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Dec 2017 14:39:26 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id w125so10718383oie.7
 for <wireguard@lists.zx2c4.com>; Mon, 18 Dec 2017 06:47:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2d4283b6-e379-cbbe-d084-91de4e023eca@posteo.net>
References: <2d4283b6-e379-cbbe-d084-91de4e023eca@posteo.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 18 Dec 2017 15:47:50 +0100
Message-ID: <CAHmME9pOmqvJF0F-DpqsvVrVSkT2YXZ6GFi6BZ5Qrcm5ydkTHw@mail.gmail.com>
Subject: Re: Bug report: WG won't reinstall after some OS recover procedures
To: Nicholas Joll <najoll@posteo.net>
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

Hello Nicholas,

This sounds like it's a bug in your distributions usage of DKMS.
Alternatively, it could be user error: have you added the dkms service
to bootup so that it checks to see if it needs to rebuild modules?

Regards,
Jason
