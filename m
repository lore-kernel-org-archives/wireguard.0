Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43412f56
 for <wireguard@lists.zx2c4.com>; Fri, 7 Apr 2017 13:56:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51c6d306
 for <wireguard@lists.zx2c4.com>; Fri, 7 Apr 2017 13:56:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14d11ac9
 for <wireguard@lists.zx2c4.com>; Fri, 7 Apr 2017 13:56:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id caf230ef
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Apr 2017 13:56:25 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id f193so86716479oib.2
 for <wireguard@lists.zx2c4.com>; Fri, 07 Apr 2017 07:02:50 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 7 Apr 2017 16:02:49 +0200
Message-ID: <CAHmME9poZPFbYhitnK8UvDB-32hLRcTFc4vAwaUPwGEz0wY+Yg@mail.gmail.com>
Subject: [RFC] Multicast and IPv6 Link Local Addresses
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>,
 =?UTF-8?Q?Dave_T=C3=A4ht?= <dave@taht.net>, Juliusz Chroboczek <jch@irif.fr>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey list,

Various networking people have been poking and prodding about
supporting IPv6 Link Local addresses and about supporting special
multicast addresses. *I MAY VERY WELL NEVER CHOOSE TO IMPLEMENT THIS*
but in case I do, I wanted to start spec'ing out what this might look
like in order to think about it better. There are a lot of odd
concerns to take into account, so I doubt that the below will wind up
as a final solution.

For these two options below, I introduce them with corresponding
configuration nobs. Since I don't really like adding nobs, it's
entirely likely that on the small chance I do wind up implementing
this, it would be without the nobs and just always on.


== Multicast ==

# wg set wg0 multicast on

When multicast mode is turned on, packets sent to the special address
ranges 224.0.0.0/24 or fe02::/16 are sent to every peer on that
interface.


== IPv6 Link Local Addresses ==

# wg set wg0 llv6 on

This command fails and returns -ENOTUNIQ if two existing peers have
the same value of hash(pubkey). When this command succeeds:, the wg0
interface receives an automatically assigned IP address of
fe80::hash(interfacepubkey)/64. Every peer has
fe80::hash(peerpubkey)/128 implicitly added to their allowed-ips. When
adding a new peer, if hash(pubkey) is the same value of an existing
peer, the command fails and returns -ENOTUNIQ.


I'm open to thoughts and suggestions about the above ideas.

Thanks,
Jason
