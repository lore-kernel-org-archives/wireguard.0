Return-Path: <SRS0=GgA3=LE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8114FC47094
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Jun 2021 11:45:19 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E39613F1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Jun 2021 11:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48E39613F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a67575c;
	Thu, 10 Jun 2021 11:44:49 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a18a747a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Jun 2021 11:44:48 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id og14so38362005ejc.5
 for <wireguard@lists.zx2c4.com>; Thu, 10 Jun 2021 04:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad-net.20150623.gappssmtp.com; s=20150623;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=tRDR1dY9O2rZi6TIj3e6Dxa+46Ccy/Lap0M/cSXWT4k=;
 b=i8xm0OLYs4lHFJJqWeA3OkxZyPknIihsY3iUcHyTXnfw3xtc1ygylJxt38u8LvCuu7
 kTK4jgykMiIwejeB9bswZzhHgzgGZArR1hP7fze5lE0HctDoHrCW6LLWuMdq6dFuOQs6
 Z6emUbDXNZrYIGAh7yvE9Gjo9Xaq27v9FD/vovrdrc8H6yEsrA2jNqSipvoWzTdpnlnK
 IAs31/5vEqGct8kbRZRxgJYmiGgHT/nfbJqztSHTyHN4xB+G2jGOwCwlCqnvXG7y/sAO
 iVJ8bHH7RFslBT4zgxr+knZjqKQ+B8aN7WRC+ka3cW7lorSIfFFp/Xh+5ryO3Y2rRml0
 8pOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=tRDR1dY9O2rZi6TIj3e6Dxa+46Ccy/Lap0M/cSXWT4k=;
 b=FGm8mRwVvRIS5STr6KUHQp2kxs4ABlcswWiDPX1wvfBVFPIXXf5WKhPoZQqk2oWTZ4
 CqeIYj0W5ES+1dIhGVOcJQbz6aM8NcMmg9Yycy69EnFkyLKJQvblofjE+MP10+xAq8rv
 Fa8eAFj94JhJ6xtw/cRJEsG5noSdzYPE68llrpjMq4Sh1Z5Zvn+jJ6zqcZXhAQXYXPa6
 lE8xRmPfyAxCn3BXLiOUK327l1ZMEnpK4zhjATak/OkdTVmGGbdhX5YG9cKyBvRn5ucl
 xFyYmUFiM2IUvZ1t5ieWIIep+EYlAxfi+avizXJc8Ex/WphRU73fdKmtbxCcSTX49JdX
 Qz0A==
X-Gm-Message-State: AOAM533mlDF2xLwE/9jC2HCvx2qVmb+jiGD25/A5WlvRSkhnUOnvU7Hz
 hz2rUtNmkMXcMAl+bxWOjEyn6S72mvh5YA==
X-Google-Smtp-Source: ABdhPJwY88H8JMplCoqOs1HhCRGQRLbc/0eUjNl7ctdqjplMT6QeoeYx4fdj+2LyeoxIMvTqMQ2DAw==
X-Received: by 2002:a17:906:e4b:: with SMTP id
 q11mr4013417eji.404.1623325487774; 
 Thu, 10 Jun 2021 04:44:47 -0700 (PDT)
Received: from smtpclient.apple (87.119.154.76.ipv4.telemach.net.
 [87.119.154.76])
 by smtp.gmail.com with ESMTPSA id p10sm940092ejc.14.2021.06.10.04.44.46
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Jun 2021 04:44:47 -0700 (PDT)
From: Andrej Mihajlov <and@mullvad.net>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: WireGuard is broken on iOS 15 beta
Message-Id: <760B19F6-17E7-4276-B2E2-DFE07AB19323@mullvad.net>
Date: Thu, 10 Jun 2021 13:44:45 +0200
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
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

Hi,

Just though to give you heads up. iOS 15 beta is out and it looks like =
the old way of obtaining the tunnel device descriptor is no longer =
working as the internal structure of NEPacketFlow has changed. It=E2=80=99=
s been a ticking bomb form the start as with any private API that is =
subject to change without a warning.=20

In the short term, researching what Apple changed and looking for a =
quick fix for that. Longer term I believe we should have a better =
integration between wireguard-go and Network extension on iOS.

Cheers,
Andrej Mihajlov=
