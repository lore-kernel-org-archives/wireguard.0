Return-Path: <SRS0=7KPu=RF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D234C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Mar 2019 19:55:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10DAB2086D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Mar 2019 19:55:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="DipkKu5S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10DAB2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8002e10;
	Sat, 2 Mar 2019 19:44:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bcb73011
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 19:44:52 +0000 (UTC)
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff875953
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 19:44:52 +0000 (UTC)
Date: Sat, 02 Mar 2019 19:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1551556490;
 bh=EHOmNHp3pngOKHkNvDb2sQxzZ4aVd5g2NWXJV2cEbo8=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:Feedback-ID:
 From;
 b=DipkKu5SmutwmRDlghF80r3dAlhQ+p5nqO8wbU2lnrmMt0YHKREgPwriaA0d/Mm42
 xg9z/mSemq4ivFMH+/54Zi/4jpcC/kuFPC5t5KVK9hL6EBgIcy2j9b2JWHoOq2PpO5
 u/+GFeqsECDo4fIvDruWWMa36dhbitysArhuGpxY=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: kolargol <kolargol@protonmail.com>
Subject: Re: iOS WG Battery Life
Message-ID: <2iVkG0SJ64643A39NC7WLPcFxQc4oevInPxiNTvr0tixLQMLV3DyvvwNBLqj-tTk95sykibLeTPEPgDK1PvH4b-FS_YWR3kO9I3DLWuealE=@protonmail.com>
In-Reply-To: <EA2CDA40-8988-4C4F-B848-B2F7C6D8716C@lonnie.abelbeck.com>
References: <zk1gAdr9rlJCh4vzh4DYSc11v_Ja4r_9xYurdAcwFsa50g2zMxHskd5Nb0leXZKUZrCqV3YIZFI5pNYptUGXTyQBIl5zWoF_N306lQKO_tg=@protonmail.com>
 <CAKXLc7dop2Q7cS0FJ=c0fA4os6HTZQHWuuqPxzb4bygsiRNu6Q@mail.gmail.com>
 <1cY0xL4k2A_qU-I2aF2Oz5uEt2LP_i6oCVA5H5rAsRet4lY1MU8GkCQWOXy8OYSZKGtprlH3lZorUozIOKChzb201YR8fdcMDsp5OS9zT1E=@protonmail.com>
 <EA2CDA40-8988-4C4F-B848-B2F7C6D8716C@lonnie.abelbeck.com>
Feedback-ID: BeuBiSQcqsr-Krwtcv9IekhH3G8BPby93wz9So6BEG3RLXEAsJdmMzmwNOSrHC8ToF3fQqLPAjlqXY7tyhxFEQ==:Ext:ProtonMail
MIME-Version: 1.0
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: kolargol <kolargol@protonmail.com>
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


> Possibly, is PersistentKeepalive defined at the "server" endpoint for your iOS peer ?
>
> I would expect a measurable additional battery usage if either peer endpoint had PersistentKeepalive defined (non-zero).

Both server and peer have PersistentKeepalive disabled, there is no fancy apps runnign in backgroud - and i am using exac same WiFi and VPN endpoint (for OpenVPN and WG comparision).
WiFI connection is stable and have strong signal, same with LTE.
The battery grap shows sharp down in the night as something continuesly draing battery (here wg)
How can i debug it ?

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
