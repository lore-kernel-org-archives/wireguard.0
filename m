Return-Path: konstantin@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09721ad4
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 14:17:56 +0000 (UTC)
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
 [209.85.220.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2d7231a
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 14:17:56 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id z143so1244022qkb.3
 for <wireguard@lists.zx2c4.com>; Fri, 22 Sep 2017 07:45:27 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Date: Fri, 22 Sep 2017 10:45:22 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: 2-factor auth options
Message-ID: <20170922144522.GA29432@gmail.com>
References: <20170921192148.GB2587@gmail.com>
 <CAHmME9qPeMve8rRUNCsMpwHxgbXwomj2TCC_5CFKQoA+q0c3eQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
In-Reply-To: <CAHmME9qPeMve8rRUNCsMpwHxgbXwomj2TCC_5CFKQoA+q0c3eQ@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Sep 22, 2017 at 12:52:43AM +0200, Jason A. Donenfeld wrote:
>The easiest way would be to add OTP to the part of your infra that
>does the key exchange. That is, if you have some kind of HTTPS
>REST-based API or an SSH-based API, you can have the server not accept
>a new public key until the OTP challenge is satisfied.

It may be the easiest and, with a web frontend, would allow doing 
something like U2F (bonus!), but it'll probably be fairly
unpopular because it would require a wholly disconnected step before 
establishing a connection. It's similar to what we do with gitolite and 
IP whitelisting -- you must run a command using your 2-factor auth token 
before your git push would succeed. It's seen lukewarm adoption and 
grumbling due to people's git pushes suddenly failing if their
whitelisting expires.

>Alternatively, you could do OTP in-band, in order to authorize that
>public key for a certain window of time before inactivity. In this
>scheme, you'd disallow access to the network segment based on firewall
>rules until a certain in-band challenge is made -- perhaps by
>contacting a certain sandboxed server and answering an OTP challenge
>there

That's very similar to the above. The upside is that it would make sure 
we don't have 2-factor stuff happening via a separate (potentially 
weaker) crypto channel than the rest of the session, but the downside is 
that it would complicate firewall management (e.g. reloading firewalls 
for some reason would require people to re-auth in order to regain 
access).

>(At some point it is planned for WireGuard to have an API for sending
>control messages directly to a public key, not via an IP address,
>which will provide another option for in-band challenges (in addition
>to dynamic configuration of IPs), but it's not immediately obvious
>that this actually simplifies things, which is why I haven't yet
>implemented the plan.)

Yeah, having an in-band solution would be best. Maybe even something 
like what you suggested above, but implemented internally. For example, 
establishing an initial connection would satisfy one set of permitted IP 
routing, but performing some API action would apply additional rules. It 
would be hard to do this in a non-kludgy way, though.

>What kind of infrastructure are you imagining? Is this for kernel.org?

I don't have concrete plans at this time, but we do use openvpn for 
admin-level access (that requires 2-factor auth), and I was looking for 
feature parity to see if we should eventually plan to switch.

Best,
-K
