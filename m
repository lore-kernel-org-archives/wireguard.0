Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B31C54EE9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Sep 2022 13:51:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c8ee1ae8;
	Thu, 22 Sep 2022 13:49:15 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 30611c5a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 13:49:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5ADF1B836E9;
 Thu, 22 Sep 2022 13:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94865C433D7;
 Thu, 22 Sep 2022 13:49:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="m8irpcrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663854549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dHFKhGjf5Z+5EfUV9WDuJ/Qp2Mr1gyR89Lc3Ox+kGlY=;
 b=m8irpcrxEd0vTX/rFQYPPDT4MHzccBe3IDfK3Ebn2Jclt3jbNpPCI91ESTsr1OEEzbye4b
 GbCYcbJTljzfqmeYLQWMyerqZTqFPCUba9yx+5KRTJBZrfisrAmpEe8Zg69zDrhkW6Yy0E
 1lKe5fIWW2UKUkqDqYCTVt5Pb3cHPZc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c4de3d83
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 22 Sep 2022 13:49:08 +0000 (UTC)
Date: Thu, 22 Sep 2022 15:49:03 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Bruno <bandry@ut1.org>
Cc: wireguard@lists.zx2c4.com
Subject: Re: MacOS app update needed
Message-ID: <Yyxnz2OJjONLKrSm@zx2c4.com>
References: <CALDyVtsgMjH1YqrTrosDVU2khC9iEgMgUYDd8D65+h-K54y2fA@mail.gmail.com>
 <CABBZOs=bkOWQv09UQJnf18xVGAq_o6O+Ar+asMKoXtghcQvnog@mail.gmail.com>
 <ee65e180-eef5-b882-58ab-8a1188a38a09@ut1.org>
 <CAHmME9rd4g0EkPQqXX9vViHRuU8uaGkENNNa+TsBi3C_QNHbxw@mail.gmail.com>
 <1980318156.4949115.1663848249035.JavaMail.zimbra@donzis.com>
 <622e8ce5-82bc-c633-4cfa-ebd2a42a8fc7@ut1.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <622e8ce5-82bc-c633-4cfa-ebd2a42a8fc7@ut1.org>
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

On Thu, Sep 22, 2022 at 03:26:11PM +0200, Bruno wrote:
> We also had a constructive chat in November (with Diab Neiroukh) on this 
> list. You made an appreciated change, but the question remained opened.

The change from that discussion is in 0.5.3:
https://git.zx2c4.com/wireguard-windows/commit/?id=8120d07dd5fc9a5e545419fe13490086ce920f31
