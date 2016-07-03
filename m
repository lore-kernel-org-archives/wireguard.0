Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 359ed808
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 19:22:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60ad750b
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 19:22:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c2cafca7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jul 2016 19:22:09 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id f6so105624854lfg.0
 for <wireguard@lists.zx2c4.com>; Sun, 03 Jul 2016 12:25:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8737nrzx74.fsf@alice.fifthhorseman.net>
References: <8737nrzx74.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 3 Jul 2016 21:25:19 +0200
Message-ID: <CAHmME9omxD7gZY1TKkkd6XakvommZLxMNFsX8NS56=9n+Uz_wg@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] continuous integration/testing across multiple
	kernels
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

As unit tests are a development building block, insecure hacks like
client.sh should not be used. You could easily repurpose client.sh to
invoke openssl-s_client or some similarly disgusting TLS hack, I
guess. In any case, though, it's not even needed. Check out what I did
with contrib/external-tests and src/debug.mk. There are just hard
coded public/private keys in there, which are more than sufficient for
unit testing. If you'd like, you can experiment with using those same
public/private keys and test.wireguard.io (NOT demo.wireguard.io), for
constructing an automated testing framework.

However, perhaps a better and more robust way of doing this would be
to use network namespaces. See src/netns.sh for an example of how this
works. This way there can be several wireguard instances and different
networking configurations all within the same machine, enabling
offline reliable unit tests.
