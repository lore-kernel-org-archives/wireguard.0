Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f448a7c7
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 11:13:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19a8a330
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 11:13:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d1c2c4c
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 11:13:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cf33ceac
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 11:13:16 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id g23so212359753wme.1
 for <wireguard@lists.zx2c4.com>; Thu, 08 Dec 2016 03:18:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161208091214.15449-1-list@eworm.de>
References: <20161208091214.15449-1-list@eworm.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 8 Dec 2016 12:18:46 +0100
Message-ID: <CAHmME9qc02xGhyiXp3J3ugFyCKkWbYY0Fj_q9C1euv1gAYa9qg@mail.gmail.com>
Subject: Re: [PATCH 1/1] make the systemd unit example more general
To: Christian Hesse <list@eworm.de>
Content-Type: text/plain; charset=UTF-8
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I like this, but two questions.

1. Why did you get rid of the ExecStop config saving line?
2. You're not planning to actually package this unit file, are you?
