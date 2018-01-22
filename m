Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cad184f7
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jan 2018 16:03:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83ec2ae1
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jan 2018 16:03:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa552236
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jan 2018 15:54:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 503081f8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jan 2018 15:54:49 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id p36so7899520otd.10
 for <wireguard@lists.zx2c4.com>; Mon, 22 Jan 2018 08:07:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qY1rVUxsdkD+M91pZJNcncG+PrG-9ypK0YPvfb4k4_JA@mail.gmail.com>
References: <1516632145.2241.49.camel@inventati.org>
 <CAHmME9rEFgWHewhf8mC=7ec=NRdhqAJQtuG1ggby-Bzfd8zaaw@mail.gmail.com>
 <CAHmME9qY1rVUxsdkD+M91pZJNcncG+PrG-9ypK0YPvfb4k4_JA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 22 Jan 2018 17:07:38 +0100
Message-ID: <CAHmME9o5N9P3aDV-Y+fm=qMqijMZQBryoP7XpkEEbwMbQJHmGA@mail.gmail.com>
Subject: Re: Trouble building WireGuard since December releases
To: Kevin <anaknaga@inventati.org>
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

Ahh, small update. When building this, I noticed:

Makefile:944: "Cannot use CONFIG_STACK_VALIDATION=y, please install
libelf-dev, libelf-devel or elfutils-libelf-devel"

After installing libelf-devel, the exact problem you reported
appeared. I then tried this hack:

$ sudo ln -s /bin/true /lib/modules/$(uname -r)/build/tools/objtool/objtool

And after, the build worked again. It therefore appears that Solus is
not distributing objtool with their kernel headers, when they should
be.

I opened a bug for your issue, but as I've never used Solus until
today, I won't be following up on it. So, please direct your
distribution to the bug at: https://dev.solus-project.com/T5607 and
see what you can do about helping to get this fixed.

Regards,
Jason
