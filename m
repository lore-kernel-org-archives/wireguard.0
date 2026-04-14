Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E0EF9D0D6
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2026 15:49:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e7d9ee49;
	Tue, 14 Apr 2026 15:44:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d5f582c3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2026 15:44:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0CC7660018;
 Tue, 14 Apr 2026 15:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A88CC19425;
 Tue, 14 Apr 2026 15:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776181447;
 bh=GOEHN8D4mrXLesq3Uxwxg1mrKL7Yav8u1R6lnIlIxfs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lG3NAFvp4uV/avU7Keluh5lA044kTwGigw0dtOcBFsT/SkWas1n5pMgD1fD3QgWZO
 T5FgsgvIdFbVWp0Yo3F+gYIuuohxZjGOqjFFKei2sD2aNLTKSk4c31G2OeSnW5PORL
 I7XuhwVrlaUQSyKMLJpYpOgwytC5MKrODYcI7uDn/PpssWe4JWbhJehzfzrSEvgyiX
 dapobBBO1yB9Y882/R+KSYYP22kgMIQZCoDy+8i2QrI9r5Gu/m+FS51PjTwlfPTgEL
 KWDxEEAmcej3DOx46/LCH6VE1sD/qtGm18rOlxnepUioDWDCLiSeYCKhX4JnWUImDu
 swVJJKmHkEFVw==
Date: Tue, 14 Apr 2026 08:44:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Shardul Bankar <shardul.b@mpiricsoftware.com>, kuniyu@google.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, janak@mpiric.us,
 kalpan.jani@mpiricsoftware.com, shardulsb08@gmail.com,
 syzbot+f2fbf7478a35a94c8b7c@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] wireguard: device: use exit_rtnl callback instead of
 manual rtnl_lock in pre_exit
Message-ID: <20260414084406.779336af@kernel.org>
In-Reply-To: <CAHmME9rwKae5b9PYzuqmwG3p05iZ=jqyp6LQefg0OsB3OP6oWg@mail.gmail.com>
References: <20260413151232.1004611-1-shardul.b@mpiricsoftware.com>
 <CAHmME9oXoXykXq_emkA3v8nG2VR28CmRP2+WmhrvGJc0ZbPfpA@mail.gmail.com>
 <20260414081824.0edf6113@kernel.org>
 <CAHmME9rwKae5b9PYzuqmwG3p05iZ=jqyp6LQefg0OsB3OP6oWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Tue, 14 Apr 2026 17:40:03 +0200 Jason A. Donenfeld wrote:
> On Tue, Apr 14, 2026 at 5:18=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> =
wrote:
> >
> > On Tue, 14 Apr 2026 15:28:37 +0200 Jason A. Donenfeld wrote: =20
> > > Thanks. Applied to the wireguard tree, and also added the missing
> > > __net_exit and __read_mostly annotations in the process. =20
> >
> > Hi Jason, while we have you - do you have a PR for us for wireguard?
> > We're going to be sending the net-next PR later today.. =20
>=20
> Sent!

Thanks!=20
(I'll apply in a couple of hours once the CI had its way with it.)
