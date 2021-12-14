Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D0EC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Dec 2021 16:51:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id fb5b183b;
	Mon, 20 Dec 2021 16:51:13 +0000 (UTC)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3a05db5b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Dec 2021 17:15:30 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso21556286otf.12
 for <wireguard@lists.zx2c4.com>; Tue, 14 Dec 2021 09:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bry.com.br; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=h13dl2dvAipKEOtbTgOZRmr/qgqa+aPk8WBu2pwrNbM=;
 b=bexzlKaz0dBLxYhKzcNB7BO+/+2IDiW6M1e55PppVfRSLI1Xy9o7e1g1wr/UTnqVCu
 24eeMKCJir9aBhqOKeJSVy0y9X3mximSHzzpkNi04dPLKJf4njYyNPb5c6pUXLuRe4+t
 44pIKNuiQpB8NOWkTJl3QHrDQUsZlsYt4d2tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=h13dl2dvAipKEOtbTgOZRmr/qgqa+aPk8WBu2pwrNbM=;
 b=ke8V1DdgfBanBOQhG5tScL121jGlI2geN1gKfhThBexlzXpfkvA0Xy6RzIyQ8N+Fqt
 cB8pVcg/biS+x38SErtknXFUfivd9v9zH4BmFGxc5ydpxvnRY4F86/+ugl35jRytodMs
 eBLu2obU7OZGFp5Ow3MmL9YTHogjpJ52a8qFcNlAYjyeJINAdCvJXohqjN0R7G7j0DqW
 U4G78kZ64j10frEP9YD9NZEN2tt6ZjNNNGfSdqGOZGFfcYUB4EIvaWd7PXPxFvcSqmpN
 3E4yTqqQ274HFZwHyuEw2OUzqaZUg3yWgkjf9qPHPqIEY09ewmmht4wx555fjiy8Gyj8
 Yy7A==
X-Gm-Message-State: AOAM530JPXOJSA/5+YA89VQiRyMVY6/GjRb2DWDe9QqqfMLrB6+lprUQ
 XTtFFIpGnJnxXgsDzOlHdmvqvdxBuXOAZ3h+3qxvCUazcIjznw==
X-Google-Smtp-Source: ABdhPJxPQGDzW2WgbGKC9SRGO75DIgldGmUh1FhG6VPfcOr4LGoJaNcvYMkH7VNHtSK7B7XqAxf/zY99aMgl0d22Nfw=
X-Received: by 2002:a05:6830:1d7c:: with SMTP id
 l28mr5287554oti.372.1639502128206; 
 Tue, 14 Dec 2021 09:15:28 -0800 (PST)
MIME-Version: 1.0
From: Antonio Teixeira <antonio.teixeira@bry.com.br>
Date: Tue, 14 Dec 2021 14:15:17 -0300
Message-ID: <CACD1g0AfxsGNdO9e-fRLUvONfPJXJnLbzGjQb-s8t+iizXdB6A@mail.gmail.com>
Subject: Running PTP (Precision Time Protocol) over Wireguard
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 20 Dec 2021 16:51:11 +0000
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

Hey,

Has anyone ever got PTP (precision time protocol) working with
hardware timestamping over a wireguard VPN?

I need to start linuxptp (http://linuxptp.sourceforge.net/) listening
on a Wireguard virtual network interface, however, it seems that
linuxptp relies on the SO_TIMESTAMPING kernel socket option and the
wireguard virtual interface doesn't support that. Moreover, I need
this working with hardware timestamping, and right now I can't even
get it working with software timestamping.

Would it even be possible to get this working? Anyone got any tips?
Can I somehow make the Wireguard virtual interface mirror the physical
NIC's capabilities?
