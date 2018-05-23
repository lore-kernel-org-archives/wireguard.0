Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22bb96c8
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 12:31:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71da1675
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 12:31:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e049dd44
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 12:30:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9c09cf8d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 12:30:44 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id y10-v6so24954672otg.10
 for <wireguard@lists.zx2c4.com>; Wed, 23 May 2018 05:33:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rJonVbSRHCPy0W7Pr=vmJoMbVTHbGw0C1xwBze4Px7uA@mail.gmail.com>
References: <CAHmME9rJonVbSRHCPy0W7Pr=vmJoMbVTHbGw0C1xwBze4Px7uA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 23 May 2018 14:33:10 +0200
Message-ID: <CAHmME9pnJqE0gaM_zPTwZ5i+Qb7nNeSw=P4+VhG3aMiUYGdJkg@mail.gmail.com>
Subject: Re: WireGuard for FreeBSD
To: ports <freebsd-ports@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
Cc: decke@freebsd.org, WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, May 21, 2018 at 11:35 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> 2. wireguard-go
> Runtime dependencies: none
> Buildtime dependencies: gmake, go
> Build: export GOPATH=$(pwd)/gopath; go get -d; gmake
> Install: gmake PREFIX=/usr/local install
> URL template: https://git.zx2c4.com/wireguard-go/snapshot/wireguard-go-VERSION.tar.xz

This has now been simplified slightly and uses proper vendoring of dependencies:

Runtime dependencies: none
Buildtime dependencies: gmake, go, dep
Build: gmake
Install: gmake PREFIX=/usr/local install
URL template: https://git.zx2c4.com/wireguard-go/snapshot/wireguard-go-VERSION.tar.xz
