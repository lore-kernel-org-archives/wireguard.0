Return-Path: rumpelsepp@sevenbyte.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b817e49
 for <wireguard@lists.zx2c4.com>; Thu, 7 Dec 2017 10:15:08 +0000 (UTC)
Received: from coruscant.sevenbyte.org (coruscant.sevenbyte.org
 [45.32.152.104])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5179b261
 for <wireguard@lists.zx2c4.com>; Thu, 7 Dec 2017 10:15:08 +0000 (UTC)
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
 [209.85.215.47]) (Authenticated sender: rumpelsepp@sevenbyte.org)
 by coruscant.sevenbyte.org (Postfix) with ESMTPSA id 8DE4C41DD7
 for <wireguard@lists.zx2c4.com>; Thu,  7 Dec 2017 11:22:07 +0100 (CET)
Received: by mail-lf0-f47.google.com with SMTP id f13so7515991lff.12
 for <wireguard@lists.zx2c4.com>; Thu, 07 Dec 2017 02:22:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171111044854.GA7956@zx2c4.com>
References: <20171111044854.GA7956@zx2c4.com>
From: Stefan Tatschner <rumpelsepp@sevenbyte.org>
Date: Thu, 7 Dec 2017 11:22:04 +0100
Message-ID: <CAB=oiXZYChYMzqK4cufNy+Gr-QHK7jE=h8-9+zQMx67_xsLVoQ@mail.gmail.com>
Subject: Re: WireGuard Upstreaming Roadmap (November 2017)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

thanks for providing all these information. I am looking forward to
the further development of wireguard!

On Sat, Nov 11, 2017 at 5:48 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> The current biggest blocker is issues with the crypto API. Before WireGuard
> can go upstream, I intend to embark on a multi-pronged effort to overhaul the
> crypto API. I very much need to sync up with Herbert regarding my plans for
> this, and start spec'ing things out a bit more formally, so I can begin
> concrete discussions with him. I intend to base my work both on feedback
> from linux-crypto/Herbert and from the cryptographic research community. I
> hope to go to RWC2018 [3] and the subsequent HACS workshop for the academic
> engagement side, but of course like all the work I do on the kernel, things
> will be highly based in engineering, rather than purely academic, practices.

I have a question which is related to the involved crypto. As far as I
have understood the protocol and the concept of wireguard, there is no
crypto agility in the design. That means we cannot easily replace the
underlying cryptographic primitives without breaking things. Please
correct me if I am wrong.

The website states:
> WireGuard uses state-of-the-art cryptography, like the Noise protocol framework,
> Curve25519, ChaCha20, Poly1305, BLAKE2, SipHash24, HKDF, and secure trusted
> constructions. It makes conservative and reasonable choices and has been reviewed
> by cryptographers.

Assuming I am right according the crypto agility, what's the upgrade
path if any of the involved cryptographic algorithms will be declared
insecure/broken? From my point of view wireguard tries to stay as
simple as possible and in general that's a good idea. I am just a bit
worrying about the possible lack of a clear upgrade path once
wireguard is mainlined.

What's your opinion on this?

Thanks!

Stefan
