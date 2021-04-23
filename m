Return-Path: <SRS0=RWyD=JU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88504C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 Apr 2021 20:33:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85762613B1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 Apr 2021 20:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85762613B1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ddd6b7a;
	Fri, 23 Apr 2021 20:32:16 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b4873be9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Apr 2021 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1619209932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bvQ1G6zPe8dW+p+9YUkJ9E3lwk9FTmuGaqXs1Ah8/Zs=;
 b=K/lglIDP4TJinbzI7haJ+9VbaW5hTo301FN8waQ0E/TLuytbc9UuneDGADpaXalm6XuE8C
 L9Dodk6qJazyzKGqJIYZZm9lfLWOul9fv0ocV0cSQngqPupe5+jzyamTJml+BlhPyPgHmI
 hZrsuFuKWAzAknZsoRw06ejcfk/vg+c=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2ec1fb13
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Apr 2021 20:32:11 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id p202so13424132ybg.8
 for <wireguard@lists.zx2c4.com>; Fri, 23 Apr 2021 13:32:11 -0700 (PDT)
X-Gm-Message-State: AOAM533KDL97aGUjMjvcP8Eraw86lT1K9kfTw2GtKl0uR4g3T8a/PMUT
 N9oSa3lSQdGk3Jm2UBx3M9bhaLtAZyb3RAWJdSc=
X-Google-Smtp-Source: ABdhPJzSv9dUD34vQcdRtjCwH+5fUcw7je9Ysa/oBQjpkCdDsy9zwwRDtSkrjAbz/ZOUV9b4PTJ5gpy5OTRe+WGOAhg=
X-Received: by 2002:a25:330a:: with SMTP id z10mr8055377ybz.123.1619209931217; 
 Fri, 23 Apr 2021 13:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210423171938.583964-1-cascardo@canonical.com>
In-Reply-To: <20210423171938.583964-1-cascardo@canonical.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 23 Apr 2021 14:32:00 -0600
X-Gmail-Original-Message-ID: <CAHmME9q3Uk0RYEeMcs+39OU17rLtX7e=5HwWJjwEjhK_+tcLBQ@mail.gmail.com>
Message-ID: <CAHmME9q3Uk0RYEeMcs+39OU17rLtX7e=5HwWJjwEjhK_+tcLBQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] wireguard-linux-compat: fix build on Ubuntu 18.04
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
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

Hi Cascardo,

Thanks for the patch. I appreciate you fixing this. Hopefully next
time there's not a several month period of CI being broken and me
having to bug apw about it. :)

Jason
