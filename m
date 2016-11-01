Return-Path: mail@danrl.com
Received: from mx.sealand.io (mx.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bafd58b9
 for <wireguard@lists.zx2c4.com>; Tue, 1 Nov 2016 20:54:14 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CAHmME9p8bYDF9StPW8EHNXGEguK=Fomb9CE6yd9h0gZwWo=5pg@mail.gmail.com>
Date: Tue, 1 Nov 2016 21:57:12 +0100
Message-Id: <8D9A34EE-331B-4704-8558-DF83F0DCE7EE@danrl.com>
References: <25C77A0A-9EAB-4B87-AF85-D590F972F332@danrl.com>
 <CAHmME9p8bYDF9StPW8EHNXGEguK=Fomb9CE6yd9h0gZwWo=5pg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Wireguard on OpenWRT/LEDE (here: Luci)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Thanks for the fast reply!


Changes applied. See diff here:
--> =
https://github.com/danrl/luci-proto-wireguard/commit/6f90ff4ecc21f39721b3d=
a357962c0ebe0d20750

Screenshots updated.



> On 1 Nov 2016, at 21:09, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> 3. "addresses.placeholder =3D "fd00:13:37::1/64"" -- might be nice to
> give a v4 example too.

Not a big fan of legacy IP in new software. Also, Not sure how to have =
multiple placeholders. If anyone knows a clean solution: Count me in. In =
the meantime I'd prefer IP over legacy IP here.


> 9. ${iface} should be quoted -- "${iface}"

Where exactly? So I quoted all I could find. Should be fine now?!


> 11. The existing logic for adding a device is to add it if it doesn't
> exist, and otherwise to flush the addresses. Is it a good idea to
> flush the routes too? Or simply delete and re-add? Or is a simple
> flush of the addresses standard LEDE behavior? I'll defer to Baptiste
> (CC'd) on this.

Not sure either. Also, anyone knows it OpenWRT and LEDE will join after =
the c-base talks? Will commit to openwrt on github. Everyone is free to =
copy from there.

>=20
> 14.
> - allowed_ips=3D$(echo $allowed_ips | tr ' ' ',')
> + allowed_ips=3D"$(echo "$allowed_ips" | tr ' ' ',')"

I went with multiple AllowedIPs=3D lines now, introduced early October.


Thanks again for the feedback!

Dan=
