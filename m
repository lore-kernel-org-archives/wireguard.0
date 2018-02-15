Return-Path: e1326252@student.tuwien.ac.at
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66a0f379
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Feb 2018 14:50:53 +0000 (UTC)
Received: from mail1.student.tuwien.ac.at (mail1.student.tuwien.ac.at
 [193.170.73.221])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e5e11f5
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Feb 2018 14:50:53 +0000 (UTC)
Subject: Re: NetworkManager Plugin
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <7d5325a3-fa07-f67f-a31e-aadd44458d41@student.tuwien.ac.at>
 <CAHmME9qVoBkdu35n4aGdZ8nCH6ONZhcGb=WCGx2LGbyHgJMTSw@mail.gmail.com>
 <CAFi5oX6LM+A=jbPmhffc4wT+pKmMg8xi=2ebSMg=s7Qg2AY_sw@mail.gmail.com>
 <cba131ba-cd15-8bf4-cdd1-4d46ad774d41@student.tuwien.ac.at>
 <CAHmME9rZU8y8mjHhHkVJ9foRW8Wuk5QMoijMfVU=_4LHfg7F-w@mail.gmail.com>
 <db120c3b-a9f3-6769-6baa-c3be86bbd78c@student.tuwien.ac.at>
 <CAHmME9ryD5Heuchod1PSNdpZP5wDY0A=zWDkdv2D7SVn_GcEdQ@mail.gmail.com>
From: Maximilian Moser <e1326252@student.tuwien.ac.at>
Message-ID: <5b85fcc4-4091-ce5d-7f4f-6dcee645f81d@student.tuwien.ac.at>
Date: Thu, 15 Feb 2018 15:57:49 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9ryD5Heuchod1PSNdpZP5wDY0A=zWDkdv2D7SVn_GcEdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Jordan DeBeer <debee1jp@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Since we're already listed on the NetworkManager page [1], it'd be a 
shame to just drop it.
Also, it would be kind of a waste having gone through all the pain of 
getting a basic grasp on the workings of it all for nothing.
Still, I'll gladly accept contributions ;)

Oh right, maybe it'd be worth noting that Thomas Haller, one of the 
NetworkManager guys, has spoken in favour of native NM wireguard 
integration on the NM mailing list:
> Hi Maximilian,
>
>
> cool, thanks for letting us know.
>
> I added a link tohttps://wiki.gnome.org/Projects/NetworkManager/VPN
>
>
> I still think, it would be great to have wireguard support in
> NetworkManager not via a VPN plugin. But that is for another day.
>
>
> best,
> Thomas

-- Max


[1] 
https://wiki.gnome.org/Projects/NetworkManager/VPN#VPN_Plugins_maintained_by_third_parties


On 15/02/18 15:46, Jason A. Donenfeld wrote:
> On Thu, Feb 15, 2018 at 3:35 PM, Maximilian Moser
> <e1326252@student.tuwien.ac.at> wrote:
>> However, this does not seem to be the case and I'll be glad to continue
>> development on it. :)
> Wonderful!
