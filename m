Return-Path: patrick@synix.io
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3bfd8bcc
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Feb 2018 09:02:40 +0000 (UTC)
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
 [209.85.223.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 139a98c0
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Feb 2018 09:02:40 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id l12so8426971ioc.10
 for <wireguard@lists.zx2c4.com>; Tue, 20 Feb 2018 01:10:15 -0800 (PST)
MIME-Version: 1.0
From: Patrick Glandien <patrick@synix.io>
Date: Tue, 20 Feb 2018 02:10:14 -0700
Message-ID: <CADy+xPkZTf+p9eEQiOSXsAhg39yPP0b57pw+kprVctVQoV_=9g@mail.gmail.com>
Subject: Re: wireguard-go relative imports
To: "wireguard lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

(Pardon for previously sending an HTML response)

Dominik,

While relative imports are discouraged in Go, I could see it making it
sense in the context of highly sensitive code such as wireguard.
The go dependency system, including `go get`, don't guarantee as to
whether the code is authentic (e.g. signed).

This is a problem to the entire ecosystem of the language as recently
witnessed when someone replaced a commonly used go package hosted on
github after the user deleted his account: <https://redd.it/7vv9zz>.

I have not looked into the wireguard-go code very much, but if it's
merely meant to be a wireguard implementation in Go (not to be used as
a library) - then either relative import paths or top-level paths in
an isolated go workspace would be sensible and should not be changed
to the usual canonical URL imports.

=E2=80=94 Patrick Glandien
