Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9d97a14
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2017 22:03:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 915397fc
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2017 22:03:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9baac73
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2017 22:22:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e691918e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2017 22:22:22 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id c74so27112971iod.4
 for <wireguard@lists.zx2c4.com>; Fri, 21 Jul 2017 15:22:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA8CD9s67yT1esUYwyo5rmsZAKahoXn86AAX8faccgvTcA8_xw@mail.gmail.com>
References: <CAA8CD9vTW5XJVDjhE=5t6e8midm6LivLYqLHBrT98riTYnP3kQ@mail.gmail.com>
 <CAA8CD9s67yT1esUYwyo5rmsZAKahoXn86AAX8faccgvTcA8_xw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 22 Jul 2017 00:22:54 +0200
Message-ID: <CAHmME9pQR3hmHJjV-wUah2wqYGKqSw+HipuQH6F92hVgD4FBrg@mail.gmail.com>
Subject: Re: Not able to ping the host as per demo of wireguard.
To: Sahil Gupta <sg5414@rit.edu>
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

You need to set the correct listening port. If you want to use port
51820, set it as such:

$ wg set wg0 listen-port 51820

Then adjust your endpoint to 'endpoint 1.2.3.4:51820'.
