Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc645d1c
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Dec 2017 01:19:32 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fca1bf99
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Dec 2017 01:19:32 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: curve25519_generate.js [was: Re: [ANNOUNCE] WireGuard Snapshot
 `0.0.20171211` Available]
In-Reply-To: <CAHmME9pCK7XCF-RVVOUJaSYK5SiXHsGFj4XceLveZ1Ocqxu7PQ@mail.gmail.com>
References: <b95c15baca1d3929@frisell.zx2c4.com>
 <874loxxe02.fsf@fifthhorseman.net>
 <CAHmME9r8qyXY-h3fw=JBee_mwD3Xe9frUCOTrf05eumrkN+d=g@mail.gmail.com>
 <87h8sxvtsk.fsf@fifthhorseman.net>
 <CAHmME9pCK7XCF-RVVOUJaSYK5SiXHsGFj4XceLveZ1Ocqxu7PQ@mail.gmail.com>
Date: Mon, 11 Dec 2017 19:43:45 -0500
Message-ID: <87bmj4wzb2.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue 2017-12-12 01:18:49 +0100, Jason A. Donenfeld wrote:
> Alright, here's a stab at it:
>
> +<script src="curve25519_generate.js" onError='document.write("<h3>Did you forget to run \"make\" to compile curve25519_generate.js?</h3><!--");'></script>

That looks fine to me.

     --dkg
