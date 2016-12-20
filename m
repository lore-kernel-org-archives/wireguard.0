Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7581c4d3
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:36:13 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8de4e9ab
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:36:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebb134b2
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:36:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9e02af92
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:36:12 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id v84so186435442oie.3
 for <wireguard@lists.zx2c4.com>; Tue, 20 Dec 2016 10:43:17 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 20 Dec 2016 19:43:15 +0100
Message-ID: <CAHmME9oOJozBq-+UbYiZzF9uBpjMQ=saNPOeXnb2mPYNiKs0iw@mail.gmail.com>
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

On Tue, Dec 20, 2016 at 7:40 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@tok=
e.dk> wrote:
> Right, but that means that even if multicast is added, a routing
> protocol won't be terribly useful, since it can't tell wireguard which
> subnets lives behind which peers. What I would need is to be able to
> assign /32s (or IPv6 lladdrs) to the interface for each peer, and have
> the kernel routing table determine which subnets should go to each of
> those. My hope was that wireguard could then figure out where to send
> the packet from the /32s (which would be in the wireguard config,
> presumably).

Ahh, I see. In this case, the routing protocol needs to update
WireGuard, not the kernel's routing table. This forces you to
re-envision your routing protocol in terms of "which public key should
get which routes?" which strikes me as an authenticity improvement.
