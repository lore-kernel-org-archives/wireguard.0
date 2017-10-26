Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dcfa7557
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 22:17:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42a5ab21
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 22:17:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bf0b73c
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 22:17:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0b726831
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 22:17:42 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id a132so8169966oih.11
 for <wireguard@lists.zx2c4.com>; Thu, 26 Oct 2017 15:19:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <976454169.394660.1509055309999@ichabod.co-bxl>
References: <2027941193.391349.1509047899053@ichabod.co-bxl>
 <CAHmME9ouUyaR6UeWeL-5a1MLkm1fE6VDmC94=K1DszrcRoPwtw@mail.gmail.com>
 <976454169.394660.1509055309999@ichabod.co-bxl>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 27 Oct 2017 00:19:27 +0200
Message-ID: <CAHmME9qkhgFbmnGqTidCBCo_-Ksvgwxs8gf1OSYhWk6HhNcdgg@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: Geo Kozey <geokozey@mailfence.com>
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

On Thu, Oct 26, 2017 at 11:53 PM, Geo Kozey <geokozey@mailfence.com> wrote:
> No, with fixed resolv.conf pointing to local namserver only there would b=
e no DNS resolution as your cache has to come from somewhere. I'm talking s=
pecifically about local nameserver without external connectivity but I thin=
k users may want to use their own static nameservers with dynamic one which=
 they get from wg for whatever reason. Having to chose one over another as =
only possibility isn't best solution IMO.

Usually people who do this usually point their cache toward the remote
tunneled nameserver, via, say, dnsmasq's -S option. Some people do
indeed enjoy multiple entries in their resolv.conf and rely on this
generally buggy behavior, which means you could make an argument that
I shouldn't be using openresolv's "-x" option, and maybe you'd have a
case. But I don't care for nobs, and those powerusers probably don't
want wg-quick anyway or can just use PostUp.

In any case, this is a different issue from what this thread is trying
to determine, so if you'd like to bikeshed -x vs -m and options and
whatnot in openresolv, please do so on an entirely different thread
with a different subject.
