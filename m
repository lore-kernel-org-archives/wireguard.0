Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69db0131
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Jun 2017 12:08:10 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b869f78
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Jun 2017 12:08:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e6b4fab
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Jun 2017 12:21:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f1bba23c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Jun 2017 12:21:44 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id s3so23144913oia.0
 for <wireguard@lists.zx2c4.com>; Fri, 16 Jun 2017 05:23:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKiCHuM=r8M=vbozrGYeXZ=9nwrVCggf29TssPwkDnFu-NRfzA@mail.gmail.com>
References: <CAA9f-OfbUrvM5PgL-ZHMCzDJuX9Vcoc84TJkK9yU7DGK7Tf2xw@mail.gmail.com>
 <CAHmME9oB5j3u20ePPouhOydb-GehgY6JRsE+mNs+CSs=KDb=tQ@mail.gmail.com>
 <CAKiCHuO49TvS-dhjtd7m8V_SOzPYMjTkBAM3KSyhWruLUYTPkg@mail.gmail.com>
 <CAHmME9oQp6zcwKd+_xmrbWi-JmCnRbH=BVMzWnF3Ne+6egzH0Q@mail.gmail.com>
 <CAKiCHuM=r8M=vbozrGYeXZ=9nwrVCggf29TssPwkDnFu-NRfzA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 16 Jun 2017 14:23:16 +0200
Message-ID: <CAHmME9o=C+yc3dFpKdfOJfqG7R-xHg7q_7c=xGKz7E6Oro7g2w@mail.gmail.com>
Subject: Re: Git tags
To: Martin Eskdale Moen <martinmoen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Oliver Beattie <oliver@monzo.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Jun 16, 2017 at 2:12 PM, Martin Eskdale Moen
<martinmoen@gmail.com> wrote:
> But the problem is that if I have 20 nodes and need to add some more and
> there is a breaking change like there was recently with the psk changing to
> peers instead of interface I can't always do that change before I need to
> add a new node.

How many times has this affected you? "Once", I assume. Breaking
changes certainly aren't the norm, and I'm sorry that it happened at
all and you have to deal with it. Big hassle. I don't want to subject
folks to that again if I don't have to. It still _may_ happen, but I
hope it won't, and we're working steadily toward the goal of
stabilizing.

> Would just be nice if the tags hung around for maybe a year.

This is currently experimental software. Someday it won't be
experimental, but today it is. You should not use old snapshots,
period. I'd strongly advise you to update all your nodes.

(However, I'll keep old tags around, because Oliver asked, and my only
reason for actually removing the tags was I thought cgit looked
prettier without the clutter, which isn't a good reason for anything.)
