Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e9bd555
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 22:04:56 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ce4de9f
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 22:04:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 764d5f7c
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 22:03:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 332d2743
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 May 2018 22:03:42 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id 77-v6so22863858otd.4
 for <wireguard@lists.zx2c4.com>; Tue, 22 May 2018 15:06:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABcNfLs4Z8uLu+Bn-3RCeAXkowB1ty0P_7hfGrAy_taS75CRdA@mail.gmail.com>
References: <CABcNfLs4Z8uLu+Bn-3RCeAXkowB1ty0P_7hfGrAy_taS75CRdA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 23 May 2018 00:06:03 +0200
Message-ID: <CAHmME9oMUDiSzdw6+1nqkMQwCjOCJDUkH_69DWSg-9LEp0J87g@mail.gmail.com>
Subject: Re: Key distribution and rotation tools?
To: Giacomo Bernardi <mino@minux.it>
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

On Tue, May 22, 2018 at 3:42 PM, Giacomo Bernardi <mino@minux.it> wrote:
> rotate pre-shared secrets by design [1].

Ahh, my apologies, I read "pre-shared" and assumed you were talking
about PSK mode. But I think you're really interested in more general
key distribution.

Some people are just doing this over TLS with basic rest APIs
beforehand. Other people are distributing keys with their ansible
deployments. Others are using pre-existing channels like SSH or LDAP.
Some people think it's a nice idea to stick it in DNS with DNSSEC.
There's a project out there called 'wireguard-p2p' that does this with
a DHT.

Because the WireGuard CLI is pretty simple, it seems that different
parties doing this tend to just use simple context-specific scripts
for automating this, rather than forming a project that's reusable. To
me, that seems like mostly a good thing -- our tools are basic enough
that people don't need to run three gigabyte large enterprise java
daemons to manage it. On the other hand, I'm sure we could all benefit
from having some nice templated possibilities out there, either in
contrib/examples/ or even as their own project.

If anybody is interested in working on this kind of thing, get in touch!
