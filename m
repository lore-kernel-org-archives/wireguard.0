Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95541dd8
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Jan 2017 10:00:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33822e88
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Jan 2017 10:00:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3b1555b
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Jan 2017 10:00:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b4da2df7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Jan 2017 10:00:49 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id 65so60207287otq.2
 for <wireguard@lists.zx2c4.com>; Tue, 17 Jan 2017 02:11:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rxvcmwPN=d+QGAneK7coc36wkmwVbUhcqc6_Zw66Ze9Q@mail.gmail.com>
References: <03b53159-927e-fa41-8fcd-544e914c7441@hamburg.freifunk.net>
 <CAHmME9rxvcmwPN=d+QGAneK7coc36wkmwVbUhcqc6_Zw66Ze9Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 17 Jan 2017 11:11:24 +0100
Message-ID: <CAHmME9pwxcRwh6VdMop_O5PqzLXws=j9A08djNFwOoHKnY+QeA@mail.gmail.com>
Subject: Re: Similar Problem with ArchARM
To: lennart <lennart@hamburg.freifunk.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Actually, even more reliable, send the output of:

pacman -Qo /lib/modules/$(uname -r)
