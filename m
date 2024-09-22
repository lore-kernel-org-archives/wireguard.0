Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC78D49221
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:24:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c0c3ef6;
	Mon, 18 Nov 2024 12:36:15 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 02a9c701
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Sep 2024 17:33:37 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-374b25263a3so2082719f8f.0
 for <wireguard@lists.zx2c4.com>; Sun, 22 Sep 2024 10:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727026417; x=1727631217; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=phizH4ZnPyfnfIE79iT3UNi975qHSUBZJs7LKHbvYrY=;
 b=Sv6H0l8bp8XnG7lugrCoQb1NZddN7dFkqoO+vkWg/Gq89QI1TizvXxfNRRmbFA6H9j
 fUSpsMIB1GEVbOx0SYthIqYUs9EpX0YrG27XTQa3Rr7CtR1RYEu7Agqu+t6uxIzrlv1j
 BgS0wf5TA5QvSSKlvICPu3nA1EhsxK030xiXCBRwfjhWxk6DCO3KoImmHOYVYoD4cueU
 JVN8qKZiv1kXyipu1csUdKkhMYDQXOtnsmjeoG/WiC8/qh3Ln2owhCN2Dz71mf9gM8zV
 mXhGlQBWFMok94NK74ZKXocsthZygJgtdvPK8tN+kSmjX/dvwssYQXzUujIu4hDDIzzY
 wjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727026417; x=1727631217;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=phizH4ZnPyfnfIE79iT3UNi975qHSUBZJs7LKHbvYrY=;
 b=WiMMkfyEJt4a5nTWTCHXSDzAUd7SXjvRuhn14pH3NqC3HmrHs+TvcCtLJP1aLse9vd
 hTCp/oRkY4lAhVRV149j5HEtgLvrHE/ljXUYtAQK40vxMHEoDiEjDqXQLMN7md7Tyai0
 4FUR7uW6yA0ecMt1bSNGayM2JV28X83Xr32/1XUgNMSOp3SUmDRpHj4nXoYYNQJyqpfy
 JIs3M0ttFTc7Pv2YYcwcjxIq/fyRg3k/L9ePoVdKT3zHDBs7skmdpR1fvqrrxRkQqM8P
 GSM/ppLrBe6CSsJTcqpYgFwOddFNgGa4azjBxYskWOjK2ehWEZldyu5U75zWYPa70EUV
 zbZw==
X-Gm-Message-State: AOJu0Ywwr2ZY1xsU/+ozBmSE54/GzjH0W7lDcl2q9yxvQLCdM3nDfUgR
 3BeRyByhOziSNNrX7AiFACG/RY31ZaqZXeBbPDNRC6nqgnj905uI+7B0M6ToZrqkaGPVfYf8YVO
 jsm35y+nKH731gs/4a4X+4tk8lHyBF712Gyk=
X-Google-Smtp-Source: AGHT+IGvw+y6cNF4JDxdusugC+z079Ol82wNl8gHxQ6SKhL7rk7izBHJKO0t9/oJ2lg8tBmYHrjcv0e/XMoTT1muN2c=
X-Received: by 2002:a5d:6646:0:b0:374:ba3f:ad08 with SMTP id
 ffacd0b85a97d-37a42380e79mr4535379f8f.55.1727026416766; Sun, 22 Sep 2024
 10:33:36 -0700 (PDT)
MIME-Version: 1.0
From: Cory Coager <ccoager@gmail.com>
Date: Sun, 22 Sep 2024 17:33:24 +0000
Message-ID: <CAM_og+oCeWFAXV4Gva5WnsPEMOG2X_SQpPx=_8H6t3QYaBp=Lw@mail.gmail.com>
Subject: wireguard-tools bug on Android with work profile
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:35:39 +0000
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

If you have WireGuard installed in the work profile of Android, the
excluded/included apps are not routing properly.  Looking at the
source code, wg-quick is reading the apps and uids from
/data/system/packages.list which only has the correct uids for the
Owner profile.  As such, iptables has the wrong uidrange for the apps
list and the apps do not work with WireGuard in the work profile.
