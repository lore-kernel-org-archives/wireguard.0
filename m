Return-Path: <SRS0=5l8i=AL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BC2C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 04:00:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 959EC206BE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 04:00:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDpBAaV5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 959EC206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf9c094e;
	Tue, 30 Jun 2020 03:40:34 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [2607:f8b0:4864:20::d32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id aff00fd4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Jun 2020 03:19:26 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id m81so19533622ioa.1
 for <wireguard@lists.zx2c4.com>; Mon, 29 Jun 2020 20:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yAZduYcEKm4wiOoLB6wnk1hlMRtoPsLgtKlyIvlMUUk=;
 b=NDpBAaV5Y8Ka1UoM0WgNI2K+NSaP1tG1RWeEhhHg0dFiLFP7uifzCMBubfXUDnq8JM
 Qdz7Rik33to316B5AikQ6oXzHq4T5UH+cUx44tVFqvaz9/rDiKRR78HnSgxrEIx0doRM
 MfpZ761C67mc3KPTANzjT/aC0qtYxVduY+jV78o+Y/0hYL5Oyo/ZSfweZKOPEz1uINMx
 3KARiV0AexBxEgrNi/XAhz6MTDKARusWB48PhCg3unU3YJIU2shNFQXmaIE+2fBC8z/0
 ut2b2cArErLkqy1GxVobPujY+e/ylGVdmQ/MF4FqCskXyM7H//NEczILBs/hC99Wr2PS
 LR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yAZduYcEKm4wiOoLB6wnk1hlMRtoPsLgtKlyIvlMUUk=;
 b=tzU+EKpe5Jlf2cM2hFQpqwkP+97V8uDhjON/7EBASKkufwG+bAG1EDvUwuV9Lj8Ilm
 BHjXIfN+o1cTQUmsThLm/I9oMAIJT2W/f/2ukrW9OcBmmUQ0XDvAX5mzncrpOllqtEdW
 H0IUSvmWzQT8tVwwYzJyqDr9QNsWpBwwnwOVzATv1gvczh60KvDMCPUExvN4aWAk3Uee
 iURmN/JSE9izHisHnK1cR7VSqlbbMjFW1+ABlXekDP+9WvkWp1Ujti3PgQIkU6xA9d12
 KSpjQfmdTbqG9mh0ZRfRTpQPubLbRhE82LhxBO5B8o1aI5v1VlPuQqtwXgSLXmKKOZNI
 +LXA==
X-Gm-Message-State: AOAM5339SfDOTgy536442WxyLdaO5VGIiobJCXnmgaK6iZXP4uRO49f/
 v1sgxS1fhDgu+zKugM+T6+d5w3W6IlaAfu15ZQA=
X-Google-Smtp-Source: ABdhPJwoird2/Mhtjc7mCVLFXM2zg41JBownJhSzezbP4gCwOLLCuBVV57M7yNYu0M/LCJeRJ67NIwts/Q8apK7vfNo=
X-Received: by 2002:a02:1a08:: with SMTP id 8mr20432403jai.124.1593488349849; 
 Mon, 29 Jun 2020 20:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006eb8b705a9426b8b@google.com>
In-Reply-To: <0000000000006eb8b705a9426b8b@google.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Mon, 29 Jun 2020 20:38:58 -0700
Message-ID: <CAM_iQpXix27CeSxORWz-5EHBGenSQ0PPxuGN3CjA51xonEA8+g@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in netdev_name_node_lookup_rcu
To: syzbot <syzbot+a82be85e09cd5df398fe@syzkaller.appspotmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 Linux Kernel Network Developers <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Jun 2020 05:40:31 +0200
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

#syz fix: genetlink: get rid of family->attrbuf
