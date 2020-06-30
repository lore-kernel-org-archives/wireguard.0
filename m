Return-Path: <SRS0=5l8i=AL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC1DC433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 04:00:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A774206BE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 04:00:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mk+11WlR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A774206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db7be67e;
	Tue, 30 Jun 2020 03:40:35 +0000 (UTC)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [2607:f8b0:4864:20::12b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2ba5f4ae
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Jun 2020 03:22:02 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id t27so11480277ill.9
 for <wireguard@lists.zx2c4.com>; Mon, 29 Jun 2020 20:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yAZduYcEKm4wiOoLB6wnk1hlMRtoPsLgtKlyIvlMUUk=;
 b=mk+11WlRWtv/l/pJYJZ/RawfGOevO83rro8kVUb/Vrf4DiINK6k0SvEvAv4248qtD5
 SRxsQEFnTPHAwz0Fk09NojsWcpckLNuF16X//8BY1XJohQ7u4yRFrC77VCcBvv93kYLh
 ayp85mqvIvdJxLk3gPh3/Ocd5g/uXWTsZ07deh0prw5mhvkLUdWpuUnE6cgv4arSU0jN
 1n7k1iAFvOjTfq62s5822T7/sgJrEQw5l2g8ZhWLyJC61sr8kuhEvoQyrvQCdIRPcsRn
 EBWM/hL04FBRZ5YafWesRBHrJysZhBGzbkidU4THG6T51lDf4BoXJn2FpMDCT/jsDUAG
 FVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yAZduYcEKm4wiOoLB6wnk1hlMRtoPsLgtKlyIvlMUUk=;
 b=csganMAYQfBVJAP8t7Av0FHx+czam9ZM6osWw3CS00O/fpxVThpjzw2ZlsbLb7SDUb
 UwreA4Mq1VpldswzSlX2ZgH+QFAN4RI5Pt9/ps9icO1wpQzR7toAcoT2lG6ZHCpsL+VC
 Yy+C/V1SLGWAxRZdMdMRNByMeSQQcP4jq5KskweJn5awciC+GeN70pQImj2Dexnw/nVt
 nsXma7FYzs+O2/IDYm6mCEoaWMPax2HUlFP1w/dN3q3aun42vsuLEX8tfvxegy6LDsS6
 4aQzCV8EvqTE+XFlmE5xoHQFe7blnsCZ3J6+0UP8zgxXad8ngZpQHzIQ1CHxijR0My5g
 WVBQ==
X-Gm-Message-State: AOAM531GkTyJ+OcNEJoo0rdK4CeJpisaKXp09nG43DCkYm0Yy1Ih5dSv
 n6K++5nPQZsBYuX6Uf9xhSzRb1lfP2KhabXaJsI=
X-Google-Smtp-Source: ABdhPJwMySp39OyWrYSU+/VcHayy9Ma8ihqWkE+7RcZvh1E4BBzAw0Bsx6/HIj42fFNOZQmueF/9iSDAv//sWqEenSk=
X-Received: by 2002:a05:6e02:147:: with SMTP id j7mr744349ilr.22.1593488505610; 
 Mon, 29 Jun 2020 20:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000c8af7205a9412c5b@google.com>
In-Reply-To: <000000000000c8af7205a9412c5b@google.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Mon, 29 Jun 2020 20:41:34 -0700
Message-ID: <CAM_iQpVieGdepCKheYETDyo691k=tdj0n9GaEQG=orFTnz7tMA@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in dev_get_by_name
To: syzbot <syzbot+86e957379663a156cd31@syzkaller.appspotmail.com>
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
