Return-Path: <SRS0=ifwh=XT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FACC432C2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Sep 2019 08:57:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 563762146E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Sep 2019 08:57:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hp4S9xO5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 563762146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a83738fc;
	Tue, 24 Sep 2019 08:57:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a5b8140
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Sep 2019 10:36:14 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2865803e
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Sep 2019 10:36:14 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id c195so2444412lfg.9
 for <wireguard@lists.zx2c4.com>; Tue, 17 Sep 2019 03:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JIB+pfNfT6Z5CdsqUgX1GWYlMkHGREgjdew8YL2MB5k=;
 b=hp4S9xO5YengponZAM1I/w5LrHWj+Loex5+j8yzRoJJYZ7S9zk2TT2VVQdylqZNAmQ
 0QDMkP3Qc02p8kIMjPWm2zFcks/RF3TBm/UjGPzno2EEZPhX4no/PN4ZdtEj+u5dy3S+
 Iz8uSef2jMl3BgiYm1qOD/5W/rDANEFwZcxzZ1cHY8Tmk+wYAHsXPvGxWagQzaOkpDj3
 1QzahNrPmW4z+kguKr+P+nnXnTLGTrQHOdvyjCbiYNHRsmJzXWh/8S3Uc9bRRi+IpB6V
 OaXB+mu2xG9oeGnapdildHE2W0MjjRid4dt37WoZYR9QUSKRpk28goTeLc3oy5LbGMKf
 qUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JIB+pfNfT6Z5CdsqUgX1GWYlMkHGREgjdew8YL2MB5k=;
 b=uHNN3sxI2514dzE5y9ZiYlkEoha7DUxWUuHlGTBzDwHggJMa2VxMeGU7GcisC0m4wu
 yveL13ogQLNvh5+y5K4Akewrf2+WdYEKLTzuGV/DMzvo7eQgNcNB3t0rYDmFKwP7c84F
 0/Z3/0nqSD6+RB4XgsntPeyVEVGOQfqu9qpAKnPIoeHaONQu2BbIqL83xv4+fK2vM7Bv
 Zg89kqHUS98WoiADgNoW/wcOlFPJywqxTEqGJSqyuY/RUxLaN2y4g4Qww73EWWAc6Adx
 zJdCErkDNek9jybKC+seyqLY94Y/WfMUv2tGe/fI+TlngZiNqD086JygBbn/5cHiZyfk
 dDxA==
X-Gm-Message-State: APjAAAUpu+UU7J1hX1sej0igy1kvlUl9LRpYxoFtX7VLQ7O7OA3zv6Rj
 CXdoXlhkt4DSre7cOYZL9k9TMfHN3eo2WltIbIABqQ==
X-Google-Smtp-Source: APXvYqyp2Gr+R15nYu20hkhldY5Gholt4Lq5/nEb6AzYwBJkbrSbXpAq+/q5RhazZKm7P7xwOTJTkXTY3B7K4h9+3Cc=
X-Received: by 2002:ac2:4c8f:: with SMTP id d15mr1864923lfl.74.1568716572891; 
 Tue, 17 Sep 2019 03:36:12 -0700 (PDT)
MIME-Version: 1.0
From: Mathieu Dolmen <mathieu.dolmen@gmail.com>
Date: Tue, 17 Sep 2019 12:36:02 +0200
Message-ID: <CAPYL5WkE5_pNP4MxLuyLXyD+HWW6wY1QVzZqqpEdD7Fr_QRQJQ@mail.gmail.com>
Subject: New contributor introduction
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Tue, 24 Sep 2019 10:57:40 +0200
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

Hi everyone,

I'm new here and want to contribute to the project. If you have good
first issues I'll be happy to help.

I plan on working on the fq_codel integration to better manage packet
queues. I have little experience with kernel programming so it could
take me some time (2-3 months I guess). Let me know if that's ok with
you or if there is someone else already working on this.

Thanks for your time,

Mathieu Dolmen
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
