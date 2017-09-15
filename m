Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84574517
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Sep 2017 01:50:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19bd4530
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Sep 2017 01:50:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de19e3b7
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Sep 2017 02:09:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8b95c00d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Sep 2017 02:09:52 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id d16so5123318ioj.3
 for <wireguard@lists.zx2c4.com>; Thu, 14 Sep 2017 19:17:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170915005255.GA5107@principal.rfc2324.org>
References: <20170915005255.GA5107@principal.rfc2324.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 15 Sep 2017 04:17:20 +0200
Message-ID: <CAHmME9oy6P6Uu1Ua=heozE8LsfFK2OPUtLwLa7e4N_QypjvqHg@mail.gmail.com>
Subject: Re: Wireguard and VRFs?
To: Maximilian Wilhelm <max@sdn.clinic>
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

Hi Max,

Yes, WireGuard supports this type of functionality through two more
powerful mechanisms:

- fwmark, so you can do proper policy-based routing via `ip rule` with
multiple tables
- network namespace, so that you can have the udp socket in one
namespace and the actual interface in another

I imagine what you want is the fwmark feature, which seems to match up
with much of the language used in vrf.txt. Check out the wg(8) manpage
for details.

Regards,
Jason
