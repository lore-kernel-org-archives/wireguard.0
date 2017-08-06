Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc3c66cb
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 16:13:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32a4b9e7
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 16:13:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 183f3750
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 16:32:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a1fc87d9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Aug 2017 16:32:20 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id c74so18973601iod.4
 for <wireguard@lists.zx2c4.com>; Sun, 06 Aug 2017 09:34:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA8CD9tHsB5tPkeUsuVA1V3SM7bQdFKjWV6c+NM6hh_o1N5HHg@mail.gmail.com>
References: <CAA8CD9t8YCR__Ee2F3Sb5H=78O9PTi5j+K1iXHsU7PS4pTKAwA@mail.gmail.com>
 <CAA8CD9sAT8PW8B1HSqR9utNvjmFB6Tn4U0bESBGO7QWVSVqX3w@mail.gmail.com>
 <CAA8CD9tHsB5tPkeUsuVA1V3SM7bQdFKjWV6c+NM6hh_o1N5HHg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 6 Aug 2017 18:34:51 +0200
Message-ID: <CAHmME9r6wpShD12r+RYGC84EZVYRXAFgaoMAWjGAz0uktKWuGw@mail.gmail.com>
Subject: Re: RTNETLINK answers: Operation not supported
To: Sahil Gupta <sg5414@rit.edu>
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

pi@raspberrypi:~ $ ip link add dev wg0 type wireguard
RTNETLINK answers: Operation not permitted

This needs to be run as root, using sudo.

sudo  ip link add dev wg0 type wireguard

After this, it should work. I believe you worked out the prior issues
already by installing the headers package and bc and whatnot.

Please stop sending duplicate emails to the mailing list. Collect your
thoughts in single coherent messages, and email the list directly
rather than individual members. The barrage of the last 48 hours --
when many of us are not available since it's the weekend -- has been a
bit annoying.
