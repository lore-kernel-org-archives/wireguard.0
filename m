Return-Path: <SRS0=2990=I5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970A0C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 31 Mar 2021 19:15:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A59E361002
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 31 Mar 2021 19:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A59E361002
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e677a53c;
	Wed, 31 Mar 2021 19:11:52 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1dc2ed45
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 Mar 2021 19:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1617217907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ceHgLRWAY+vEUQfF9H+ySt7FvjKup+/KLwlzMl+8oqg=;
 b=k9Fxyg1d7aQYVd95R5nZ7NmFp9YCA9AVlKO3qUWtoUjbXrmBUBwDhfGbI60cqZ1t6L8Kv4
 nLN7AMDbMPsYN7ekkxmp+9XLKgHVZC2AmkYseXWoU5JaD04U8QtCdN+D96QTI3jIASgN1d
 S52LS0+4+F+s/bzl9a3tgtoaFM255a4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 864e09d1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 Mar 2021 19:11:47 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id x189so22304154ybg.5
 for <wireguard@lists.zx2c4.com>; Wed, 31 Mar 2021 12:11:47 -0700 (PDT)
X-Gm-Message-State: AOAM532AtvFzdTDzhG4/mkHZWYzXgw6urOdHLvsWPdT6IuSDCXGEezEf
 DcPp8LPRCmy/NMBEVSTLxUypvFb6ZhYCWePGsSE=
X-Google-Smtp-Source: ABdhPJzVOswnGaw59NToPoXneJ2av+alLCsYCac3Q1px2RYrxFeRcC/OcOWNpWmkLmBnFRxyiYZZRJnve983MTvaQFA=
X-Received: by 2002:a25:e807:: with SMTP id k7mr6776485ybd.456.1617217906728; 
 Wed, 31 Mar 2021 12:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <6aa0fd33-4c0d-557f-f7f5-5f5406b3a273@harz.behrens.de>
 <CAHmME9q6dO1X+Gt3hY4kQxsQ4DqeaJGxoT8qkaAe-0s_WCrVrA@mail.gmail.com>
 <ee43587f-8e17-add1-6b28-174639d126f8@harz.behrens.de>
 <CAHmME9qaMcd0R1zvFy+ZyW4a1vmX1bE_Rxf4WFgau4UTdEi7hQ@mail.gmail.com>
 <CAHmME9r13tPji0Guw3_Q8k4grh046RkSccPLbEVAasKQ=BNkVw@mail.gmail.com>
 <89952f1f-5296-7f87-9345-0f5c087ee3ae@harz.behrens.de>
 <a5cdf813-3cf6-b5e6-d497-78980c681958@harz.behrens.de>
In-Reply-To: <a5cdf813-3cf6-b5e6-d497-78980c681958@harz.behrens.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 31 Mar 2021 13:11:36 -0600
X-Gmail-Original-Message-ID: <CAHmME9rCzvFGv3=ZwurVMnax0RzKQr2mTCAgqT9EY8MEbJ24Ng@mail.gmail.com>
Message-ID: <CAHmME9rCzvFGv3=ZwurVMnax0RzKQr2mTCAgqT9EY8MEbJ24Ng@mail.gmail.com>
Subject: Re: [PATCH] freebsd: Implement selection of FIB (routing table) for
 tunneled packets
To: Frank Behrens <frank@harz.behrens.de>
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

Hi Frank,

Thanks for the patch. Does the line `so4->so_fibnum = so6->so_fibnum =
sc->sc_socket.so_fibnum;` also need to be changed too in initiation,
or is that one fine?

Jason
