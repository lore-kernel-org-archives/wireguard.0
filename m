Return-Path: dave.taht@gmail.com
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
 [209.85.216.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79e14f09
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Sep 2016 18:53:08 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id 38so41864167qte.1
 for <wireguard@lists.zx2c4.com>; Thu, 29 Sep 2016 12:03:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9ps9AacMTk15+6NNZQ9dYi1jMw0Gm_S51PraEni=3Ki1A@mail.gmail.com>
References: <CAHmME9p7LbqwSxSXgyjcam5f1cS0yM3E4WuLKnk8Ffm1QhQ4=A@mail.gmail.com>
 <CAA93jw5Uv3bjXSvOnx0fcPYPjPVeVuHehYr4oHeHX+ED7c-2Ng@mail.gmail.com>
 <CAHmME9ps9AacMTk15+6NNZQ9dYi1jMw0Gm_S51PraEni=3Ki1A@mail.gmail.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Thu, 29 Sep 2016 12:03:45 -0700
Message-ID: <CAA93jw7Lt5bq0ExfyhBmu7Lw1pdnPpebyG3v1pdtODsji88ABw@mail.gmail.com>
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

that + 1 was clever. I think you are done... and I should go change the blo=
g. :)

On Thu, Sep 29, 2016 at 11:59 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrot=
e:
> On Thu, Sep 29, 2016 at 8:19 PM, Dave Taht <dave.taht@gmail.com> wrote:
>> I think the correct behavior here is to only set ce on the inner
>> packet if the inner packet is marked as ecn capable.
>
> IP_ECN_set_ce already does this. It exits early if it isn't already
> ECT(1) or ECT(0):
>
> static inline int IP_ECN_set_ce(struct iphdr *iph)
> {
>        u32 check =3D (__force u32)iph->check;
>        u32 ecn =3D (iph->tos + 1) & INET_ECN_MASK;
>
>        /*
>         * After the last operation we have (in binary):
>         * INET_ECN_NOT_ECT =3D> 01
>         * INET_ECN_ECT_1   =3D> 10
>         * INET_ECN_ECT_0   =3D> 11
>         * INET_ECN_CE      =3D> 00
>         */
>        if (!(ecn & 2))
>                return !ecn;
>
>        /*
>         * The following gives us:
>         * INET_ECN_ECT_1 =3D> check +=3D htons(0xFFFD)
>         * INET_ECN_ECT_0 =3D> check +=3D htons(0xFFFE)
>         */
>        check +=3D (__force u16)htons(0xFFFB) + (__force u16)htons(ecn);
>
>        iph->check =3D (__force __sum16)(check + (check>=3D0xFFFF));
>        iph->tos |=3D INET_ECN_CE;
>        return 1;
> }
>
>
>
>>
>> It looked to as tho leveraging the other newer ecn capable codebases
>> in the kernel was sane also.
>
> I tried to copy already existing code in the kernel for this. Is there
> a certain driver that you think does it particularly well that I
> should copy?



--=20
Dave T=C3=A4ht
Let's go make home routers and wifi faster! With better software!
http://blog.cerowrt.org
