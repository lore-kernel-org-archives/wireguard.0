Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e42d837
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:06:46 +0000 (UTC)
Received: from mx.sealand.io (mx.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a6302e0
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:06:46 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: Structure(d) output of wg?
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CAHmME9pePj0thgb_NDVr_iN9rcvdwQMz=4_zRtP_57g=QO4_ow@mail.gmail.com>
Date: Wed, 14 Dec 2016 22:16:32 +0100
Message-Id: <AE381473-7783-4828-9297-874E831F3244@danrl.com>
References: <AD79A695-30E3-425D-9D7F-51AE2A25384D@danrl.com>
 <CAHmME9pePj0thgb_NDVr_iN9rcvdwQMz=4_zRtP_57g=QO4_ow@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

that would mean multiple calls to `wg` to get the desired structure =
filled, one for each [CATEGORY]. I can live with that, but was looking =
for a more efficient solution.

Cheers,

Dan

Nice bandwidth, though :)
=20
> On 14 Dec 2016, at 22:09, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Hi Dan,
>=20
> This already exists. While `wg show wg0` gives some hipster colorized
> output, `wg show wg0 [CATEGORY]` gives very structured output meant
> for parsing with bash or grep or sed or cut or whatever you want. For
> example:
>=20
> [zx2c4@demo ~]$ sudo wg show wg0 bandwidth | tail
> l8gKhi5rvJChhDWHl+C7Ubj8hSHfW0HbkOOA9GQPL3Y=3D    13272   43056
> CpX3sUNoLSofE6V6X+uHnFqF5+g/fXwJeY6ploPbgV0=3D    9425    5785
> NkUUqbqhh+VV2IZYdAuVIdjpx0UopRRgO7hZju7+DW0=3D    145     89
> S3/UokM7yvoKCYOvGdyi0IiiqvrUWXsIX8FTSFl0i2E=3D    46101   152415
> FPqY/W8Z6LTgZLu69CqF1WtIPwUoG52pNNno4BRDtR0=3D    145     89
> ULFNzzUznzXzMrjRvWUlz9dQsIzEAtIG7o3s9oHRJHk=3D    145     89
> qbTrp7yhdqrvLnMg9kZNxNTd7FQRvV6jMr18G63zDhA=3D    13299   28787
> p0rDK1UEx7siGp061hekJFYkjTs3qY08TBaTfSk86TM=3D    5075    3434
> NZSZ7/JTraQ6eOseLIMQBo38cfQL8SXarfO/g99xYUI=3D    0       0
> pX7cS/weolOD5GKHhrNqtqKT4nZto50ZXczacQ5iklM=3D    95210   58850
>=20
> (Quit hoggin my bandwidth, yall ;-) )
>=20
> Jason
