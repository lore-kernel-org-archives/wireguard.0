Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE022C7EE2E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 May 2023 16:54:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47ee0ee0;
	Tue, 23 May 2023 16:48:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cc5ec052
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 May 2023 16:47:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D48C6348B
 for <wireguard@lists.zx2c4.com>; Tue, 23 May 2023 16:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FBE4C4339E
 for <wireguard@lists.zx2c4.com>; Tue, 23 May 2023 16:47:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bKXyBMM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1684860475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRnFnF2rQ2+ju+Gq8ha9DasxaZ50kRA51/t/mC1MNRc=;
 b=bKXyBMM6Ynf4xlS+DcAXug1HT+aBCBtX0QAkIw/7Gdct1dutOKcDHuFQj8qND+XuLuyPQY
 fhm6OzU6U0um1SvmV3yXaZDwoAh1+zHHY6C+lWFnHP2gVdzpJWdHiXUHXVJHsXS8z+NQEm
 B/S6saEzTlSwpfaLgf83xBuB1hMrWOE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a37f8754
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 May 2023 16:47:55 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-4572fa2a92fso1153400e0c.2
 for <wireguard@lists.zx2c4.com>; Tue, 23 May 2023 09:47:54 -0700 (PDT)
X-Gm-Message-State: AC+VfDzQv5nwWgmer8IhTdioAW8lcmGagX6fM94pAGRfuRXwtAx+Ts92
 34obXnlglXY4EhKiXBx17G5to3R1PYxGY6QlHK8=
X-Google-Smtp-Source: ACHHUZ7pSg6rKoXYHLBucwCvcc2dnGFD3Vb69NZfzEXA8Y6n1t4H/1zQ7ymb48vBWNR0yG99WjJFpgNhwCtRWu2e3iA=
X-Received: by 2002:a67:e34f:0:b0:430:229e:9386 with SMTP id
 s15-20020a67e34f000000b00430229e9386mr4404544vsm.6.1684860473351; Tue, 23 May
 2023 09:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000c0b11d05fa917fe3@google.com>
 <ZGzfzEs-vJcZAySI@zx2c4.com>
 <20230523090512.19ca60b6@kernel.org> <ZGzmWtd7itw6oFsI@zx2c4.com>
 <20230523094606.6f4f8f4f@kernel.org>
In-Reply-To: <20230523094606.6f4f8f4f@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 23 May 2023 18:47:41 +0200
X-Gmail-Original-Message-ID: <CAHmME9pEu2cvrSQd+Rg8Cp=KDfKEfjeiPPgF-WecXLHyRZVjcw@mail.gmail.com>
Message-ID: <CAHmME9pEu2cvrSQd+Rg8Cp=KDfKEfjeiPPgF-WecXLHyRZVjcw@mail.gmail.com>
Subject: Re: [syzbot] [wireguard?] KASAN: slab-use-after-free Write in
 enqueue_timer
To: Jakub Kicinski <kuba@kernel.org>
Cc: edumazet@google.com, 
 syzbot <syzbot+c2775460db0e1c70018e@syzkaller.appspotmail.com>, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, davem@davemloft.net, 
 linux-kernel@vger.kernel.org, pabeni@redhat.com, wireguard@lists.zx2c4.com, 
 jann@thejh.net
Content-Type: text/plain; charset="UTF-8"
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

On Tue, May 23, 2023 at 6:46=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 23 May 2023 18:14:18 +0200 Jason A. Donenfeld wrote:
> > So, IOW, not a wireguard bug, right?
>
> What's slightly concerning is that there aren't any other timers
> leading to
>
>   KASAN: slab-use-after-free Write in enqueue_timer
>
> :( If WG was just an innocent bystander there should be, right?

Well, WG does mod this timer for every single packet in its RX path.
So that's bound to turn things up I suppose.
