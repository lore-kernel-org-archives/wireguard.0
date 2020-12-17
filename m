Return-Path: <SRS0=K437=FV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F322C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 10:25:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6128723741
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 10:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6128723741
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 643a218f;
	Thu, 17 Dec 2020 10:17:24 +0000 (UTC)
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6e23b9cb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 10:17:22 +0000 (UTC)
Date: Thu, 17 Dec 2020 10:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail; t=1608200750;
 bh=CbBTZyuilpAhaBNj+vSg1NI2c6E1rUukFTHAZ8EoB5g=;
 h=Date:To:From:Reply-To:Subject:From;
 b=RIPU/VZu83NEJ19MkNeR74TQ118u+X8LhusKvQ+ECVnNuUxYiITdn9pL9axa37KA+
 uUX5qjGtQwnAeukPFwoPqpqKs2Lo2thjvqTt79OPRzL/7CJDRWMkNMzkKfCol4FzEz
 EXTZZVgV/Dh9A60uuceaOIHTTLYE+p8IjYO4r1zM=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Subject: macOS update logic needs improving
Message-ID: <Em6qFgnUJHoAWQmkBzNyZi4JA8DAd7Ylk0OANNRR1LVrZs8SzGAWkGCvyYj-jQPMTg3AV83_0oGW8Z40Uxm-KvseNM_CWXM9kQQLaOoOJPY=@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Thank you for the recent efforts to bring macOS/iOS up to date.

However there is a little bit of a problem with the logic for your macOS Ap=
p Store updates.

The update downloads fine, and *appears* to install, but the App Store app =
continues to show the update as available and installed.

Further investigation shows that if Wireguard is running and/or open, the a=
pp will not actually be updated (App Store will roll back to the existing v=
ersion).

If Wireguard is quit, then the update will install OK.

So you probably need to add some logic somewhere to detect and deal with op=
en/running Wireguard (e.g. prompt user to exit).
