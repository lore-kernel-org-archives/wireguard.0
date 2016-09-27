Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef4fbe00
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Sep 2016 01:38:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4cbb493
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Sep 2016 01:38:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 170a374d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Sep 2016 01:38:27 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id b71so143843288lfg.0
 for <wireguard@lists.zx2c4.com>; Mon, 26 Sep 2016 18:48:45 -0700 (PDT)
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
Date: Tue, 27 Sep 2016 03:48:43 +0200
Message-ID: <CAHmME9qo9FOWAAiRWJrcZ1LqP_BAdJ5MR-EREyoT3+d_Uv8vRw@mail.gmail.com>
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

I've begun trying to integrate your excellent work into WireGuard in
the branch rvh/mips:
https://git.zx2c4.com/WireGuard/commit/?h=3Drvd/mips

It seems like there's still a bit of cleaning up and polishing to do,
but it's headed in a great direction. There's a lot of weird
formatting and general inconstancy to clean up. I'll do a review of
the crypto as we get rolling here.

To make things easier, I gave you commit access to the rvh/mips branch
in the repo. Feel free to do with this what you like, and when we're
ready, I'll merge it to master.

$ git clone ssh://git@git.zx2c4.com/WireGuard
$ cd WireGuard
$ git checkout -b rvh/mips origin/rvh/mips
$ edit code...
$ git commit...
$ git push

That general flow should work for you, using your Github SSH key. Let
me know if there are any issues, and feel free to poke me on irc
(zx2c4 on freenode -- #wireguard).

Talk soon,
Jason
