Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8C9C83F27
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Jul 2025 22:44:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49624ffe;
	Sat, 19 Jul 2025 22:44:51 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 57c8b769
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Jul 2025 22:44:50 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-747fba9f962so3006686b3a.0
 for <wireguard@lists.zx2c4.com>; Sat, 19 Jul 2025 15:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752965088; x=1753569888; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rX0Pf8REK9TMWdAtTnj0GB3nrEpt4gmCBu2EAyyPZWc=;
 b=D18Xh6GQFc6VaX77Q5j+Ya8JeAxzLThglylTgen1AdqOQcC9b6JEQ6eYOOimKjPJ4f
 ncSZWrEzZYga+lBwF7qIvS7dM/aK4H8KjhvFBJPgCMvgGbHJ1c6KBzoO2Cio54IeSVrs
 MXzfPGxCh3esISDl9NV+IHqO+9hj2uzxtgx7IU3NnEQAVY0uiRXXEhNML/NLYz4/fKnz
 k4SvS1ICPOb+aUNhbnOMyi661mReCFZLx4XSv7ZGZBoHR4FkCxdpi2+mYHIYE+E1TdiL
 r5aYYxWuYyW53eN+EOtHfl3fB8XPhgvmlRKFbFsUt8HZw5wyiNepN+2Ata7yCAaNJsC6
 Sowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752965088; x=1753569888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rX0Pf8REK9TMWdAtTnj0GB3nrEpt4gmCBu2EAyyPZWc=;
 b=FZEjPfe/VecGHdlPJUulX0c6laKll1a9jkwGngncnm12H7zsI9wjxc76ND+FQuo/kr
 AK9orM24RsCIwuGg5tEKPMYH7JrKTWBOZ6JVMcPtaqIblwt5j6uRToa7FhvCwHHna220
 FWtjRjU+iyhnGzSARh8ILXzVI0ZkzHtFam/QuAjSYrmO25KRk9Qfyzx5hHcn1hE4kFDw
 NNsXhL+79ljaZ15mDBGBI87WVQQvTdaYUE1GFDQ5aareBOaK8P9gyNfZLy+qY1duC6jP
 Ap5WIMxXxGcc/wlYi2eSAwkX1yP3/aMLFkvpnJiXQi870J9dyt85LokfAhLI3nAJ0fCd
 n0Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0ijPjXCFr5ZgwPHhLTHj4JPq3j3aO9vPWY20cwMSBn9ykngtPv2aBf2ADItPnQkxHeC2xrSyRQj4=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YweQHrxIPXI4G4xXHOgt86seVuuw9ZgyZvitj7uM8ORPom3SHg/
 nN0NaFmP1ZyJCG7cqSSGvWhxotiLUfiDpYkVil/koWEzUgh1bibssGQn
X-Gm-Gg: ASbGncvi093TbN8b/zjZROkz6XIyxAMszR4ApkGVB1vMk/NRw/XbvnMO8LDKCAUH7zF
 vZTLZSX5A0QdNaEtRxbFHO+HBnQLC9gFKVoeADTI2xPmetWFWj60CvLS2idNg69OeBwP4z6gxqu
 bhTIg2TuYcJToOgLjpKymP7DsRhvsjl5F8Z9FAo7XThfMNzDV1He6OWBKCC77uDiFgpVH1xr1sy
 DC11OZ4shEjktW9msmk/uhiZ5YWt9rv/H5JxOxAZTU2ln1CAlpcu1LicxnoAzF5oURN5pJyr9v0
 KxolZQywb/XA3mffV2LqY5bYfyL35SmDiq9Z6KVOi6CAn4Ar+2N/noGj7qhtReNuOSUQtj6sIL2
 Plz3YYzFAa4pwIYSBZxqJKQ==
X-Google-Smtp-Source: AGHT+IH98UpilUFLm3CbbeUiySk0nOKqWXRoCDy4nXd63SqnoDS0iSFLv6lrwRFkLte9JmXI2aSaVw==
X-Received: by 2002:a05:6a00:80ca:b0:736:4c3d:2cba with SMTP id
 d2e1a72fcca58-75969abde55mr7634461b3a.9.1752965088409; 
 Sat, 19 Jul 2025 15:44:48 -0700 (PDT)
Received: from localhost ([216.228.127.129]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb15761dsm3340124b3a.67.2025.07.19.15.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:44:47 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH v2 0/2] rework wg_cpumask_next_online()
Date: Sat, 19 Jul 2025 18:44:41 -0400
Message-ID: <20250719224444.411074-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Yury Norov (NVIDIA) <yury.norov@gmail.com>

Simplify the function and fix possible out-of-boundary condition.

v2:
 - fix possible >= nr_cpu_ids return (Jason).

Yury Norov (NVIDIA) (2):
  wireguard: queueing: simplify wg_cpumask_next_online()
  wireguard: queueing: always return valid online CPU in wg_cpumask_choose_online()

 drivers/net/wireguard/queueing.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

-- 
2.43.0

