Return-Path: mail@danrl.com
Received: from mx.sealand.io (mx.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c79d6b1a
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:49:29 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CAHmME9qTLVPVrCnrusb3W32EtGYvLuKyyiGz+TWrXTxneVSrCA@mail.gmail.com>
Date: Wed, 16 Nov 2016 15:54:49 +0100
Message-Id: <7FCCB728-BB7E-4A4F-ABAC-7D16FA6A1382@danrl.com>
References: <A7E34EE0-F8F0-4F88-AA94-58434D0DF2BA@danrl.com>
 <CAHmME9r0tdR8=nnC4yPLJoOE8yU_7iJi0qEpx9POyM3OBZ3otQ@mail.gmail.com>
 <44DAF4D4-00A8-4903-8003-EB0215635B61@danrl.com>
 <CAHmME9qTLVPVrCnrusb3W32EtGYvLuKyyiGz+TWrXTxneVSrCA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Demo Server: Dual stack?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Thanks Jason!

No hurry, though.

Is the script open source as well? Maybe I can tinker with it, so you =
don't waste your precious development time on supporting infrastructure.

> On 16 Nov 2016, at 15:49, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Hey Dan,
>=20
> On Wed, Nov 16, 2016 at 3:38 PM, Dan L=C3=BCdtke <mail@danrl.com> =
wrote:
>> Hi Jason,
>>=20
>>> I guess I could provide IPv6 connectivity, but.... why? It's a demo.
>>=20
>> Because it is a demo of a brand new protocol, showing how it can be =
used with legacy versions payload and transport protocol. I find that =
odd, but as I understand we have contradicting point of views on IP =
protocols.
>=20
> I see what you mean. That's a fair point. We might as well give people
> an opportunity for trying things out, indeed.
>=20
> Currently the scripts on the server don't support that, so I'll have
> to write a small bit of code, but it shouldn't be too bad. I'll circle
> back in a few weeks.
>=20
> Jason
