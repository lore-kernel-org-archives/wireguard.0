Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 861ddc04
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Apr 2017 11:58:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59da8a96
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Apr 2017 11:58:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a268efa
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Apr 2017 11:58:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 05886647
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Apr 2017 11:58:27 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id l18so8510804oig.2
 for <wireguard@lists.zx2c4.com>; Sun, 30 Apr 2017 05:07:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKJBWRfDRi9KGM_OJwgN2ZaQ9a56Gxshh=apnj5j9ish-WOOcg@mail.gmail.com>
References: <CAKJBWRfDRi9KGM_OJwgN2ZaQ9a56Gxshh=apnj5j9ish-WOOcg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 30 Apr 2017 14:07:43 +0200
Message-ID: <CAHmME9obiOSUAxaOEFk64VDH=8KRGOrA957RZVdAjHYDGsm0AQ@mail.gmail.com>
Subject: Re: do a client behind NAT needs to define listening port?
To: Rostislav Belotserkovski <rost.bel@gmail.com>
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

If you don't specify a listening port, it will be picked at random for you.
