Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40dc3bcd
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:15:38 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7676ff6b
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:15:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a08b4c1
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:15:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 52f8979f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:15:37 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id v84so185861840oie.3
 for <wireguard@lists.zx2c4.com>; Tue, 20 Dec 2016 10:22:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8737hiqx9k.fsf@toke.dk>
References: <87fuli7itj.fsf@toke.dk>
 <CAHmME9o-0qccmg2zbM62fhi_KuEjtDoXZfBFPtf3yyhUKwtfiA@mail.gmail.com>
 <8737hiqx9k.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 20 Dec 2016 19:22:40 +0100
Message-ID: <CAHmME9q2NOxMFptThz8boPSg4feTX92BHSge==zzjk3xDa0BrA@mail.gmail.com>
Subject: Re: Multicast over a wireguard link?
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
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

On Tue, Dec 20, 2016 at 7:19 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@tok=
e.dk> wrote:
> Can wireguard handle routed traffic to an endpoint. I.e. if endpoint A
> has address 10.0.0.1/32 and endpoint B has a route 'ip route add
> 10.10.10.1/24 via 10.0.0.1 dev wg0', would the traffic go where it's
> supposed to?

The `via` isn't relavent, since that only functions to determine which
device to send it out of. All the ordinary routing table will do is
direct it toward wg0. Once it hits wg0, then the allowed-ips entries
are consulted to see where to send it (the "cryptokey routing table").
See sections 2 and 3 of [1].

[1] https://www.wireguard.io/papers/wireguard.pdf
