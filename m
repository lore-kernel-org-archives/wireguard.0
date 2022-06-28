Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386A8C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jun 2022 18:00:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id dd27c751;
	Tue, 28 Jun 2022 18:00:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e2cd3a61
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jun 2022 17:59:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5BA79619E4
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jun 2022 17:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F185C3411D
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jun 2022 17:59:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="IYfm/8oK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656439195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dsKapWLaRAn5m7Fuu7nB6/1BBUI8oO0cnEI6xHSoXiI=;
 b=IYfm/8oK6UV41kZ51/QJzn2XkNgAweJ8uGmhR9lKrjrbElYagyvT60TjJD2OzW4pPHL0/W
 Dqedf5Qxar4Z8Z+X7NQxXDCVsuFnWhX1z4+mXlstQFp8OYp+19Z7469KZQIiNl6cV9tKnZ
 Si23pMHnaFKucb4ZZUD0Yic/QDYoxB8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8b7c2af4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jun 2022 17:59:55 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id y18so13669914iof.2
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jun 2022 10:59:55 -0700 (PDT)
X-Gm-Message-State: AJIora+P7ynJ8GveWwoQybsICOFQ7hisdhKX8VcRgB4XMU6yD5xdMdcp
 n/Mz+JrcwexfVYP+k2pOislcU83p7J+u1+s5aoM=
X-Google-Smtp-Source: AGRyM1sI71JrkRgYrAJ+r6BZSlkdDGjw3YblJDu2GFaWGMuTaNv5FsfzgeWEyRBzIsrmcX6HsjyJR8vY6RGJfXuD1Uw=
X-Received: by 2002:a05:6602:2b02:b0:65a:fea9:c715 with SMTP id
 p2-20020a0566022b0200b0065afea9c715mr10377479iov.142.1656439194970; Tue, 28
 Jun 2022 10:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <1559d27e5d07780e786f5095afae9077@mail.gmail.com>
In-Reply-To: <1559d27e5d07780e786f5095afae9077@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Jun 2022 19:59:44 +0200
X-Gmail-Original-Message-ID: <CAHmME9r0Ak-pr748Z9BHj7c3AKo8EkCDG5TYLG8DmPKXja8LRA@mail.gmail.com>
Message-ID: <CAHmME9r0Ak-pr748Z9BHj7c3AKo8EkCDG5TYLG8DmPKXja8LRA@mail.gmail.com>
Subject: Re: seems that https://www.wintun.net/ down?
To: Clint Dovholuk <clint@openziti.org>
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

Equinix Metal had a network connectivity incident and during the
resolution apparently unplugged a server. Things are back up now. They
told me the hardware I'm using is deprecated anyway, so I'll be
migrating to a more reliable machine in the next few days.

Jason
