Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB8CC001E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Jul 2023 17:56:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a484e8c;
	Wed, 19 Jul 2023 17:52:44 +0000 (UTC)
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 89aea9e3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Jul 2023 17:52:37 +0000 (UTC)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-563668b61e5so10478483eaf.3
 for <wireguard@lists.zx2c4.com>; Wed, 19 Jul 2023 10:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689789156; x=1692381156;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hiRiXJW3cvp7FSsZTUGSxXp2M76eBloK3LBfm2fpvAw=;
 b=caYCeyetU/DckqpQJcgC0OFSNi2l+fF+LqmkU0ZqKbi8aKVh01DAzeDbQtkvH9bYnN
 vU43k0rIsRyp/JhSyXLqwjiczJpNnvD97RYfJJL7G2JtUyvaybVE7mDx+1SrI3/08z2f
 9zzff2WEiOo3ydPn+GMxpOnrvj9ZHok7spWqGVBS6r+yZn+3dMIgn3QubVuR6/KYX3ul
 VwdXtSzPFjmQSEqX4J5GrGgxWjgxij+ap8N85tz0T01uXCcGwUZjbJrUXg13ueT0asQP
 ILN3avcy13ukFaEo5EVQWNVpGSHxzMkHolC7x9kdyNbK3ySV/7+f5ziQwPwQeMQz809b
 Bjvw==
X-Gm-Message-State: ABy/qLacMFnNAlEthUdzWJ0dtpCBcRI2A3FTXSKRK6ho1pQB+dLEY0/X
 i635gZ+bLDN+d2/85/y3XJIlAOBzV9JhY76xVv+7ZFwLvpA0
X-Google-Smtp-Source: APBJJlG5ugVl7dPPwQXLSskdx//wo3Cxwyt6xyJHDlFhfMqOYOoEiwYraGQnxOCt15oVej8GHXbJ8Vy/Q7WgiHAYGdyqnMHSkz9m
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f0a:b0:3a3:644a:b55 with SMTP id
 m10-20020a0568080f0a00b003a3644a0b55mr30865038oiw.4.1689789156368; Wed, 19
 Jul 2023 10:52:36 -0700 (PDT)
Date: Wed, 19 Jul 2023 10:52:36 -0700
In-Reply-To: <30f03978-3035-a28e-c097-112036901bcb@nerdbynature.de>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000069291b0600dab2d6@google.com>
Subject: Re: [syzbot] [wireguard?] [jfs?] KASAN: slab-use-after-free Read in
 wg_noise_keypair_get
From: syzbot <syzbot+96eb4e0d727f0ae998a6@syzkaller.appspotmail.com>
To: broonie@kernel.org, dave.kleikamp@oracle.com, davem@davemloft.net, 
 edumazet@google.com, jason@zx2c4.com, jfs-discussion@lists.sourceforge.net, 
 kuba@kernel.org, kuninori.morimoto.gx@renesas.com, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 lists@nerdbynature.de, netdev@vger.kernel.org, pabeni@redhat.com, 
 povik@cutebit.org, syzkaller-bugs@googlegroups.com, wireguard@lists.zx2c4.com
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

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+96eb4e0d727f0ae998a6@syzkaller.appspotmail.com

Tested on:

commit:         6e2bda2c jfs: fix invalid free of JFS_IP(ipimap)->i_im..
git tree:       https://github.com/kleikamp/linux-shaggy.git
console output: https://syzkaller.appspot.com/x/log.txt?x=172aecaaa80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f631232ee56196bd
dashboard link: https://syzkaller.appspot.com/bug?extid=96eb4e0d727f0ae998a6
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
