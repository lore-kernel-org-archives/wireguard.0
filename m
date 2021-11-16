Return-Path: <SRS0=+SnU=QD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6175C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Nov 2021 17:15:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E58D361B31
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Nov 2021 17:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E58D361B31
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c23b8d32;
	Tue, 16 Nov 2021 17:15:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4f42d0e2
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Nov 2021 17:15:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9998263217
 for <wireguard@lists.zx2c4.com>; Tue, 16 Nov 2021 17:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="nYbc0F4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1637082900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FhkR/4XRFbAT2hUmNTGXNAfjpe9yg2oVnUtwjCx6b0I=;
 b=nYbc0F4aWJJlL4IEvepVThlIhBoNz2fhh7hyvKfFdCT47D5knQJY2UHdORbpszdaUdsb6k
 s8p58C1AxdO4eStOoPy11fuXqk9TDVnW16RhfH5vaCJj0T6ld9+czWifhBQ86ZEgIAveep
 OZI1wbq3mp+SJVyOYKo63pOFnu/0tPo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dbfcee7a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Nov 2021 17:15:00 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id v64so59550927ybi.5
 for <wireguard@lists.zx2c4.com>; Tue, 16 Nov 2021 09:14:59 -0800 (PST)
X-Gm-Message-State: AOAM531hfDFSWkBk6yOuDp2/wMBbP2eBXyxo+kTtG3lLnPiW/TnOZmoq
 ck2Owa2XwsbVm0/WhSaXOrgHOqtsy44lO6FFO1A=
X-Google-Smtp-Source: ABdhPJxUwzTRCE0Ov8fkgmeLyLCCZFlCnM9DT0ZMlPB0E6Bn2XS5JcnjKE3nXLBTTIKlbUtiyoZBqNSXPXOzKBWb41c=
X-Received: by 2002:a25:a2cd:: with SMTP id c13mr9893049ybn.95.1637082899134; 
 Tue, 16 Nov 2021 09:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20211116165222.3236464-1-peter.georg@physik.uni-regensburg.de>
In-Reply-To: <20211116165222.3236464-1-peter.georg@physik.uni-regensburg.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 16 Nov 2021 18:14:47 +0100
X-Gmail-Original-Message-ID: <CAHmME9py4aEC_jJSZs1uQb=9xsS+1C85rMjGAYvGG3A8cTmp0g@mail.gmail.com>
Message-ID: <CAHmME9py4aEC_jJSZs1uQb=9xsS+1C85rMjGAYvGG3A8cTmp0g@mail.gmail.com>
Subject: Re: [PATCH compat] Update for RHEL 8.5
To: Peter Georg <peter.georg@physik.uni-regensburg.de>
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

Applied! Thank you.

https://git.zx2c4.com/wireguard-linux-compat/commit/?id=77256108c0edcaee78dc16352e7339fb13ddeb05
