Return-Path: <SRS0=w0hv=KV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE1DC47082
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 May 2021 11:40:30 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A81316101B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 May 2021 11:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A81316101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3429530;
	Wed, 26 May 2021 11:37:57 +0000 (UTC)
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [2607:f8b0:4864:20::e2d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f058f784
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 May 2021 16:57:36 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id n1so14933290vsr.10
 for <wireguard@lists.zx2c4.com>; Tue, 25 May 2021 09:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=NAsw7d5k3GMD0H1gwc68Ydh1Kqp7lpbV+M8FtJq1Igs=;
 b=Qlw7AFnGkLi3DLMZHNw8mkD88Te6wQ6z+nTyz966490PXrUNf0rfUQpnbc28yjVxCE
 sIXofSEK+B+Xn4ZfXbrWNy0La0VZXfHeblYW7t2xy5VQEn2OPivxjb+vg6q1HmzEGpVh
 35Hc+csRMuc+WXATzGqSE3uMR6HHQFXlq0pAkf6WqTet+7f9xtBQzb2hUl2qhemtaeap
 ECxm37WZceeojN+DxKlEyvfHdU4w1yICQCGZQV3G0SLv7Td92pneZgPtIt6MN2g2RtpR
 1AE3iXg9/fAJJMJC/6597cYbRDDU9tOrypvXJOKdnGVUwOwFnHi/n3WUsNMlx4jLhn06
 M3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=NAsw7d5k3GMD0H1gwc68Ydh1Kqp7lpbV+M8FtJq1Igs=;
 b=njPIDVIwjpVU1tdc5vYbzcdQ5sBC8d6Z4Xlcl3+2QK2GVXtRGvfrgpaSXbwvYNMwz9
 aNJSGkp+cSk93+lrQyr6WNCqlna21EzRQ8rgAIWY7F6F/dmoFxNDZX6loNtna8/u1x8k
 dshyyyswcw4R/zPXCyhocDHRW6ew9t+IG19kdTwIaeTxrHJN+19vdstsuerjELpQshrO
 az5rrMtWHmtm+gMYKJjlZnsnbP8K2qhiCt+W4qldRE87VYN9oJMHy1r0aij//u4p138P
 202mOxMRtls7iG1/CrWut2jga9M66B5ZnBpoPbTqOoycdijAEOFVbSvr8z8wGRLtrpk5
 QEEA==
X-Gm-Message-State: AOAM530nNFFpUU/mtb7Q8bRR519vUT7cYmwGWxsqtcKyrpt+V5Q4fUhl
 CbvZbRPmkwVwHzlmnKTejApjMiiwJQ/oKQ==
X-Google-Smtp-Source: ABdhPJytMgjZ0M9a2VOb+cahuangz/BCV1Qdlwh9EoPnV3beRDwMWsml5ECi0gcX1W8xoF3rzZyl5g==
X-Received: by 2002:a05:6102:10dd:: with SMTP id
 t29mr26214859vsr.22.1621961854532; 
 Tue, 25 May 2021 09:57:34 -0700 (PDT)
Received: from smtpclient.apple ([67.204.19.34])
 by smtp.gmail.com with ESMTPSA id s137sm1677775vkb.54.2021.05.25.09.57.33
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 May 2021 09:57:34 -0700 (PDT)
From: Kurtis Mullins <kurtis.mullins@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Icon height on MacOS
Message-Id: <800DE710-9096-488D-915D-FD1604CEDEAE@gmail.com>
Date: Tue, 25 May 2021 12:57:31 -0400
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Mailman-Approved-At: Wed, 26 May 2021 11:37:53 +0000
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

I am not sure where to make feature requests. The icon on MacOS fills up =
the full height of the menu bar and looks out-of-place compared to the =
other icons.

It would be nice to shrink the height down a bit.

I=E2=80=99m happy to share a screenshot if that would help; could use a =
suggestion on an image sharing service first.

Thanks,
-Kurtis=
