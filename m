Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEE0C5517A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:22:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 381DD20789
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:22:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ma0MbiV4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 381DD20789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5409cfe;
	Mon, 9 Nov 2020 22:41:04 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d99b2e6d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Nov 2020 04:47:30 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id p5so4809330ejj.2
 for <wireguard@lists.zx2c4.com>; Fri, 06 Nov 2020 20:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4sg3Sgqfvs7x7AxHIWJKYLZcs6qJtlWRHM+vW8DCkvE=;
 b=ma0MbiV4jhTAfZWfakBEiHemCU/Ubsrr2VEk2HSZozgoI8Zhaf0UsxNBktSGpSAKP/
 XduKozVj5hxYzeEg/0lMlrSmCTaGxl4DMEEtKbyk8R/2oKPGUJWKZaOUlOe+Tm86UR18
 lr6ACFt1ewqPBeqgvfwb+oh7tArqZgOj2t2uoX8r9Zp2rzaWCkU7gc+Z2YaubbWj4758
 zO/OM1UsK0og01j5XEocf28NxbLwGBg0B95NbKx3aZQ8KeoqYtcmEK8i2MF/qPihySvR
 myAgioyz3BCvui5SXoEgiUlymNUZd5+Cset0YsvyrdlleEa1n8pZ4e9V1A6zKncoivc0
 mbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4sg3Sgqfvs7x7AxHIWJKYLZcs6qJtlWRHM+vW8DCkvE=;
 b=i4UgOpTnD5nYk3plocFCT4aT3PJ3inVoBmyiuDbKHF+iLKxf5AIrS7NgH88al2LOcR
 W4ahYv3pUZHE86CYxubl0IKbNMjUcK3QagCYcEOlPPdo0nEfPmOzvkImO0/UJBi2RZdS
 QRGBJNUGUtjEAJk7j2yP4Bjl1wvQXdkJMXlIWHtizCSb8YVWgLOMiWuKO2num2UaQcUN
 ltTXYzAODhFtkpEFczt/C9AsUmrGJAWmTGcA4pYhGa1GdUEQr9rmLESDv3TOmtwxqXBQ
 VE6OoMoflr0Nr6FdSmk8gVBOkYGBZOBqjuR9IGQNeEtfdjAp7tjPSWOTkbK6xe0UEnmR
 f7cw==
X-Gm-Message-State: AOAM533J5IuSBq6ffAbTOlvC8fpoHMssMDdddhPnNHU08nHwo1UF4Wm1
 27SbidTEISZADHQscP3z1geD4z9n20UCYuEjanZzRup2WVO1X1n5
X-Google-Smtp-Source: ABdhPJxsD/3fwdItHBercLRGgYXirsoPhwkO9zkExk2YcsZBtRn7iD+n/SzPj2a5XEHBigFb5uTx8TRmN1XNHl0e2Hk=
X-Received: by 2002:a17:906:b852:: with SMTP id
 ga18mr5601660ejb.80.1604724644527; 
 Fri, 06 Nov 2020 20:50:44 -0800 (PST)
MIME-Version: 1.0
From: Dashamir Hoxha <dashohoxha@gmail.com>
Date: Sat, 7 Nov 2020 05:50:33 +0100
Message-ID: <CAMucfLzgeC9ZLKQ-RVQj0st8PnsQ1FTLQpWnJOUsMx1XM1kCOA@mail.gmail.com>
Subject: Accessing Computer Labs Remotely
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:41:02 +0100
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

Hi,

I have just published this article that explains a way for accessing
private LANs remotely, using Guacamole and WireGuard:

https://www.researchgate.net/publication/345404166_Accessing_Computer_Labs_Remotely

Maybe some people will find it interesting or useful.

Regards,
Dashamir
