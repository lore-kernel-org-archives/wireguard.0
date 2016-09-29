Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d3df0e7
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Sep 2016 17:39:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 885d5c86
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Sep 2016 17:39:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 903aee9e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Sep 2016 17:39:44 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id l131so87499321lfl.2
 for <wireguard@lists.zx2c4.com>; Thu, 29 Sep 2016 10:50:22 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 29 Sep 2016 19:50:19 +0200
Message-ID: <CAHmME9p7LbqwSxSXgyjcam5f1cS0yM3E4WuLKnk8Ffm1QhQ4=A@mail.gmail.com>
To: Dave Taht <dave.taht@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: [WireGuard] WireGuard ECN Implementation
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Dave,

I'm back! Catching up on the backlog now. You wrote in your blog post:

> In a day, the author (while on a plane!) tossed off an ecn encapsulation
> implementation (it worked! but it=E2=80=99s not currently as modern RFC c=
ompliant as it should be),

What part of it deviates from the RFC precisely? Here's a short
summary of the implementation:

- When a packet is transmitted:

    outer_packet->ds =3D
            ip_tunnel_ecn_encap(0, ip_hdr(inner_packet), inner_packet);

- When a packet is received:

    var =3D ip_tunnel_get_dsfield(ip_hdr(outer_packet), outer_packet);
    if (INET_ECN_is_ce(var))
        IP_ECN_set_ce(ip_hdr(inner_packet));

What specifically is wrong with this? Where does it deviate from the
RFC? I'd like to be as "correct" as possible.

Talk soon,
Jason
