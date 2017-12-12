Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f25d1014
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Dec 2017 00:11:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54d3a6ed
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Dec 2017 00:11:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8cfde5b6
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Dec 2017 00:11:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f13329e7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Dec 2017 00:11:16 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id r63so12872844oia.6
 for <wireguard@lists.zx2c4.com>; Mon, 11 Dec 2017 16:18:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87h8sxvtsk.fsf@fifthhorseman.net>
References: <b95c15baca1d3929@frisell.zx2c4.com>
 <874loxxe02.fsf@fifthhorseman.net>
 <CAHmME9r8qyXY-h3fw=JBee_mwD3Xe9frUCOTrf05eumrkN+d=g@mail.gmail.com>
 <87h8sxvtsk.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 12 Dec 2017 01:18:49 +0100
Message-ID: <CAHmME9pCK7XCF-RVVOUJaSYK5SiXHsGFj4XceLveZ1Ocqxu7PQ@mail.gmail.com>
Subject: Re: curve25519_generate.js [was: Re: [ANNOUNCE] WireGuard Snapshot
 `0.0.20171211` Available]
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

Alright, here's a stab at it:


+<script src="curve25519_generate.js" onError='document.write("<h3>Did
you forget to run \"make\" to compile
curve25519_generate.js?</h3><!--");'></script>
