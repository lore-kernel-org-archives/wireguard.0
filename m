Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91b08001
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 15:01:37 +0000 (UTC)
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
 [209.85.223.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9e4fa4d
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 15:01:37 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id q11so11622279ioe.10
 for <wireguard@lists.zx2c4.com>; Thu, 21 Sep 2017 08:29:01 -0700 (PDT)
MIME-Version: 1.0
Sender: nicolas.prochazka@gmail.com
In-Reply-To: <CAHmME9oM+nGFi+4wVg2nDpy18SqCwh67_tjj2eAbGeV0EjbMqw@mail.gmail.com>
References: <CADdae-hcrAL6-pMPwVOmGe3cb299jtUj68WVbz3EU5MmGQbtaQ@mail.gmail.com>
 <CAHmME9pr6-WXJ6wthXDyzc4V5MAv-0uuSgrWD3a2O3NiLQWHEQ@mail.gmail.com>
 <CADdae-jAp+r2hT37Huetz9eajrgWEvwAZfhbo4mS8DP5gWw_Hw@mail.gmail.com>
 <CAHmME9qs_hyveXwUTU17gzri9Dwe+DgLj3Mzqu6dvZxuz57Jaw@mail.gmail.com>
 <CADdae-i+Ue8cLZhcNUZ__-DQzU7b+uC963VbENpgDV4TTsqGRg@mail.gmail.com>
 <CAHmME9oM+nGFi+4wVg2nDpy18SqCwh67_tjj2eAbGeV0EjbMqw@mail.gmail.com>
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Thu, 21 Sep 2017 17:29:00 +0200
Message-ID: <CADdae-g3cnKhOCECVZ-8nSv3vdxpzW61X8dQA0WSV0++dgP7JA@mail.gmail.com>
Subject: Re: [wireguard-dev] Ability to use one udp port for multiple wg
 interfaces
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

A last thing what we also prefere with multiple interface it that the
server public key is not shared between our customer.
customer only known there's interface public key, so , when we destroy
a customer, the key is never used again.
Regards,
Nicolas

2017-09-21 15:24 GMT+02:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> On Thu, Sep 21, 2017 at 3:14 PM, nicolas prochazka
> <prochazka.nicolas@gmail.com> wrote:
>> "historical" private software, and it's difficult to deal with.
>> It is not a wireguard issue.
>
> In that case, I'd recommend you bind your services to 0.0.0.0 and just
> use iptables to do net-based ACLs with the standard filter table.
