Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8403d68
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 03:49:34 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 698be35a
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 03:49:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26533f68
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 03:40:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6d5b59c1
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 03:40:42 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id h8-v6so429453otj.7
 for <wireguard@lists.zx2c4.com>; Tue, 17 Apr 2018 21:04:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1523995660.9423.4.camel@gmail.com>
References: <1523814593.1990.49.camel@gmail.com>
 <CAHmME9rr7AJ_LGZt62vMAkAFh4Q304PTpHJ3WRug91Xw3Ewb9w@mail.gmail.com>
 <1523995660.9423.4.camel@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 18 Apr 2018 06:04:16 +0200
Message-ID: <CAHmME9qy5mNRNHM4qJc-kBVu1+5ryO8fY5sZfCLiXRvc+b9vmw@mail.gmail.com>
Subject: Re: SFTP-based VPN bootstrapping with automatic collision-free IPs
 assignment/peers' public data sharing
To: ST <smntov@gmail.com>
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

The problem is that it uses unauthenticated TCP.
