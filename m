Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1479fa3a
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 10:47:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61c6e099
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 10:47:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9783a0c6
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 10:47:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7a129319
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 10:47:36 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id a132so26053326oih.11
 for <wireguard@lists.zx2c4.com>; Tue, 31 Oct 2017 03:49:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 31 Oct 2017 11:49:54 +0100
Message-ID: <CAHmME9rd=8C86vm0aEkq_83UBHEhT4nWhsqSDAMgDf-LFQUYeQ@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Martin Hauke <mardnh@gmx.de>, Joe Doss <joe@solidadmin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello everybody,

I have committed the DNS hatchet! But in compromise-form:

https://git.zx2c4.com/WireGuard/commit/?id=f042be244a98a8d854d4b89353190d1673f5f814

Distributions that still need to use it (such as Fedora and OpenSUSE)
can call the apply.sh script in contrib/ to modify things. Everybody
else will keep functioning like before. When no more distributions
need the hatchet, I'll remove it from contrib/. Advantages of this
approach:

- Distributions don't have to maintain it, but still are responsible
for it by virtue of choosing to apply it.
- It doesn't pollute wg-quick.bash itself.
- It's more arguably removable later, since it only lives in contrib/.

So, I'll release a new snapshot soon, and I'll expect to see future
RPMs run apply.sh prior to make install, until they have a more
enterprisey solution available to them.

Glad we worked this out! Thanks everyone for their helpful input.

Regards,
Jason
