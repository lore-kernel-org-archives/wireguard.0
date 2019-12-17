Return-Path: <SRS0=T0jl=2H=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C99C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Dec 2019 13:17:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7468520716
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Dec 2019 13:17:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="M+pxLjOv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7468520716
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 036450f6;
	Tue, 17 Dec 2019 13:17:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f44b1771
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Dec 2019 13:17:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55f99b22
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Dec 2019 13:17:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d66cbe5f
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Dec 2019 12:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=IqKDvsLun3QEs9/zrctPJ8zZcsM=; b=M+pxLj
 OvbYkuJOqKmNKsrX8hfDdLUgvmplt0U+UQcM/lEMUWWma+RgklutZn6yhbHcsPqs
 hDRGzTM6SuL5NTq0J6SK1tCAK4+LIcp8L5+RlcISc03Ct9BP0UPZWHNCaNK4kJE+
 /ss30LUPEKKc8/5/KTFOyB78Ew+AUdDxOOpDrF8refLQBHO/2iNunCcxnnLfoVYJ
 Bk5T7yttRyu1KtBGLRn5/3UK6OU6m8ICKd1vLtvuN5UUuLQrmKwCS0uCmRPmWYyg
 3IfkCfLRQXGRJShlWXean39auMU9YsBUQkHOmRvL2udEcahwe6U47e8ZIw1kntVV
 ZRMIRWBz+H0usJ4g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6b3fd2ab
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Dec 2019 12:20:59 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id j22so5295895oij.9
 for <wireguard@lists.zx2c4.com>; Tue, 17 Dec 2019 05:17:25 -0800 (PST)
X-Gm-Message-State: APjAAAXimZTAqTiELsdiuQ4jVXCsL+92C8pgcqXiWsV+qMQoZlC1Xn0y
 obojp4khANxYwGzRKrRR9C6eV+P5qFW3fMIL4hM=
X-Google-Smtp-Source: APXvYqwfsGsJoeAzGFStjWfxxbhub8fchBQPAszBqa1s/aQVTWpP9UV8m4t8bD4W12tcNot73u1BWZ2CXQTeAgi8Vu8=
X-Received: by 2002:aca:5143:: with SMTP id f64mr1404468oib.66.1576588644771; 
 Tue, 17 Dec 2019 05:17:24 -0800 (PST)
MIME-Version: 1.0
References: <c984c11f-fd80-7468-698d-bc5ed8b8fdb8@53c70r.de>
In-Reply-To: <c984c11f-fd80-7468-698d-bc5ed8b8fdb8@53c70r.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 17 Dec 2019 14:17:13 +0100
X-Gmail-Original-Message-ID: <CAHmME9r4idCjAoO0_JtPgvvQOKjZ6HP+RmbmVu2mmrxK9kXgXg@mail.gmail.com>
Message-ID: <CAHmME9r4idCjAoO0_JtPgvvQOKjZ6HP+RmbmVu2mmrxK9kXgXg@mail.gmail.com>
Subject: Re: WG interface does not come up after Fedora Upgrade
To: Silvan Nagl <mail@53c70r.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Fixed here: https://git.zx2c4.com/WireGuard/commit/?id=036226fbea484e9836307902159d7e43326f822c

Thanks for your (offlist) help tracking this down.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
