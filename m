Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C39C3DA78
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Jan 2023 19:00:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 645c6fef;
	Tue, 17 Jan 2023 18:58:16 +0000 (UTC)
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c89be364
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Jan 2023 16:27:10 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-12c8312131fso22825009fac.4
 for <wireguard@lists.zx2c4.com>; Fri, 13 Jan 2023 08:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VSe6sWR0zYmlaKhMW+GGQleH/sA7c6RiPDHKzXkZ1tg=;
 b=KD4X9M8aW2y0iB3i/wdSUCWBUEmyGf4JTfobeIKURoLeekcPNr3rErfxLyumCiaFIN
 2wcqP5yKTPQ8x66xdWdXtUuuLDK3mKQ0UXuMRKZxW6He1I+Czh64OwKGekCsjECvDm7B
 yOxFYOHroDh559tDxyk34URHmsil4P7NmrZ59M0Hruot+GkaNDx1VwIIqKjLYz4hgyvA
 6630LqdGEdzy4Y660m20vIq/LtE1Q5WpbNNK1WuQ72LsKPqYBGbPHZJX8fTHTknAr/kD
 xXEIHBSMWXtnPicQfsg306XWlFJfla2ZJ45UkwYV2iGePHo4Oh9XSJg+TeSYIr50pT5p
 PjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VSe6sWR0zYmlaKhMW+GGQleH/sA7c6RiPDHKzXkZ1tg=;
 b=RfGgL9JLQ5ktMZF62exoFvloiGzbhu8QEAcK7KkCj1tUQI92kzHGIjlx4Lu8Fi0+JD
 1vmh/AQEw/EC/n/7rh1mGrHTnB3Mc2pngA4DUVj93TdDsAY0YtRlHr+uqQuxQM9Bn3mt
 +EebJcOucXZFE5H9OOEv6d4C3ryZNbNGMxNgHblb/9Km5X1Tr6e0t9r3ibSo0iI6teuE
 QwcLrb9y0xEaCTGN5nw/I7//ygF2j6sqt6fR+LMiZJIAEky14SEjLbX2U+WckDWRZsVl
 Mcy0+9q/Wc0CAAkS7YetF++e6UsniNmRvAN0I0vyVGgNf15Qf9hj1H2ey2MLO13fpmV2
 92sQ==
X-Gm-Message-State: AFqh2kqvaz9r9yuy99VpPejDnfJOILQKGTMamg0dKY3ua5RwM2tGagRV
 REvpFU1nrzMqkEsi2XEHwDWzenk5RBGtYd8kJ8RHfpyRtc0=
X-Google-Smtp-Source: AMrXdXsF8l80LdoQELWFGdw1jeFr5mzQssvWcVgGN7ibnAHCPb+4mjUUUa3X0fDJgkxIrqbs4yoMtQ6Wkk9QQfI6nD0=
X-Received: by 2002:a05:6871:827:b0:144:cca1:62f6 with SMTP id
 q39-20020a056871082700b00144cca162f6mr6953981oap.80.1673627229134; Fri, 13
 Jan 2023 08:27:09 -0800 (PST)
MIME-Version: 1.0
From: Andy Xheli <andyxheli@gmail.com>
Date: Fri, 13 Jan 2023 10:26:58 -0600
Message-ID: <CAPJ9KJ843d+hMD8t8izkzaAAdJW1Dabn_2Pg+5U7s=qdi5k-8w@mail.gmail.com>
Subject: Android TV Wireguard issue
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 17 Jan 2023 18:58:10 +0000
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

Hi All,

First I want to thank everyone for this amazing software.

The issue that I am having is that i can't add vpn tunnel on my Xiaomi
TV stick 4K. This device does not have a USB port and when i click on
the + icon on the app im getting an "You don't have an app that can do
this" I think it would be nice to have an option to either add it
manually for the devices that don't have a USB stick have an option to
import via SMB or webdav let me know what you all think
