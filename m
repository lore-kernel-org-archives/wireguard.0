Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85355f0a
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 10:25:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd3ba9e0
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 10:25:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ac816e4
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 10:25:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9d6d2d3d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 10:25:43 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id b189so12001177oia.5
 for <wireguard@lists.zx2c4.com>; Tue, 14 Nov 2017 02:29:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9prMg_RuEUaO1XNy4Aj6MH3Cu=16kp=F_B-kKbSwO+qdQ@mail.gmail.com>
References: <20171111080920.GA5705@localhost.localdomain>
 <5A08F7ED.19177.35F8664A@pageexec.freemail.hu>
 <CAHmME9pDi9Djov75zjuc++jzZ+ksYPMwGs=tUMJU=C2Vk1od7Q@mail.gmail.com>
 <5A0A3587.25804.3AD10FF8@pageexec.freemail.hu>
 <CAHmME9prMg_RuEUaO1XNy4Aj6MH3Cu=16kp=F_B-kKbSwO+qdQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 14 Nov 2017 11:29:48 +0100
Message-ID: <CAHmME9oA+ATwHhHD8==qe+vGUGLE0aCEvzHMoDGdxvRAn4XU-A@mail.gmail.com>
Subject: Re: imer_setup() is not compatible with PaX's RAP
To: pageexec@freemail.hu
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

On Tue, Nov 14, 2017 at 10:29 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Or is there something else?

With the latest git master (that commit in my last email), I just
tried compiling and running this with some sketchtastic 4.9 "forward
ports", and things seem to be working. If things are broken for you
with >4.9, happy to accept patches.
