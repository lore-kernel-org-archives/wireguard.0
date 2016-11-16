Return-Path: mail@danrl.com
Received: from mx.sealand.io (mx.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7caf1f3c
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 16:55:53 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CAHmME9ph6MXEkwTdSgQ5MBRAimOv512zNjipxAo+qXSbLDpscg@mail.gmail.com>
Date: Wed, 16 Nov 2016 18:01:09 +0100
Message-Id: <04D9C861-C98A-4886-94F3-74695E8FE029@danrl.com>
References: <A124E9F5-B1CF-4904-A849-EEAAD788030C@danrl.com>
 <55998A34-BCEC-4693-ABC4-48AC108F7A64@danrl.com>
 <39B38656-DD06-43E8-BC20-BAF5BC622EBA@danrl.com>
 <20161116081527.GB14469@tuxmachine.polynome.dn42>
 <E0BFF696-C9B9-45BC-98E5-E736C1AE11EF@danrl.com>
 <CAHmME9ph6MXEkwTdSgQ5MBRAimOv512zNjipxAo+qXSbLDpscg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Wireguard in OpenWRT/LEDE: FYI: Pull Request
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> On 16 Nov 2016, at 17:56, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> config wireguard_foo
>=20
> -->
>=20
> config wireguard_peer1

Unfortunately, not. All peers for iface 'foo' will be named =
wireguard_foo. UCI sections are iterable if they have the same name.

wireguard_peer1 could belong to any wg interface. We would need a =
further option to relate it to the corresponding interface. It would be =
more complicated.=
