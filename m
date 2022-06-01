Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6CDC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Jun 2022 18:46:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d1ffd1a3;
	Wed, 1 Jun 2022 18:46:10 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 127cb0b2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jun 2022 18:46:09 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id jx22so5517207ejb.12
 for <wireguard@lists.zx2c4.com>; Wed, 01 Jun 2022 11:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agillic.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=4KYJV9DvsT+6Ra8JB2p88cloqNecBdvnS8PqYHwGvGE=;
 b=VFY0LQnvL1OGRVsVe/BHHG7SclwPz1zN7eSJqyJj4QWOkAI61wXqWx3bJf/bSZos64
 ieqb3ezY33o3Mj5xUFAgr+yNsl2zqQlZk8gOy653c651Zz2jCKgMwyjSWz/f52Cez9jY
 t712UElpVRmRGgOgtkrFMhOg5oi8BNRhyqi1F6kiNdEp0oqnCnDTuFrkSfxABf9SPm79
 GQoUGizxEBUPXvoIWvPn+6dxl4FYoelWZZAXGglloZHqH8cMieuaEg0RFjVBV8ld1pKr
 27WLkS+LvPKxlAtE18ZTEPQdGmgq5O4NmJykUwUTRo2iEPj4Gjz4BukzausmBoGf9CTa
 Ay0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4KYJV9DvsT+6Ra8JB2p88cloqNecBdvnS8PqYHwGvGE=;
 b=Axz9bfcQVxoZrwWUbSNZXpAKEFBIv3YFl8kItE66n1FRatsJTCIIa98K2Lxe0tTJvd
 4zk1HEua6VoAByDBYkkL72WCHTZf76YiPmXBhAqxypyabbZVr3CHpc9Vd6zyfeivJ3q6
 1DH5xscuQs8Pi3XXgmH3uMQEf3QBxtfz2BSTuwHjJ843E57+SZxya/4QOwWNf5OyiQ7F
 QiNITLYHJe5/PrpSxTttdJjahLKYAC3AsCgbbBxB0Bff1Bo6Vy1+SnqI/SaE/kzYu6jW
 O/KqIAmJPI6PVc5BFpxEV/PPtnDcbLXvFd+COK1jAGXlCpXrzAMWMh1EjkbgnH9g1Fdu
 ew+A==
X-Gm-Message-State: AOAM530peVxPpslFqDzOVeq/Mn8SflsDZhg85X/cclTJvnYJNthmlV2i
 +NePLC4mPHYn/3NkDwwZ1qg3+H6mkng0geZmztaFs+deZrGEng==
X-Google-Smtp-Source: ABdhPJyUDzOGsZkoNJcnL+Y70DRqZBvM01wL8uQ3kOWw2YaxTyurpBk+zXHiY1scVpEBprLMefTkmwQAAbvxas/Fzx8=
X-Received: by 2002:a17:907:8a03:b0:6fe:c10d:4bf8 with SMTP id
 sc3-20020a1709078a0300b006fec10d4bf8mr885614ejc.308.1654109169423; Wed, 01
 Jun 2022 11:46:09 -0700 (PDT)
MIME-Version: 1.0
From: Simon Karberg <simon.karberg@agillic.com>
Date: Wed, 1 Jun 2022 20:45:58 +0200
Message-ID: <CALDyVtsBytM7kdhKz7-mkSreM1h5LennY0==jeB5Ne63fAE+BQ@mail.gmail.com>
Subject: Multiple search domains settings in MacOS based on config file
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

I can see in my config file under DNS that I have our primary DNS
server ip address and then added search domains with comma list after.
On linux & Windows it seems to be set correctly but it's not being set
through the MacOS client from the app store.

I have tried to look through the source code to identify if the
settings are there for the app but I'm not sure.

I am on MacOS 12.4 (Monterey) in a M1 Max (arm64).
App version: 1.0.15 (26)
Go backend version: 2ef39d47
