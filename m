Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5DCC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 Jun 2022 11:51:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b39a3220;
	Fri, 17 Jun 2022 11:39:59 +0000 (UTC)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [2607:f8b0:4864:20::f2e])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ac15a3bf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jun 2022 01:48:20 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id el14so292320qvb.7
 for <wireguard@lists.zx2c4.com>; Wed, 15 Jun 2022 18:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=0h5BSKjXfJmnXh7slkNIolIHS6p9yI0tiDPBhV8xjNE=;
 b=kOt9fgKVQcbKfIaYE7IJwYQEFkWaTWGJFgnrTdm3ON6U6lpEtEOFDDtItzeVn5oNO/
 HTSPXC8JCTJwuSGF7raq62AH2olDBY7DUCSEa9rbAz2tSLYYr7rHmg2YRr7nYRN8X7U/
 7RJhf0mfJC8U4ZX/+XieejeUd2Ufqj5zxmXxW5uOtpy7/WFtFpG1pnmIBw+gCkKjY+kZ
 25IMJVUYswlhQU1GmXPZZPQHejFgNmDFpOq4cdJhvkxWzyI4irnJ2N3DMdulRvn7N9st
 w6wEHMzbhJmzB9PCFvV5WempwV3k+j+EXLGkq9ROcyl6vblTIwuf9gcisETLePm+caFf
 xJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0h5BSKjXfJmnXh7slkNIolIHS6p9yI0tiDPBhV8xjNE=;
 b=oC3yVJxllzkg8xfOrANoGMBCPGwyULv4TQcZwUufIxJhUPANzv7DCNUjQCRxmoQdWs
 HP4mjNyNGBxkudTwaCR3z/qPoE9EI5Rd9XpwpDdkd0RIIgYOO7+SyPziaE7OvBb/64Ju
 44sFQqFXeDC6j4EkKNHjjO9pRJId1Y9i0Kz4A3DGc3A0YFmC1jVVFvtsfmdJy8HjPgz9
 7sri3FgeJ5v0M3sYMc1tT2PRAIAOEeg/LT0N2/U3CKsUGZgg/NfML8oH3TA7sUlGa+27
 KyI8vc0TUgG7XMBipZuzAnUsAwXTVyVNAZhDSMdX8lYGLOG3bC3PCpN/z55A0nD7wAMn
 FTDw==
X-Gm-Message-State: AJIora+DnTT1BX7/oo4egZZXWyxAMwEMznXwpXaef7U3UvkABGjVLPdJ
 bNHcuxYaPxdV5Cu6XBVfl4aoDugxnKnqRhS2ooJWLKAE6I0V8Q==
X-Google-Smtp-Source: AGRyM1vU7CuJ/yDbh+7Mrpp3UEEAdsCB2ETmMplvSDCVgSuwkAZ9UiWNnHZm0RCUegIy6MQw/x0fSqR4pUhxllvQVJo=
X-Received: by 2002:ad4:5ccd:0:b0:464:5848:399b with SMTP id
 iu13-20020ad45ccd000000b004645848399bmr2177349qvb.45.1655344099418; Wed, 15
 Jun 2022 18:48:19 -0700 (PDT)
MIME-Version: 1.0
From: Jacob Lifshay <programmerjake@gmail.com>
Date: Wed, 15 Jun 2022 18:48:08 -0700
Message-ID: <CAC2bXD6FKSk1EEcw4QtqxengUvyCN2bfwzG5jFUvAPAsg2kxBA@mail.gmail.com>
Subject: why not use ktime_get_clocktai_ts64
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 17 Jun 2022 11:39:46 +0000
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

I was reading in noise.c and noticed you use ktime_get_real_ts64 and
do manual adjustments (the current code is broken if/when there's
another leap second) rather than using ktime_get_clocktai_ts64 which
already handles compensation for leap seconds.

https://git.zx2c4.com/wireguard-linux/tree/drivers/net/wireguard/noise.c?id=7fae4596a269d2f9a6a7d1a8695c3a68ab34f7be#n501

Is there a reason for that?

Jacob
