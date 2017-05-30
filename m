Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76ea109d
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 11:47:07 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91f17e21
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 11:47:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbda15e0
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 11:58:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e65a9087
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 11:58:32 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id l18so107990590oig.2
 for <wireguard@lists.zx2c4.com>; Tue, 30 May 2017 05:00:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <987716C2-3ABE-4705-A7AA-98511627C777@gmail.com>
References: <61E1F38E-66AB-4AD1-B3B0-79FB42A3B4C8@gmail.com>
 <CAHmME9rtEXCHG6LE+JP7jaDnM7cR+faJOAKJLW0bMBKawoZZ0Q@mail.gmail.com>
 <987716C2-3ABE-4705-A7AA-98511627C777@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 30 May 2017 14:00:06 +0200
Message-ID: <CAHmME9ou95Lq=Dc86iCC7H1_N+oLckyM7Ngrv1hwOp=TarOkRQ@mail.gmail.com>
Subject: Re: Kernel panic on ARM
To: Alexandre Karlov <bassbeat@gmail.com>
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

Hi Alexandre,

Could you compile with `make debug`, so that dmesg gets plenty of
debugging output? That will let me see if this is related to
handshakes or to transport messages. An initial theory, based on the
stacktrace there involving fmonty and such, is that the 32-bit
implementation of curve25519-donna uses a lot of stack space, and if
you're on a kernel that puts the softirq stack and the process stack
in the same place, this could be an issue. Also, would you mind
sending your kernel's .config?

Jason
