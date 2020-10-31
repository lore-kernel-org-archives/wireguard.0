Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D88EC2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:43:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E85B206B6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:43:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ekonbenefits.com header.i=@ekonbenefits.com header.b="LU96MdOE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E85B206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=ekonbenefits.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 604f85cb;
	Mon, 9 Nov 2020 22:40:14 +0000 (UTC)
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [2607:f8b0:4864:20::e33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0f17c44c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Oct 2020 17:26:44 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id b129so5195791vsb.1
 for <wireguard@lists.zx2c4.com>; Sat, 31 Oct 2020 10:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ekonbenefits.com; s=google;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=iFZ375+5+JVtqP45Opa2IVXAcmwHyAH9XPEo5jZNgJQ=;
 b=LU96MdOEEgjjsjldioaVVDID/MqG3lWM0b6THGYZ8mQb4qv/qEMAmUJClmpVBohvhc
 wFwfCaThz9TtCkZN0eURYWbUbYlanhqOiHgLQX3wPdTWz+K02hlTd6lCksoRBglSIE37
 kVKudvH6IR45zGw8xdxbv8Axj82URjTdtwbYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=iFZ375+5+JVtqP45Opa2IVXAcmwHyAH9XPEo5jZNgJQ=;
 b=sXHItN0Dz56OSFFkF/jXX5vjIEed/Lz/r4DwAvn9Gkj0uTUOEvbbhATyfQcyCQHVMD
 PMFGHEMp/VmvZVuuWCFcYsvfyuQWHU7FW0jGc95oji2/dm1wydneJVHZjuR9YUilKjWK
 PwSzvCsEAkUGZXLGJ2QZKEcLdMAso4PpdbtNcyeIbSrkBiZgglqoO8uVl+TCV8A21KZH
 pPDT6qslVCYC1WAaqpBoA8eT5PIrC8oAJi0v3N1XZsn7QxmK0vimjY/KzZbLnMbsCqAg
 NbxqYZIN6CRvBer6DGglWIZMGE1cdAdZTOXEtTLOn5RO/yA1ytL23oHixS4m8a1B79iz
 Azzw==
X-Gm-Message-State: AOAM530lBFuUW4/3yxfrPxhuCg6ig3QvhugLRnJFODe7jzPfDw4Ks1gZ
 j8gruH5VIYFXLv7ofhKtFYBFZoPc96wnYAbS/n9Wk2qI/StpyhKt
X-Google-Smtp-Source: ABdhPJyhYr/cwvo9EmAe780nk3IDtVfF19bCo72xuj24F6MDoBWuWjaf16W46jyi9C01Y3qT1AxQ2H7plFP5/xxyQns=
X-Received: by 2002:a67:2901:: with SMTP id p1mr11322125vsp.28.1604165349088; 
 Sat, 31 Oct 2020 10:29:09 -0700 (PDT)
MIME-Version: 1.0
From: Jay Tuley <jay.tuley@ekonbenefits.com>
Date: Sat, 31 Oct 2020 12:28:58 -0500
Message-ID: <CAPhasKNCoDb2SYSO__qOpHxWrj846k1hQYF8jjTSqxxw-6gwYg@mail.gmail.com>
Subject: WireGuard-Android QR code import disappeared from chromebook
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:40:11 +0100
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

We have a whole system for provisioning chromebooks with WireGuard
using the QR code. Suddenly we can=E2=80=99t do it anymore.

I think it was a wireguard update that checks for a rear camera before
providing the QR code import option. Checking instead for
FEATURE_CAMERA_ANY would fix this regression for us.

If there is another place I should post this issue, please let me know. Tha=
nks.

Jay Tuley
