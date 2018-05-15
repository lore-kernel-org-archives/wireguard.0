Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6a3393f
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 20:49:21 +0000 (UTC)
Received: from mail-ot0-x231.google.com (mail-ot0-x231.google.com
 [IPv6:2607:f8b0:4003:c0f::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44a357cb
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 20:49:21 +0000 (UTC)
Received: by mail-ot0-x231.google.com with SMTP id l13-v6so1824680otk.9
 for <wireguard@lists.zx2c4.com>; Tue, 15 May 2018 13:49:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180515202126.yw57deh6st5ebnk6@kowloon>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <489c2f57-574a-1223-9c4d-266904e52c94@gmail.com>
 <20180515202126.yw57deh6st5ebnk6@kowloon>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Tue, 15 May 2018 22:49:15 +0200
Message-ID: <CAKXLc7drht4CVexsCTXwHe-Z_RyFghAhQsXom=z9dtQuxQU48Q@mail.gmail.com>
Subject: Re: Need for HW-clock independent timestamps
To: Devan Carpenter <mail@dvn.me>
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

On Tue, May 15, 2018 at 10:21 PM, Devan Carpenter <mail@dvn.me> wrote:
> Aaron Jones transcribed 3.1K bytes:
>> On 12/05/18 19:29, Axel Neumann wrote:
>> > You want WG to secure your network. So the suggestion can not be to open
>> > your network for a pretty insecure deamon in order to get WG working.
>> > This would essentially allow attackers to a fake the ntp server and then
>> > block WG forever.
>>
>> Someone in a position to fake NTP (which needs bidirectional
>> communication) is already in a position to block WG forever (by simply
>> refusing to forward its packets).
>>
>> Additionally, there are a few very well-designed and secure NTP daemons
>> out there (such as OpenNTPd).
>>
>
> Using NTP is not a viable solution for a distributed mesh network. What
> if the Internet is only accesible via WG, or what if the network is not
> connected to the Internet at all?
>
Why do you need the Internet at all?
You can do as simple as plug a $20 GPS receiver (serial/USB) in any
node and get precise time that is shared with others in the network.
Heck, even go analog and use the Colorado WWV radio signal.
Or go fancy and buy a dedicated Cesium-backed "private" NTP server.

> It's not a trivial problem, but I think it would be benefecial to WireGuard as a project to not depend on
> centralized time authority *if there is an option not to*.
>
I wouldn't call universal time a "centralized authority", it is more
of a well-agreed-upon concept.
With a clear view of the sky and some math, you can use the stars (Sun
incl.) even and nobody can ban you from knowing the time.
It is not like say centralized DNS.

So, yes you need a method for obtaining the time at somewhat precise
scale[1], but "NTP-to-I'net" is just one somewhat convenient method.

[1]  Can anyone point me to the piece in code that shows that
precision? In other words, how far apart can 2 peers' clocks be and
still connect.
I spend some time grepping, but couldn't find it... I guess it is
connected to 'REJECT_AFTER_TIME = 180 * HZ;' ?

Cheers,
Kalin.
