Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30c8edbc
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 03:27:13 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3571aaa
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 03:27:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a43eaba
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 03:25:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0a2da4ca
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 03:25:59 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id l15-v6so17460902oth.6
 for <wireguard@lists.zx2c4.com>; Mon, 25 Jun 2018 20:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAK+ZqRryNNWq1yhAQKbzOxTKrzRmO_gfM47F18YCGOiYcdumdg@mail.gmail.com>
 <CAHmME9ooS8c-QmB6X_ySTZiYsK98vFQ-bpws6TJUUJ3sE-aCLQ@mail.gmail.com>
 <CAK+ZqRqA4BkCLmxnuNfRtNByXaDYv1MpZB44PZrCM_Mx_ncNRw@mail.gmail.com>
In-Reply-To: <CAK+ZqRqA4BkCLmxnuNfRtNByXaDYv1MpZB44PZrCM_Mx_ncNRw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 26 Jun 2018 05:32:30 +0200
Message-ID: <CAHmME9pa6eOoWeN+GgBVRUmy78S4PuGRHxr5OWJtvcoWB=X10g@mail.gmail.com>
Subject: Re: src/crypto/curve25519-x86_64.h:1319: Error: no such instruction
 while compiling in centos 6
To: kumarkarthikn@gmail.com
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

It's probably possible to get this working with CentOS 6. But I'm not
going to spend time on it, and I'd encourage you to switch to a newer
version that sees more security attention.
