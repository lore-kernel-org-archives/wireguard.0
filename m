Return-Path: tcondeixa@veniamworks.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 207de700
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 11:59:11 +0000 (UTC)
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
 [209.85.128.179])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ed955b7
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 11:59:11 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id 77so143750010wrb.1
 for <wireguard@lists.zx2c4.com>; Mon, 26 Jun 2017 05:15:34 -0700 (PDT)
Return-Path: <tcondeixa@veniamworks.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Wireguard multihomed roaming performance
From: Tiago Condeixa <tcondeixa@veniamworks.com>
In-Reply-To: <CAHmME9oPp0EAmkbjHHgsuMVQ5-MhswysW+MvFdpb0qRRW0qMcg@mail.gmail.com>
Date: Mon, 26 Jun 2017 13:15:30 +0100
Message-Id: <46BBE473-046E-4247-841F-340C1A848DCA@veniamworks.com>
References: <EE8741B3-9787-4522-98B9-D484C4BE7A8E@veniamworks.com>
 <CAHmME9rwLqT6Ph_LxYMQLaZw-=f-LTxf7ScnqJ6jbDD+BqN87w@mail.gmail.com>
 <48D760AA-BFB5-4A3E-B8C8-81E49A65BC5A@veniamworks.com>
 <CAHmME9pzg__jT1zaG+ThTsOCgo=DaXC-iV-yJp1O4didhPLubA@mail.gmail.com>
 <CAHmME9p807nxgrJ9sM6TSuZnna6dL8e4x8o+TWkjG+50w+T0mA@mail.gmail.com>
 <CAHmME9oPp0EAmkbjHHgsuMVQ5-MhswysW+MvFdpb0qRRW0qMcg@mail.gmail.com>
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

Hi Jason,

I already tried the new version from master and it=E2=80=99s working =
perfect with roaming right now, great job.

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
