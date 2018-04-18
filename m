Return-Path: chm.duquesne@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4337a3de
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 09:25:40 +0000 (UTC)
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
 [209.85.214.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 646d474f
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 09:25:40 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id l83-v6so592552ita.5
 for <wireguard@lists.zx2c4.com>; Wed, 18 Apr 2018 02:40:26 -0700 (PDT)
MIME-Version: 1.0
Sender: chm.duquesne@gmail.com
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Wed, 18 Apr 2018 11:40:05 +0200
Message-ID: <CAHLp1Ym8ZaKjJOtuKspFHfgTh4Y4yNU5FFy=ZAfjcg0p9iWhyw@mail.gmail.com>
Subject: Broadcast on wireguard
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi list,

Maybe the answer is obvious to some of you, but I don't quite
understand why wireguard does not support broadcasting, and I found no
clear explanation in the archive. In fact, this [1] seems to indicate
that implementing it would be doable, so I am wondering why this has
not been done.

Could anyone explain - roughly - why this is the case? Is it for
security reasons? Performance? Complexity of implementation? Lack of
interest?

Another possibility could be that my question is just poorly asked or
irrelevant, in that case I would also appreciate a hint :-)

Best,
Christophe-Marie

[1]: https://lists.zx2c4.com/pipermail/wireguard/2016-December/000813.html
