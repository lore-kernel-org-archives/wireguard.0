Return-Path: <SRS0=2ZxM=FW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19A4C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Dec 2020 16:00:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 434D323B70
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Dec 2020 16:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 434D323B70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46e500bf;
	Fri, 18 Dec 2020 15:51:27 +0000 (UTC)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [2607:f8b0:4864:20::12f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6665df8c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Dec 2020 15:51:24 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id r17so2537970ilo.11
 for <wireguard@lists.zx2c4.com>; Fri, 18 Dec 2020 08:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Y94byRFxQdHszSdnbXYLuiPOn9VTAV+YoYEDsaY4BKM=;
 b=SYUSlKR5hayfFlrrgWzH7nlxan5jHkl1V9S+9oT6OJPe5FcW01UJRKM9z8b2irgVPM
 PlcY+CGwzQI7VLUdE4DamhLKZ22qyKYSbCZquIbQTjysSaQRRF79qmrxk1FIrZsEiGey
 nliT/O4q23ortIoOWpqQDFJcr6CcpDJ8bnWrD6p+zLxRj1q1hWhIOM21tGNY+e+oC2UL
 cpae4/VN12g6xRXd9PkdsEA8QTw3/PgSFvGnz6trJX0f2ssfbKlOHeGeW5jKl9wd5fpK
 aNzK/n5jY017zrZ07vaFLe8U9rbf6RmpXp8pbzooTPluKqsL93Cb9/+zgRDaphi8mH+D
 ZuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Y94byRFxQdHszSdnbXYLuiPOn9VTAV+YoYEDsaY4BKM=;
 b=Qr2IxB8UeAvM6JKi+LAMMikWDzAcXLAjzDBk1FvlzhSXMNIdxmBQyGhwphMUh2mcBh
 8R9vsRGw0Td7DwFyE0UYqZPf3ShgXdQqHUeNjALqLQpwCS7zNVk2Hsj86iguEszEbKzW
 bGK2ebzI8nmPLqCiN5t7AfRvk1B05KVTgHKJgdO86wJqh7YQM7oFOyl8MSdSaHw1iOyf
 fHDYE6+SG47EzU2MXxkzhV97uXh6qfVojPcWowGST6nmITKPDXAOZ5gm0WSDgxnRD5zQ
 VvxjNuntn66u3+m0rRlJgYF8idoKpfVCq4tGtzfJfpwRJKymKyBwn6gDTkMfquuchHSG
 GBYA==
X-Gm-Message-State: AOAM5301Wa3DzCfXu7GN1wYrVGRm4mZBBhr9L1uW1OtllWx3Fanx+yBp
 osU6SJzkPwbZrCG2kZ0RFYP0lsiId8VQHrprQEKcRsyYong=
X-Google-Smtp-Source: ABdhPJyGTKmydoLXZTLP5tAjpVdVF5R+6cTlJ4iplMUjRUtzZPAQ1jTnHiJej2ivgWUAEbRMRebG285n3Y6CJyh2iM4=
X-Received: by 2002:a92:d812:: with SMTP id y18mr4523967ilm.1.1608307202614;
 Fri, 18 Dec 2020 08:00:02 -0800 (PST)
MIME-Version: 1.0
From: Janne Johansson <icepic.dz@gmail.com>
Date: Fri, 18 Dec 2020 16:59:51 +0100
Message-ID: <CAA6-MF-fXL58SWcr6ct+iKLutObvM7xNoRTUW=iwfXUjcPsUGQ@mail.gmail.com>
Subject: MacOS and wg 1.0.11 issues (for me)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

I waited until 1.0.11 was out to not have to workaround the 1.0.10
issue if you didn't have DNS in the [Interface] section, and got a
"reverse" of it. I could not connect tunnels which did have DNS
entries in the interface section. As soon as I tried removing DNS =3D
the tunnels worked fine.

After MUCH back and forth with Jason, I have ended up where I can
either have DNS set in resolv.conf only and not ask wg to set any, OR,
I can have a local resolver running on 127.0.0.1, and ask wg via the
tunnel interface config to set this one and it will work for me. If my
localhost resolver is not running, the tunnel also doesn't come up.

I have no idea why my Mac is this weird, and we have tried a lot in
order to replicate this at his end without luck, so if anyone out
there upgrades to .11, has issues as long as DNS=3D is in the interface
section, please reach out to jason (and/or me) so we can figure why
this happens and what the conditions to trigger/reproduce this is.

In my case, the gui quickly shows the local udp port, then it goes
away. Data sent show some 146 bytes, but it doesn't show any received
data or a timestamp for last handshake.

wg logs have lines looping like this when it doesn't work:
2020-12-18 16:32:35.876 [NET] peer(kU2O=E2=80=A6g42s) - Sending handshake i=
nitiation
2020-12-18 16:32:35.877 [NET] peer(kU2O=E2=80=A6g42s) - Failed to send
handshake initiation no bind
2020-12-18 16:32:41.042 [NET] peer(kU2O=E2=80=A6g42s) - Handshake did not
complete after 5 seconds, retrying (try 2)

Macbook pro, Big Sur 11.1, wg 1.0.11(20) from app store, and configs
that used to run ok in the 2019 wg from app store.

--=20
May the most significant bit of your life be positive.
