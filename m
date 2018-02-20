Return-Path: patrick@synix.io
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 044ab024
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Feb 2018 08:56:58 +0000 (UTC)
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
 [209.85.128.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e0a0011
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Feb 2018 08:56:58 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id m5so12233960wrg.1
 for <wireguard@lists.zx2c4.com>; Tue, 20 Feb 2018 01:04:33 -0800 (PST)
Return-Path: <patrick@synix.io>
Received: from [127.0.0.1] ([213.152.161.219])
 by smtp.gmail.com with ESMTPSA id r70sm31288226wmg.30.2018.02.20.01.04.30
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Feb 2018 01:04:31 -0800 (PST)
Content-Type: text/html; charset=utf-8
From: Patrick Glandien <patrick@synix.io>
To: "wireguard lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Cc: "wireguard lists.zx2c4.com" <wireguard@lists.zx2c4.com>
In-Reply-To: <mailman.180.1519108159.2201.wireguard@lists.zx2c4.com>
References: <mailman.180.1519108159.2201.wireguard@lists.zx2c4.com>
Subject: Re: wireguard-go relative imports
Message-ID: <local-f33257f5-3676@nylas-mail.nylas.com>
Date: Tue, 20 Feb 2018 09:04:28 +0000
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Dominik,<div><div><br></div><div>While relative imports are discouraged in =
Go, I could see it making it sense in the context of highly sensitive code =
such as wireguard.</div><div>The go dependency system, including `go get`, =
don't guarantee as to whether the code is authentic (e.g. signed).=
</div><div><br></div><div>This is a problem to the entire ecosystem of the =
language as recently witnessed when someone replaced a commonly used go =
package hosted on github&nbsp;after the user deleted his =
account:&nbsp;https://redd.it/7vv9zz</div><div><br></div><div>I have not =
looked into the wireguard-go code very much, but if it's merely meant to be=
 a wireguard implementation in Go (not to be used as a library) - then =
either relative import paths or top-level paths in an isolated go workspace=
 would be sensible and should not be changed to the usual canonical URL =
imports.</div><div><br></div><br><signature>=E2=80=94 Patrick =
Glandien</signature><div id=3D"n1-quoted-text-marker"></div></div>
