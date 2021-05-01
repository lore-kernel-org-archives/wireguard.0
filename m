Return-Path: <SRS0=NC//=J5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F32C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 May 2021 11:17:41 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFAC361208
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 May 2021 11:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFAC361208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0b395a9;
	Sun, 2 May 2021 11:17:38 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1fc15271
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 1 May 2021 04:20:10 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id a36so572679ljq.8
 for <wireguard@lists.zx2c4.com>; Fri, 30 Apr 2021 21:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3UkLN3oDj7LBExFmfftc6VlkS7rnKSiEboqdrM3HZus=;
 b=kkDL4/EHlSdqq2XV/whcKDG8J4N9eCQS5a085mg4igl3ZKPrQZWaedtJx7u3fxKCrJ
 gpJyyYZG2Q/3FTI+vlp4vuwGabyv3s4mELJQNv+FNZnMJjUUJ5dL3GRKqc8jLykDVRuM
 mT/+tMSuKZq4yV4SSviHSS1i8lPScYWprA5X90NONqlY7g4tz3c5LKb+eTFp5GZYWBEN
 dXddU0ZhzMm+qteZQbUr+8V1gZRHcjqS0ORZYuZ8gTWlbRdFMG1RWGkgd2jq2BPUFI0h
 sczRfRtiNq9XqQUM4PmQ10ep+w22IKg2+TztwBfuKypiDnFJrW5n703XCRL/W5uV9UOa
 YRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3UkLN3oDj7LBExFmfftc6VlkS7rnKSiEboqdrM3HZus=;
 b=RMM3ROh8JardYb7ozdx5Hckuczu8JYzTnc+RSiH8eOYBVDVGHvwXdg+z5YZ9kUD9uV
 56qu0nBTzqPNcdV7c7wE9/E7W/qI0516XFe9ireZ3jYcdaVxY0ryVHtMweiMlwQNXYk2
 BbKCEArLssF8eKIr5o7e4+yVXYl4Cjruh8DOOa47U4aCyljgA6Un8sNax1eAeDv+4LL2
 jLUjs2GA3AlKkAm7BEq5Ov4WMjgRmzq4WuelS9KAlTiy736A1K6Rjea/ql3yEHyWf7ED
 MIIhsvb8NlK+kIaXO702WF43rtUTtRS5Jeyk3ddIhBhXtG3ORn5OSt4OCRBjHaR/TS3J
 DgYQ==
X-Gm-Message-State: AOAM533XoPFdnY1I/gL4R//kn3GCexWUZzpgPRR1blmXjFhUxhFUGD8m
 XnVehXteVOq+rqTW561kUC7HQs7fUy8wM/EzYhKc7vGIQIY=
X-Google-Smtp-Source: ABdhPJwlbPVLkaxNeMNf+qc1efc7D+siBmvQ6WamsTvcNUj2iLfs1XiKwMYEDiIOKqKm7GaaY56VyFbZWtboGZrmTro=
X-Received: by 2002:a2e:8e71:: with SMTP id t17mr2540286ljk.54.1619842809593; 
 Fri, 30 Apr 2021 21:20:09 -0700 (PDT)
MIME-Version: 1.0
From: Vivekvardhan Jilkara <jilkara.vivekvardhan35@gmail.com>
Date: Sat, 1 May 2021 09:49:58 +0530
Message-ID: <CAKTTC6mqQGt8_X-TEhmSZu9QbEJGqHRXSPd7RjNi3ixqfudqpg@mail.gmail.com>
Subject: Why there are no API exposed to connect or disconnect the network
 interface
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 02 May 2021 11:17:37 +0000
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

Hi team,

I have been going through the wireguard-windows module to understand
its usage for one of my requirements.

My requirement is as follows.
1. Create the virtual network interface/ network tunnel. This I can
achieve by calling, CreateTun
2. Eventually, based on some trigger points, I want to open this
created tunnel and then do the
connection/disconnection(OpenSession/CloseSession).

Following are my queries.

1. Like the CreatTun method, I expected a method called
GetTun(string), which would simply call the OpenAdapter method(in the
wintun package) and return the instance of the device.
Is there any reason for not providing this?

2. In the device interface(in tun package), the APIs that are provided
are operating on the adapter against the tunnel.
I thought, if this interface would have had APIs, something called
StartSession and EndSession, using those APIs I could have connected
or disconnected the connection for that tunnel.
Is there any reason for not providing these?

Also, I am doubting whether the expectations that I set are incorrect. If YES,
I request you to help me to understand the reason AND
please guide me if there is any way to achieve the above requirements
without these APIs being expected.

Thanks in advance.

Regards,
Vivekvardhan.
