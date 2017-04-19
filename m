Return-Path: crasm@wireguard.1.email.vczf.io
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0ae8b3d
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Apr 2017 15:59:04 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5f54e82
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Apr 2017 15:59:04 +0000 (UTC)
Message-Id: <1492618019.116821.949489032.63283A29@webmail.messagingengine.com>
From: crasm@wireguard.1.email.vczf.io
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
In-Reply-To: <CAHmME9oX6x2NKTqqTNZVKz2y2h0cSVkYeXUqL0MTSB8Tc1-T3A@mail.gmail.com>
Date: Wed, 19 Apr 2017 12:06:59 -0400
References: <1492479545.1458773.947454608.1D3BD4D5@webmail.messagingengine.com>
 <CAHmME9oX6x2NKTqqTNZVKz2y2h0cSVkYeXUqL0MTSB8Tc1-T3A@mail.gmail.com>
Subject: Re: Java userspace test (contrib/external-tests/java)
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I did replace it, but I'm still having the same problem.

https://github.com/crasm/noise-java/blob/wireguard-contrib-external-tests/src/main/java/com/southernstorm/noise/crypto/Blake2sMessageDigest.java
https://github.com/crasm/WireGuard/blob/master/contrib/external-tests/java/src/main/java/wireguard/Main.java

If anyone can help, it would be appreciated, but I'll continue debugging
on my own as well.

On Mon, Apr 17, 2017, at 09:54 PM, Jason A. Donenfeld wrote:
> From your code:
> 
> Blake2sMessageDigest blake2s = new Blake2sMessageDigest(preshared);
> blake2s.update(theirPublic);
> blake2s.update(buf.array(), 0, buf.position());
> // Note: Blake2s returns 32 bytes, but we only use the first 16.
> buf.put(blake2s.digest(), 0, 16);
> 
> The final length needs to be passed to Blake2sMessageDigest in the
> constructor, because Blake2 encodes the final length into the initial
> block. The implementation from here might work better:
> https://github.com/Geal/android-wireguard/blob/master/app/src/main/java/com/southernstorm/noise/crypto/Blake2sMessageDigest.java
