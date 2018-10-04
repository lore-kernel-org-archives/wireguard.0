Return-Path: <SRS0=SlID=MQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3309C64EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Oct 2018 20:50:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CECFC205C9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Oct 2018 20:50:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=jhcloos.com header.i=@jhcloos.com header.b="A+oZ0B2Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CECFC205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=jhcloos.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c476e6ac;
	Thu, 4 Oct 2018 20:49:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 295d2eaa
 for <wireguard@lists.zx2c4.com>; Thu, 4 Oct 2018 20:49:09 +0000 (UTC)
Received: from ore.jhcloos.com (ore.jhcloos.com [IPv6:2604:2880::b24d:a297])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8026c88d
 for <wireguard@lists.zx2c4.com>; Thu, 4 Oct 2018 20:49:09 +0000 (UTC)
Received: by ore.jhcloos.com (Postfix, from userid 10)
 id 4E2E01E521; Thu,  4 Oct 2018 20:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jhcloos.com;
 s=ore17; t=1538686166;
 bh=YbQqz5sMTmNt3LMqBWRfu0kdLr/ioiDdv8TAy/pUWvA=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=A+oZ0B2Qr29pZXozr+4fbQnQ8ib4jm33PNKIKBMa48XN28GL7tYJCZVgt4/269pHp
 TkoTlGw+Jc4LlVa2M9OO+lVntzy8/9WPIiHP/gzA+2LlAEZvhVFqljxqGTBdY4aNU2
 z26Nu9SIfld1x1xUCS2F/NbGYqaZFcSb5Ed7KcZ1RMirujls+zZg6AxNahRNLwwvHt
 ZnBOGa3WuR904pMZ1Mi5UCZD6Vh2uXhQVZr7JWCJj/oqM2Aj8AqKVHKNytITQccRuS
 TWoYKk8sFPgBc1hlB+1X2ADwUfAIFboVFAH13SRWduIMfoJeyy3DVhLBEPUQHgOKl6
 S/RsN6RvEkDsQ==
Received: by carbon.jhcloos.org (Postfix, from userid 500)
 id D05A410A6FF29; Thu,  4 Oct 2018 20:49:19 +0000 (UTC)
From: James Cloos <cloos@jhcloos.com>
To: wireguard@lists.zx2c4.com
Subject: Re: wireguard-go compilation fails
In-Reply-To: <m31sb2qq7p.fsf@carbon.jhcloos.org> (James Cloos's message of
 "Mon, 13 Aug 2018 10:46:34 -0400")
References: <m31sb2qq7p.fsf@carbon.jhcloos.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.50 (gnu/linux)
Face: iVBORw0KGgoAAAANSUhEUgAAABAAAAAQAgMAAABinRfyAAAACVBMVEX///8ZGXBQKKnCrDQ3
 AAAAJElEQVQImWNgQAAXzwQg4SKASgAlXIEEiwsSIYBEcLaAtMEAADJnB+kKcKioAAAAAElFTkSu
 QmCC
Copyright: Copyright 2018 James Cloos
OpenPGP: 0x997A9F17ED7DAEA6;
 url=https://jhcloos.com/public_key/0x997A9F17ED7DAEA6.asc
OpenPGP-Fingerprint: E9E9 F828 61A4 6EA9 0F2B  63E7 997A 9F17 ED7D AEA6
Date: Thu, 04 Oct 2018 16:49:19 -0400
Message-ID: <m3y3bdigj4.fsf@carbon.jhcloos.org>
MIME-Version: 1.0
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

In case anyone sees this thread in a search, the solution is that the
version of golang Debian packages is too old.

If one manually installs golang 10, then wireguard-go compiles fine.

-JimC
-- 
James Cloos <cloos@jhcloos.com>         OpenPGP: 0x997A9F17ED7DAEA6
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
