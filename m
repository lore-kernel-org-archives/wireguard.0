Return-Path: <SRS0=x0Et=UU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81D4C48BE0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Jun 2019 09:53:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49E1920665
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Jun 2019 09:53:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="cvR2bziZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49E1920665
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42a45f25;
	Fri, 21 Jun 2019 09:53:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b052f36c;
 Fri, 21 Jun 2019 09:53:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb36f8f3;
 Fri, 21 Jun 2019 09:53:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e98c6fe;
 Fri, 21 Jun 2019 09:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=SrG9wh
 ALBDTfLZfu4lv+Iz3Yz4s=; b=cvR2bziZPLpJfpcsI7cMIbXelSigGVmrhs/CRB
 CnAstnTgQFDOGbVPUO/LJVkI46BlLftQ4oSA2H8+hcs8ctlq9Zi2uUXePE27gieI
 aiuTreAim9WN+/5CbHfLo0Z3v43aXE2anI47Ui6QDtFE421l6BX4UnfRz90hxUUn
 EA8cO0x2xGk3DT1E2voSge8L88ihP5N1e7w+zCyjd/hHvcjZq1cZCeJzOGhMOIo5
 9/w6N08HmOPUMH/blaUUn7DI4F9+pGypJA2gTmBxzqbwL7MaMKGfGDZ4jOKjcJv2
 Q7rMe55usN+LwXBOPv44v3U6gKp0oklLRCmFB3vkauKxktYQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fde8b2f9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Fri, 21 Jun 2019 09:20:20 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id g7so4241021oia.8;
 Fri, 21 Jun 2019 02:53:43 -0700 (PDT)
X-Gm-Message-State: APjAAAUEiV9Ms1lxlkdZ7zI6EzeW6rrUeCBf6mN5pJF/2Uhn5QRLjm7Y
 krZ8OapmO1CEVkehJr/mrCBnMDBSqrUrhgQUO14=
X-Google-Smtp-Source: APXvYqxV9hze/ZCrV959K8/PmMANjQzD4qwUWaCTZGr8XKHJdH3h3iZIIhquJP4NgLVLm2rg2BnL4oaFRwYQ/D/WXpY=
X-Received: by 2002:aca:ccd2:: with SMTP id c201mr1957387oig.119.1561110822582; 
 Fri, 21 Jun 2019 02:53:42 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 21 Jun 2019 11:53:31 +0200
X-Gmail-Original-Message-ID: <CAHmME9pcw1Zx4dqKXB-Pt4jGOptjTqfELDF36LQV8+dxr1yOsA@mail.gmail.com>
Message-ID: <CAHmME9pcw1Zx4dqKXB-Pt4jGOptjTqfELDF36LQV8+dxr1yOsA@mail.gmail.com>
Subject: [ANNOUNCE] git.zx2c4.com ssh host fingerprints changed
To: WireGuard mailing list <wireguard@lists.zx2c4.com>, cgit@lists.zx2c4.com, 
 password-store@lists.zx2c4.com
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi contributors,

I've you push to git.zx2c4.com over ssh, you'll notice the ssh fingerprints
have changed. The valid new ones are:

SHA256:9os9asMrVeuWNlQmsmpA6bfcgFIwr5e0psYJYVBekUM
SHA256:frea6X2uzWJ3m0w5/qMKuXpbRgvvQIsFqotWCWkbR4M
SHA256:pDEtFepAZKaINDzfXLg/8F+4hf3tUvkz5C5j2i+NNwY
SHA256:5zPKp8sV2CnYDxBa9crqKXa2nJlPUyqW92SX7Xll7Ks

This message is signed with my usual GPG key.

Jason
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl0MqQwACgkQSfxwEqXe
A67ssxAAu/TbRoQRfegcAf/ZdgPs6mI1aXKhwKUfnljqKzy5UgUq+UcT/iZHsZgL
gvnz0OwYaMsIMVdB+kWoCJwhbC1+Mrc+6rShbn9/kFVMVzEgE8Ut1dwvVM1ijRkj
q3BrriZwh3hwtpo8XAANursOUrOVoaY9UvpZ0187G5IB1n9mIbrtJkjQqjCF9/Tu
Vfx+khHdDe38onc7dFIPLFjhTiEQCxRwsOH53QNTyGjqCW9IjvYzhgfEOAo0KQHu
KnQpYWdhxeYohmEqGQxihPh3+8x+mbuk4+YS9Qd+Zbn+Yy9oC27TBtZwnzL0oHC/
cYlK51kkjEgsxtguXpVDm1xYnffMOkd5ECX7VYjqJE+V+cGBPhRqIu+D5lgI7tZE
dnfDotRUtXKjRIv04qYns7A2hQR8qh+PVG3Qcl5Tg6Jc3c02N1bm7JM5hfk09BDZ
lbAkvbIC3BsFfn+9ZIWF/7OqpJORxgGLToT9zjUagTC5PydiBO9RfybcUGQYHTiG
afiaexOlADKUn1u91wqq+VyX74JQ2tug11gWvLpc8ip/Bohqhx0Qb+jyGkpgOlrd
dxrd8WGNGIMKsEI7HISWBVh04MxxzH6i2ziiFS1y3dF4/olNu0zFJtaINIexHrS9
tGiwl2HM2fIXiabCmAhNEhhk4kqXZBkBLJU9DRAof/eVIp998AU=
=YEXK
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
