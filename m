Return-Path: <SRS0=TPXl=N3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6860DC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 11:18:30 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 836ED608FB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 11:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 836ED608FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=z3ntu.xyz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d436abad;
	Sun, 5 Sep 2021 11:16:51 +0000 (UTC)
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5adb1f7f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 4 Sep 2021 11:47:08 +0000 (UTC)
Received: from [127.0.0.1] (ip-213-127-63-121.ip.prioritytelecom.net
 [213.127.63.121])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id C1DD2C8D1B
 for <wireguard@lists.zx2c4.com>; Sat,  4 Sep 2021 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1630756027; bh=qN2CKfToQaSpSSu3gvGzgcuExaSbGC40+5gAAbtsbu0=;
 h=Date:From:To:Subject;
 b=USFcEMmR/XYLE0/gXDYe5GM2jvesJYIAb0S4qLJfO+VQF1gHR686jsB0TQ6NwibwS
 j7RTzRq+okcxwUQqsOaqAuTDAlGN9i/5ElIJX7PpUxhdrPlfifbfzlRJrRwztoMJlB
 8fmZHM+3xDvPIt5yYnuHsbTUVyMn5za5HtpbepNs=
Date: Sat, 04 Sep 2021 13:46:54 +0200
From: Luca Weiss <luca@z3ntu.xyz>
To: wireguard@lists.zx2c4.com
Subject: build.wireguard.com down
User-Agent: K-9 Mail for Android
Message-ID: <1126168D-D01E-48E8-B3F4-308F16666C61@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Autocrypt: addr=luca@z3ntu.xyz; keydata=
 mQINBFgc0/QBEACzBE9TBfe+O2TARphhmhVgMd2zo3lkvjWdohb9mg9+NvUq7swQR2l8davgwaTN
 VwDUA9jdzfjp4GShf0VFnqqFGouEc3OMeuHFdtjG4RoYGW+XvEoAcTWgY6glANmMZMi33D+2wnQQ
 Qziie3LMTQ7Tlpk8at8Ck4ShmmGTmek9LNFq1eHs3IHK5eH0fDA/rYvPxFMmwbHRDjdwtXjZlXBC
 nxEXK8CJkNG58G+RbtPU0I8Iu02TDOkr9x6KwLT1lJmq03wCkuQEXrDAzo6kkeAMhzWBtBtxTB1M
 byOZqNlbzEtxOTK9iA74U6POyN//876ESQ87LicFS4mgoyHL0Vt7ro9CSH7Imzv96Ae8HDZqIcBy
 Bn9YMBswjy4JOsC9JP/oDhr71y40nnrVvgx4ZesJM0PL9J1JYQWJQ22GoinnDwSB11Re51OYsK+l
 xEqph38N+AjcNYm+l85O/l+BkkULC+0kHWG6wQCv67KyeYCJJhNqJucXj2gXXaKyv2ltWPwHgK6w
 OAtN9QbimcYV2PUgfx6hl5r7buwc3tefp9ccmtoLq74mgrKiLurHqa4pKCa1uqfhBEN5/Os5tMrX
 IGa2sRvKHK0Pn7iyJQyuclyOp4r9W+QUw2DENm4n6ovkl7rfriL6ibBgVLcnexdG/8LZRaWFV96G
 YY3VCcRlz8SCwQARAQABtBtMdWNhIFdlaXNzIDxsdWNhQHozbnR1Lnh5ej6JAlQEEwEIAD4CGy8F
 CwkIBwIGFQgJCgsCBBYCAwECHgECF4AWIQS9BNokyXG41YeyuNf69pz2zS0CzQUCX5CaYAUJCVT5
 7AAKCRD69pz2zS0Cze7SD/0Xnvid+b9qeqAoXZeAqju1sXlv1BU8dNvA7AlDOQejNOAOO64DB8Ye
 r6AWu5Wcizo0KHEGPKmgJaAcjUac9MqFdLfhImsnUKEC6cjVeIJE5fynkNibtucQQFWO6nQMMF/3
 DmmfFOVeY70dhUzprvR8iYHyehh2yytQ7X7y83DSC89GpWq5hHJX41M3M0g006mPSNQvd79XXXVe
 RM7CUg6Ny3f3nThD7oa6SjLPF3hvYnhg1QTZk2zF3P0IeK+GiXI6RrogNBrCSKr2u3jW1QwiFJu1
 RI8TFgYdxMFyckUDpLZbsgEOsss07ffROQm7i+tVVlUQH7RM9TWVxA7jCMkFYtiE4V0WrTowcuk+
 28g/L/SKC+wrhAV/s98+CghS7u7A/xhamXGMdcW2ZQEUkvTBJULe6343bM1RkiYDKbfra1p8/rww
 TH5G3mtoCf8in7VlfNEcjf00oBHHtoz3xZtIRRf7QaW7XOz9vQaMV0YcmGhZzFd/tbWI9R74gwqD
 Zf9Qtt5P4ptKBYH7yKqvl1wuncTDrIcltMgSfeP9Z6yt+EkMz08XvZwC6OboozEmM+zd7jbCcjom
 o3XNYUDvgBPZq+nWzOGFH8KdPHnLHbso2DZf5StxKdYXH8WWyJkQqLW+BYCiGxTLfjyFofEUoTdY
 2bEWznuNRPmsKWeqEkzxyA==
X-Mailman-Approved-At: Sun, 05 Sep 2021 11:16:50 +0000
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

Hey all,

It seems that build=2Ewireguard=2Ecom is down which is hosting the distros=
=2Etxt used by the android_kernel_wireguard script and also used by the mai=
n homepage (distros=2Ejson there)=2E

Regards
Luca
