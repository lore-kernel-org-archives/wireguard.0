Return-Path: <SRS0=3VOv=OQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530B8C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 Sep 2021 04:26:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AB1F61029
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 Sep 2021 04:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AB1F61029
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 638b9661;
	Sun, 26 Sep 2021 04:24:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 48f9c703
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Sep 2021 04:24:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F68A61090
 for <wireguard@lists.zx2c4.com>; Sun, 26 Sep 2021 04:24:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="lsSSaAKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632630272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BlHiMymBOdODLSN9bfAoQzygj/ww0nYyQJXjORkqyFg=;
 b=lsSSaAKZK2AJGq+FNY5IqMlG6YluVwW+5uV51yywgCKGKTQxcEmql30fnpm94d36s46r1s
 1BsQ9yiS8SK6odf71t1DEfd57ZKaWPE3X/OOSFZU+DYvva0HA8TETcutIT+CNdjZMrIy8a
 HGKLPahOF1Pa34a7xWE4geU2gsbwQWQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 23b45a79
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Sep 2021 04:24:32 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id b82so14613125ybg.1
 for <wireguard@lists.zx2c4.com>; Sat, 25 Sep 2021 21:24:32 -0700 (PDT)
X-Gm-Message-State: AOAM533xCFJMBe2Ti/tOHxbJtjNiuVrfVDZ2clT6a8ilY/N+xaWMD3hE
 uRNjwADaMW+2Ac0ib3AjgCcHu6aClmKLoIxY/qo=
X-Google-Smtp-Source: ABdhPJyNguTIyCdmAekjYLlnZwOftN7bXQC7bqNhM7WFjrgzQeQLGJlb0YuRcaRzK76qe0mMQv6lHXPrlFMRhJGnMaM=
X-Received: by 2002:a25:854c:: with SMTP id f12mr20304383ybn.95.1632630271324; 
 Sat, 25 Sep 2021 21:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAKFP4-gORakAyi7A+f2uMwRiE5LT5Ui7rBgZedqoBPcV6Q0M0Q@mail.gmail.com>
In-Reply-To: <CAKFP4-gORakAyi7A+f2uMwRiE5LT5Ui7rBgZedqoBPcV6Q0M0Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 25 Sep 2021 22:24:20 -0600
X-Gmail-Original-Message-ID: <CAHmME9o2+1Wrmd9y1i-YLwQpa4rHTc_1CEbbmA_f4_mKj2AYqg@mail.gmail.com>
Message-ID: <CAHmME9o2+1Wrmd9y1i-YLwQpa4rHTc_1CEbbmA_f4_mKj2AYqg@mail.gmail.com>
Subject: Re: Can't add search domain in Wireguard Android App
To: Alexis Geoffrey <alexis.geoffrey97@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Alexis,

Thanks for the reminder to actually implement this. Voila:
https://git.zx2c4.com/wireguard-android/commit/?id=3935a369b866c67705f3e27944be56b94ea2b245

Jason
