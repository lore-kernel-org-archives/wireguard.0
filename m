Return-Path: <SRS0=V78u=MZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816D2C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:18:53 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAAC760F70
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAAC760F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04e20856;
	Mon, 2 Aug 2021 13:14:12 +0000 (UTC)
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 067c0450
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 2 Jul 2021 04:18:53 +0000 (UTC)
Date: Fri, 02 Jul 2021 04:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1625199532;
 bh=XZfpOctUgH91ggf6JpaL/e5zilxhgdlK/2dxxtAKmyU=;
 h=Date:To:From:Reply-To:Subject:From;
 b=e0UklAic7UBYxjphkWR80YI5MpBG4RbqItHBf/dcITfEvLj7miWD8MkDnfTR/n8/D
 rfQtvQjpgWUKD+Hn9xd0tW94bytb8HDQl9Jf8dSRA06eBbMv4wRW8wbIC5c8HdeMie
 rrDJl648BKpSsgmjt2lCpvdKjouUR0xknhY5qrIU=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: j19981106 <j19981106@protonmail.com>
Subject: The default value of the IPv6 MTU of the Windows client is incorrect.
Message-ID: <zubfbJXkPKhuyOst-DfICGsvB7bY6kLzN-Qqb9a2kykFXHAkejEME14tTEyUenUCc6LHPUTyW4ThXKUIWBE7hSj6cV9JFKxSZyvi73pUOl8=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 02 Aug 2021 13:14:07 +0000
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
Reply-To: j19981106 <j19981106@protonmail.com>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I found that when the Windows client does not set the MTU value, the IPv6 M=
TU will be 65535. This will cause IPv6 to not work properly.

Use the `netsh interface ipv6 show subinterfaces` command to view the IPv6 =
MTU value.

When I checked the mailing list, I saw a question about the MTU value of Ap=
ple products, but I only saw a vague answer. Do Apple products still have t=
his problem? Is it reasonable that the default MTU is 1420?

Mailing list regarding the MTU value of Apple products:
https://lists.zx2c4.com/pipermail/wireguard/2017-December/002201.html
