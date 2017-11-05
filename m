Return-Path: markus.woschank@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b39eae1e
 for <wireguard@lists.zx2c4.com>; Sun, 5 Nov 2017 00:02:25 +0000 (UTC)
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com
 [74.125.82.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81b88f54
 for <wireguard@lists.zx2c4.com>; Sun, 5 Nov 2017 00:02:25 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id f18so5602109otd.10
 for <wireguard@lists.zx2c4.com>; Sat, 04 Nov 2017 17:05:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171105000327.0a772771@vega.skynet.aixah.de>
References: <CAKUy5axWvBJfDQOjWSs7T0BCJ3Gw051Uu8gGw0BdSUOrzMAndw@mail.gmail.com>
 <20171104212701.527fadc1@vega.skynet.aixah.de>
 <CAKUy5ayAzFtkLvagJN=m9Qk5Zuk1uwhHkj19=kCKDqNDj4jBxQ@mail.gmail.com>
 <20171105000122.09eae100@vega.skynet.aixah.de>
 <20171105000327.0a772771@vega.skynet.aixah.de>
From: Markus Woschank <markus.woschank@gmail.com>
Date: Sun, 5 Nov 2017 01:05:18 +0100
Message-ID: <CAKUy5az5NX6hLDPsiUg1eoJEnJ4VK6Q2KyrKLzZ3BMAGrg2nnw@mail.gmail.com>
Subject: Re: wg showconf
To: Luis Ressel <aranea@aixah.de>
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

>> While searching for arguments I realised that wireguard will allow a
>> peer to connect with a different IP from the one set in the
>> configuration.
>> Not sure if this is the best behaviour (I understand that the peer
>> needs to know the secret key, anyway not sure).
>
> Yes, wg does this. It's a deliberate design decision which is important
> to support roaming peers.
>
> This is not a security problem. Since wg uses UDP as a transport
> protocol, source IPs can be trivially forged by an attacker; therefore
> checking source IPs wouldn't add any real value.

Nevertheless this is different from the behaviour I expected:
If I specify an endpoint IP the peer is only allowed to connect via
the specified IP/Port.
If I don't specify an endpoint IP the peer is allowed to connect from
everywhere.

Yes, I could have read the documentation more carefully but maybe
restricting the remote IP/Port in cases the endpoint has been
specified would prevent some confusion/discussion.
This would also make the behaviour of the showconf command more
"consistent" because then the information, if the endpoint is set by
config or not, would be available and also the showconf command could
generate an equivalent configuration.

I imaging specifying an endpoint IP for a peer and than discovering
that it connected from a different IP may be surprising to some. I
generally prefer for things to break if I configure them the wrong way
and not work "sometimes" (wrong endpoint IP on one side but the other
first initiating the connection most of the time).

Thanks,
Markus
