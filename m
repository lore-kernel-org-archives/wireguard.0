Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a8b22db
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 22:14:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53a5d20d
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 22:14:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79adde24
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 22:05:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8a0da7e3
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 22:05:54 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id f18so4052166otf.6
 for <wireguard@lists.zx2c4.com>; Fri, 16 Feb 2018 14:21:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CANcmUPE9PPfniYa5ejj180Wncth7i3qS0A-ZaG06X4bwkRn5qQ@mail.gmail.com>
References: <CANcmUPE9PPfniYa5ejj180Wncth7i3qS0A-ZaG06X4bwkRn5qQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 16 Feb 2018 23:21:54 +0100
Message-ID: <CAHmME9raXy8gjJ44MHso1WjU_QFz1_Z8Q12q2GauoBPGJSaSxg@mail.gmail.com>
Subject: Re: Cortex-m support
To: Jonathan Beri <jmberi@gmail.com>
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

Hi Jonathan,

Currently it's quite coupled to Linux, but it doesn't have to be that
way for ever. Our cross platform implementations are coming along.

Jason
