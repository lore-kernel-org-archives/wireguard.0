Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2df604ec
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 18:14:05 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1510248d
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 18:14:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80739cfa
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 18:12:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 19862788
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 18:12:49 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id l12-v6so18078915oth.6
 for <wireguard@lists.zx2c4.com>; Tue, 29 May 2018 11:16:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d0fe533f-de71-9446-ec2b-0da8cd0548f9@fireorbit.de>
References: <d0fe533f-de71-9446-ec2b-0da8cd0548f9@fireorbit.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 29 May 2018 20:16:01 +0200
Message-ID: <CAHmME9qby2G_CL3gbdcXiBAgM-fe3gSGktM+zfaOgGqwZOOSsQ@mail.gmail.com>
Subject: Re: own interface address and peer address in same Subnet
To: "Martin/Geno" <geno+dev@fireorbit.de>
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

You can use the fwmark option to have wireguard's udp packets marked,
and then use policy routing. Check out what wg-quick(8) does under the
hood.
