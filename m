Return-Path: dave.taht@gmail.com
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
 [209.85.220.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 143c6926
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Sep 2016 18:09:15 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id n189so12329306qke.0
 for <wireguard@lists.zx2c4.com>; Thu, 29 Sep 2016 11:19:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9p7LbqwSxSXgyjcam5f1cS0yM3E4WuLKnk8Ffm1QhQ4=A@mail.gmail.com>
References: <CAHmME9p7LbqwSxSXgyjcam5f1cS0yM3E4WuLKnk8Ffm1QhQ4=A@mail.gmail.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Thu, 29 Sep 2016 11:19:52 -0700
Message-ID: <CAA93jw5Uv3bjXSvOnx0fcPYPjPVeVuHehYr4oHeHX+ED7c-2Ng@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard ECN Implementation
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Sep 29, 2016 at 10:50 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrot=
e:
> Hey Dave,
>
> I'm back! Catching up on the backlog now. You wrote in your blog post:

Welcome back!

I got distracted also. See "TCP BBR".

I have no idea how sch_fq + pacing fits into your design, either.

>> In a day, the author (while on a plane!) tossed off an ecn encapsulation
>> implementation (it worked! but it=E2=80=99s not currently as modern RFC =
compliant as it should be),
>
> What part of it deviates from the RFC precisely? Here's a short
> summary of the implementation:
>
> - When a packet is transmitted:
>
>     outer_packet->ds =3D
>             ip_tunnel_ecn_encap(0, ip_hdr(inner_packet), inner_packet);
>
> - When a packet is received:
>
>     var =3D ip_tunnel_get_dsfield(ip_hdr(outer_packet), outer_packet);
>     if (INET_ECN_is_ce(var))
>         IP_ECN_set_ce(ip_hdr(inner_packet));

I think the correct behavior here is to only set ce on the inner
packet if the inner packet is marked as ecn capable.

> What specifically is wrong with this? Where does it deviate from the
> RFC? I'd like to be as "correct" as possible.

It looked to as tho leveraging the other newer ecn capable codebases
in the kernel was sane also.


>
> Talk soon,
> Jason



--=20
Dave T=C3=A4ht
Let's go make home routers and wifi faster! With better software!
http://blog.cerowrt.org
