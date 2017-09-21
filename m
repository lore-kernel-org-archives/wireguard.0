Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 642ff38b
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 15:09:30 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61aad9d5
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 15:09:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8d2a61e
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 15:28:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a8b5304a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 15:28:33 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id k101so11788539iod.0
 for <wireguard@lists.zx2c4.com>; Thu, 21 Sep 2017 08:36:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADdae-g3cnKhOCECVZ-8nSv3vdxpzW61X8dQA0WSV0++dgP7JA@mail.gmail.com>
References: <CADdae-hcrAL6-pMPwVOmGe3cb299jtUj68WVbz3EU5MmGQbtaQ@mail.gmail.com>
 <CAHmME9pr6-WXJ6wthXDyzc4V5MAv-0uuSgrWD3a2O3NiLQWHEQ@mail.gmail.com>
 <CADdae-jAp+r2hT37Huetz9eajrgWEvwAZfhbo4mS8DP5gWw_Hw@mail.gmail.com>
 <CAHmME9qs_hyveXwUTU17gzri9Dwe+DgLj3Mzqu6dvZxuz57Jaw@mail.gmail.com>
 <CADdae-i+Ue8cLZhcNUZ__-DQzU7b+uC963VbENpgDV4TTsqGRg@mail.gmail.com>
 <CAHmME9oM+nGFi+4wVg2nDpy18SqCwh67_tjj2eAbGeV0EjbMqw@mail.gmail.com>
 <CADdae-g3cnKhOCECVZ-8nSv3vdxpzW61X8dQA0WSV0++dgP7JA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 21 Sep 2017 17:36:52 +0200
Message-ID: <CAHmME9oOCMcfkDxyMZ9rAqMd8Rwd2Zf6Dss5+QRDCp_3n1yxJA@mail.gmail.com>
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

There shouldn't be any massive issue with sharing your public key
between customers. Just keep your private keys private.
