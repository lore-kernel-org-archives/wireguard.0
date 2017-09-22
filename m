Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5012df40
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 11:14:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27ef22b7
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 11:14:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cad82054
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 11:33:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d212b698
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 11:33:19 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id w94so2391412ioi.7
 for <wireguard@lists.zx2c4.com>; Fri, 22 Sep 2017 04:41:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170922101756.Horde.0028OWy_TWcXeR6q3nnfYrp@www.vdorst.com>
References: <20170922101756.Horde.0028OWy_TWcXeR6q3nnfYrp@www.vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Sep 2017 13:41:44 +0200
Message-ID: <CAHmME9qPOjjtjVt-E03uz8PUs3voGDGjpJ9f8YDGbDsfBPVAqw@mail.gmail.com>
Subject: Re: Failed to give packet to userspace from peer with very poor wifi
 connection.
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Are you *positive* you don't have it reversed?

In my testing, 0.0.20170918 has the issue with "failed to give packet
to userspace", whereas current git master does _not_ have the issue.

Can you make sure that after building the new module, you're sure to
unload the previous one (rmmod)?
