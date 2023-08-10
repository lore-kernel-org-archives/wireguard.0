Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B2FC001DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Aug 2023 03:51:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02204f96;
	Thu, 10 Aug 2023 03:51:42 +0000 (UTC)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [2607:f8b0:4864:20::42d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 451d9a93
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2023 03:51:40 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-686efa1804eso343685b3a.3
 for <wireguard@lists.zx2c4.com>; Wed, 09 Aug 2023 20:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691639499; x=1692244299;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bs6Ef6YrdVWVUnL/f6Y1+3WIGcGsCnnft8o7I+1bo8I=;
 b=Pv/3GwyC4R2yug9R8mfhJ7ss5g1pCGESy0co4/XV4Tbu6ZAOm0gNa/C+RjtzH6Cdqs
 NIrTqLkzUEMxOOJ84gKgQIKSzjmE9h151L9xhqUe2ohF7bVD4K2Tm5KZti5MdBeiAXKY
 wtjEfd4IZHdDsEMY8nMBImgJ1weUe9ltyLBpZ6YYt6GO7AsYabwMYjsybAQ+g6i+Xd80
 gSrsKbWatSNRw0XM5oe/17MCdQFEagTo/1zXJaNmF/IEIXpfDNIoxlgxDrnlEucY0wdI
 honuL9/vAGBO0BtbSHYjVpC6+0V5sAAe/j4MDYOYNgBAb23SHGU3hhgYQGdGDxmtWpC+
 Kd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691639499; x=1692244299;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bs6Ef6YrdVWVUnL/f6Y1+3WIGcGsCnnft8o7I+1bo8I=;
 b=IxzDBs5DHZ4FyP4zN+HaedhU0gRgHTAEPyo0asuxs0UaE44gBBJXNJXvHj4Ri7FZC6
 SOibraTflh4ln4bb547/+eQ5aH/Hr/xi824uJZNI4C/3gHd8GEBNR0I1EzzAY6dOvc+m
 hk0CfGITnpt4fUKvwhqDRqLx0EBGf1/o+Y4KGpQw9/8lRRTS8Wn4beW+SrkWQ9PeHNgI
 mW2SQgfhdlnBdVtPrBXZ/JXEI1drcEIJfrAd6g3ozxFQ6xwHF960aTbfAX8W6FeGf8KS
 J80FWG4b+dJJk+n/FO9m3mBY3mHfi2gkHkx/hStzCdGVEItKNZr7faLNSGLIXcl2OJV2
 yigw==
X-Gm-Message-State: AOJu0Yw7rKTjohdfa8NjIUspyCxIALapxCVBTkiX27k+5EranHUlhDnS
 9moBDD9PnQc6rJuekth+e7HPB0Irb9oWVmVD
X-Google-Smtp-Source: AGHT+IG3L8WieweZZ1bML8G2/5QHI7N1LZEy5QozfZwV9D4x8gUxhvrvoMrQYcv1wBgzRpCDfDWkLg==
X-Received: by 2002:a05:6a21:9993:b0:138:3302:1471 with SMTP id
 ve19-20020a056a21999300b0013833021471mr1526105pzb.6.1691639499013; 
 Wed, 09 Aug 2023 20:51:39 -0700 (PDT)
Received: from Laptop-X1 ([43.228.180.230]) by smtp.gmail.com with ESMTPSA id
 k4-20020a170902ba8400b001bb4f9d86ebsm381216pls.23.2023.08.09.20.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 20:51:38 -0700 (PDT)
Date: Thu, 10 Aug 2023 11:51:35 +0800
From: Hangbin Liu <liuhangbin@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
Subject: What's the wireguard-tools
Message-ID: <ZNRex9yqvEekpU/h@Laptop-X1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Jason,

I'm maintaining the RHEL wireguard-tools rpm. Recently, There is a request to
convert the license tag in the spec file to SPDX format[1]. The current License
tag in wireguard-tools spec file is GPLv2, which is the same with the COPYING
in upstream. But when I searched the src files, I found there are kinds of
license identifier. e.g. GPL-2.0, LGPL-2.1+, MIT, GPL-2.0 OR MIT, etc.

Do you know which one I should use at the end? Should we unify the src files?

[1] https://fedoraproject.org/wiki/Changes/SPDX_Licenses_Phase_1

Thanks
Hangbin
