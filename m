Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F1AEF06E3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:13:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1da47c63;
	Sun, 8 Feb 2026 17:13:00 +0000 (UTC)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f5f57bcd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Jun 2025 17:03:30 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-7115e32802bso27681817b3.1
 for <wireguard@lists.zx2c4.com>; Mon, 16 Jun 2025 10:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750093409; x=1750698209; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nIXen2IWJ1nFMk/8G2Y6PbzVJ6y+M8EBmHILatDJo28=;
 b=frKmfbkMjq/8c8IpRJn24nVjFLKv+V98ND0/1SvgGcwg85XQ3MwD9b1PervIJPhKBt
 cxf/u8ge2ASzaqSmF30i3csk1NhTe9vISQplmkmntk5dB2u3uR9pW8V0JCrS0+TIoqnZ
 4Nc+WnYX42uw4rPSqTTnsYuKSDx32ZW6rtpyRDlIohslA+Wlg6NMk+Agco0Nod8/cqsN
 9ckZq7walXInUZyogL9hAVynDzshMO9vpw37R0mEbJtGZfUyDwVSjG+qxAZD26lPBxZ+
 tWP0uWk2wuBDpSZ456c3MtIINqRGrYbIii4u5tmn/TtsnmC94s+HOcc5BV8bCd/DJ4u+
 oeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750093409; x=1750698209;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nIXen2IWJ1nFMk/8G2Y6PbzVJ6y+M8EBmHILatDJo28=;
 b=iBcNjeDIXMLwdTN/b9pjMIvNzYtnv1dcPtonbFDOS9/ZMUQgdLwavmuyV6FlUv9FdE
 XUIQlNC2talaVnKon8BvGJnldFJDBK7cstcquX+iIXhC/Ko1nLwe9Wyu9SYtAxRnnS7i
 7T6HCDDe9RuJUX13a0rKL/O+IHjHKbiFDQ8jIePD1AMerwNV7xUwUo17A13I979bxZry
 CurwM1VqF049R/DGjSw0eGLTW0qNTs+ehiT2CSwv5gW1G6s+ICPkrqFxJCZVs5ZV9K0S
 FCzY6z3ZCiabwhw0W28rNMADwlt1LpBlpMovawyl4aohFchqUPqhdklnGadG28o974Ss
 zuTw==
X-Gm-Message-State: AOJu0YxqEBRAXUAH772Zp6ebp3Bqx4Myz5OHUoR/E4CebZ6MKlLZevon
 g1MfOmFDEbZZ1rVnFPjJx3VLV+lULZTnE39CEgcPWy1T7Oix/e+bQn61GD0tAUicEJx/Y/jYkce
 0xogVBK/JRtkEIusEYmWUUQ2sTzrFO9e2kztw
X-Gm-Gg: ASbGncsmf1y8vjoUTL18E9Dm2toUjYIBWgSnemqBQdfHLS5V9ZYIH+IPTnpZCLIb/vH
 TWtmc1AmhWTfg8Oi64onAoliIaVn4Tg+vNb6TxggkkGV+btyjciEfdAHBQTiqSMApK19sZ8dO6r
 5aCL8xvucEwlvmXwIIHfKg+KgpIvN54kD5IvLQIa1tp2gELw==
X-Google-Smtp-Source: AGHT+IF+Y16JMFc85/p3wA6OcRDW9KQXiDC8R5u+h5H1N2OjngCzseZqFg+eVWYAm6X+6q4GcpcKFtgAvvLpDyYS0DY=
X-Received: by 2002:a05:690c:fc2:b0:702:d54:dd28 with SMTP id
 00721157ae682-711754840e2mr142636057b3.32.1750093408534; Mon, 16 Jun 2025
 10:03:28 -0700 (PDT)
MIME-Version: 1.0
From: Taj Khattra <taj.khattra@gmail.com>
Date: Mon, 16 Jun 2025 10:03:18 -0700
X-Gm-Features: AX0GCFtG7lPqNUESk2SJEAFicaDO9GQA04Ppsp5kegddhgyVgfTCekpGFrll4ik
Message-ID: <CAJmL96BgEJ6cngY80mpiH4dWSOSUeL8aLeu=fwVefrY0-vx=Bw@mail.gmail.com>
Subject: typo re: handshake initiation timer
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:12:58 +0000
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

hello,

is there a typo in the Connection-less Protocol section at
https://www.wireguard.com/protocol/

    After receiving a packet, if the receiver was the original
initiator of the handshake and if the current session key is
REKEY_AFTER_TIME - KEEPALIVE_TIMEOUT - REKEY_TIMEOUT ms old, we
initiate a new handshake.

shouldn't that be REJECT_AFTER_TIME - KEEPALIVE_TIMEOUT -
REKEY_TIMEOUT? (cf: section 6.2 of the technical whitepaper)

thanks
-taj
