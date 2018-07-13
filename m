Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43ad2a33
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Jul 2018 18:20:13 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9a7991a
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Jul 2018 18:20:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d9ec15d
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Jul 2018 18:18:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 325269e9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Jul 2018 18:18:58 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id i12-v6so63944278oik.2
 for <wireguard@lists.zx2c4.com>; Fri, 13 Jul 2018 11:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9rP8fE7U9VxLauQ_Ee-w6ox-DAAFkvAOjx52bxGT58w4w@mail.gmail.com>
 <580E3DE0-4D06-46C5-A972-96C1F687A7B7@abelbeck.com>
 <F0797C8C-D288-4531-A21F-4FD38764544A@lonnie.abelbeck.com>
In-Reply-To: <F0797C8C-D288-4531-A21F-4FD38764544A@lonnie.abelbeck.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 13 Jul 2018 20:27:45 +0200
Message-ID: <CAHmME9rUf87VA2u0Nqh2jQ=_D2aAug1z4vYz6ctHXznarkA0KQ@mail.gmail.com>
Subject: Re: receive: use gro call instead of plain call
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
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

Hey Lonnie,

Wow, thanks for benching that (and watching the git repo for the
experiment-of-the-day). This performance increase certainly exceeds my
expectations; I'm quite pleased it's working so well.

You might, by the way, be interested in using Flent for testing. It's
slightly more scientific, and its developer hangs out on this mailing
list.

https://flent.org/

Jason
