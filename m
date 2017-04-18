Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eccbb242
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Apr 2017 01:47:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f57b9618
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Apr 2017 01:47:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f2477b3
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Apr 2017 01:47:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 80faeedf
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Apr 2017 01:47:01 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id b187so161493650oif.0
 for <wireguard@lists.zx2c4.com>; Mon, 17 Apr 2017 18:54:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1492479545.1458773.947454608.1D3BD4D5@webmail.messagingengine.com>
References: <1492479545.1458773.947454608.1D3BD4D5@webmail.messagingengine.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 18 Apr 2017 03:54:44 +0200
Message-ID: <CAHmME9oX6x2NKTqqTNZVKz2y2h0cSVkYeXUqL0MTSB8Tc1-T3A@mail.gmail.com>
Subject: Re: Java userspace test (contrib/external-tests/java)
To: crasm@wireguard.1.email.vczf.io
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

>From your code:

Blake2sMessageDigest blake2s = new Blake2sMessageDigest(preshared);
blake2s.update(theirPublic);
blake2s.update(buf.array(), 0, buf.position());
// Note: Blake2s returns 32 bytes, but we only use the first 16.
buf.put(blake2s.digest(), 0, 16);

The final length needs to be passed to Blake2sMessageDigest in the
constructor, because Blake2 encodes the final length into the initial
block. The implementation from here might work better:
https://github.com/Geal/android-wireguard/blob/master/app/src/main/java/com/southernstorm/noise/crypto/Blake2sMessageDigest.java
