Return-Path: ygh@mysterious.site
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ce72d59
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Mar 2017 05:02:07 +0000 (UTC)
Received: from sender-of-o52.zoho.com (sender-of-o52.zoho.com [135.84.80.217])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf9385d8
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Mar 2017 05:02:07 +0000 (UTC)
Date: Mon, 20 Mar 2017 14:06:13 +0900
From: sopium <sopium@mysterious.site>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "wireguard" <wireguard@lists.zx2c4.com>
Message-ID: <15aea1bc5c3.c2181619229336.1203334027395810585@mysterious.site>
In-Reply-To: <CAHmME9p8kMshYw0A0v7ibY_jeNbMDLX5TE1+r0e02j+28kk8Dg@mail.gmail.com>
References: <15acfffc263.e11103bb85901.2506936173902453879@mysterious.site>
 <CAHmME9p8kMshYw0A0v7ibY_jeNbMDLX5TE1+r0e02j+28kk8Dg@mail.gmail.com>
Subject: Re: Some questions about the protocol
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

Thanks for the reply. Some more questions.

The most tricky one first:

Do we send back keep-alive packets in response to keep-alive packets?
[No?] If so, they will ping-pong indefinitely, and persistent
keep-alive seems unnecessary. If not, do we send keep-alive packets in
response to persistent keep-alive packets? [Yes?] Then we need to
distinguish these two different types of keep-alive?

And,

2017-03-16 0:34 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> [...]
>> * Shall we start handshake in case the _previous_ session is not
>>   alive, or too old? My guess is NO?
>
> I'm not sure I understand your question. Could you rephrase? Here's
> some text that might clarify things possibly:

[Not a question] I was thinking of these timers as tied to individual
sessions. It all makes sense if they are tied to the peer.

>> * When padding packets, how to avoid getting larger than MTU,
>>   because we don't seem to know the MTU?
>
> You know the MTU of the WireGuard interface, and so you pad packets to
> fit into that. You can query this from the TUN device.
>
> WireGuard currently doesn't do per-peer-endpoint PMTU, but I'm working
> on this, and I'll update you when this is worked out.

Since a WireGuard interface can have multiple peers, some may have
a smaller MTU than the interface MTU?

Regards,
Sopium
