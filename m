Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff428a21
 for <wireguard@lists.zx2c4.com>; Sun, 1 Oct 2017 22:01:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2021014
 for <wireguard@lists.zx2c4.com>; Sun, 1 Oct 2017 22:01:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dddf790e
 for <wireguard@lists.zx2c4.com>; Sun, 1 Oct 2017 22:20:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5d227a39
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 1 Oct 2017 22:20:10 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id c77so4517950oig.0
 for <wireguard@lists.zx2c4.com>; Sun, 01 Oct 2017 15:29:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170922124913.Horde.l7vpYDEtJHMgZ9U602cMi6K@www.vdorst.com>
References: <20170922101756.Horde.0028OWy_TWcXeR6q3nnfYrp@www.vdorst.com>
 <CAHmME9qPOjjtjVt-E03uz8PUs3voGDGjpJ9f8YDGbDsfBPVAqw@mail.gmail.com>
 <20170922124913.Horde.l7vpYDEtJHMgZ9U602cMi6K@www.vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 2 Oct 2017 00:29:48 +0200
Message-ID: <CAHmME9prH1dmZSPt0AzEeGs=4gKu=2zPBp-ceDqJ=SxH9qma+A@mail.gmail.com>
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

Hey Ren=C3=A9,

I've got this fixed in the latest master branch, and it will roll out
in the upcoming snapshot.

Jason
