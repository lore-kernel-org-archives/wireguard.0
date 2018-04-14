Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b621b8f8
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:44:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0941e67e
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:44:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e587ebed
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:36:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eff569f4
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:36:00 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id a14-v6so11873785otf.6
 for <wireguard@lists.zx2c4.com>; Fri, 13 Apr 2018 18:59:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAPGejTdvKJ-4q5B6OtkvC-FDbqK07+PiXpdXzMW8MS-1oSNfRA@mail.gmail.com>
References: <CAPGejTe5nKoZfQbyZYfpz5GmiC+UAvkmnuTehKvXjzLxUeHbaw@mail.gmail.com>
 <CAPGejTdvKJ-4q5B6OtkvC-FDbqK07+PiXpdXzMW8MS-1oSNfRA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 03:59:04 +0200
Message-ID: <CAHmME9q8LiU2U9qRp-RJ83k7AhgGCNuFj+hVdAJUQJQttuxwaA@mail.gmail.com>
Subject: Re: Cannot ping peer 1 from peer 2
To: Vikas <kedia.vikas@gmail.com>
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

You may need to run as root:

sysctl net.ipv4.ip_forward=1

You also may want a -o wg0 rule on the FORWARD table, if you don't
also have an established/related rule there.
