Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e2e492b
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Sep 2016 18:49:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa7a83cd
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Sep 2016 18:49:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ca8d66d5
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Sep 2016 18:49:04 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id l131so88860181lfl.2
 for <wireguard@lists.zx2c4.com>; Thu, 29 Sep 2016 11:59:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA93jw5Uv3bjXSvOnx0fcPYPjPVeVuHehYr4oHeHX+ED7c-2Ng@mail.gmail.com>
References: <CAHmME9p7LbqwSxSXgyjcam5f1cS0yM3E4WuLKnk8Ffm1QhQ4=A@mail.gmail.com>
 <CAA93jw5Uv3bjXSvOnx0fcPYPjPVeVuHehYr4oHeHX+ED7c-2Ng@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 29 Sep 2016 20:59:39 +0200
Message-ID: <CAHmME9ps9AacMTk15+6NNZQ9dYi1jMw0Gm_S51PraEni=3Ki1A@mail.gmail.com>
To: Dave Taht <dave.taht@gmail.com>
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

On Thu, Sep 29, 2016 at 8:19 PM, Dave Taht <dave.taht@gmail.com> wrote:
> I think the correct behavior here is to only set ce on the inner
> packet if the inner packet is marked as ecn capable.

IP_ECN_set_ce already does this. It exits early if it isn't already
ECT(1) or ECT(0):

static inline int IP_ECN_set_ce(struct iphdr *iph)
{
       u32 check = (__force u32)iph->check;
       u32 ecn = (iph->tos + 1) & INET_ECN_MASK;

       /*
        * After the last operation we have (in binary):
        * INET_ECN_NOT_ECT => 01
        * INET_ECN_ECT_1   => 10
        * INET_ECN_ECT_0   => 11
        * INET_ECN_CE      => 00
        */
       if (!(ecn & 2))
               return !ecn;

       /*
        * The following gives us:
        * INET_ECN_ECT_1 => check += htons(0xFFFD)
        * INET_ECN_ECT_0 => check += htons(0xFFFE)
        */
       check += (__force u16)htons(0xFFFB) + (__force u16)htons(ecn);

       iph->check = (__force __sum16)(check + (check>=0xFFFF));
       iph->tos |= INET_ECN_CE;
       return 1;
}



>
> It looked to as tho leveraging the other newer ecn capable codebases
> in the kernel was sane also.

I tried to copy already existing code in the kernel for this. Is there
a certain driver that you think does it particularly well that I
should copy?
