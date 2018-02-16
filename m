Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6c4b958
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 05:26:47 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee128dc5
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 05:26:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ed2082c
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 05:17:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 12aacf84
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 05:17:56 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id x21so1526090oie.13
 for <wireguard@lists.zx2c4.com>; Thu, 15 Feb 2018 21:33:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2a30ad28-1e5a-0fac-7db6-15b609e3b245@mmoya.org>
References: <7d5325a3-fa07-f67f-a31e-aadd44458d41@student.tuwien.ac.at>
 <CAHmME9qVoBkdu35n4aGdZ8nCH6ONZhcGb=WCGx2LGbyHgJMTSw@mail.gmail.com>
 <CAFi5oX6LM+A=jbPmhffc4wT+pKmMg8xi=2ebSMg=s7Qg2AY_sw@mail.gmail.com>
 <cba131ba-cd15-8bf4-cdd1-4d46ad774d41@student.tuwien.ac.at>
 <CAHmME9rZU8y8mjHhHkVJ9foRW8Wuk5QMoijMfVU=_4LHfg7F-w@mail.gmail.com>
 <db120c3b-a9f3-6769-6baa-c3be86bbd78c@student.tuwien.ac.at>
 <CAHmME9ryD5Heuchod1PSNdpZP5wDY0A=zWDkdv2D7SVn_GcEdQ@mail.gmail.com>
 <5b85fcc4-4091-ce5d-7f4f-6dcee645f81d@student.tuwien.ac.at>
 <2a30ad28-1e5a-0fac-7db6-15b609e3b245@mmoya.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 16 Feb 2018 06:33:50 +0100
Message-ID: <CAHmME9oy2uhNfG4vXYHLK2eq36qZA_QWfrTnMrQJWis6sqDTag@mail.gmail.com>
Subject: Re: NetworkManager Plugin
To: Maykel Moya <mmoya@mmoya.org>
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

On Thu, Feb 15, 2018 at 9:15 PM, Maykel Moya <mmoya@mmoya.org> wrote:
> Wondering about the pic in slide 8 of
> https://fosdem.org/2018/schedule/event/bulletinboard_dht/attachments/slides/2204/export/events/attachments/bulletinboard_dht/slides/2204/presentation.pdf

I think he's working on some wilder plugin that incorporates his DHT
stuff, which is a separate effort from Max's. My personal preference
is getting a lightweight but functional NetworkManager plugin out
there for users, that doesn't come with the baggage or bells&whistles
of the DHT. But for people using the DHT work, having the plugin for
that is undoubtedly useful.
