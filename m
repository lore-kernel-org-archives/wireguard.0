Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1CFC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 29 Mar 2022 16:30:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5b4fb204;
	Tue, 29 Mar 2022 16:30:13 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 681e50dd
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Mar 2022 16:30:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DA73CB818CF
 for <wireguard@lists.zx2c4.com>; Tue, 29 Mar 2022 16:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490E4C34111
 for <wireguard@lists.zx2c4.com>; Tue, 29 Mar 2022 16:30:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="LluaCtVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1648571407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gWpDt/rwNM/nig7k6lt+szP4lNhhSqQ0Y3OUIZSEPzM=;
 b=LluaCtVN26lstEHPHhDvzm408FZEe/4mLDt08eIz1J1NR7wtqR/Dfur4+J3Iwe20oNT4eP
 7VZuh8hwb45mISaO6Yg+09dG9R9gvyqkEB+Au+u0FYJwkLfjihE43ADtiViJ9FbsnRvlp7
 kZVo/SCzGRVIOvYhSSKlwXnzRnyC5vE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7f05d0ca
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Mar 2022 16:30:07 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so189005317b3.11
 for <wireguard@lists.zx2c4.com>; Tue, 29 Mar 2022 09:30:07 -0700 (PDT)
X-Gm-Message-State: AOAM5315kJcVKg/Wo4yaEXfGpPtxERGIyOGmOoErrT00kU/hQn99kDKh
 VnQY3TakdC93/iza7vnXkwQNlHgpwk47/LgPumA=
X-Google-Smtp-Source: ABdhPJx19sXr2RsIii2GkQbjQnPceSjSSWkgV89Y13xyhfMg4Uq23lWzaHw/ZQPb9dPHhvxRKHs0O6YsjXedp4I+Fis=
X-Received: by 2002:a0d:d508:0:b0:2e5:d9ec:d668 with SMTP id
 x8-20020a0dd508000000b002e5d9ecd668mr32980539ywd.499.1648571406134; Tue, 29
 Mar 2022 09:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220329121552.661647-1-wanghai38@huawei.com>
In-Reply-To: <20220329121552.661647-1-wanghai38@huawei.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 29 Mar 2022 12:29:55 -0400
X-Gmail-Original-Message-ID: <CAHmME9rpRTLN7tHOsdVTJZfKLVsr_ZBTkWsheLKNjX5-3-rwkg@mail.gmail.com>
Message-ID: <CAHmME9rpRTLN7tHOsdVTJZfKLVsr_ZBTkWsheLKNjX5-3-rwkg@mail.gmail.com>
Subject: Re: [PATCH net] wireguard: socket: fix memory leak in send6()
To: wanghai38@huawei.com
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
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

Applied, thanks for the patch.
