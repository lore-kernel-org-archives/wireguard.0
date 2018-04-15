Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dedbfa9b
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 15:32:53 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0927369
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 15:32:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e30196d8
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 15:24:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eacb244e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 15:24:01 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id x9-v6so12382740oig.7
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 08:47:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAM3m09Q8mg_baVZrmZ+tqx2FiKuStMhSTq8mT0kZ_beK_10GxA@mail.gmail.com>
References: <CAHmME9owJaafkWfz8ruaKWqATmQ9gfoxNtZNyxRJFjyQgr7yvw@mail.gmail.com>
 <CAM3m09Q8mg_baVZrmZ+tqx2FiKuStMhSTq8mT0kZ_beK_10GxA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 15 Apr 2018 17:47:17 +0200
Message-ID: <CAHmME9pYVm3yJWmdQNKamd+khC5w8knQjLNg_mFATErEhXB0DA@mail.gmail.com>
Subject: Re: PMTU Discovery Security Concerns
To: Ryan Whelan <rcwhelan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Luis Ressel <aranea@aixah.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, Apr 15, 2018 at 5:45 PM, Ryan Whelan <rcwhelan@gmail.com> wrote:
> I don't have an actual fix; but is something that could have a switch that
> could be configured per interface?  I know knobs and controls aren't really
> desirable, but if Off by default, it would encourage those turning it on to
> understand what they're exposing.

Knobs with a security impact? Sounds like a foot-gun disaster, and
something we've always tried to avoid here. I'm interested more in
seeing whether there's a secure way to do the right thing all of the
time.
