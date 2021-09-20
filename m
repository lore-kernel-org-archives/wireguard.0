Return-Path: <SRS0=I+33=OK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57191C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Sep 2021 17:48:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F4D56136F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Sep 2021 17:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F4D56136F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a475e9c6;
	Mon, 20 Sep 2021 17:48:42 +0000 (UTC)
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [2607:f8b0:4864:20::933])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 53082f61
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Sep 2021 17:48:38 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id f24so11688419uav.8
 for <wireguard@lists.zx2c4.com>; Mon, 20 Sep 2021 10:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=s8Qo57/qlNk8AvUc4Jl2wa3nns5l009KaV2SwaqfP2Q=;
 b=a0hnfmGwqWNy0ovM5vDw77wYJ3k9bUymJiHhMBNPRZNN7JSNKkYxg91kPkFuPvs6h/
 WGihhXzdWTCNezDPbbq+rdkpoEGkz+9wAweuSpRThqKQDihHG0tgUx7jpOhPMeLgUugh
 iIwkxrlx6SDIOakzqGdMUsN+XYEBcB9Ovskv6Dh+16y7jCEldJ/YPsFhL49/ydocLZ2F
 Vd7jgciZxdrLwk4Wa0+AqSW2HiByn9IhHzXtFQbCXZ0QrZIRoiQA+8DJ8X/xC+hjsgnn
 +H3kIcI6nTy5vdSvk4jfuT/yttRS5RNsFovgorf3t28NCpYqQnyKgf16IUGjGTbmR2Dt
 xrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=s8Qo57/qlNk8AvUc4Jl2wa3nns5l009KaV2SwaqfP2Q=;
 b=5dEi9AHGr7EskCb8P3J4oG7TJcID1HwFZJPNUkrMQoA4YZM0NZUY076X32V3BZzJUI
 MTti1aoF9ZLYMv+Q4jGa8TNmye3dJjK+4JcwnUb/3S4cS14BK4MSUlz2uJR5DrNAQS7F
 Nqm0Xjsp50KJ01yrA3GCNTiwLOUIBQffQjoAlVWyEujyUCJXAbPP5a6I5o1UQvaoutpY
 Onqwpel6WWQSL65mKK2dTIdTcQQGF10UEEs5IhJvsW0Fm6Cko8HdOhd05sxv0+Wyk0hE
 Hnpn/guvAIoA/72bzdqxJCdiakhy8+uGKmwKugP57cK1ePbwWUL5aMQ2OpdDLVxcJ0ZK
 b1sw==
X-Gm-Message-State: AOAM531cIUe5HxFEqepg6XNeH8cpttO/tilrfqiYxkzpOzhj11tHmvDf
 U8eBBGAD5mbE4j6me5OflmuXOXQEDbE3I+m5TukEYXN3L9A=
X-Google-Smtp-Source: ABdhPJwqighANwQUejEj8iT1bMr6GnON0Y47lc126A+iYz8elRB4W6ZxZUK64ygJDYNS7DJMbTnPgjuAZIPmqod01JA=
X-Received: by 2002:ab0:3184:: with SMTP id d4mr5577716uan.19.1632160116958;
 Mon, 20 Sep 2021 10:48:36 -0700 (PDT)
MIME-Version: 1.0
From: Devanath S <s.devanath@gmail.com>
Date: Mon, 20 Sep 2021 10:48:25 -0700
Message-ID: <CADjMg7XK3t21phcS-FfcGXGE_Nc+Sw5b4Ln0-OsN5Lp0GPf8CQ@mail.gmail.com>
Subject: wireguard-go on container-optimized os on GCP
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Matt Layher <mdlayher@gmail.com>
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

Hi All,

I am trying to run wireguard-go (using
"golang.zx2c4.com/wireguard/wgctrl" for configure) on
container-optimized os on GCP and I am facing the below issue. The
same works on ubuntu/centos etc

1) Wireguard device creation and tunnel gets created as required. It
works as expected
2) When the admin wants to delete the wg tunnel interface and recreate
the wg interface.  It gives error "err device or resource busy"

=> To create the tunnel device
tun.CreateTUN(deviceName, mtu).
device.NewDevice(tun, deviceLogger)
=>To delete the tunnel device
func (device *Device) Close()  which is probably calling
tun.tunFile.Close(), to close the FD

----Snippet of the logs, while closing the device and creating again

^[[0m^[[1;33m[22:04:47 2021/09/09 +0000] [WARN] LIsten_WG_API:
userspace wireguard device API interface closed, error while accepting
connection, err:fd closed

^[[0m[22:04:47 2021/09/09 +0000] [INFO] .Close: closed userspace
wireguard API interface and device

^[[0m[22:04:47 2021/09/09 +0000] [INFO] CreateWg: create userspace
wireguard device wg1

^[[0m^[[0;31m[22:04:47 2021/09/09 +0000] [EROR] CreateUSWG: userspace
tunnel interface creation failed, device name wg1, err device or
resource busy

^[[0m^[[0;31m[22:04:47 2021/09/09 +0000] [EROR] CreateWgfailed to
create wg1: device or resource busy

^[[0m^[[0;31m[22:04:47 2021/09/09 +0000] [EROR]new Config:device or
resource busy


Plz let me know if I am missing something.

Regards,
Dev
