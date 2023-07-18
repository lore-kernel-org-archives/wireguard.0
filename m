Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E911C001DC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jul 2023 17:58:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0aea572;
	Tue, 18 Jul 2023 17:58:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 609aa9b8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jul 2023 17:58:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5F9346150B
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jul 2023 17:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9200DC433CC
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jul 2023 17:57:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ex5UTj9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1689703076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z3DDMndpyGQ9Js5DGZvxnMtOBjS6KRA0SgH3Yn0/Ifk=;
 b=ex5UTj9wimDvzl6iBEvbtxWLBtLWz2cCL31LdbPMwtzbrm8Nj7oVrCWerFyS96RUUpBFvs
 NliCRmksdWtfl4tj7XnXOIEjRj0300HSSv3rEYvIdPBs5WvCC1M4evlgcDzwQeERm1EVdO
 ydVoP2y8Rc3KagLr6wpOTRjJh6p4Ov4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 41015c98
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jul 2023 17:57:55 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-51e619bcbf9so8324022a12.3
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jul 2023 10:57:55 -0700 (PDT)
X-Gm-Message-State: ABy/qLZiQ5vknAW+LXtChE9woLvgHQRSKldQlZd+EgfDne4MMgYnzSSv
 ZbTavq9f0pW80/i5F1beltVQb+QVUXMZNV0jh34=
X-Google-Smtp-Source: APBJJlEbE+jfEDYuzLdPmOtu5UXWbBGlbEEOaC0BX+lIg944+HdN56uIq7onSwd1wZz7Xep4OTrRvB60bolSKxN+89w=
X-Received: by 2002:aa7:c704:0:b0:51e:e67:df4d with SMTP id
 i4-20020aa7c704000000b0051e0e67df4dmr326904edq.38.1689703072538; Tue, 18 Jul
 2023 10:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002bfa570600c477b3@google.com>
In-Reply-To: <0000000000002bfa570600c477b3@google.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 18 Jul 2023 19:57:22 +0200
X-Gmail-Original-Message-ID: <CAHmME9reBny-ufJp58uOg+KdMptircBRhLFd-N2KwxNUp6myTA@mail.gmail.com>
Message-ID: <CAHmME9reBny-ufJp58uOg+KdMptircBRhLFd-N2KwxNUp6myTA@mail.gmail.com>
Subject: Re: [syzbot] [wireguard?] [jfs?] KASAN: slab-use-after-free Read in
 wg_noise_keypair_get
To: syzbot <syzbot+96eb4e0d727f0ae998a6@syzkaller.appspotmail.com>
Cc: broonie@kernel.org, davem@davemloft.net, edumazet@google.com, 
 jfs-discussion@lists.sourceforge.net, kuba@kernel.org, 
 kuninori.morimoto.gx@renesas.com, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
 povik+lin@cutebit.org, shaggy@kernel.org, syzkaller-bugs@googlegroups.com, 
 wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

Freed in:

 diUnmount+0xf3/0x100 fs/jfs/jfs_imap.c:195
 jfs_umount+0x186/0x3a0 fs/jfs/jfs_umount.c:63
 jfs_put_super+0x8a/0x190 fs/jfs/super.c:194

So maybe not a wg issue?
