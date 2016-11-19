Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c9b8c03
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Nov 2016 01:10:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29f19f46
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Nov 2016 01:10:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 05f4ce44
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Nov 2016 01:10:55 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id f82so68715759wmf.1
 for <wireguard@lists.zx2c4.com>; Fri, 18 Nov 2016 17:14:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKXLc7fAG5xErC_vU40qOwxKxWbLAavKmomNwjOiRP=Fh+0tGg@mail.gmail.com>
References: <CAKXLc7fAG5xErC_vU40qOwxKxWbLAavKmomNwjOiRP=Fh+0tGg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 19 Nov 2016 02:14:00 +0100
Message-ID: <CAHmME9rfB709DCnqiXG2L7kMwCx0bgiSXi2C2LwYR=bX-trNzw@mail.gmail.com>
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] What is a good way to ingrate (as of now) wireguard
 into openrc in Gentoo?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Kalin,

Funny enough, I can't remember the exact interworkings of that script,
because I didn't write it. A guy named zhasha in #wireguard did. I'll
ask him to document it; that could be useful. I know another gentoo
dev was working on a WireGuard gentoo page for the wiki.

I think, in short, the way it works is you add this to your /etc/conf.d/net:

wireguard_wg0="/path/to/file.conf"

or,

wireguard_wg0="private-key /path/to/whatever listen-port 1234 peer
ABCDEF= endpoint 1.2.3.4:2468"

In other words, if the argument is a file path, it is passed to
setconf, and otherwise they're passed to set. You can then use the
other ordinary netifrc values for setting the IP addresses.

A somewhat reasonable place to store config files would be in
/etc/wireguard, and make sure that directory is chmod'd to 700, since
it contains private keys.

Jason
