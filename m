Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 699ba4d3
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 21:10:34 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b71f38fb
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 21:10:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f05af897
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 20:46:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1a14c145
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 20:46:52 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id m22-v6so3520711otf.8
 for <wireguard@lists.zx2c4.com>; Wed, 18 Apr 2018 14:10:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAPGejTdkr5ERbLPR=94do2_w6GddCK4fOP62ofZ=VYuvSNJ40w@mail.gmail.com>
References: <CAPGejTdkr5ERbLPR=94do2_w6GddCK4fOP62ofZ=VYuvSNJ40w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 18 Apr 2018 23:10:32 +0200
Message-ID: <CAHmME9pHbB8JS9anHpMHXqzbF=Ei_9cw3iXBg8aTSZT59vwBPg@mail.gmail.com>
Subject: Re: On redhat 7.4 wireguard not working
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

You need a newer version of iproute2.
