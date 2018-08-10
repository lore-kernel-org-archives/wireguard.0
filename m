Return-Path: b.candler@pobox.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64506f01
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 13:23:59 +0000 (UTC)
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed4f5ee8
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 13:23:59 +0000 (UTC)
Received: from pb-smtp20.pobox.com (unknown [10.110.30.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPS id 3FB87101204
 for <wireguard@lists.zx2c4.com>; Fri, 10 Aug 2018 09:35:21 -0400 (EDT)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id B714E2D182
 for <wireguard@lists.zx2c4.com>; Fri, 10 Aug 2018 09:35:20 -0400 (EDT)
 (envelope-from b.candler@pobox.com)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id B0D452D181
 for <wireguard@lists.zx2c4.com>; Fri, 10 Aug 2018 09:35:20 -0400 (EDT)
 (envelope-from b.candler@pobox.com)
Received: from MacBook-Pro-2.local (unknown [84.92.42.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 246932D17F
 for <wireguard@lists.zx2c4.com>; Fri, 10 Aug 2018 09:35:16 -0400 (EDT)
 (envelope-from b.candler@pobox.com)
Subject: Re: Reflections on WireGuard Design Goals
To: wireguard@lists.zx2c4.com
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
From: Brian Candler <b.candler@pobox.com>
Message-ID: <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
Date: Fri, 10 Aug 2018 14:35:14 +0100
MIME-Version: 1.0
In-Reply-To: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> For whatever reason, in the last several weeks, WireGuard been receivin=
g a
> considerable amount of attention, and with that comes various parties
> interested in the project moving in this direction or in that direction=
. And
> more generally, over the last year or so, we've seen a decent amount of
> interest from different folks wanting to do different things with the p=
roject
> and with the protocol. This inevitably leads to the question: what do w=
e
> actually want WireGuard to be, as a project, as a protocol, as a set of
> implementations, as a design methodology, and so forth? I've had a pret=
ty
> clear idea about that, but I don't think I've ever tried to communicate
> aspects of it in this context, so I thought here I'd highlight two impo=
rtant
> design goals that motivate us.
Thanks for explaining the project background, and your very sensible=20
goals of simplicity and robustness.=C2=A0 And thanks for releasing this=20
excellent piece of software.

 From my point of view, the only thing which makes me uncomfortable=20
about wireguard is the lack of any second authentication factor. Your=20
private key is embedded in a plaintext file in your device (e.g.=20
laptop), not even protected with a passphrase.=C2=A0 Anyone who gains acc=
ess=20
to that laptop is able to establish wireguard connections.

Of course, it can be argued that the laptop holds other information=20
which is more valuable that the wireguard key, therefore you should=20
concentrate on properly securing the laptop itself (*). Furthermore, to=20
be able to talk to the wireguard kernel module you're already root, and=20
therefore have all sorts of malicious options available to you. etc etc

But I'd feel a lot happier if a second level of authentication were=20
required to establish a wireguard connection, if no packets had been=20
flowing for more than a configurable amount of time - say, an hour. It=20
would give some comfort around lost/stolen devices.

Whilst I appreciate that wireguard is symmetrical, a common use case is=20
to have remote "clients" with a central "office".=C2=A0 I'm thinking abou=
t a=20
hook whereby the "office" side could request extra authentication when=20
required - e.g. if it sees a connection from a wireguard public key=20
which has been idle for more than a configurable amount of time, then it=20
sends a challenge which requires (e.g.) a Yubikey to complete.=C2=A0 I=20
appreciate that it's not going to be straightforward, requiring the=20
kernel module to talk to userland components at both ends.

In the absence of that, it would be nice if the private key which is=20
stored on the laptop were encrypted with a passphrase.=C2=A0 Simplest opt=
ion=20
may be to extend wg-quick so that the entire config file can be=20
pgp-encrypted.

Regards,

Brian.

(*) You could make a similar argument for ssh keys or pgp keys, saying=20
there's no need to protect them with a passphrase if the host they are=20
stored on is properly secured.=C2=A0 I think many people would disagree.
