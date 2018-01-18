Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10f9d541
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 12:59:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bd07eed
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 12:59:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 359b3fad
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 12:50:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f1b0726a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 12:50:27 +0000 (UTC)
Received: by mail-ot0-f178.google.com with SMTP id r4so16152961oti.12
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jan 2018 05:02:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1516279577.16nr5x0y18.astroid@morple.none>
References: <1516279577.16nr5x0y18.astroid@morple.none>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 Jan 2018 14:02:45 +0100
Message-ID: <CAHmME9oiqr7dN+riRgJ0jXxxwuXB0U9ot94GsoM7KUWGbEE-0Q@mail.gmail.com>
Subject: Re: Defaultroutepiercing
To: "M. Dietrich" <mdt@emdete.de>
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

 Take a look at what wg-quick does to solve this:

https://git.zx2c4.com/WireGuard/tree/src/tools/wg-quick.bash#n162

It uses policy routing, which is much nicer than overriding the default rou=
te.

If, however, you do with to do it the old 0/1, 128/1 way, here's a
script to automate that: https://=D7=90.cc/gvFOR5BO/bash But I'd recommend
doing the trick that wg-quick does.
