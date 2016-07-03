Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0cbc9e1e
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 18:43:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c90d3b6
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 18:43:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4a9b5111
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 18:43:17 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id h129so105446880lfh.1
 for <wireguard@lists.zx2c4.com>; Sun, 03 Jul 2016 11:46:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467469135-30518-1-git-send-email-dkg@fifthhorseman.net>
References: <1467469135-30518-1-git-send-email-dkg@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 3 Jul 2016 20:46:28 +0200
Message-ID: <CAHmME9prtOfazpfa2Q6YkVYbJjthmrsD4h4CE75sKprPqsMHFw@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [PATCH] "wg help" cleanup and normalization
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Just like git --help, I don't want to display all the usages. However,
I've improved the general situation with this patch:

https://git.zx2c4.com/WireGuard/commit/?id=62cc3a9c5af2fd7cc8847a577b6b911c79e110e7
