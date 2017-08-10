Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1f61d5c
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 15:29:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f466536c
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 15:29:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5cf412ec
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 15:48:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id be549aa9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 15:48:46 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id j32so11204310iod.0
 for <wireguard@lists.zx2c4.com>; Thu, 10 Aug 2017 08:51:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADqnr01+qq8K+083_LRJeq424BHB_F+R-nxoGdrWAPCuS1r=gA@mail.gmail.com>
References: <CADqnr01+qq8K+083_LRJeq424BHB_F+R-nxoGdrWAPCuS1r=gA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 Aug 2017 17:51:47 +0200
Message-ID: <CAHmME9pMAMC4DY6PXTB_y64O6O2O6JVQY8ks=c=co+gDFYMHqA@mail.gmail.com>
Subject: Re: FR: interface ListenAddress (Aka:Multihomed server issue)
To: Jan De Landtsheer <jan@delandtsheer.eu>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Jan,

> When wireguard clients connect, their config shows their peer
> to be the Uplink IP address instead of the IP on the Public
> interface that was specifically assigned for wireguard (wgsrv)

Do you mean to say that the _endpoint_ IP address of the WireGuard
peer is an IP associated with Uplink instead of with Public? If this
is the case, it might be some odd DNAT situation causing this to
happen for you? The peer's endpoint IP address is simply the src IP of
the most recently authenticated packet from the peer. It sounds like
there's something odd in place causing the src IP to be wrong? But I
can't think of how this would be WireGuard related. Unless I've
misunderstood something?

Jason
