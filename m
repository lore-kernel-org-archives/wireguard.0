Return-Path: <SRS0=B3Yb=IO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C90C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 13:36:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 587EB64FE0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 13:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 587EB64FE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dbba32d4;
	Tue, 16 Mar 2021 13:36:42 +0000 (UTC)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ec7e2ff6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Mar 2021 22:52:41 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso378829pjb.4
 for <wireguard@lists.zx2c4.com>; Mon, 15 Mar 2021 15:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :to; bh=CeZmgcMvsUSW2K5/jbMZTmRXVO+bbf9e/jMqVe2wpGc=;
 b=qg7RW8fcUnGjkjKNp82gLx0QKkD+A4V6rAhnqF8jnR6u0AYxA0Ck4z+SzQW1QKdIT8
 U0+F3202Uo915n2pdyIkHnvIRWsoyVgo3qOqsvTTOeouxb8KQiOAEPSpR+K4i9mrmzqI
 bOcs+7dhifQAFpNoADfdZKaAdNKALdEBJgb1ecfUXVqykieVoVbLqyADAZsCTj+I9lt2
 2iPdOjiUfwsu/vZBix17WviGs23c0ntDt4FhHosw43REQ34DYXgfMLScUZAVBbTZE3El
 GqBUx04s+o8/H/pBIweTdiR5hZ96z/Em2pScYULtTnt+slTi0PuVvmQSrtbDHZvA5UWL
 7IPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to;
 bh=CeZmgcMvsUSW2K5/jbMZTmRXVO+bbf9e/jMqVe2wpGc=;
 b=bcVntWcpCloD81LKMcT3du4Sf6u3SX4y+Vwe84jvDSGzy//By6cmfLbYB+L61QhmaF
 gwxABPCSWja74hzEtO1Y5OEP+Es475Aw9ZxS2hXnheooAoQyLfU7LcMxAotq/URdaTfR
 HqVHecl3YoX0jd7n0PS/bYViQH6sk9mXU2b84EzQlZdsHTXeTZMq5jnE5v+6NsxYC6tl
 lslfkVkIs20fB7oBTfJbADIGnlw+61p3RLXQcElCKHXjNi9Gkg5BzwUaWD7MliVs0fGr
 pnDmvovyZPtX3zQCxD2gb61Us9hhA6swGqUnr9ffqQ1J+iy/wyJ3bC6k41sAzJHJZztb
 AnBQ==
X-Gm-Message-State: AOAM533U/fRJdp7T/O1mIXsfRoW5sP41Uajx2tyeEEO+iTi+/AEt0tRA
 +SLuwKQeVZpqG++YKZADxlxc+qM+qk0=
X-Google-Smtp-Source: ABdhPJz8iGzFtfwfv2MFf581RbJHX0y2vomiTezC6bY1RODO1Kc8Z47OHkNFx5Be6IgcfnEL/IzG+w==
X-Received: by 2002:a17:903:30c3:b029:e6:5008:f7a7 with SMTP id
 s3-20020a17090330c3b02900e65008f7a7mr13660318plc.73.1615848759240; 
 Mon, 15 Mar 2021 15:52:39 -0700 (PDT)
Received: from [10.78.6.105] (89.208.241.197.16clouds.com. [89.208.241.197])
 by smtp.gmail.com with ESMTPSA id d7sm14041179pfh.73.2021.03.15.15.52.38
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 15:52:38 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Daniel Yu <leptonyu@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 16 Mar 2021 06:52:36 +0800
Subject: Is iOS testlight available?
Message-Id: <A7D1188B-A61E-4167-8BBF-A06F2AF3F1F8@gmail.com>
To: wireguard@lists.zx2c4.com
X-Mailer: iPhone Mail (18D52)
X-Mailman-Approved-At: Tue, 16 Mar 2021 13:36:37 +0000
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
   My ios version is outdated with TestFlight.

Thanks
