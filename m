Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7622FC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 12:17:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DA0964F10
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 12:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DA0964F10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00e637f5;
	Thu, 25 Feb 2021 12:17:02 +0000 (UTC)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [2607:f8b0:4864:20::52b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e623db70
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 12:16:59 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id o63so3667042pgo.6
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 04:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=B88P9f4cwzJq5UVO3BrfeVtCr3ooUbXXackhq808SOs=;
 b=jXRHYqfZdf6tbpNTjOcx9zSFZd6t0kskcUUBR/yS4aSgPXASFDSuAwcb7Eo1l67EEn
 dItozfcXKwz+1eaxO/SgQs4eoZDQHMt3A123SXRjdxFAONkWoynl3j1lKvnobmKWLORc
 N4EcS3Lka0nAnBbF8qygXIBr7tyWxw9Heno0mkdiYVJ8A4xe394Zg7Zfh4Mu2iJjg3Mf
 dTpxQrL614y5NlIgdQub+s2hHG/LyvN/22LbnLSdmAxVu8oAmN0EmqEjtiMt3+TLyn9h
 VtWuwmF/dBSz4aJ97FtlYX8Jkn9lvere+4jgNG5F1cMDhdWoeXp+qfh7+b1kOCtStotF
 l+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=B88P9f4cwzJq5UVO3BrfeVtCr3ooUbXXackhq808SOs=;
 b=px2FSvR80UBVohh3Jss5iYRurUM+s7P41n6TbxpZm/aHcZj2G4EfUZPrnTYFvBoPDy
 27j3VmMxhcMo0cK6cHIs0odBLk7rHpVW+OuZ3nd4IGYjeVjbhEdLhkiO0Zi07Mhq1FAj
 Kw2u5xKdLGqzGvrn8wOK2feuKQQZwQcokSiQvLxWShvOaGkT5641pJaLIC/xJRIzXCRY
 tkGRF1noO+D2SlmFf+FwnmNv3VYL4me6Nk9TA8rbAJmX85xlAgCGMXCsAyeTYlFpdEmi
 T0H6n7mRlrU88eXUxGnw2ZdvBsks0m1U2lBFYSn6brh/deunL2wFI+woqMeVEiCQvbqK
 qe1A==
X-Gm-Message-State: AOAM533k3J+jmuFOEeCvH9bDCGgcUZxEjClm/pFVxWKAgBmYlYLhIfT5
 R2Fyqc5rP96OvJOPHqq0coVVkU2ydvMy4pPEePnx5LP3kmoukg==
X-Google-Smtp-Source: ABdhPJwjFyTG0Autd3mAuG4fHirOpqYWSPrmXtWHE0b/UUch0Xy6UIBm51gLY6F68nSH74KUECQ8pAAMp4a0lyEaKKc=
X-Received: by 2002:a63:4b21:: with SMTP id y33mr2722025pga.73.1614255417709; 
 Thu, 25 Feb 2021 04:16:57 -0800 (PST)
MIME-Version: 1.0
References: <CAE9z9A0mNSoCfV2oYBojk=sAtzUmA8iknMM=keAChTEZrp8p4g@mail.gmail.com>
In-Reply-To: <CAE9z9A0mNSoCfV2oYBojk=sAtzUmA8iknMM=keAChTEZrp8p4g@mail.gmail.com>
From: Rudi C <rudiwillalwaysloveyou@gmail.com>
Date: Thu, 25 Feb 2021 15:46:43 +0330
Message-ID: <CAE9z9A2a+G5pcjPpvRVf5Rtb6znLOCQgvsnv01iua4xwONg9NQ@mail.gmail.com>
Subject: How to tunnel only udp traffic through Wireguard?
To: wireguard@lists.zx2c4.com
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

I use naiveproxy+v2ray to proxy my tcp traffic, but naiveproxy doesn=E2=80=
=99t
support udp, and it just passes them through my normal network. I want
to tunnel all my udp traffic through WireGuard. Is this achievable?
Thanks.
