Return-Path: mail@danrl.com
Received: from mx.sealand.io (mx.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33394ea8
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 10:05:58 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CAKXLc7fFctm__qAQ8N5Vzms_MLFXJe0hf1-A6GH8QMD8B+3zSA@mail.gmail.com>
Date: Wed, 16 Nov 2016 11:11:16 +0100
Message-Id: <DC87441F-C3BF-44FB-A5A9-E2F9AABA929E@danrl.com>
References: <A124E9F5-B1CF-4904-A849-EEAAD788030C@danrl.com>
 <55998A34-BCEC-4693-ABC4-48AC108F7A64@danrl.com>
 <39B38656-DD06-43E8-BC20-BAF5BC622EBA@danrl.com>
 <20161116081527.GB14469@tuxmachine.polynome.dn42>
 <CAKXLc7cHjdUZdFfKrq8ynfo24AoD6W8otj2fNqbfnKef5Bm2=w@mail.gmail.com>
 <FE60D347-65AB-49AC-8ECC-8B5DD199DA53@danrl.com>
 <CAKXLc7fFctm__qAQ8N5Vzms_MLFXJe0hf1-A6GH8QMD8B+3zSA@mail.gmail.com>
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
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

Hi Kalin,


yes, this looks fine. Thanks for reporting.

I created an issue and submitted a fixing pull request. As soon as it is =
merged the builds should be fine again.

I will set up a new build machine that builds from scratch to avoid =
similar mistakes in the future.

Cheers,

Dan

> On 16 Nov 2016, at 10:50, Kalin KOZHUHAROV <me.kalin@gmail.com> wrote:
>=20
> And it seems to work now. I guess this looks as expected:
> =
./build_dir/target-mips_34kc_musl-1.1.15/WireGuard-experimental-0.0.201611=
10/ipkg-ar71xx/wireguard-tools/
> =E2=94=9C=E2=94=80=E2=94=80 CONTROL
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 control
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 postinst
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 prerm
> =E2=94=9C=E2=94=80=E2=94=80 lib
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 netifd
> =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 proto
> =E2=94=82           =E2=94=94=E2=94=80=E2=94=80 wireguard.sh
> =E2=94=94=E2=94=80=E2=94=80 usr
>    =E2=94=94=E2=94=80=E2=94=80 bin
>        =E2=94=94=E2=94=80=E2=94=80 wg
