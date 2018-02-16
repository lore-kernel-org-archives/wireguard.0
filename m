Return-Path: e1326252@student.tuwien.ac.at
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4ca43c6
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 10:36:12 +0000 (UTC)
Received: from mail1.student.tuwien.ac.at (mail1.student.tuwien.ac.at
 [193.170.73.221])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e109c081
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Feb 2018 10:36:12 +0000 (UTC)
Received: from [192.168.0.103] ([178.188.66.253]) (authenticated bits=0)
 by mail1.student.tuwien.ac.at (8.14.7/8.13.8) with ESMTP id w1GAhFQE019673
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <wireguard@lists.zx2c4.com>; Fri, 16 Feb 2018 11:43:16 +0100
Subject: Re: NetworkManager Plugin
To: wireguard@lists.zx2c4.com
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
From: Max Moser <e1326252@student.tuwien.ac.at>
Message-ID: <f9fe4524-b5a1-ce94-4391-ae1fd74099e7@student.tuwien.ac.at>
Date: Fri, 16 Feb 2018 11:43:14 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9oy2uhNfG4vXYHLK2eq36qZA_QWfrTnMrQJWis6sqDTag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I just read that he's on to something in Rust, don't know any specifics 
though.

I've written him an e-mail a couple of days ago, since some sort of 
comparison or joining forces may be beneficial for everybody.


On 16/02/18 06:33, Jason A. Donenfeld wrote:
> On Thu, Feb 15, 2018 at 9:15 PM, Maykel Moya <mmoya@mmoya.org> wrote:
>> Wondering about the pic in slide 8 of
>> https://fosdem.org/2018/schedule/event/bulletinboard_dht/attachments/slides/2204/export/events/attachments/bulletinboard_dht/slides/2204/presentation.pdf
> I think he's working on some wilder plugin that incorporates his DHT
> stuff, which is a separate effort from Max's. My personal preference
> is getting a lightweight but functional NetworkManager plugin out
> there for users, that doesn't come with the baggage or bells&whistles
> of the DHT. But for people using the DHT work, having the plugin for
> that is undoubtedly useful.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
