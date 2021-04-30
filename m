Return-Path: <SRS0=papb=J3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D7BC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Apr 2021 13:48:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61E8661462
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Apr 2021 13:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61E8661462
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c07a3eb6;
	Fri, 30 Apr 2021 13:45:17 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 22cd90da
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Apr 2021 13:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1619790311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Znmz+3MEkFw/wOVA+WNIFD0bV1vil3kvrBhqCPViaRc=;
 b=nRfeE7tNfQNJmtnu0mL+Wr3r03ENCwkk9Wmaid+24WVm0IUwG6QSYgwKgzkgTyVB9OwIfq
 IOmLO6QB9/TZqkHWQ9nelD46X88980/UuQdR0YLkRcNVlXtr285THybrB4cf4CHj1zJCpR
 OR+BRn/bse4TYuWr0bddfVaIHhHuaeY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d64df06d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Apr 2021 13:45:11 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id b131so7673160ybg.5
 for <wireguard@lists.zx2c4.com>; Fri, 30 Apr 2021 06:45:11 -0700 (PDT)
X-Gm-Message-State: AOAM530sku1KYr1ys7NxrVZdzfc6WVf/L4scDrvGg6bXFDvssepx6DCW
 c0bdNZzOmFswearkse4P550qzHBktBzCe63ODjA=
X-Google-Smtp-Source: ABdhPJzphPLARfsWpSniWZP1a7OBOaS0Kr+r/VdFoQXUW29R9g9KgRPIuxmJeR8cla5OORPIbUaQlB3fpIqtk0+bHJw=
X-Received: by 2002:a25:be09:: with SMTP id h9mr7055110ybk.239.1619790311252; 
 Fri, 30 Apr 2021 06:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <eaf535ec1f0c48649e1a24878e0c18e1@limelogic.be>
In-Reply-To: <eaf535ec1f0c48649e1a24878e0c18e1@limelogic.be>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 30 Apr 2021 15:45:00 +0200
X-Gmail-Original-Message-ID: <CAHmME9riCYnd-bUe1-+HWuEcUqPQHOKfQen_ONrbO-uUsV_20Q@mail.gmail.com>
Message-ID: <CAHmME9riCYnd-bUe1-+HWuEcUqPQHOKfQen_ONrbO-uUsV_20Q@mail.gmail.com>
Subject: Re: Wireguard for windows: routes are added even if remote server not
 reachable
To: Jean.Cardona@limelogic.be
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

You can adjust the route metric using `PostUp`, if you need:
https://git.zx2c4.com/wireguard-windows/about/docs/adminregistry.md

But having WireGuard automatically _shutoff_ due to unreachability
sounds like something with DoS security implications, so we're
unlikely to add that to the client. However you might be able to
trigger various rules to enable or disable WireGuard using other OS
facilities. https://git.zx2c4.com/wireguard-windows/about/docs/enterprise.md
may help.

Jason
