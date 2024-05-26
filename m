Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD77FC25B75
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 May 2024 04:00:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf762a2b;
	Sun, 26 May 2024 04:00:06 +0000 (UTC)
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 00b6cf22
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 May 2024 04:00:04 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-24cb75c126aso831748fac.3
 for <wireguard@lists.zx2c4.com>; Sat, 25 May 2024 21:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716696002; x=1717300802; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tWMzIbFaUGoHwG2z+nrttoM+JU2fnTx2gmGj6YzT2zc=;
 b=NBhBjLr/YTD9UzlIYmZF6gDUry7yBIOVNOEm4aHaVy375o1O9bsgLCjx2BsDx01a7M
 cN6WIsTjNf/oiwmTfqiBFtS7j97+APyxWexwh865HCgciSdnY4GjrqvYbG7G1i2dTYYG
 FMO26pCycInWoINHu16J1SNyngAKzx0oIVzc7dpWiHb3toWdvBSbEvYj4YJAnm1w8doz
 k6GcybtlDf59lk+w6W7ZBQerbqVvKw6cZ2Po7my1khy67PYyUOe2ERgV6IhNbk++mGre
 szSfiA99Fb+etjldNbzRvizDgAYLxl6E94ea/QBH8054BkRknumyb+xc0TBBYSAflB5d
 BBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716696002; x=1717300802;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tWMzIbFaUGoHwG2z+nrttoM+JU2fnTx2gmGj6YzT2zc=;
 b=mTEkfDiSp9sFY6zGFQx5SR6yNhpB7DHb+Oem8guJ/PQSJ6ZpumpVVQxAPT3CmPOpuW
 6J97rbH+ZcgpJYUcRXtnMjwNyQQlvIpyk+glHfRYnMdN4s/mQn+DFM74B/iff38CrDYI
 t6TBth3CJjhnC3xDc7oXXfPfGe8xMDryywiJjYhnnoOGCxWNB2RkPyTlkOMd0qf48yjW
 RiP1O8mSChszIWreD8mQmt0DgsfhWftRuOJtHrXi3NKFop3IOjIswh0L41mJD7mxFrGA
 H11Lc7Y6mxHnrt2aSCGmGC4DxMcaDKkjFkJ8v07AO643cWGYVEoVdN/zUz8THuCTdxFx
 Ai2w==
X-Gm-Message-State: AOJu0YwSiCzp+gNzG0XvohXVHykeGo8YUdVfxeDP08mBg7o4q2wLurvs
 xgpxNwGEQmHxWtP1TWB9iSIm+Ev0XFzP2rebU0dpqik1ghJ/bfwwGYdsPEua1iEs8SoCw8AeLXw
 Ta5cEe+89mOM+T+QA/goyC8bm/Xab0MnP
X-Google-Smtp-Source: AGHT+IHPtYiEOaTJqi+MXdLyzHN74G7xx1K6rV09X46P0zfiu0cdnzJQNNqGbs3GVsyK90DnOIykM7A/fbs3CYBGv0M=
X-Received: by 2002:a05:6870:3287:b0:24c:bafa:6429 with SMTP id
 586e51a60fabf-24cbafa65d3mr6172270fac.20.1716696002220; Sat, 25 May 2024
 21:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <87le4cfz0u.fsf@ungleich.ch>
 <20240514113648.neaj6kfazx4fi7af@House.clients.dxld.at>
 <87msojhbq0.fsf@ungleich.ch>
 <CAA6-MF-npREucdWneVw+DWMQi3bG+3zp98VNctErfLMuRkvY9A@mail.gmail.com>
 <87a5kjgw3j.fsf@ungleich.ch> <f292656a-52c8-4258-8b6a-45064a702a8a@keff.org>
 <874jarfd43.fsf@ungleich.ch>
In-Reply-To: <874jarfd43.fsf@ungleich.ch>
From: d tbsky <tbskyd@gmail.com>
Date: Sun, 26 May 2024 11:59:50 +0800
Message-ID: <CAC6SzHJFRNPsLNSd7_w8qQwtyfHLvZtf5SeTS-gvAcY_wAidXQ@mail.gmail.com>
Subject: Re: Wireguard address binding - how to fix?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

> Sebastian Hyrvall <sh@keff.org> writes:
> > [...]
> > Anyway. I've waited for this binding option for years. It's insane to
> > me it gets ignored.

I  remembered how exciting when I tested wireguard at 2017. until I
asked muti-home question in the list.
wiregurad is beautiful,elegant,fast but not easy to get along with.
openvpn is not so amazing but it can get the job done.
