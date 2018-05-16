Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11fdeb1f
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 20:35:25 +0000 (UTC)
Received: from mail-ot0-x22d.google.com (mail-ot0-x22d.google.com
 [IPv6:2607:f8b0:4003:c0f::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb011b0b
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 20:35:25 +0000 (UTC)
Received: by mail-ot0-x22d.google.com with SMTP id t1-v6so2474431ott.13
 for <wireguard@lists.zx2c4.com>; Wed, 16 May 2018 13:35:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20C72316-B8FC-4515-8DC8-8BC82BF3864F@cgws.de>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <489c2f57-574a-1223-9c4d-266904e52c94@gmail.com>
 <20180515202126.yw57deh6st5ebnk6@kowloon>
 <CAKXLc7drht4CVexsCTXwHe-Z_RyFghAhQsXom=z9dtQuxQU48Q@mail.gmail.com>
 <20C72316-B8FC-4515-8DC8-8BC82BF3864F@cgws.de>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Wed, 16 May 2018 22:35:27 +0200
Message-ID: <CAKXLc7c5xbD8isDvbpnYYcp9hWzmA09reDJWwCNAJwx6=_nBLw@mail.gmail.com>
Subject: Re: Need for HW-clock independent timestamps
To: Axel Neumann <neumann@cgws.de>
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

Hello Axel,

I may have not been clear in my last response, it was to be taken in
the context of the whole thread...

On Wed, May 16, 2018 at 9:32 PM, Axel Neumann <neumann@cgws.de> wrote:
>
>
> Am 15. Mai 2018 22:49:15 MESZ schrieb Kalin KOZHUHAROV <me.kalin@gmail.com>:
>>On Tue, May 15, 2018 at 10:21 PM, Devan Carpenter
>
>>> Using NTP is not a viable solution for a distributed mesh network.
>>What
>>> if the Internet is only accesible via WG, or what if the network is
>>not
>>> connected to the Internet at all?
>>>
>>Why do you need the Internet at all?
>>You can do as simple as plug a $20 GPS receiver (serial/USB) in any
>>node and get precise time that is shared with others in the network.
>
I meant to have one (or few) nodes that do provide time over UDP from
a GPS or other time-source, i.e. not connected to the Internet.
Not every node needs that.

Alternatively, as a pure software solution, every node of the network
may be required to run ntp on udp, or even other time protocol (say
RFC 867, RFC 868).
So any new node, before connecting to the WG endpoint with WG tunnel,
sets its time from it.
Nodes that do have access to the Net (exit nodes in a way), can run
ntpd internally and also don't need GPS or other time sources, if the
purpose of the network is "connect to the Net".

Cheers,
Kalin.
