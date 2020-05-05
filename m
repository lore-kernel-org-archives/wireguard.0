Return-Path: <SRS0=7A+2=6T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85099C47256
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2020 03:52:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDC49206CC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2020 03:52:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rub.de header.i=@rub.de header.b="Trgu+Xrv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDC49206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=rub.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0d3a34f;
	Tue, 5 May 2020 03:39:49 +0000 (UTC)
Received: from out2.mail.ruhr-uni-bochum.de (out2.mail.ruhr-uni-bochum.de
 [2a05:3e00:c:1001::8693:2ae5])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2e63ddeb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 03:39:47 +0000 (UTC)
Received: from mx2.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
 by out2.mail.ruhr-uni-bochum.de (Postfix mo-ext) with ESMTP id 49GQlf6fPrz8S5R;
 Tue,  5 May 2020 05:52:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rub.de; s=mail-2017;
 t=1588650735; bh=J832xqdfRahf2OcU6Skj7cF28SMv40t+DS0wNZga5fY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Trgu+XrvERd3KgUMbYrVx5qcff+pjlgZZOIHaqsuhMfvkjJqGdnDGIFi3TSiG6+yR
 p6u0t+K/qEswDw5Fx64aP4Ox+coE/WeaevX27cyo6i5mBC9ArutBfZDBnS0NonNkL8
 Fv250X7X9BcvJNgaVtGefQ4JOaZJGrrYkDxOgSzs=
Received: from out2.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
 by mx2.mail.ruhr-uni-bochum.de (Postfix idis) with ESMTP id 49GQlf5BVBz8S5l;
 Tue,  5 May 2020 05:52:14 +0200 (CEST)
X-Envelope-Sender: <pascal.ernster+wireguard@rub.de>
X-RUB-Notes: Internal origin=134.147.42.227
Received: from mail1.mail.ruhr-uni-bochum.de (mail1.mail.ruhr-uni-bochum.de
 [134.147.42.227])
 by out2.mail.ruhr-uni-bochum.de (Postfix mi-int) with ESMTP id 49GQlf4zYfz8SDN;
 Tue,  5 May 2020 05:52:14 +0200 (CEST)
Received: from [IPv6:2a01:c22:c018:d103:f417:bfc6:e4c5:b5ba]
 (dynamic-2a01-0c22-c018-d103-f417-bfc6-e4c5-b5ba.c22.pool.telefonica.de
 [IPv6:2a01:c22:c018:d103:f417:bfc6:e4c5:b5ba])
 by mail1.mail.ruhr-uni-bochum.de (Postfix) with ESMTPSA id 49GQld4NVvzyYR;
 Tue,  5 May 2020 05:52:13 +0200 (CEST)
Subject: Re: Ubuntu kernel >= 5.3.0-52.46 breaks DKMS build for
 wireguard-linux-compat >= 1.0.20200429, patch included
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <6565463c-0a99-9137-5cc2-714e2fbd6dfc@rub.de>
 <CAHmME9qDMiNh90_zA9KsFX-OaHNUHnw5=e65jH3PdXg1n7nyFw@mail.gmail.com>
From: Pascal Ernster <pascal.ernster+wireguard@rub.de>
Message-ID: <20328df0-e2dd-1653-9fc1-1fb06cbc054f@rub.de>
Date: Tue, 5 May 2020 05:52:24 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9qDMiNh90_zA9KsFX-OaHNUHnw5=e65jH3PdXg1n7nyFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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


[2020-05-05 03:37] Jason A. Donenfeld:
> Can you confirm to me whether or not this patch fixes the issue on
> both 19.10 and 18.04-hwe?
> 
> https://git.zx2c4.com/wireguard-linux-compat/commit/?id=1325bedf8ee3d69ed58460b7a8fee96d949f67da

I don't have a 19.10 machine to test on, but at least on an 18.04
machine with the 5.3.0-52.46 kernel, it works as intended.

However, building the module for the previous 5.3.0-51.44 kernel fails
now, and it doesn't fail when I use my original patch.

Note that as of now, 5.3.0-51.44 is still the latest "official" HWE
kernel for 18.04, and 5.3.0-52.46 is only available from Ubuntu's
"bionic-proposed" repo.


Regards
Pascal

-- 
Forschung und wissenschaftliche Informationsversorgung
IT.SERVICES
Ruhr-Universität Bochum | 44780 Bochum
Fon: +49 234 32-29169
Fax: +49 234 32-07835
