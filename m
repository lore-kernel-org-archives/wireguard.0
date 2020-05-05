Return-Path: <SRS0=7A+2=6T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E4DC47256
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2020 04:27:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4630206E6
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2020 04:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rub.de header.i=@rub.de header.b="iHswiDP/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4630206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=rub.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31c68fe0;
	Tue, 5 May 2020 04:14:38 +0000 (UTC)
Received: from out2.mail.ruhr-uni-bochum.de (out2.mail.ruhr-uni-bochum.de
 [2a05:3e00:c:1001::8693:2ae5])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 16a063e0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 04:14:35 +0000 (UTC)
Received: from mx2.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
 by out2.mail.ruhr-uni-bochum.de (Postfix mo-ext) with ESMTP id 49GRWp5cX0z8S4g;
 Tue,  5 May 2020 06:27:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rub.de; s=mail-2017;
 t=1588652822; bh=Uc3gN+iXbqH4vc+09Uj4jn6jKxvtHVuL1u3QHetzrLw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iHswiDP/eWywLGxCKny1K+Uss+DtPlXfIUeAJPrc65Bkf88AiqFy8A7wmBv/PTSDk
 fXXwe8ftgd/cV+Gkyim9hkHhbtGSQza9lrrxGmH3lk7DKtvfPg9a5tBgHz8iklNw3O
 ox3zWQqjnBvdlt7JMlYxnLvUx7UEKE3+ElD5jhsQ=
Received: from out2.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
 by mx2.mail.ruhr-uni-bochum.de (Postfix idis) with ESMTP id 49GRWp49Bfz8S3t;
 Tue,  5 May 2020 06:27:02 +0200 (CEST)
X-RUB-Notes: Internal origin=IPv6:2a05:3e00:c:1001:5054:ff:fe37:b9e4
X-Envelope-Sender: <pascal.ernster+wireguard@rub.de>
Received: from mail1.mail.ruhr-uni-bochum.de (mail1.mail.ruhr-uni-bochum.de
 [IPv6:2a05:3e00:c:1001:5054:ff:fe37:b9e4])
 by out2.mail.ruhr-uni-bochum.de (Postfix mi-int) with ESMTP id 49GRWp0tJ4z8S37;
 Tue,  5 May 2020 06:27:01 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.1 at mx2.mail.ruhr-uni-bochum.de
Received: from [IPv6:2a01:c22:c018:d103:f417:bfc6:e4c5:b5ba]
 (dynamic-2a01-0c22-c018-d103-f417-bfc6-e4c5-b5ba.c22.pool.telefonica.de
 [IPv6:2a01:c22:c018:d103:f417:bfc6:e4c5:b5ba])
 by mail1.mail.ruhr-uni-bochum.de (Postfix) with ESMTPSA id 49GRWm73ZHzyWg;
 Tue,  5 May 2020 06:27:00 +0200 (CEST)
Subject: Re: Ubuntu kernel >= 5.3.0-52.46 breaks DKMS build for
 wireguard-linux-compat >= 1.0.20200429, patch included
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <6565463c-0a99-9137-5cc2-714e2fbd6dfc@rub.de>
 <CAHmME9qDMiNh90_zA9KsFX-OaHNUHnw5=e65jH3PdXg1n7nyFw@mail.gmail.com>
 <20328df0-e2dd-1653-9fc1-1fb06cbc054f@rub.de>
 <CAHmME9rnxp2QYjhu1vU+2K1GaoM2hupz5uJGpo_8z4t=E2-boQ@mail.gmail.com>
From: Pascal Ernster <pascal.ernster+wireguard@rub.de>
Message-ID: <134de22f-64b8-96fd-67c4-680b1a8e244c@rub.de>
Date: Tue, 5 May 2020 06:27:12 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9rnxp2QYjhu1vU+2K1GaoM2hupz5uJGpo_8z4t=E2-boQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.99.4 at mail1.mail.ruhr-uni-bochum.de
X-Virus-Status: Clean
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

Hi Jason,


[2020-05-05 06:03] Jason A. Donenfeld:
> Ahh, you're running -proposed, gotcha. So I guess I should wait until
> this hits the main repo. Any idea when they usually do that?

I'm not a Ubuntu developer, but my educated guess would be "when their
next HWE kernel security advisory hits the RSS feed". At least that's
what happened when 5.3.0-51.44 got released:

https://usn.ubuntu.com/4342-1/


Regards
Pascal
