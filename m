Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A6BC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 09:09:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C53AA2081C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 09:09:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaYqVPwe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C53AA2081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ec28fa5;
	Sun, 4 Nov 2018 09:05:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id abb0156e
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 09:05:02 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b01f34b
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 09:05:02 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 124-v6so467148wmw.0
 for <wireguard@lists.zx2c4.com>; Sun, 04 Nov 2018 01:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Z1I64mfHqX0FlWzQM1Tlhm3IyzPO+hT6N3uI01HYvPE=;
 b=eaYqVPwekhRhIXubOH/E8kaPFYyltXOzsHxux41TEJf6lbALIn8fkczi2xPsG77GvU
 IN9urYvJ02ck3jfmPsP5KVEtrJVS3Xtri5w2YfgduwN3UWuBOr/awBymS3NqyLj7zitc
 ap9aC8sBYmKqgvFstsZy2Sne/BokmJqidnc2U6yPKTuvXMunRG+fUMT7DQaO6uVLaFGG
 6GZW2n+Hl5POvHgvwBZsJ8eA0/28jgeBAZNlEGXDsnCwOqsa/PMsBXDHHjw9fyffOjLP
 va0IT92ZN0YI/jSooaNTU9wQlbWvgS/VQQP0Yxz9MleJm+4Ju45lOVqPGLdFZllUTyyd
 lODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Z1I64mfHqX0FlWzQM1Tlhm3IyzPO+hT6N3uI01HYvPE=;
 b=Qi2+E6AVtoUBL0O3zp1hVfkA7inPYWsbr41Tk6Mu9Z0c4V+80pyXcAlgsw2NInmrU7
 OV9V9OYf/7yoa75GypiHv6ZaEffe5JvnC6Qp8s0J4tYL1seTBZokSWORd6QMaKchUFGF
 aUwCK2W/VLy9lKv0hE4DIcs6TKQjI9ZitnUi4c7Pn4THukA7yghahiKkFSoWr+vG9OT/
 funKAdOt2Xrt49M5M1ewQ+AMeDtlbnIons6NS+YK00hcENYUXBc+EXBdYd1DapVT29VH
 cyKdoS/vKJZ01SEkdza+CzGoG3wG6/Ljd0CBJ+w1dQ3XoDICMJKHoh1f6jx8Y0TEXFA+
 N/gQ==
X-Gm-Message-State: AGRZ1gK+jtKuYixwfv27S5mGfGa6FJ6HyS96TCaloCcPci4UEq9CUG0W
 RKjW07niRt7mZayxwWk4FwQl7v7n
X-Google-Smtp-Source: AJdET5fh5n71BQkM+/4ozAPbm6B+ZN0mNbG51f8Us9FarneRHhN96Rlq9I1U6p837IGNECo0u/g4RQ==
X-Received: by 2002:a1c:3b06:: with SMTP id i6-v6mr2695939wma.18.1541322545414; 
 Sun, 04 Nov 2018 01:09:05 -0800 (PST)
Received: from hal.home ([188.25.94.178])
 by smtp.gmail.com with ESMTPSA id l140-v6sm58094513wmb.24.2018.11.04.01.09.04
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Nov 2018 01:09:04 -0800 (PST)
To: wireguard@lists.zx2c4.com
From: Adrian Sevcenco <adrian.sev@gmail.com>
Subject: match on wg packets and redirect
Message-ID: <22f7e0cd-b0cd-aa6b-29dc-18ef2d689c2b@gmail.com>
Date: Sun, 4 Nov 2018 11:09:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi! Is there a way to use iptables to match wireguard packets incoming 
on 443 and the redirect them to the actual port?

In many hotels/hostels and other free wifi it seems that only 80+443 is 
allowed but amazingly both tcp and udp...

Thank you!
Adrian
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
