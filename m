Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6381e90d
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 19:42:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88ece122
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 19:42:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 28df019f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 19:42:13 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id h129so62891061lfh.1
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2016 12:45:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87mvm21o0z.fsf@alice.fifthhorseman.net>
References: <87mvm21o0z.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Jun 2016 21:45:00 +0200
Message-ID: <CAHmME9rocoQvv8mdVgK-Qyj0yufQW=foat_0SfM7osm1r8te2w@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] README.md refers to doc/protocol.md
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey dkg,

Thanks for finding that. Indeed I initially had all the docs in docs/
and moved it to wireguard.io for the public release. They still live
in markdown format and the site is built from that. Right now I have
no plans of moving the documentation back into the repo. In any case,
I've got a good system for keeping the docs in wireguard.io up to date
with the wireguard src repository; they're both versioned in git, and
perhaps I'll open up the repo for the site markdown documentation.

Good feedback, thanks.

Jason
