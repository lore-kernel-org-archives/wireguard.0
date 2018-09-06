Return-Path: b.candler@pobox.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bec2eb68
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 15:23:49 +0000 (UTC)
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af63c03d
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 15:23:49 +0000 (UTC)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 6DA21108E70
 for <wireguard@lists.zx2c4.com>; Thu,  6 Sep 2018 11:24:03 -0400 (EDT)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 671F6108E6F
 for <wireguard@lists.zx2c4.com>; Thu,  6 Sep 2018 11:24:03 -0400 (EDT)
Received: from MacBook-Pro-2.local (unknown [185.45.97.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 8A943108E6D
 for <wireguard@lists.zx2c4.com>; Thu,  6 Sep 2018 11:24:02 -0400 (EDT)
Subject: Re: Let's talk about obfuscation again
To: wireguard@lists.zx2c4.com
References: <mailman.1542.1536245115.2201.wireguard@lists.zx2c4.com>
From: Brian Candler <b.candler@pobox.com>
Message-ID: <2c0808aa-47da-9d1a-1c35-1aec3d0c9acc@pobox.com>
Date: Thu, 6 Sep 2018 16:24:00 +0100
MIME-Version: 1.0
In-Reply-To: <mailman.1542.1536245115.2201.wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> Domain fronting seems like the stealthiest option to me (and if anyone has a reliable way to
> detect domain fronting, I would love to hear about it!). But that doesn?t get you UDP (and NAT
> traversal); perhaps VOIP/WebRTC mimicry could work?

I think this is a game you can't win against a suitably motivated adversary.  Such an adversary can and will decode the payload to see if it makes sense.

For example: an apparently unencrypted VOIP/WebRTC stream, but one which contains "random" payload (i.e. which doesn't decode properly through the declared codec, or decodes to noise) may be interpreted as an encrypted phone call, and blocked on that basis alone, even if it's not obvious it contains data.

It would also be massively inefficient.  On the one hand, you'd have to send a stream of padding packets when there is no data to send, to look like an idle phone/video call.  On the other hand, when you *do* have data to send, you would have to constrain your bandwidth so you don't burst above a level of traffic which such a call would normally generate.

OK, so what about changing wireguard to use TCP and TLS on port 443? It's still going to look very anomolous compared to a "normal" web exchange.  Conceivably it might be mistaken for a websockets-based chat application or XMPP; but any adversary who wants to block wireguard is presumably going to want to block encrypted chat too.

In summary: I think wireguard is a tool for connecting together island networks, over an untrusted but cooperative intermediate network.  I don't think it should turn into a tool for steganography or policy busting.
