Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed88bc54
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Sep 2016 16:23:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2f75ea7
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Sep 2016 16:23:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3e35c922
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Sep 2016 16:23:48 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id y6so111652279lff.1
 for <wireguard@lists.zx2c4.com>; Fri, 30 Sep 2016 09:34:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA93jw4dbVM8ntF8L4+5hZjGP5_362-qa-WCURWUrZG-qsoPag@mail.gmail.com>
References: <CAHmME9p7LbqwSxSXgyjcam5f1cS0yM3E4WuLKnk8Ffm1QhQ4=A@mail.gmail.com>
 <CAA93jw5Uv3bjXSvOnx0fcPYPjPVeVuHehYr4oHeHX+ED7c-2Ng@mail.gmail.com>
 <CAHmME9ps9AacMTk15+6NNZQ9dYi1jMw0Gm_S51PraEni=3Ki1A@mail.gmail.com>
 <CAA93jw7Lt5bq0ExfyhBmu7Lw1pdnPpebyG3v1pdtODsji88ABw@mail.gmail.com>
 <CAHmME9pvM_LZhT0VXGj+baUNXJXW1e97Akw3actPYa7_yYeCRg@mail.gmail.com>
 <CAA93jw4dbVM8ntF8L4+5hZjGP5_362-qa-WCURWUrZG-qsoPag@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 30 Sep 2016 18:34:30 +0200
Message-ID: <CAHmME9rUzt2jh4m7S4LdXY2ok-N5JV30hWz26YzNkpZHiCQHGA@mail.gmail.com>
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

On Thu, Sep 29, 2016 at 10:03 PM, Dave Taht <dave.taht@gmail.com> wrote:
> Now... as for the other stuff in that blog entry (I never got around
> to writing parts II and III), I am curious as to your raw PPS with
> small packets presently, and if you've figured out how to apply
> fq_codel internally yet? :-P

I haven't looked deeply into it yet, but one thing that makes me a bit
hesitant is that fq_codel does flow classification. WireGuard uses a
separate queue for each peer, so that it can start and stop it
independently depending on the state of various crypto handshake
things. This also means that each queue only has one flow.
Furthermore, flow classification is usually done because different
endpoints have different latencies. But in this case, the latency
isn't a factor of which endpoint, but rather of the CPU doing the
encryption/decryption operation. So, I'm not yet sure precisely how to
conceptualize fitting fq_codel over WireGuard.
