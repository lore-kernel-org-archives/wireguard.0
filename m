Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8a35373
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 20:10:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2db4965d
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 20:10:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4347741
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 19:54:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 98f15375
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 19:54:19 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id k12-v6so22979551oiw.8
 for <wireguard@lists.zx2c4.com>; Thu, 06 Sep 2018 13:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20180907004141.277c9af7@natsu>
 <CAHmME9pw_HzDC7CRSsPKL0CjA1yV15JAOJ-7uL_qmOUmVc5ZVw@mail.gmail.com>
 <20180907010451.78c89258@natsu>
In-Reply-To: <20180907010451.78c89258@natsu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Sep 2018 14:10:12 -0600
Message-ID: <CAHmME9qqNXnMztKjfG2e=q0sok1sQ82ec=VHy4kq7BOY2YDauQ@mail.gmail.com>
Subject: Re: Error building for ARM
To: Roman Mamedov <rm@romanrm.net>
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

Thanks. This should fix it:
https://git.zx2c4.com/WireGuard/commit/?id=56e1ddb4091e8e9b60546891930c3829215ec63c
