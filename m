Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B13C432C3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:24:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8948204FD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:24:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=molgaard.org header.i=@molgaard.org header.b="a+0BHO4x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8948204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=molgaard.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f4c6360;
	Wed, 27 Nov 2019 09:22:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e132d157
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Oct 2019 15:30:33 +0000 (UTC)
Received: from mail3.molgaard.org (mail3.molgaard.org [116.203.246.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ef6edef
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Oct 2019 15:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail3.molgaard.org (Postfix) with ESMTP id 527CF3E902
 for <wireguard@lists.zx2c4.com>; Mon, 14 Oct 2019 17:30:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail3.molgaard.org
Received: from mail3.molgaard.org ([127.0.0.1])
 by localhost (mail3.molgaard.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cm0V5rL2IvQV for <wireguard@lists.zx2c4.com>;
 Mon, 14 Oct 2019 17:30:30 +0200 (CEST)
Received: from [192.168.1.2] (3e6b00d8.rev.stofanet.dk [62.107.0.216])
 by mail3.molgaard.org (Postfix) with ESMTPSA id 0300E3E900
 for <wireguard@lists.zx2c4.com>; Mon, 14 Oct 2019 17:30:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=molgaard.org; s=mail;
 t=1571067030; bh=g2HiWWRL+kVE7CghbRsAMUI6ZZiOe6GKt717V53EoAk=;
 h=To:From:Subject:Date:From;
 b=a+0BHO4xwrXaiNLjbbjyDcsocBQeR5QjkfhweeH+2WkrSsol1sdJX57ldwXwh5xQG
 Ecu981n/5DXwMDf40+zyPnXsbo3p5tuaERmWszXl4bUb8krCI6AXmjLJIHJeFoScz7
 509dW5m0Jjmk3HcecmmxDmr9zK1qWGSXnaR/ruW3c4OXi4spVvYBo+GM3UkRdNI35D
 8lmVLaP+6DqwUVqhpu752S3WbEZPcgzXQcCokrfcsMi9mcv+IHVOhFbX6q5PFJ41Q5
 2fEtMEJx4Ss5BKKgPcctdc27KTwMgJV5c2fAjxPMBJ5aHwm6Ku1Y/LXZGA0GhORriM
 H0DIZ5ZBot5Hw==
To: wireguard@lists.zx2c4.com
From: =?UTF-8?Q?Sune_M=c3=b8lgaard?= <sune@molgaard.org>
Subject: Wireguard, bridging and DHCP?
Message-ID: <a4ca89a7-5eee-e570-e721-e559e9eb0e23@molgaard.org>
Date: Mon, 14 Oct 2019 17:30:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:22:33 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

SGkgYWxsLAoKMS4gV291bGQgaXQgYmUgcG9zc2libGUsIG9uIHRoZSBzZXJ2ZXIsIHRvIGJyaWRn
ZSB3ZzAgd2l0aCBhbm90aGVyCmludGVyZmFjZSwgZS5nLiB0aGUgb25lIGF0dGFjaGVkIHRvIHRo
ZSBsb2NhbCBuZXQgYW5kLCBoZW5jZSwgYXZvaWQKZXh0cmEgc3VibmV0cyBhbmQgcm91dGVzPwoK
Mi4gSWYgc28sIHdvdWxkIGl0IGFsc28gYmUgcG9zc2libGUgZm9yIFdpcmVndWFyZCAqbm90KiB0
byBhc3NpZ24gYW55IElQCmFkZHJlc3NlcyB0byB0aGUgY2xpZW50cywgYnV0IGhhdmUgdGhlbSBv
YnRhaW4gc3VjaCB2aWEgREhDUCBvbiB0aGUKbG9jYWwgbmV0LCB3aGljaCB3ZzAgaXMgYnJpZGdl
ZCB0byBvbiB0aGUgc2VydmVyPwoKQmVzdCByZWdhcmRzLAoKU3VuZSBNw7hsZ2FhcmQKCi0tIApC
bGFjayBob2xlcyBhcmUgd2hlcmUgR29kIGRpdmlkZWQgYnkgemVyby4KLSBTdGV2ZW4gV3JpZ2h0
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFy
ZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4
MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
