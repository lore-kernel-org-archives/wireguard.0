Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c42ec143
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 20:00:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c8ef4b2
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 20:00:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 768d8da0
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 19:44:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c2a6fefa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 19:44:49 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id l82-v6so22920383oih.11
 for <wireguard@lists.zx2c4.com>; Thu, 06 Sep 2018 13:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20180907004141.277c9af7@natsu>
In-Reply-To: <20180907004141.277c9af7@natsu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Sep 2018 14:00:42 -0600
Message-ID: <CAHmME9pw_HzDC7CRSsPKL0CjA1yV15JAOJ-7uL_qmOUmVc5ZVw@mail.gmail.com>
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

Could you send your kernel's .config or some more information so that
I can try to reproduce locally?
