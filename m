Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6A3C04E69
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Aug 2023 01:53:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5757703f;
	Fri, 11 Aug 2023 01:53:51 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 50091bb7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Aug 2023 01:53:49 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bc3bec2c95so18839015ad.0
 for <wireguard@lists.zx2c4.com>; Thu, 10 Aug 2023 18:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691718827; x=1692323627;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2CBZOp8AJW5tp0MFGWEX840VIyuEwh+LMR4mvYGWS48=;
 b=ZzqVyDtK4opxYhN3m378N4YyZnYgShl8XALI1sxQMJH5qYV+I4xiHqPnaOM+Z0lsJl
 FrUEZXRrktGdxICLrUkio6nxiIoa2hnS2JfdvAuwd+3unfCMLz+PR+XYIDYEBLgExTpY
 7NEpIBVCS3KBB2H3DJkwkjjtWerGHck05A54xP+/ux7uI98cstD/n6u8pECRPiia9Wtx
 eFcEevWWJrfpQnVHQOIKhnzlDAkZiZw8qlSghpxDfEjBe1TEOlskXfaR54XX8OOvjmm2
 gpeIEBhx6dUIXGENctTPZLGCXkCecvpNca1PQPdPybANg+RRu+KK3wmUeAOdDj+bK51m
 GQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691718827; x=1692323627;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2CBZOp8AJW5tp0MFGWEX840VIyuEwh+LMR4mvYGWS48=;
 b=X/MoUCNG99DVJDn9Hw3qtdXjuOC2hN8cmnMTw19hVuBFl6LVzqeUkp7TVxJNiRGcqD
 Rc+4y5OD7/LhiSaWuE6QAOtDWlrc4nWQf78WlqAPYpeRcgEN3djyQdF5yyO2dGlvjLrZ
 MLJVTTCygvmUVruS9qBaWhdzo56yANJYRobAFyKG2gFDHhpJw+5X4mVVRpg4NbgkrVLc
 4MYgUpKEGHWD4wOiG4rhz4R1c0zoh+4ai5gLXW1IctIEu3G/UJLqN2A36wFpN3xA4Z7u
 zj7zRmysIT3lbQ/+cbSvsz9gDW8XbR68Yi34mWU2ivveaCVfDJrmPlw39QfsmAQneuV9
 da6A==
X-Gm-Message-State: AOJu0YxQz5UBo1rZgEvQ4QtQSVq8dVjAsyt3rdSU1prAOgC1HMSS90jD
 eBARYw8U/Y+8kLJZdMIPuMc=
X-Google-Smtp-Source: AGHT+IFlsV6Ui5S+zmoEkmZEh4c0y6Jtw43LHcjupEbO3DgE/kCGEzt0vu0MJdKkzwIA2OOkIz2W2w==
X-Received: by 2002:a17:902:ecce:b0:1af:e302:123 with SMTP id
 a14-20020a170902ecce00b001afe3020123mr753068plh.3.1691718827060; 
 Thu, 10 Aug 2023 18:53:47 -0700 (PDT)
Received: from Laptop-X1 ([43.228.180.230]) by smtp.gmail.com with ESMTPSA id
 1-20020a170902ee4100b001bb8be10a84sm2470704plo.304.2023.08.10.18.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 18:53:46 -0700 (PDT)
Date: Fri, 11 Aug 2023 09:53:43 +0800
From: Hangbin Liu <liuhangbin@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: What's the wireguard-tools
Message-ID: <ZNWUp/cFn3pCkEwJ@Laptop-X1>
References: <ZNRex9yqvEekpU/h@Laptop-X1>
 <ZNTAIUY6L20ltgiP@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNTAIUY6L20ltgiP@zx2c4.com>
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

On Thu, Aug 10, 2023 at 12:46:57PM +0200, Jason A. Donenfeld wrote:
> Hi Hangbin,
> 
> On Thu, Aug 10, 2023 at 11:51:35AM +0800, Hangbin Liu wrote:
> > Hi Jason,
> > 
> > I'm maintaining the RHEL wireguard-tools rpm. Recently, There is a request to
> > convert the license tag in the spec file to SPDX format[1]. The current License
> > tag in wireguard-tools spec file is GPLv2, which is the same with the COPYING
> > in upstream. But when I searched the src files, I found there are kinds of
> > license identifier. e.g. GPL-2.0, LGPL-2.1+, MIT, GPL-2.0 OR MIT, etc.
> > 
> > Do you know which one I should use at the end? Should we unify the src files?
> 
> The license is GPL-2.0.

Thanks for the confirmation.

Hangbin
