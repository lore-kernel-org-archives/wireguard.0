Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA731D49221
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:24:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e1da928;
	Mon, 18 Nov 2024 12:38:26 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ef6cf6e3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jul 2024 09:07:47 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2eea7e2b073so25866601fa.0
 for <wireguard@lists.zx2c4.com>; Tue, 09 Jul 2024 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720516067; x=1721120867; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WHj+zDmT5CDS1arrVDBySf0N0PRuCU4KzwZLCRtwx+o=;
 b=dz3Ed7ElTXx+ONFzQq6+Ax1QzCUJQbj6geW/b6nitz3Y1zw0+PYFmd6TnQ3Qq6/ocu
 IZ8Zg6ERNZU7jQeZ43Au7rd5rg2sePE80akxLo7zZhFcnuTog97YaDcZZl9RiBsRq2qa
 V0FprQVy8R0RaugacY6epf3CoNbDWdUxjAlFA9B5dbABuYzpS+0/t+13JK8tJ46Rxt/9
 ubb3gGFooOge/pc2iuvxG90EUo7kmII64ocHYqd1qTKKxPTRlw+XlL45fvu8/LiHasCf
 fj/lrC2baTG4D7kQYYrEEe0Zyrj2FnwhUGI6IT924/xXI1oakT2DlKE9KMwIKBCNNoo5
 OPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720516067; x=1721120867;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WHj+zDmT5CDS1arrVDBySf0N0PRuCU4KzwZLCRtwx+o=;
 b=Fvto+JDoLHilBw0Zkh/8f8HHGu8rjVXYoflHI/82t5esLPTAmwn7hUH5btaOD+p4LG
 eABJAD0s8L2UfgoM3MzYQLSI/TKEhBi9NkEsyXVnS8F0FUDmfezkewTsvTO4JVkAlY64
 2LA7coDO9DRN9D2mC2gTPrgOIna17he4Qe5CooZ5/DLkhTGXeY3CxjjfqD4fWRzhqQM1
 +JIkBL48jsmvao9N7FBvf3196BsXROJWbiQ8iUl39EQm/Doz+rbSeXh6ZYo7pY8gx3uC
 dETAIIIu4ASgo4xJwTiqoHKJj0y6S/lQBu23Xmo8bM+uKpDUWHxrCJVrazOc90SYqXrT
 CuZw==
X-Gm-Message-State: AOJu0YyGHssmbY8esGVsz5MTbC9Kc0eJTRg/NE+yKClDsh/zv09uOSxr
 E3a44Qz292FzMEw1TRwdezyylL/JTy7esKvYK4YgzJ+nWvYB2ZQP1gD5lg==
X-Google-Smtp-Source: AGHT+IHqUByf5PBIHKipFboxjlusgpwtO15qAvYPjnMrnbSgPjl36j2DrkL6NRebNB2fKQG9Rs/SPw==
X-Received: by 2002:a05:6512:33d1:b0:52c:e047:5c38 with SMTP id
 2adb3069b0e04-52eb99952cemr1255487e87.15.1720516065340; 
 Tue, 09 Jul 2024 02:07:45 -0700 (PDT)
Received: from localhost.localdomain (77-46-243-132.dynamic.isp.telekom.rs.
 [77.46.243.132]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42667720667sm87002695e9.33.2024.07.09.02.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 02:07:44 -0700 (PDT)
From: Ilia Shipitsin <chipitsine@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Ilia Shipitsin <chipitsine@gmail.com>
Subject: [PATCH 0/1] handle potential strdup failure
Date: Tue,  9 Jul 2024 11:06:45 +0200
Message-ID: <20240709090728.872-1-chipitsine@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
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

if allocation fails, strdup returns NULL. 

Ilia Shipitsin (1):
  src/config.c: handle strdup failure

 src/config.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.43.0.windows.1

