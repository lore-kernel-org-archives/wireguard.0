Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCC1C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Apr 2022 18:16:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 867e5bdf;
	Sun, 24 Apr 2022 18:16:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 05fb4e5f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 24 Apr 2022 18:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650824188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mglzaFMfvMRIjWdPAA57TJCxj6UGGLt0CVKEDEVz6Aw=;
 b=UwsG3AhBl8RoH1ekmtYHXskVCRPVkbYENuKjK/+a9fCcFR76CyrdG+87Rnb5gWl3MZVFx3
 GQOrtqHMwZ2Yt+S8AfI/wwELW3v5oPvAxgQyu2pZT1zhqCVumrh9Zme+GCa+OF1aTr4u5G
 mQIJUtLObdOnwSRQZ9ism16G6ywieE0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-QJ_UphGBNcOGzF0aIMpt3g-1; Sun, 24 Apr 2022 14:16:26 -0400
X-MC-Unique: QJ_UphGBNcOGzF0aIMpt3g-1
Received: by mail-qt1-f200.google.com with SMTP id
 m3-20020ac86883000000b002ed8d29a300so6894425qtq.11
 for <wireguard@lists.zx2c4.com>; Sun, 24 Apr 2022 11:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=mglzaFMfvMRIjWdPAA57TJCxj6UGGLt0CVKEDEVz6Aw=;
 b=dGv0XEVQciZKPaaIvuXiBje1Cbqh/YwJI67pqIFze2WsVXB/btrCw44ni2hKWJLtNR
 XRQRNm/WvZ5yzEOpfux4LHKnugxIu2yVJmSPuQzaWGqhFNmpzkXqvV14zpG9Iuz5WGWC
 TVMNFkZOVpO5nqPQn3Uy1potE67cka5q9neVrKqQmn4HeinA+oPJX4JwbqOUFT9P1GpZ
 zd5IzT06PRlwSrJAfF5l5Y0p6qHbY2QouX3+h1pQEiqZFWIHpqMPUrVyA4MiLtyVGvOF
 cnW/GPyheVXScQINqF0gkcqvxCN0iCMUnoW2GFCexuY67B8ZGUhQq3IDndvKccp2zXJd
 D3vw==
X-Gm-Message-State: AOAM533t6DESfIMB5/Lmhgl+jz9YGLvaAKrucrGNBOuaFUcXfXiYTt4v
 r41oKmzjEsFBnfyGB/TVlRVc0woyi1PX0gGHG56AzrStphtvypyDnOixK39IEMu71WTXu5kLhCf
 zH9Frm1bpyBRThldxFPA/EbWiplyHM/0hK/pOnAWSyMUqvyuDpBgB6A5lOlKCICBiykZlrQ==
X-Received: by 2002:a05:622a:15ce:b0:2eb:9a95:a422 with SMTP id
 d14-20020a05622a15ce00b002eb9a95a422mr9671277qty.582.1650824185881; 
 Sun, 24 Apr 2022 11:16:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFtqfRaDb9wvlZCFqm6D0GsNM4cF/EUHqTeX8HedNRXhfhzpM4DUmnXoxM4HhFHC84mWJ+mQ==
X-Received: by 2002:a05:622a:15ce:b0:2eb:9a95:a422 with SMTP id
 d14-20020a05622a15ce00b002eb9a95a422mr9671266qty.582.1650824185554; 
 Sun, 24 Apr 2022 11:16:25 -0700 (PDT)
Received: from [172.31.1.6] ([71.168.80.171]) by smtp.gmail.com with ESMTPSA id
 a28-20020a05620a02fc00b0069e8e766a0csm3913600qko.94.2022.04.24.11.16.24
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 11:16:25 -0700 (PDT)
Message-ID: <22218021-270c-8ac9-c214-76ae4e1c1263@redhat.com>
Date: Sun, 24 Apr 2022 14:16:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: wireguard@lists.zx2c4.com
From: Steve Dickson <steved@redhat.com>
Subject: wireguard.ko on RHEL8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=steved@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Trying to install wireguard.ko on a RHEL8 vm (4.18.0-348.el8.x86_64)
and I'm getting

    wireguard: module verification failed: signature and/or required key 
missing - tainting kernel

The entire error:
      http://pastebin.test.redhat.com/1046896

is there anything at can be done about that?

I'm new to wireguard and I'm pretty impress...
It came up in both Fedora rawhide and an
unreleased verson of RHEL9...

We are trying to used it as our network in
a community wide virtual NFS testing event
called Bakeathon [1]

Again I'm new to wireguard but not to kernels ;-)
So if you could throw something at me to
help me get over this bum... It would be appreciated!

Note: I am not member of this list so please
reply to be directly.

tia,

steved.

[1] http://www.nfsv4bat.org/Events/2022/Apr/BAT/index.html

