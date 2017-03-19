Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b12aca7f
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Mar 2017 11:48:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60a934a5
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Mar 2017 11:48:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3fccb963
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Mar 2017 11:48:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4d7c5e61
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Mar 2017 11:48:58 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id i1so118522616ota.3
 for <wireguard@lists.zx2c4.com>; Sun, 19 Mar 2017 04:53:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <961f639e-5f37-00cc-c94d-4ca1c7e6d90a@viisauksena.de>
References: <97c5005a-78f0-0064-0d14-9062827b908e@gmail.com>
 <961f639e-5f37-00cc-c94d-4ca1c7e6d90a@viisauksena.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 19 Mar 2017 12:53:00 +0100
Message-ID: <CAHmME9q_UGtoY08H=tq30P=v9EYS3R2NQEHHbBD7xddo2jS11w@mail.gmail.com>
Subject: Re: [Question] Is it posible layer 2 interface on wireguard
To: jens <jens@viisauksena.de>
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

On Sun, Mar 19, 2017 at 12:47 PM, jens <jens@viisauksena.de> wrote:
> you need to establish connection, which means you may want to ping the
> inner wireguard ip in regular time intervalls

WireGuard has a "persistent-keepalive" feature for this. Check out the
manpage for wg(8).
