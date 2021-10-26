Return-Path: <SRS0=ix1r=PO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01EFC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Oct 2021 09:29:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C59560240
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Oct 2021 09:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C59560240
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7d78f25;
	Tue, 26 Oct 2021 09:29:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6aa4a903
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Oct 2021 09:29:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07E5260F90
 for <wireguard@lists.zx2c4.com>; Tue, 26 Oct 2021 09:29:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GtIn37Xj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1635240580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rSg6Q8m9/CeYGDOIazqVpsd3QkWLGr83dh5uNp8L5ng=;
 b=GtIn37Xj4lXUGs8K62ZhGN45EJ3JfY4Cv/JEQx9/TIbYUHHTFw/lYp4BkyRn3Lk4fTSxcQ
 m1qJHw7SiTHOM8FXewcD5V6O2Y1wEkNn4RN+t0GVSUTAZgqZzN6vQ1KeyKvh0X7yddKbWL
 LUNIhDcgVHhDvuj5R4KRZt3XRXi+hxI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ec08ae7d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Oct 2021 09:29:40 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id i65so32496119ybb.2
 for <wireguard@lists.zx2c4.com>; Tue, 26 Oct 2021 02:29:40 -0700 (PDT)
X-Gm-Message-State: AOAM530Cq/X1su+3Bnx8DCI3j0i92YckyAIKqM57RJrzl4VOg+yoNDHM
 gcLhxq235GcUs9ySyXkPl6DlQabjI1/psllk+u8=
X-Google-Smtp-Source: ABdhPJw48cUidqpUBM15yed89rm6Nwo/SP+dyT/mx0bP3d5wZFsd7iUi0OHISJQDOlHWwP3rxJiuEPt4rU7hCZKD6bU=
X-Received: by 2002:a25:948:: with SMTP id u8mr22324369ybm.472.1635240579627; 
 Tue, 26 Oct 2021 02:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <CABOEyuLiu96_KxEH5sdGLaE5-s9e8F_c0a1PKHSnFcMKp5YHow@mail.gmail.com>
In-Reply-To: <CABOEyuLiu96_KxEH5sdGLaE5-s9e8F_c0a1PKHSnFcMKp5YHow@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 26 Oct 2021 11:29:28 +0200
X-Gmail-Original-Message-ID: <CAHmME9oPi=LvdcZC-FA+SvyxEmcRULtNB8hAQZoCAX=kQycTXA@mail.gmail.com>
Message-ID: <CAHmME9oPi=LvdcZC-FA+SvyxEmcRULtNB8hAQZoCAX=kQycTXA@mail.gmail.com>
Subject: Re: wireguard-freebsd handshaking issue upon underlying WAN
To: Ryan Roosa <ryanroosa@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Kyle Evans <kevans@freebsd.org>
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

Hi Ryan,

Thanks for the report. Kyle saw your reddit post earlier and tracked
this down, I think/hope, to a bug in the state machine cranking. I
committed the fix here -- https://w-g.pw/l/yQTw -- which will be part
of the next snapshot. Hopefully that will fix the issue, but if it
doesn't, please do update this thread so we can keep searching.

Regards,
Jason
