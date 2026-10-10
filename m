Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B8A606A31A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 19:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror header.d=gmail.com header.i=@gmail.com header.a=rsa-sha1 header.s=20251104 header.b=QOtuzaun
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8a88a2ad;
	Mon, 26 Oct 2026 19:53:41 +0000 (UTC)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [2607:f8b0:4864:20::32c])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 4f4840c2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Oct 2026 16:03:30 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-82374c2d7aeso653661a34.1
 for <wireguard@lists.zx2c4.com>; Sat, 10 Oct 2026 09:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791648209; x=1792253009; darn=lists.zx2c4.com;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O1JlYyGO/kBtbkrsXrC4IE4AnhtRmTQaIdHHgnGUgdg=;
 b=QOtuzaunJeqEvg7SRGgMZtjW44qhzgiVZLEbnngXG60TDg+pxA1cadmJ76BXmZwJM6
 0BL5CJ1gBM2C+o95CdJW/jkyTT929Kxaq84/EljP+tfqLAvC2wZxld+vnhNMZtyNZX7u
 IV1SzL+AKdautrEC9KeaT359leVh+aXcaXyLIeNm2PnO9xTWZBOdsHf1zwSEBOxD3WJa
 F0fM/4ih2AaqVsM6uz2J9Yx3nciZYx2rsKBYXN6IBFiI/G0tcUar3PaFpMzbbcnuUuO2
 M06Vrqr8weyPujVrBY2xWDoxg1JkZlohUkF21fYmPtNeJNBfuZL90i+39PO5H2Ql9YKl
 sVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791648209; x=1792253009;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=O1JlYyGO/kBtbkrsXrC4IE4AnhtRmTQaIdHHgnGUgdg=;
 b=fbgQVm7CMPX0jpuvgLe1MF3ocqKO8vVnNkALxK0Etgi1JJC3ZhZVW0NbT8iXdYPs0O
 7IBlYNXMGcg2uYmQnHoCFG0qzxj0WEuPyCUlyy4L6PjzsH+P3K1hXTFP/59J2HRbRjwb
 t1NF8X+44BJdylEJlTfCtQVUiZkIitAUMy4Bh4rSQftMKF2QEr+Q9WpBsKmnz2oPGC3p
 a3MNYwvh1EvHZGVldAs8ervxc4xlwhqYqG5R0z5qehJRkZV5CrRuodKW320XTX0OmU8u
 PSDnUbFDGS/nKFd97UhclBLTvkIl6MrENVijazFxLBnDblGrEpH1281FQbNPPzvIspMX
 HJEA==
X-Gm-Message-State: AFq9FYJ3d/9EOK+wXmP264UchDsiZB3SPZB96OX5YnUoK+GsLk4gbWZ7
 +p9j4a5G6hqpwcs3F1flPSdS+q2oW5A8PWUI3YiIjq0LI8DX2owASyqIGqCPqA==
X-Gm-Gg: AYBFou0VcwGXvzYpu8SLuRlk4LpECaIGDeIpEaYfO1oMaFrf4snFecuJLAFVD2w4DUT
 KVLm/lv2FDCL2kl2O6iEe7LwA0+ntK3ipZiIzsMYoTUg6XZn38Njp121BtwXb2S8k4ra6ZqjETz
 ALdpe0udG7LLocv8L7R9Q4iKxTvHgataEoiSzh/c67qZaxLEfdWHmQ4N1bad1pDbZtzbxKdPqON
 pOwr9gBVYTwCk1unGXHjSf+Wq35dQtrbmFogWjCYJmqDmKNzzyzW/WcIgAgtywPBzpwiB0C/Ic+
 4GS4SbsN+hwWG3SDpx3fWMQ23VPVWngPpW/uWh5pGpp4x0LhCBptVLVV66Sgkn4Idu0OXPCMI64
 emzvJeGB/z4HFpcUqCVMmoD+ZFF1SjTGUzu2ZgufaoG60agIwgJYhPemxWWfRAcNWOr0bb9dIey
 XeUJUCAiHK9M87HegBlSr0AZOSfFRltzi1NuzgFgijRvm8I158ieb9B5FzydbypHB5jj2xWiz4v
 hPNsOnLHy+TknKGXYSetKfXFCrQ1oo0kQGV3MA85yuxXsnKBLWhD2G/YZZTA3b1B2ZW
X-Received: by 2002:a05:6830:6dc8:b0:82a:2aca:30b9 with SMTP id
 46e09a7af769-83027f9973amr3230637a34.11.1791648208740; 
 Sat, 10 Oct 2026 09:03:28 -0700 (PDT)
Received: from fruitbat.pteropodidae.net
 ([2600:8802:7f60:800:f5af:3c13:a013:e022])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-83039076d67sm5184385a34.13.2026.10.10.09.03.26
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 10 Oct 2026 09:03:28 -0700 (PDT)
From: Loren McQuade <loren.mcquade@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/2] WireGuardKitC: include sys/types.h
Date: Sat, 10 Oct 2026 09:03:02 -0700
Message-ID: <20261010160303.2853-2-loren.mcquade@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010160303.2853-1-loren.mcquade@gmail.com>
References: <20261010160303.2853-1-loren.mcquade@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Oct 2026 19:53:36 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With the iOS 27 SDK the WireGuardKitC module fails to build:

  error: declaration of 'u_int32_t' must be imported from module
  '_DarwinFoundation1.unsigned_types.u_int32_t' before it is required

The same goes for u_char and u_int16_t. Include sys/types.h before using
them.

Signed-off-by: Loren McQuade <loren.mcquade@gmail.com>
---
 Sources/WireGuardKitC/WireGuardKitC.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Sources/WireGuardKitC/WireGuardKitC.h b/Sources/WireGuardKitC/WireGuardKitC.h
index 54e4783..84c53f7 100644
--- a/Sources/WireGuardKitC/WireGuardKitC.h
+++ b/Sources/WireGuardKitC/WireGuardKitC.h
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: MIT
 // Copyright © 2018-2023 WireGuard LLC. All Rights Reserved.
 
+#include <sys/types.h>
+
 #include "key.h"
 #include "x25519.h"
 
-- 
2.54.0 (Apple Git-157)

