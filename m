Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E49C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Apr 2022 08:05:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 071b2ceb;
	Wed, 20 Apr 2022 08:05:44 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5d822489
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Apr 2022 08:05:41 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id l7so1897571ejn.2
 for <wireguard@lists.zx2c4.com>; Wed, 20 Apr 2022 01:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exys-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=aWk1glIb5fQPQ4AvSFdOJsApxF0o6YNYLVWfDL8PDNg=;
 b=5y+sVJ9hFpVrTisgB+xYavZ9OYqumoJFABRaRNBV46TVpSflIjHVZPoxlA6pecDyNE
 7TP0uVRtBUTwyyKW3QgOCE2zKc5Y2YeK0iI3eXhM+x6xiroxtdYmUdF7Y/yU4tD7SDti
 aykWHZTlZSmhUcy0QpDhQrKJeUBV7L4WPc50WHsEMtpoURBQ2LzzkUJu4xoXWyK2e+oi
 CP4l1m90oitQbrlH4M7Y+XYdvi6+1sBbV4wyZ916kRWRW4tGp4AXKNXekax26dVOdhvW
 kDwS9MLnoZtOUo3nKueHTeVxWGSvRV8+vfInmHlL1snPSdj9olKBfKpnn/acBoH0+ETk
 Qbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aWk1glIb5fQPQ4AvSFdOJsApxF0o6YNYLVWfDL8PDNg=;
 b=z5m7ztCdrZsHt3+MZMcjbxDxZ/cl+HwQV2coTBfc/2mRvES0Y/tBXZjD8H2/Fuj32S
 jK6wVSCfxaD05k/u4IiFgj8Y94nHAhkDYmyVeT6iWJvJQnPNpr+DAAOJ6HrvHNheTY0G
 khgge3gycFYIglni8HQfshutnhuHY6il6sPxxPfxR2ZZScOZCvw5si//idPt5SOFvT8f
 CTmhv4M501SBlCTyTcJWV572wFsJsmpYvjn9pSajcnKRcots6v6M19VrsUmvQwhKWc+H
 WfFF2WaoQQBy95zFs9WLxfa0wbJOD/wLdSV4536Q7xihwyhRsRPPI2bvE0jJI74/afP4
 vWGw==
X-Gm-Message-State: AOAM533j+klD/uTIDZ4AshZNtvj4i+IdR7FdComP2+LCjRWPMjaW+RvH
 pDpBQxh3Jy9GdFwx/7whf5Sm4CGnKdHEkJOgR/MW83j2rYCWtA==
X-Google-Smtp-Source: ABdhPJxtjSINIvZgpJn5OiR6Zrf1TMuId/uExO2w1w/FRKkHXQ/RCSRsmzm3LPcHcBUiynjDAQNrWQmuwQeDgjccsvE=
X-Received: by 2002:a17:907:6d10:b0:6e8:8fbc:310c with SMTP id
 sa16-20020a1709076d1000b006e88fbc310cmr16644519ejc.530.1650441940966; Wed, 20
 Apr 2022 01:05:40 -0700 (PDT)
MIME-Version: 1.0
From: Arvid Picciani <aep@exys.org>
Date: Wed, 20 Apr 2022 10:05:30 +0200
Message-ID: <CACD9L=DWEargDr8f1gXzigZ=NQsSz=18vzQMgVQKzUN++r4ELw@mail.gmail.com>
Subject: will frequently changing allowed-list result in latency spikes?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

we're currently using wg as point-to-point transport between thousands of vms.
each peer has a separate interface so we can do BGP with bird.

this works extremely well. But due to lack of port-reuse, eventually
you run out of udp ports.
Now i'm thinking of redesigning it with a single wg interface and
using wgs native destination selection which is based on allow-list.

that means every topology change results in a netlink call to wg to
replace all affected peers with a new peer with a new allowed-list.

In a quick test i couldn't see any problems with that.  But i'm
worried that might change with scale. Replacing a peer config might
flush its buffer, possibly resulting in packet loss.  Or more likely
reset its crypto session, resulting in a latency spike until the
handshake finished.

anyone has more insight into that?

-- 
+4916093821054
