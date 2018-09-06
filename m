Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac5a793b
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 16:10:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dd3f9a6
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 16:10:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a33bce4
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 15:55:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a5a90c71
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 15:55:05 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id k12-v6so21542475oiw.8
 for <wireguard@lists.zx2c4.com>; Thu, 06 Sep 2018 09:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7UkwLER55wRDfLT7gNH+cPwSW4ziD-L71HyPix_wXOKFsiWg@mail.gmail.com>
In-Reply-To: <CA+7UkwLER55wRDfLT7gNH+cPwSW4ziD-L71HyPix_wXOKFsiWg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Sep 2018 10:10:57 -0600
Message-ID: <CAHmME9q9C9FcpMz0HHQD-hLRF-qsNM4K8PZ2xwseSRcpQ+jD0w@mail.gmail.com>
Subject: Re: Let's talk about obfuscation again
To: coder@poorlab.com
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

Hey SB,

Thanks for the detailed post and insights.

Indeed obfuscation is an extremely useful tool. WireGuard itself is
derived from an exfiltration mechanism of mine, and so I've written
quite a few different obfuscation modules for that. When the core
WireGuard engineering becomes a bit more relaxed (right now it's
pretty intense), I may devote some effort into cleaning these up and
making them available as generic methods for whatever packet flow.

One thing to consider with obfuscation is: what type do you need and
for what purpose? What is your adversary like, and what policies are
they trying to enforce? For example, any one of these methods are
useful in a particular circumstance:

- Turn the entire stream into noise with something like xchacha or aes-pmac-siv.
- Turn the stream into noise and then walk a markov chain to generate
something that looks like HTML.
- Turn the stream into noise and then walk a markov chain to generate
something that looks like h264.
- Turn the stream into noise and then walk a markov chain to generate
something that looks like TLS 1.0.
- Turn the stream into noise and then encode the traffic as DNS requests.
- Turn the stream into noise and then walk a markov chain to generate
something that looks like DNS.
- Generate a training set using traffic gathered from eth0, turn the
stream into noise, and then use the training set to generate traffic
that looks like normal traffic.
- Generate a training set using traffic gathered from an implant on
another box, turn the stream into noise, and then use the training set
to generate traffic that looks like normal traffic.
- Manually provide a hand crafted training set, turn the stream into
noise, and then use the training set to generate traffic that looks
like normal traffic.
- Turn the stream into noise, and manually encode that into some given format.
- Turn the stream into noise, and then inject as corrupt ethernet frames.
- Turn the stream into noise, and then delay existing packets with a
modulated encoding to create a side channel.

The list goes on. These have all been useful in different
circumstances, and there are many more like them. I'm not too familiar
with the pluggable transports project, but my understanding is that it
is motivated by precisely this insight: there are many valid and
useful means of obfuscation, each of which is useful and has different
trade-offs. So why not make it pluggable? I generally don't like
mega-abstracted and pluggable big complicated things, as a general
taste, but here I think one has a decent argument as to why this might
make sense.

So of your suggestions, the most compelling one is:

> - Remain plaintext, but fix padding and timing problem,
>  relying Pluggable Transport [4] plugins to do the remaining work.
>  (I really recommend this solution.)

This is generally what I'd recommend too, but I'm not sure I follow
the logic of the padding and timing. Should not a proper pluggable
transport be doing this on its own already? Adding random padding to
all packets, and delaying statistically similar ones randomly as well?
Especially for the padding aspect, there's little reason why a
pluggable transport should not already be doing this.

Jason
