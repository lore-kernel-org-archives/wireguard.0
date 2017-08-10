Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e2bc7cc
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 19:24:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 608bc961
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 19:24:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a018a6f
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 19:43:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c42be25a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 19:43:08 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id c74so13269126iod.4
 for <wireguard@lists.zx2c4.com>; Thu, 10 Aug 2017 12:46:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABQfmN3EFBL-w3KwLJQMa3HB7_FTrFEFXyQyeJqDtM4yg4DW4Q@mail.gmail.com>
References: <CADqnr01+qq8K+083_LRJeq424BHB_F+R-nxoGdrWAPCuS1r=gA@mail.gmail.com>
 <CAHmME9pMAMC4DY6PXTB_y64O6O2O6JVQY8ks=c=co+gDFYMHqA@mail.gmail.com>
 <CADqnr00euKzi7R44JSTktKCbooodU5Y1sko6wP9b8bpf4SLFbg@mail.gmail.com>
 <CAHmME9q8hNh8tfqruwyYfb0G0qZgdHN53p2NVzpG8QZcx++z8Q@mail.gmail.com>
 <CABQfmN1fviFhgp1bw82_A9RnZrokch+PmwLZCUMZm=F_doxc5g@mail.gmail.com>
 <CABQfmN3EFBL-w3KwLJQMa3HB7_FTrFEFXyQyeJqDtM4yg4DW4Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 Aug 2017 21:46:10 +0200
Message-ID: <CAHmME9qNUzNqPQK-csdRou3Ndy5rqsugdMQ132_uADNOhmMeuw@mail.gmail.com>
Subject: Re: FR: interface ListenAddress (Aka:Multihomed server issue)
To: Jan De Landtsheer <jan.delandtsheer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jan De Landtsheer <jan@delandtsheer.eu>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jan,

Thanks for the drawing. So the issue is that you want packets to exit
through eth1 using the addresses of eth0. I believe applying this
patch should enable that: http://ix.io/z3d Can you apply that and let
me know if it works?

I'm curious: do TCP connections generally work correctly with your
configuration?

Jason
