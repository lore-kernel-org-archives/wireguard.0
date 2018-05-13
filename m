Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c10cde57
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 12:34:18 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [IPv6:2001:470:dc45:1000::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38e4fc99
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 12:34:18 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Matthias Urlichs <matthias@urlichs.de>, wireguard@lists.zx2c4.com
Subject: Re: Need for HW-clock independent timestamps
In-Reply-To: <c468bc7b-c1bf-b8db-1168-0ee7eef2f385@urlichs.de>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <c468bc7b-c1bf-b8db-1168-0ee7eef2f385@urlichs.de>
Date: Sun, 13 May 2018 14:37:23 +0200
Message-ID: <87k1s7wx30.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Matthias Urlichs <matthias@urlichs.de> writes:

> Can anybody think of problems with this solution?

Well, the possibility of DOS if you set the counter too high, and the
possibility of replay attacks if you fail to save the last state when
you shut down comes to mind :)

(Not saying it's not possible to create a workable solution, just that
it's not trivial and requires careful thought to not break the security
assumptions of the protocol).

-Toke
