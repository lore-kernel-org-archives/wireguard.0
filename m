Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e62e04a
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 12:57:29 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe68267a
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 12:57:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d67ebaa
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 13:16:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4f865b1a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 13:16:32 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id w94so10740550ioi.7
 for <wireguard@lists.zx2c4.com>; Thu, 21 Sep 2017 06:24:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADdae-i+Ue8cLZhcNUZ__-DQzU7b+uC963VbENpgDV4TTsqGRg@mail.gmail.com>
References: <CADdae-hcrAL6-pMPwVOmGe3cb299jtUj68WVbz3EU5MmGQbtaQ@mail.gmail.com>
 <CAHmME9pr6-WXJ6wthXDyzc4V5MAv-0uuSgrWD3a2O3NiLQWHEQ@mail.gmail.com>
 <CADdae-jAp+r2hT37Huetz9eajrgWEvwAZfhbo4mS8DP5gWw_Hw@mail.gmail.com>
 <CAHmME9qs_hyveXwUTU17gzri9Dwe+DgLj3Mzqu6dvZxuz57Jaw@mail.gmail.com>
 <CADdae-i+Ue8cLZhcNUZ__-DQzU7b+uC963VbENpgDV4TTsqGRg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 21 Sep 2017 15:24:51 +0200
Message-ID: <CAHmME9oM+nGFi+4wVg2nDpy18SqCwh67_tjj2eAbGeV0EjbMqw@mail.gmail.com>
Subject: Re: [wireguard-dev] Ability to use one udp port for multiple wg
 interfaces
To: nicolas prochazka <prochazka.nicolas@gmail.com>
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

On Thu, Sep 21, 2017 at 3:14 PM, nicolas prochazka
<prochazka.nicolas@gmail.com> wrote:
> "historical" private software, and it's difficult to deal with.
> It is not a wireguard issue.

In that case, I'd recommend you bind your services to 0.0.0.0 and just
use iptables to do net-based ACLs with the standard filter table.
