Return-Path: bounce+6f817a.2e38e-wireguard=lists.zx2c4.com@jbeta.is
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18366e06
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 20:53:24 +0000 (UTC)
Received: from rs224.mailgun.us (rs224.mailgun.us [209.61.151.224])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e271ab0
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 20:53:24 +0000 (UTC)
Sender: jarteaga@jbeta.is
Received: by mail-pl0-f44.google.com with SMTP id f4so2310225plr.10
 for <wireguard@lists.zx2c4.com>; Fri, 16 Feb 2018 13:00:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1518793634.23818.33.camel@gmx.de>
References: <7d5325a3-fa07-f67f-a31e-aadd44458d41@student.tuwien.ac.at>
 <CAHmME9qVoBkdu35n4aGdZ8nCH6ONZhcGb=WCGx2LGbyHgJMTSw@mail.gmail.com>
 <CAFi5oX6LM+A=jbPmhffc4wT+pKmMg8xi=2ebSMg=s7Qg2AY_sw@mail.gmail.com>
 <cba131ba-cd15-8bf4-cdd1-4d46ad774d41@student.tuwien.ac.at>
 <CAHmME9rZU8y8mjHhHkVJ9foRW8Wuk5QMoijMfVU=_4LHfg7F-w@mail.gmail.com>
 <db120c3b-a9f3-6769-6baa-c3be86bbd78c@student.tuwien.ac.at>
 <CAHmME9ryD5Heuchod1PSNdpZP5wDY0A=zWDkdv2D7SVn_GcEdQ@mail.gmail.com>
 <5b85fcc4-4091-ce5d-7f4f-6dcee645f81d@student.tuwien.ac.at>
 <2a30ad28-1e5a-0fac-7db6-15b609e3b245@mmoya.org>
 <CAHmME9oy2uhNfG4vXYHLK2eq36qZA_QWfrTnMrQJWis6sqDTag@mail.gmail.com>
 <1518793634.23818.33.camel@gmx.de>
From: Javier Arteaga <jarteaga@jbeta.is>
Date: Fri, 16 Feb 2018 21:00:31 +0000
Message-ID: <CA+D5fhPh3ENB01rQcnGBZ5nyosBL=NC9SKmUvAPdsqNWU7K79A@mail.gmail.com>
Subject: Re: NetworkManager Plugin
To: Max Moser <e1326252@student.tuwien.ac.at>
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

Hi all,

First off, thanks for WireGuard and this effort!

I've tested the NM plugin on my Arch/GNOME3 setup and it works for me
too - congrats! I'm looking to get a bit more involved with the
community, so it would be my pleasure to contribute something back.

On Thu, Feb 15, 2018 at 2:07 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> As I wrote earlier, this is going to require a lot of work to actually
> bring to fruition. The first priority should be entirely dispensing
> with the use of wg-quick. In order to aid these efforts, I spent some
> time writing a mini single-file-c library that you can drop into your
> project as a means for talking to the kernel and configuring devices
> directly:

If nobody else is on this already then I'd like to take a stab at it.

Otherwise, I'll figure out other ways to help get this upstreamed :)

Cheers!

-- 
Javier Arteaga
