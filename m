Return-Path: zx2c4@gentoo.org
Received: from smtp.gentoo.org (smtp.gentoo.org [140.211.166.183])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21401884
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2016 02:38:58 +0000 (UTC)
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
 [209.85.215.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: zx2c4)
 by smtp.gentoo.org (Postfix) with ESMTPSA id F2A03340F0B
 for <wireguard@lists.zx2c4.com>; Fri,  1 Jul 2016 02:41:50 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id l188so68078512lfe.2
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2016 19:41:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pvaUDq0FO9O=Qj9C=MCYs63D-Rco6pM8Xgp1NssEGh4A@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9roK0U62hwXq2rHOtGEkoxKx92Xg9Ay2HOnKuL4CtoQgA@mail.gmail.com>
 <20160630212727.6c1c9f16@leda.localdomain>
 <CAHmME9pvaUDq0FO9O=Qj9C=MCYs63D-Rco6pM8Xgp1NssEGh4A@mail.gmail.com>
From: "Jason A. Donenfeld" <zx2c4@gentoo.org>
Date: Fri, 1 Jul 2016 04:41:46 +0200
Message-ID: <CAHmME9pU8JuX=F=ume=h9xg2HC6VXutFkkmf3VGya2k8BHZJyw@mail.gmail.com>
To: Christian Hesse <mail@eworm.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 zorun@bitsofnetworks.org
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Investigating the / in the tag name a bit more, it seems git has all
sorts of problems with that. I'll get to addressing those in their
respective projects in due time, but for WireGuard, the experimental
snapshots will have a simpler naming scheme. Here's the new URL:

https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20160630.tar.xz

Sorry for the churn. This should now be solid.
