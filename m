Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F04C7EE26
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 May 2023 17:19:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7f8788b;
	Tue, 23 May 2023 17:16:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8e697082
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 May 2023 17:16:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 058A861AB2;
 Tue, 23 May 2023 17:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFA9C433D2;
 Tue, 23 May 2023 17:16:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="looCTqoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1684862183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFJsOQSB9/S2uFWepKjivi/bXH52kAWTnSyImng+RbA=;
 b=looCTqoHUH8IwlqRFT2RLLuymENVAFpFMDKuKRob0jaZv/KuJ4X2rY145Qw0VMLyV+FUMg
 Wl7DZwJoR3KV8t31OjBtOTz4JXPduUqzq1gRX+FpX2HpKLSRkLOdr2Jwa2DgBZ94BTCoIb
 2xf1z8W9ENJE0liw6gW4oY6TmX/XSys=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c151c9eb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 23 May 2023 17:16:23 +0000 (UTC)
Date: Tue, 23 May 2023 19:16:20 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: edumazet@google.com,
 syzbot <syzbot+c2775460db0e1c70018e@syzkaller.appspotmail.com>,
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 davem@davemloft.net, linux-kernel@vger.kernel.org,
 pabeni@redhat.com, wireguard@lists.zx2c4.com, jann@thejh.net
Subject: Re: [syzbot] [wireguard?] KASAN: slab-use-after-free Write in
 enqueue_timer
Message-ID: <ZGz05BI29KBb2fdz@zx2c4.com>
References: <000000000000c0b11d05fa917fe3@google.com>
 <ZGzfzEs-vJcZAySI@zx2c4.com> <20230523090512.19ca60b6@kernel.org>
 <ZGzmWtd7itw6oFsI@zx2c4.com> <20230523094606.6f4f8f4f@kernel.org>
 <CAHmME9pEu2cvrSQd+Rg8Cp=KDfKEfjeiPPgF-WecXLHyRZVjcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9pEu2cvrSQd+Rg8Cp=KDfKEfjeiPPgF-WecXLHyRZVjcw@mail.gmail.com>
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

On Tue, May 23, 2023 at 06:47:41PM +0200, Jason A. Donenfeld wrote:
> On Tue, May 23, 2023 at 6:46 PM Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > On Tue, 23 May 2023 18:14:18 +0200 Jason A. Donenfeld wrote:
> > > So, IOW, not a wireguard bug, right?
> >
> > What's slightly concerning is that there aren't any other timers
> > leading to
> >
> >   KASAN: slab-use-after-free Write in enqueue_timer
> >
> > :( If WG was just an innocent bystander there should be, right?
> 
> Well, WG does mod this timer for every single packet in its RX path.
> So that's bound to turn things up I suppose.

Here's one that is seemingly the same -- enqueuing a timer to a freed
base -- with the allocation and free being the same netdev core
function, but the UaF trigger for it is a JBD2 transaction thing:
https://syzkaller.appspot.com/text?tag=CrashReport&x=17dd2446280000
No WG at all in it, but there's still the mysterious 5376 value...

Jason
