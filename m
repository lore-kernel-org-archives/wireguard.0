Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29fd1c7b
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jan 2018 13:46:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acd0ca5c
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jan 2018 13:46:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f089e7c8
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jan 2018 13:38:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 486b9f17
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jan 2018 13:38:02 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id d10so11345617oti.7
 for <wireguard@lists.zx2c4.com>; Tue, 09 Jan 2018 05:49:14 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 9 Jan 2018 14:49:13 +0100
Message-ID: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
Subject: WireGuard in systemd-networkd
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi folks,

Thanks to the wonderful work of J=C3=B6rg Thalheim, WireGuard is now
supported inside systemd-netword's .netdev files. The syntax should be
pretty similar to wg(8). Expect for this to be released as part of the
next release of systemd, where you'll then be able to read the man
pages for using it.

Next up - anybody interested in providing support for NetworkManager?

Jason
