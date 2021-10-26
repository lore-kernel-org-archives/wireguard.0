Return-Path: <SRS0=ix1r=PO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF39C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Oct 2021 10:06:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9260B61039
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Oct 2021 10:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9260B61039
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07a4cefe;
	Tue, 26 Oct 2021 10:06:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0d513942
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Oct 2021 10:06:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A43360F9D
 for <wireguard@lists.zx2c4.com>; Tue, 26 Oct 2021 10:06:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FXafdz5N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1635242768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pUvZnwjptTGqHp/zC0M3atDClZlvKRM3I6WHczyv2vw=;
 b=FXafdz5NBTXe0B2wqX2vYPbtoScYEriD7KNpqoxJeKntZWHL/ldyTGD2bILqJQEd/DPNP1
 WaNyOoa0mWj9IJSfS/a9WrfMUsTU3Vyt0Pz7ajOkW+fXL69UUXYOtKArQzTa50le7mRAgf
 eh6rNyVO0UAvAoVR7u1oHlebovE5Uak=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id de394915
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Oct 2021 10:06:08 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id y80so15513949ybe.12
 for <wireguard@lists.zx2c4.com>; Tue, 26 Oct 2021 03:06:08 -0700 (PDT)
X-Gm-Message-State: AOAM532pMSgTMvLFXdZGWgP3yO9QieIBAd6E66pBcGhxAQoXZS9Th/OL
 NEZz9dJjO2GtwySuA6ZO1fBZ4JJwCtrMu/5hyTA=
X-Google-Smtp-Source: ABdhPJziCh51XFGm2HLwPDvzcesN+KCxtlkAgx1M3tngiaY8vOqb69mTBlqrlwMURO1ALBhG/O1y09tnfGQ2g72/vOc=
X-Received: by 2002:a25:3cd:: with SMTP id 196mr23438956ybd.95.1635242768205; 
 Tue, 26 Oct 2021 03:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <SA1PR05MB79668D58D886BB8D36F558FE99B29@SA1PR05MB7966.namprd05.prod.outlook.com>
 <CAHmME9pu=syh5zkig=e1KFQKMvCYfu6e+BhKENdwZARCrpss7Q@mail.gmail.com>
 <PH0PR05MB7962AD22BE333E844C0A79B799B69@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9pgbxyAxgBAfgLMVquzmPC9fiBzjWhQ5zJV+3bR2aR9dQ@mail.gmail.com>
 <PH0PR05MB79623EC9C12B4AE732B04E9299B79@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9q3j=2HG-4v5tpHRM9DCKpw+5iSMyzu30jAUHS1r=eDHw@mail.gmail.com>
 <PH0PR05MB79629688EB84BF07A2AEF54F99B89@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9rMPgJ3E82nLoXyFYDT7DyjkLsdV3ange9sd_Qm+1-BNw@mail.gmail.com>
 <PH0PR05MB79620040C1298C80677C4BF999B89@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9q9VB7eEsZCFUqo8XG7qj1pe2RwgLezJEHueF4_AjmA4A@mail.gmail.com>
 <PH0PR05MB7962AD9044A813DE82AE796A99B99@PH0PR05MB7962.namprd05.prod.outlook.com>
In-Reply-To: <PH0PR05MB7962AD9044A813DE82AE796A99B99@PH0PR05MB7962.namprd05.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 26 Oct 2021 12:05:57 +0200
X-Gmail-Original-Message-ID: <CAHmME9qU7MMZd9RbmemvveTs9SDs48wCOUUp8AXwrvk29c-pMg@mail.gmail.com>
Message-ID: <CAHmME9qU7MMZd9RbmemvveTs9SDs48wCOUUp8AXwrvk29c-pMg@mail.gmail.com>
Subject: Re: Windows Log Output to Event Viewer or Text File
To: Frank Wayne <frank.wayne@northwestern.edu>
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

`wireguard /dumplog /tail | select` should now work in 0.5.1. Let me
know how that goes with your log ingestor.

Jason
