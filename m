Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3063a1f
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 20:07:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa545baf
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 20:07:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 70102776
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 20:07:39 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id f6so96176587lfg.0
 for <wireguard@lists.zx2c4.com>; Sat, 02 Jul 2016 13:10:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467473657-10023-1-git-send-email-dkg@fifthhorseman.net>
References: <1467473657-10023-1-git-send-email-dkg@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 2 Jul 2016 22:10:42 +0200
Message-ID: <CAHmME9qJW8JTP9b+A9-roxtvGwur0KWmhyo=h+fvhdg+LwzX-Q@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [PATCH] use runtime check for getrandom syscall
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Daniel,

WireGuard supports kernels =E2=89=A54.1. getrandom was added in 3.17. So, a=
ll
kernels on which wg is useful support getrandom.

Jason
