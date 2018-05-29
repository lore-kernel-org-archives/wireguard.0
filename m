Return-Path: jaapbuurman@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 612b00f1
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 11:57:26 +0000 (UTC)
Received: from mail-it0-x22d.google.com (mail-it0-x22d.google.com
 [IPv6:2607:f8b0:4001:c0b::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 858066ba
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 11:57:26 +0000 (UTC)
Received: by mail-it0-x22d.google.com with SMTP id q4-v6so18139496ite.3
 for <wireguard@lists.zx2c4.com>; Tue, 29 May 2018 04:59:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9ogDQv-TxNz+2jwbw=d4s2Vq1LdZgin4_=dL5D_SRy2_Q@mail.gmail.com>
References: <CAN-r--kLC4bAG0oAGp0gDO7Q2Ro0X9J5L-HY3sXaRz-zeZDR6Q@mail.gmail.com>
 <CAHmME9ogDQv-TxNz+2jwbw=d4s2Vq1LdZgin4_=dL5D_SRy2_Q@mail.gmail.com>
From: Jaap Buurman <jaapbuurman@gmail.com>
Date: Tue, 29 May 2018 13:59:23 +0200
Message-ID: <CAN-r--=Of+ca1+otqwZM-q4RrGGfNyqZAEazVsoXDzjvDd5sQQ@mail.gmail.com>
Subject: Re: Wireguard & hw flow offload incompatibility
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Dear Jason,

This isn't a regression. This is simply the first time this has been
observed. (hw) flow offload is a new feature, and hence this
interaction with wireguard is also new.

Yours sincerely,

Jaap

On Tue, May 29, 2018 at 1:54 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hi Jaap,
>
> Thanks for the report. Is this a _new_ bug in _new_ version of
> WireGuard that wasn't there before. Or is this the first time you've
> observed this?
>
> Thanks,
> Jason
