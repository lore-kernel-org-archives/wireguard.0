Return-Path: tcondeixa@veniamworks.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c301b6fe
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 20:27:57 +0000 (UTC)
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
 [209.85.128.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2377c1f
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 20:27:57 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id 77so80458072wrb.1
 for <wireguard@lists.zx2c4.com>; Fri, 23 Jun 2017 13:43:59 -0700 (PDT)
Return-Path: <tcondeixa@veniamworks.com>
References: <EE8741B3-9787-4522-98B9-D484C4BE7A8E@veniamworks.com>
 <CAHmME9rwLqT6Ph_LxYMQLaZw-=f-LTxf7ScnqJ6jbDD+BqN87w@mail.gmail.com>
 <48D760AA-BFB5-4A3E-B8C8-81E49A65BC5A@veniamworks.com>
 <CAHmME9pzg__jT1zaG+ThTsOCgo=DaXC-iV-yJp1O4didhPLubA@mail.gmail.com>
 <CAHmME9p807nxgrJ9sM6TSuZnna6dL8e4x8o+TWkjG+50w+T0mA@mail.gmail.com>
 <CAHmME9oPp0EAmkbjHHgsuMVQ5-MhswysW+MvFdpb0qRRW0qMcg@mail.gmail.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <CAHmME9oPp0EAmkbjHHgsuMVQ5-MhswysW+MvFdpb0qRRW0qMcg@mail.gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Message-Id: <E327ED96-3EA1-4B4D-9C61-85C53A407823@veniamworks.com>
From: Tiago Condeixa <tcondeixa@veniamworks.com>
Subject: Re: Wireguard multihomed roaming performance
Date: Fri, 23 Jun 2017 21:43:55 +0100
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

Thank you Jason. I will try it on Monday and I will come to you with the res=
ults.

Regards,
Tiago

> On 23 Jun 2017, at 20:42, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Hi Tiago,
>=20
> Okay, I've fixed it, and the fix is in the git master branch.
>=20
> I've made a small video demonstrating the fix:
> https://data.zx2c4.com/fixed-route-change-wireguard.gif
>=20
> Can you try things out and let me know how it works?
>=20
> Thanks,
> Jason
