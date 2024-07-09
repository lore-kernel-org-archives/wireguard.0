Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDC5D4921C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:24:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e27cc12a;
	Mon, 18 Nov 2024 12:38:28 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id aee6b01b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jul 2024 09:07:48 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4266edee10cso7631075e9.2
 for <wireguard@lists.zx2c4.com>; Tue, 09 Jul 2024 02:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720516068; x=1721120868; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+wMZ3knmgNnETbYVjfABw4lz2vIC5p+3nQgT5amumDA=;
 b=Fu/tH13TQqR2IjnjctiznmeEqq8y+aH1knD7Wx+sZxKnMAqJ1GNSQUuA3j/A0av5Ue
 2i/Kz7GvM5baYlrYZko8enocO+EhFjm46701NYFOB3jp9JNCJZoG+h3KFFj8Qsjvru5v
 nKxLAuAWn9IEeuPzy4MQGn15q+uiIO2zi/gE+LLTXjH6o3OvzhtLrXMnZXNtDvMODpYy
 YNDFtpNH3UxqF1wVhrKNJHyS36e1arIkbjkYi5MU5c8VgaDEfmfNXtiTvbderZ1kKklf
 LycBLHwcs2SQAOMVSy5Eg7oJe9ikUJt8Xh2lZMP4yH9UFEU3L2RDC72p3T1ooUxbsUHF
 N46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720516068; x=1721120868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+wMZ3knmgNnETbYVjfABw4lz2vIC5p+3nQgT5amumDA=;
 b=XKKz7Us+a0XLTn/0vNRKg/ois+f+lW/qVx0zGssM8LS8hj0etQVN4l7uV2Zmyc7Ww3
 pxQgFuuMDnE/V1D8ihBeQ1hu6DkXS6w5aDdUr/OoEFc2ZXXPYMcnBoKFuGrpWTjs5L7E
 ea58A3jmZBIeZWEJqIKOveE31Zjbvbjbtw5JfFthrwnVaMDA0yLEd3cV2Bu/jzqEDk8q
 VWFjudMa1C1fbnmJTEqbXIQOJ4sLQYNUKDu2/1yzdAdEgPLMqTvs34Ou/rmDIMXxObNY
 fM108flceMPc2XeahPmQe/30Si+nPzhEMYDBrk6cm30G2QRBAqmUiqMmOxD/gPGoNl5p
 xXTw==
X-Gm-Message-State: AOJu0Yz7AlqK+Hbe7RuxSuQJ9+U7Ezp4aeqvE2A5p306AdEMMs+Lafck
 tr1tCiM5XNDX98SvN8lEP1aD+Xom/aPwsI893FFCNRRZOWKHp2u+I0y+qA==
X-Google-Smtp-Source: AGHT+IGecTWu8DaTyP11oetYeEJXLMzmmNOKQR9gyOR6ojGLSo7kklSCCEbEceIyuzgMApovAipywQ==
X-Received: by 2002:a05:600c:178f:b0:426:5f8f:51a4 with SMTP id
 5b1f17b1804b1-426707d89e4mr12422335e9.12.1720516067326; 
 Tue, 09 Jul 2024 02:07:47 -0700 (PDT)
Received: from localhost.localdomain (77-46-243-132.dynamic.isp.telekom.rs.
 [77.46.243.132]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42667720667sm87002695e9.33.2024.07.09.02.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 02:07:46 -0700 (PDT)
From: Ilia Shipitsin <chipitsine@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Ilia Shipitsin <chipitsine@gmail.com>
Subject: [PATCH 1/1] src/config.c: handle strdup failure
Date: Tue,  9 Jul 2024 11:06:46 +0200
Message-ID: <20240709090728.872-2-chipitsine@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20240709090728.872-1-chipitsine@gmail.com>
References: <20240709090728.872-1-chipitsine@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:38:13 +0000
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

Signed-off-by: Ilia Shipitsin <chipitsine@gmail.com>
---
 src/config.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/src/config.c b/src/config.c
index 81ccb47..f78e076 100644
--- a/src/config.c
+++ b/src/config.c
@@ -357,6 +357,12 @@ static inline bool parse_allowedips(struct wgpeer *peer, struct wgallowedip **la
 		char *end, *ip;
 
 		saved_entry = strdup(mask);
+		if (!saved_entry) {
+			perror("strdup");
+			free(mutable);
+			return false;
+		}
+
 		ip = strsep(&mask, "/");
 
 		new_allowedip = calloc(1, sizeof(*new_allowedip));
-- 
2.43.0.windows.1

