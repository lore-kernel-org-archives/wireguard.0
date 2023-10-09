Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3352BC00A8F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Oct 2023 14:24:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2ec23ae;
	Mon, 23 Oct 2023 14:07:38 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3c805854
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Oct 2023 18:51:28 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1bdf4752c3cso28783065ad.2
 for <wireguard@lists.zx2c4.com>; Mon, 09 Oct 2023 11:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696877486; x=1697482286; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RXVZw/puk3pyJYfxQZZSBAU8OTJc7ayMuFr3ZOfahXM=;
 b=Obhqh2u7BVeQJC2nSTLHT+MDxYO+ox3Kphxk7QFT6E6U77lpkO1OAuTdYWOR7GNldo
 U7hiQFL9qaZaxV5QDTm54YIemAeWoW7Z/XoJmnLsjW0y2Aq/VwzcYnKgBUT34GtQ9w2l
 gJLbiQowEBVil64TkO6AE5AjmD0T3vDIUnkEve8e+u2aAyqrurE0wK0iy/hjEUzCO5p0
 w92+p0Ka3WvebF0actrKCCRvQ8Zja2J16+ObXmB82SPgVM0sNoTrtuS9QVhLfCtaV3ot
 9q79LNFy6tLVhudV+9pmbH4SUyNBJ8gmfWjw2Wiun1tNOaz68fAONP8ofmnNeZ/93mQd
 WUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696877486; x=1697482286;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RXVZw/puk3pyJYfxQZZSBAU8OTJc7ayMuFr3ZOfahXM=;
 b=VDYLPWura1HZbTOrVSEJvRZwA4a/UW+v/x36XYpP4Apgck7w5f+jZmc+ttnfGGqxM8
 zrmjWHBR22GfXWq3h4aHaik1r/ohx/c0PabmdXoMg69gX326iNE395ARcpNJTTrJwvqB
 CXQQHTD61wCMftmGVz5EImQ4s24Z950vUmYc7VeVKixDLEG8WUevLWnz7tqozXwZjUZ4
 Jp1ouVESILcUazr1iaNfVw5wTs/WWgj4CY/Y0Rj+RsgKvr+yu7RcrURf3eBCFPYXG7SO
 ++tFtB5DmTJ8mepnlNHjXjl7G9PRTaPZwil9NF0LL87uEluQAmKwnT0u1P3T6VOG/jZ2
 AcFQ==
X-Gm-Message-State: AOJu0Yy+vJzWbcCEHY9tBqbbAMphkxJUtfS9E0I0aSucR5JOLaA2ccVS
 uEakNyoEeQdVu8odLs5GdG63NSrHVa/0YaDsVsmFzsINZnSLig==
X-Google-Smtp-Source: AGHT+IEHkeQIxw19ZE5Iz/zxyU40HvZaSp1qm4NEhPV5opcOI18SR/qvm78G2QcWyfMOtkfKSiMkKJnLQxbSkL7kze0=
X-Received: by 2002:a17:903:1207:b0:1c0:bcbc:d64 with SMTP id
 l7-20020a170903120700b001c0bcbc0d64mr16312387plh.51.1696877486392; Mon, 09
 Oct 2023 11:51:26 -0700 (PDT)
MIME-Version: 1.0
From: Jan Kleks <winebugs140@gmail.com>
Date: Mon, 9 Oct 2023 20:51:15 +0200
Message-ID: <CABZ_JDeYrF3TXcoO3cVE75H47zf7e1p17SWM6Qg4FUECCTh8nA@mail.gmail.com>
Subject: WireGuard Android TV app feature parity?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 23 Oct 2023 14:07:27 +0000
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

Hello,

Are there any plans to implement the features from the standard
Android app into the Android TV one? There is no info on the TODO list
regarding this matter:
https://docs.google.com/document/d/15i0Z750eL_OlUyrypUFLF7Hoi5eoF-dTFWj-Rs4RXGI

The TV app is really barebones, there is even no split tunneling setting...

Regards
Jan Kleks
