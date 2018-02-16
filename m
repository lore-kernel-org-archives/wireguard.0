Return-Path: manuel.schoelling@gmx.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a79cdd29
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 15:00:22 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef1ba454
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 15:00:22 +0000 (UTC)
Message-ID: <1518793634.23818.33.camel@gmx.de>
Subject: Re: NetworkManager Plugin
From: Manuel =?ISO-8859-1?Q?Sch=F6lling?= <manuel.schoelling@gmx.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Maykel Moya <mmoya@mmoya.org>
Date: Fri, 16 Feb 2018 16:07:14 +0100
In-Reply-To: <CAHmME9oy2uhNfG4vXYHLK2eq36qZA_QWfrTnMrQJWis6sqDTag@mail.gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

On Fri, 2018-02-16 at 06:33 +0100, Jason A. Donenfeld wrote:
> I think he's working on some wilder plugin that incorporates his DHT
> stuff, which is a separate effort from Max's. My personal preference
> is getting a lightweight but functional NetworkManager plugin out
> there for users, that doesn't come with the baggage or bells&whistles
> of the DHT. But for people using the DHT work, having the plugin for
> that is undoubtedly useful.

Yeah, I gave that presentation. The plugin I wrote is suppose to work
for both: raw wireguard and my wireguard-p2p solution, that lets you
circumvent the NAT and dyndns problems. I wrote it in Rust because I
really did not go through all the pain with GTK that Max went through
;)

My plugin comes independent of the DHT client (it just communicates
with it via dbus if the DHT client is installed). However, it's written
in Rust, so I don't think that it would be easy to get it accepted
upstream.
