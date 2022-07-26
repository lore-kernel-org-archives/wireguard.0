Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58ADEC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Jul 2022 13:06:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c571f7d6;
	Tue, 26 Jul 2022 13:06:27 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e2eef113
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jul 2022 13:06:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9CF6BB8162B
 for <wireguard@lists.zx2c4.com>; Tue, 26 Jul 2022 13:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D57C341C0
 for <wireguard@lists.zx2c4.com>; Tue, 26 Jul 2022 13:06:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="eaDqqnQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658840781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6VDSyYBTm8e/A4njVgolgd/tpxY8z107rsOjb6Yozu8=;
 b=eaDqqnQM0f32PSvYMe/rNVFIjn2r6MRAugemHy3wHfIf+c8oXtPX6blgWPxDfPsWBNhbSz
 LeacXVfzThXQVynB439FepY/nS3x19i4PmMXHyDO+rsz39LVgWMXIAbFsNj3d79b1pXb95
 8QI7KRsPN6cTVrGAFGMZTP8BfRFIwyA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a7167b3a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jul 2022 13:06:21 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-31f443e276fso23664847b3.1
 for <wireguard@lists.zx2c4.com>; Tue, 26 Jul 2022 06:06:21 -0700 (PDT)
X-Gm-Message-State: AJIora/wg258pQ+jyqPPH0UTpxM/VhuYpcFPtxSeYe6BG1xzim4vh7+6
 M+KPCEF5EF51h8EAclKPJNgsr8IXzbYzA6gblpg=
X-Google-Smtp-Source: AGRyM1uEw8B5KufJv5EFdrQLtTqR1WusMhc5HzHbfQxBHMUpbPem1siotpHU/Qv/o6DV+E947ypxXXoLQpK5KFB+Y3I=
X-Received: by 2002:a0d:d597:0:b0:31f:5858:9050 with SMTP id
 x145-20020a0dd597000000b0031f58589050mr244502ywd.341.1658840780279; Tue, 26
 Jul 2022 06:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220726130058.21833-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220726130058.21833-1-lukas.bulwahn@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 26 Jul 2022 15:06:09 +0200
X-Gmail-Original-Message-ID: <CAHmME9ogBc_uX_TutV7ZC=nmhhZEtKLA3ezyx4VFwotietNytQ@mail.gmail.com>
Message-ID: <CAHmME9ogBc_uX_TutV7ZC=nmhhZEtKLA3ezyx4VFwotietNytQ@mail.gmail.com>
Subject: Re: [PATCH] wireguard: selftests: update config fragments
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Netdev <netdev@vger.kernel.org>, linux-kselftest@vger.kernel.org, 
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
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

Hi Lukas,

Thanks for researching this! I'll apply this to my wireguard tree and
send it up to netdev during my next push.

https://git.zx2c4.com/wireguard-linux/commit/?id=6da997932c4d4cb41c4a35d5541d0e4e1154fdb7

Jason
