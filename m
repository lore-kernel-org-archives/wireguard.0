Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99e45275
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Jan 2017 09:58:35 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c5a573a
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Jan 2017 09:58:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acc37580
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Jan 2017 09:58:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0a2bcf12
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Jan 2017 09:58:35 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id f9so60178628otd.1
 for <wireguard@lists.zx2c4.com>; Tue, 17 Jan 2017 02:09:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <03b53159-927e-fa41-8fcd-544e914c7441@hamburg.freifunk.net>
References: <03b53159-927e-fa41-8fcd-544e914c7441@hamburg.freifunk.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 17 Jan 2017 11:09:10 +0100
Message-ID: <CAHmME9rxvcmwPN=d+QGAneK7coc36wkmwVbUhcqc6_Zw66Ze9Q@mail.gmail.com>
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

Can you send the output of:

for i in vmlinuz-linux kernel.img Image zImage uImage; do [[ -f
/boot/$i ]] && pacman -Qo /boot/$i; done
