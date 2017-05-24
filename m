Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d3d0753
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2017 01:56:17 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bf5ecfc
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2017 01:56:17 +0000 (UTC)
Date: Wed, 24 May 2017 04:08:25 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: What has changed in the configuration file?
Message-ID: <20170524040825.2087168f@msi.defcon1>
In-Reply-To: <CAHmME9rQoSrRsVWzOMWbc4FMrHG1+jWj4VM7C7tQQE9c9P0ooA@mail.gmail.com>
References: <20170524034606.54078c3c@msi.defcon1>
 <CAHmME9rQoSrRsVWzOMWbc4FMrHG1+jWj4VM7C7tQQE9c9P0ooA@mail.gmail.com>
MIME-Version: 1.0
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

On Wed, 24 May 2017 03:56:46 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> wg-quick(8) is a wrapper around wg(8) that adds a few more
> configuration keys, such as "Address=3D", "PostUp=3D", and so forth. Thus,
> you should only use these augmented config files with wg-quick(8):
>=20
> wg-quick up path/to/configuration.conf

Oh, my bad, I thought they used the same file syntax.

But now, there's another PB (after deleting wg0, of course):

# wg-quick up vpnserver0
[#] ip link add vpnserver0 type wireguard
[#] wg setconf vpnserver0 /dev/fd/63
Line unrecognized: `PresharedKey=3D=E2=80=A6'
Configuration parsing error
[#] ip link delete dev vpnserver0
