Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82212b8a
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Sep 2016 20:29:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21a58882
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Sep 2016 20:29:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2f979e0b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Sep 2016 20:29:30 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id y6so25283101lff.1
 for <wireguard@lists.zx2c4.com>; Tue, 20 Sep 2016 13:39:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160914071654.Horde.VPt42kADErUJCGSNzTb-Lfl@www.vdorst.com>
References: <20160808132309.Horde.PpRcvoBjgmDh9S0lYDhy7Au@www.vdorst.com>
 <CAHmME9o+QqPR0qo8uadYVZDMw=Z-uxCwuBgggOeYNdE8FDLXpQ@mail.gmail.com>
 <20160908115753.Horde.dla9pNo2jSEeBF-QW8dWlO-@www.vdorst.com>
 <20160909134611.Horde.d1CtbRQrioV8yr-kI71aUI3@www.vdorst.com>
 <20160909135202.GA32666@lud.imag.fr>
 <20160909152208.Horde.qMOsffs1bVcJx-AfO91qa9q@www.vdorst.com>
 <20160909194927.Horde.e1JlaJl_SL7blOrpizk9Uba@www.vdorst.com>
 <20160914071654.Horde.VPt42kADErUJCGSNzTb-Lfl@www.vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 20 Sep 2016 22:39:01 +0200
Message-ID: <CAHmME9r3OSaTD_u4P8rcDo9gxOEK7E=qc8hnj=VoTWYUyov2-Q@mail.gmail.com>
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] News about MIPS and ARM optimized code?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Ren=C3=A9,

That's excellent. Thanks for writing that. I'll review this implementation.

Is your speed up compared to your unaligned optimization from the
other patch? Or is that against vanilla?

With only a 1% increase, I'm first interested to see where precisely
that improvement is coming from, and if we could squeeze that out of
gcc instead, so that they're producing more or less the same code.

Regards,
Jason
