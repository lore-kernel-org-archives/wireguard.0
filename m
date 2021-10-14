Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E027EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 00:40:51 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB1566109F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 00:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB1566109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openziti.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 383bbd5d;
	Thu, 14 Oct 2021 00:40:48 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 99b301d1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 00:40:47 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id r2so3900289pgl.10
 for <wireguard@lists.zx2c4.com>; Wed, 13 Oct 2021 17:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:thread-index:date:message-id
 :subject:to;
 bh=OVAS9EKKcoR/DnW9gAOfkVyOG1w3ABGd2WE3kEt07Z0=;
 b=lT4x46r9A6DilzMoHSCHam67btQq5ylO/gkxBJVYBXlsYyNVJtC8mI01bOCrkISG3U
 wKOGZd9Ygsrvx7VFevInJqMDO0K6+ukSnv/oVJXS0L8XIU3QQBInrnn1zrM12TnI3zsJ
 ZqjIxTkQnj9tCl2bMMHBLzRsek9cN2OL3j14hWWT0M9fQG49Q5k9BneauBDzi7uk8C+O
 C11gkcRYVsD/iEcsZdiksDHFNeQZ8Wtxyw7uoLLM4zJ7OAsMsOpVHrUn7k2YSVPpx5p+
 0yxeUIdVwWWDEHy3kgWxu+SAfEM1FOhOEiDp4dG3muMe/xT+Qtr8M62nDoPvFkXVzh+y
 WYpg==
X-Gm-Message-State: AOAM532obDK/XvBI/PED0G81dmIJjzG2WjnZ8tOfrUIMSfQwiI/jcq/p
 PtUJi1LszEkfyIkRpSpOf+2V8NMZ4fVMqg==
X-Google-Smtp-Source: ABdhPJxPnrsOXej1LwF0N+eNS766ZHjx9WX8kALMjm8U481/Au7ZYwLGfeGbT2YYLTpu4V5pm9CUTw==
X-Received: by 2002:aa7:8bd3:0:b0:44c:68b3:a52e with SMTP id
 s19-20020aa78bd3000000b0044c68b3a52emr2569106pfd.74.1634172045630; 
 Wed, 13 Oct 2021 17:40:45 -0700 (PDT)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com.
 [209.85.214.182])
 by smtp.gmail.com with ESMTPSA id c24sm651195pgj.63.2021.10.13.17.40.45
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 17:40:45 -0700 (PDT)
Received: by mail-pl1-f182.google.com with SMTP id s1so1140302plg.12
 for <wireguard@lists.zx2c4.com>; Wed, 13 Oct 2021 17:40:45 -0700 (PDT)
X-Received: by 2002:a17:902:c409:b0:13e:ff25:8c73 with SMTP id
 k9-20020a170902c40900b0013eff258c73mr2246756plk.88.1634172044913; Wed, 13 Oct
 2021 17:40:44 -0700 (PDT)
From: Clint Dovholuk <clint@openziti.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdfAk5ZaPuhOPfyfRdS/OYai8PM7Hg==
Date: Wed, 13 Oct 2021 20:40:43 -0400
X-Gmail-Original-Message-ID: <5656bb014ee2161f6c8ea5f35d354563@mail.gmail.com>
Message-ID: <5656bb014ee2161f6c8ea5f35d354563@mail.gmail.com>
Subject: wintun.dll + go CreateTun crash
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

Our project calls
	tun.CreateTUN(interfaceName, mtu).

I upgraded to windows 11 tonight and this call now crashes at:
	
golang.zx2c4.com/wireguard@v0.0.20201119-0.20201209004655-310ae107c346/tun
/wintun/wintun_windows.go:89

which is this system call:
	r0, _, e1 := syscall.Syscall(procWintunOpenAdapter.Addr(), 2,
uintptr(unsafe.Pointer(pool)), uintptr(unsafe.Pointer(ifname16)), 0)

I'm going to try to debug why myself but figured I'd reach out to the
mailing list in case this was a known issue that's already solved or being
worked on?

Thanks (I can supply the full stack if you like but I wouldn't think it'd
help and decided to keep this mail shorter)
-Clint
