Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 089e1105
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 17:44:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13b73d3e
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 17:44:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9f56a080
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 17:44:11 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id h129so104997606lfh.1
 for <wireguard@lists.zx2c4.com>; Sun, 03 Jul 2016 10:47:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8760snzxk6.fsf@alice.fifthhorseman.net>
References: <8760snzxk6.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 3 Jul 2016 19:47:22 +0200
Message-ID: <CAHmME9oGh=CPJ_ik1dL4exDnBRaEK-Ft5+tRy-5VVNqTRaFs-g@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] stricter inputs for wg genkey, genpsk, and pubkey
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Daniel,

You can always post massive patch sets to the list, so long as you do
it with git-send-email so that the threading works correctly.
Sometimes it's nice to be able to comment on patches via inline
replies. The lists.zx2c4.com projects generally operate the same way
as LKML. Alterntively (or additionally) you can use git-request-pull,
which is often easier for actually merging the commits. Anyway, I'll
review stricter-inputs shortly.

Jason
