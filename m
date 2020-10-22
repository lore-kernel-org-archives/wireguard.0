Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C2DC4741F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:18:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04F092074F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:18:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=provakil.com header.i=@provakil.com header.b="VGW4SRq3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04F092074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=provakil.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cafd37bd;
	Mon, 9 Nov 2020 22:40:49 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 527a40da
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Oct 2020 04:39:58 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id t25so272123ejd.13
 for <wireguard@lists.zx2c4.com>; Wed, 21 Oct 2020 21:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=provakil.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=p+tpurMPz78ss0ih02AEAtpMLUiFFDQ8C7Zbe31doJk=;
 b=VGW4SRq340F586fdKGxkfMZTc8dvyQbnE3/A8pNZE2qGt8RGL92VF93Ew9d/gOlnbo
 9vRFagAsm7/BuBh0vnWPWujlsWvd7S1fmJfT+67Lnv0FvuOrlko9q9EjHkvd3a8xNkfW
 TPv672C7QeN/jM5uWVXONTPITGJiNiELmOAsDFvpBlbsidrGXGH1vySZLmn9EG5EZnye
 Ab58khtaQs17N01KoasK0bGDK8b34P4G9xFNCh0dBj0By7cmyiklv9FR9fft7AwKB6/Y
 txIEdgBhqOhJ2pOsD97nnnQXtcl0a3EplAOpdvg+I5v8+nXqjM3bTEIXYLQbpnmnEjYu
 N/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=p+tpurMPz78ss0ih02AEAtpMLUiFFDQ8C7Zbe31doJk=;
 b=Av83IcfdjsmcoC4XWYomjZLzGULZ63SBiEpUxZxHH1Iw5qBQWkiTgB+TsehyvbtFUa
 CoiqXT3381YIZpipBdCAuGlBRqn4Hzt/mQAHVI60muv5+z1YwoVhowMfdx89Q6pQH6i8
 8AZaSF+f4q65Hr+HtPLhlUXnbCwZfXxUC0y0u1rSTs30HKYYWvC2mqqjWD6Ev27wypQ+
 YBCn3spA7zAsaVEDWRr5VSyL3v52Z4dEsrg+/NxbFbsmd+efaxQFmEzum2Ylwn9LZX3O
 h1VAVUMrud3BN769hZxmCOjvwL/IaN9Riagw8W/wmOyHDMxHN2Q8xembeoiFPZgBjN42
 y6ow==
X-Gm-Message-State: AOAM530W+E5z96LQk5GcKZx9mUrVMTT7DZOiUX5yJTAh2YZ625RuLEQs
 HpmKgMh3qjfz7B4z6O3crIhx5xiCfJgn1bjl/ZPvKNS6fJCw8g==
X-Google-Smtp-Source: ABdhPJw9oBYZhhZh6gP33Pk3PVnTRAC6DFGWuA6pqvOdVIe6pFFeDTN9YK9l39KgSC4JfTxAbBtMzklzrsu3QTqgp28=
X-Received: by 2002:a17:906:5594:: with SMTP id
 y20mr628540ejp.196.1603341669147; 
 Wed, 21 Oct 2020 21:41:09 -0700 (PDT)
MIME-Version: 1.0
From: Ashish Madeti <ashish@provakil.com>
Date: Thu, 22 Oct 2020 10:10:58 +0530
Message-ID: <CAFzYBZ6LPb-ro=2F1GvRseav+67vkgVQBDJmECEbFAXi-94LNw@mail.gmail.com>
Subject: Transient Connection Issue
To: wireguard@lists.zx2c4.com
Cc: Pulkit Anand <pulkit@provakil.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:40:48 +0100
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

Hi All

Background: I am using Wireguard VPN to secure intra-server
communications among my 5-6 ubuntu servers sitting in different data
centers.

Today, we had a downtime of around 15 minutes because the server
running nginx was not able to connect to the web-application server
using the wireguard interface [0]. I ascertained that it was not a
connection issue between nginx server and web-application server by
trying to connect to web-application server via its public IP, which
worked [1]. I even tried restarting wireguard service [2] on both
nginx and web-application server but to no avail.
So, before investigating further, I decided to first route all the
traffic to a failover server (which was also a part of the VPN). It
took me around 5-10 minutes to pull the latest configuration and
application changes onto the failover server and then route all
traffic to it. Once our site was up, I again tried connecting to the
original web-application server from nginx server, using curl, but
this time it worked fine.

Can anybody help me understand the problem or anything I should try if
it happens again?

Please let me know if you need any more information.

[0] Tried via curl. curl 10.0.0.10:8080. Received the error
'Connection timed out'
[1] curl w.x.y.z:8080 returned the html content as expected.
[2] sudo service wg-quick@wg0 restart

Regards
-- 
Ashish Madeti
