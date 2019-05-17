Return-Path: <SRS0=x/BS=TS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D07C04AAF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 16:48:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B356E20872
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 16:48:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPoFr2ph"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B356E20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17a6a24d;
	Sat, 18 May 2019 16:48:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1c54ec2
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 May 2019 16:28:56 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f84c9901
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 May 2019 16:28:55 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id n19so3939742pfa.1
 for <wireguard@lists.zx2c4.com>; Fri, 17 May 2019 09:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=SP8Vsil8dV149Zr672s3TdeaaivGz56Ewhd5tB0FFvc=;
 b=pPoFr2phyTk29mn2/Lx0596WuC76ycgqs/SsgBaYIwvJZNRXPKNxfp6uVKo+DFbroc
 LxsOsnIdmsJ+exlrGOuCzWb/GatTBKePxB93C93Q3ABAluyYW7SJylTyratOeHMUXq5e
 kL3O7X9r8nUpUhm+soqW5ypIWOFJsbwDPiIVetdcQ+vOlI7dOYCbFuTcYHhmarOZWtxs
 zlvVyv/AufVER/bzv9VKn1WdjoiawmObMcD33e+6VhBvHALTboNCn/kS57FSXqyX3oHf
 RC8tcKE/kris4dbea+18y65N0n69H56evPz+hw3k/6Ipx82ZTytb9DKoIhoFZym0D/tf
 oWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=SP8Vsil8dV149Zr672s3TdeaaivGz56Ewhd5tB0FFvc=;
 b=KIa0v0FIpo9LjY4KeYj7Ee5r04xd/wKRLpl0epaz0QqO35KQ1UJmWnLdGFE1lYBFZC
 Zz3BXKL80wOsgEl6XQZxfxHD5uaNfA2yN8CJYJ0vxbbztqYFJWKgQTQnEXyRmagPXuDt
 vor4H/1/xwq0K3W1TmkCPTMzPrukBkNb7dacZajY48ePf+Ai4pzJ7wnMN39j19q0IXPd
 G9RNvx/bkvA4eazBImxvZrdt6lhd5H1aq7r02slh/keaO2H516TQF/ElsHGVi8Sc83PO
 YRioGfGsqABW957GDmCb3zwmM+Bns6j2AuruGWyvbkJaLQzfMxns40BzZ/pIHQLU1D1S
 G39w==
X-Gm-Message-State: APjAAAVc3IVlSgQDqGstxFxGHHLDI8sW4lRjfqB45h5VsNl+++v1hIJG
 2ygpT/3L38NLRStuXeDQH5ASpAihSjI=
X-Google-Smtp-Source: APXvYqwmxR7ZTMgfT9N8i5rRPbsijR1M0XFPeyBirtHsxiputSb14N/oIjJs+CVRwQVC2AToPh5N6g==
X-Received: by 2002:a62:1ec3:: with SMTP id
 e186mr15729895pfe.197.1558110534218; 
 Fri, 17 May 2019 09:28:54 -0700 (PDT)
Received: from [192.168.1.162] ([119.28.76.168])
 by smtp.gmail.com with ESMTPSA id i7sm4568025pfo.19.2019.05.17.09.28.52
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 May 2019 09:28:53 -0700 (PDT)
From: Chandler Ding <chandlerding@gmail.com>
Mime-Version: 1.0
Subject: [wireguard-ios] Allow user to specify the value of
 dnsSettings.matchDomains in func generateNetworkSettings()
Message-Id: <3474A89F-0C20-46D6-AA16-831EA470C2B4@gmail.com>
Date: Sat, 18 May 2019 00:28:51 +0800
To: wireguard@lists.zx2c4.com
X-Mailer: iPhone Mail (16F156)
X-Mailman-Approved-At: Sat, 18 May 2019 18:48:11 +0200
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

Dears Roopesh & Jason,
  Wireguard ios client works perfectly for me, thanks for the great work.
  Here is a feature request, instead of resolve all domain via tunnel's dns server, users may only need resolve particular domains.
  Could you kindly consider allow end user to specify the value of dnsSettings.matchDomains in func generateNetworkSettings() so that no all dns resolve goes via tunnel dns servers.
 Best Regards & Many thanks.
 
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
