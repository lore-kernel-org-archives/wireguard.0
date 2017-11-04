Return-Path: markus.woschank@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d675c44e
 for <wireguard@lists.zx2c4.com>; Sat, 4 Nov 2017 21:22:36 +0000 (UTC)
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com
 [74.125.82.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de7dbc17
 for <wireguard@lists.zx2c4.com>; Sat, 4 Nov 2017 21:22:36 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id f18so5463942otd.10
 for <wireguard@lists.zx2c4.com>; Sat, 04 Nov 2017 14:25:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171104212701.527fadc1@vega.skynet.aixah.de>
References: <CAKUy5axWvBJfDQOjWSs7T0BCJ3Gw051Uu8gGw0BdSUOrzMAndw@mail.gmail.com>
 <20171104212701.527fadc1@vega.skynet.aixah.de>
From: Markus Woschank <markus.woschank@gmail.com>
Date: Sat, 4 Nov 2017 14:25:28 -0700
Message-ID: <CAKUy5ayAzFtkLvagJN=m9Qk5Zuk1uwhHkj19=kCKDqNDj4jBxQ@mail.gmail.com>
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

>> Having the output of showconf reflect the original configuration in a
>> deterministic way enables configuration/provisioning software to check
>> if the interface is in the desired state and only take action if it's
>> not - that would be very helpful at least to me.
>
> I'd suggest you set up your provisioning software to ignore the
> endpoints in "wg showconf"'s output if(f) the configuration file
> doesn't specify endpoints at all.
>
> If the config file does contain an endpoint, it's probably a good idea
> to compare it to the endpoint reported by wg showconf.

While searching for arguments I realised that wireguard will allow a
peer to connect with a different IP from the one set in the
configuration.
Not sure if this is the best behaviour (I understand that the peer
needs to know the secret key, anyway not sure).

Thanks,
Markus
