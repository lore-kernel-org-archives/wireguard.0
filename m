Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B763C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 15:46:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFFBA65004
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 15:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFFBA65004
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab2b613c;
	Sun, 7 Mar 2021 15:43:35 +0000 (UTC)
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c1f60333
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Mar 2021 20:29:47 +0000 (UTC)
Date: Fri, 05 Mar 2021 20:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1614976186;
 bh=qIzU8Xq+wXHZZki/w+Io535SGyDObI/3hmaOmoMoHaU=;
 h=Date:To:From:Reply-To:Subject:From;
 b=L0TzmpsKt04TXyhnQ2QUNJyhmgeZAaX7DEm/fh38N3AUX8JzhxwKCMsnnjkVrHj8U
 VPn29CpUTxXGWyecb3rgbOUG9kQtHSM+MkPfgrI2kdixnCjgRgw89fuSF/EfHUDigF
 W8AgVeOHrWq3r9YVLOFYx9LWtCOHARFuONerJSyk=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Bradley Saulteaux <bradsoto@protonmail.com>
Subject: Wireguard Windows ARM64 Build 21327
Message-ID: <nrcRMSny-jv34qB41pOjVZQJVY7-l1J7yFQ_bO740PasFTOqt9uNp8H8EctftDLEcNgOrxmydh8KJ3ZuTlS3FjmE2abkWJAXhmQTYhtnQlk=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 07 Mar 2021 15:43:28 +0000
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
Reply-To: Bradley Saulteaux <bradsoto@protonmail.com>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

A quick FYI Wireguard UI stops launching in Windows ARM64 Build 21327. Vers=
ion 0.3.5 works for me as a temporary workaround. I'm not expecting my conf=
iguration to be supported or stressed over in the slightest. I just want to=
 let everyone know about it in case the issue finds its way into official b=
uilds.

