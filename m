Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4289a1f
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jul 2016 11:45:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fee95f59
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jul 2016 11:45:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7da2fa52
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jul 2016 11:45:55 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id f93so47660833lfi.2
 for <wireguard@lists.zx2c4.com>; Thu, 28 Jul 2016 04:48:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160727150219.fdyg2smhmffmfxxl@c3po>
References: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
 <CAHmME9rCmhkegmUnS8EBoSmb8BEHo=bv7fxOQNdCwu1CaB+L-A@mail.gmail.com>
 <CCE0C17C-29C4-4E58-A853-590802C58589@viisauksena.de>
 <CAHmME9qqv3kC=6Y_JTO-P++4jpfTjw8qUGtGTQhsdmCujvU4sw@mail.gmail.com>
 <DEB54C8F-1159-48AD-B2A3-CB2B4E05C896@viisauksena.de>
 <CAHmME9oveH4hLUzEjwWnZ8Nj8U63LEuVezgivsxVxgpZKL_PwQ@mail.gmail.com>
 <20160727150219.fdyg2smhmffmfxxl@c3po>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 28 Jul 2016 13:48:39 +0200
Message-ID: <CAHmME9ogcB=7T8-0Qe+FuH11g7nAtA-xo0Q9CXnkB3SjhwNDkw@mail.gmail.com>
To: Michael Gerlach <n3ph@terminal21.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] LEDE / OpenWrt test - on TP-Link841Nv11 - 15MBs and
	crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey,

Do you guys have a good way of running your setup inside Qemu? I'd
like to debug this issue a bit...

Jason
