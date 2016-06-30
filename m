Return-Path: zx2c4@gentoo.org
Received: from smtp.gentoo.org (smtp.gentoo.org [140.211.166.183])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id daad3a0e
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 18:29:38 +0000 (UTC)
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
 [209.85.215.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: zx2c4)
 by smtp.gentoo.org (Postfix) with ESMTPSA id DC863340EB0
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2016 18:32:27 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id q132so61589549lfe.3
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2016 11:32:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
From: "Jason A. Donenfeld" <zx2c4@gentoo.org>
Date: Thu, 30 Jun 2016 20:32:22 +0200
Message-ID: <CAHmME9roK0U62hwXq2rHOtGEkoxKx92Xg9Ay2HOnKuL4CtoQgA@mail.gmail.com>
To: zorun@bitsofnetworks.org, Christian Hesse <mail@eworm.de>,
 Daniel Kahn Gillmor <dkg@fifthhorseman.net>,
 Christophe Fergeau <cfergeau@gmail.com>, zx2c4@gentoo.org
Content-Type: text/plain; charset=UTF-8
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi folks,

Thanks for the super helpful responses.

For versioning of tags, I'll go with "experimental/0.0.$(date
+%Y%d%m)". You can then do whatever you'd like with regard to version
numbers, so long as it contains the 0.0.YYYYMMDD somewhere. I've
already tagged the first one for testing:

https://git.zx2c4.com/WireGuard/snapshot/experimental/0.0.20160630.tar.xz

Zorun -- to answer your question: cgit turns snapshots into tarballs
automatically. (It also evidently imposes that directory scheme on the
tarball; Christian -- we'll discuss this oddness on the cgit list.)

I'll be signing the git tags with the public key on wireguard.io.

It seems like we've converged on the split packages wireguard-tools
and wireguard-dkms/kmod-wireguard. Sounds good to me.

I'll get a Gentoo ebuild cooking with the new snapshot. Looking
forward to seeing the other packages!

Yay!

Jason
