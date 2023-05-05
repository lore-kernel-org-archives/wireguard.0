Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D134C3DA6E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 04:58:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5627f66;
	Wed, 20 Dec 2023 04:58:50 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 217cec55
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 May 2023 18:14:54 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50b8d2eed3dso3250364a12.0
 for <wireguard@lists.zx2c4.com>; Fri, 05 May 2023 11:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google; t=1683310493; x=1685902493;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PiPg/UmeOzhqiGA9MZImgyB/L9zWAT+EUbVnGEk/RsE=;
 b=CZ99JigMlivtDbl4rPRnoWENIu37UhPAW98OG1TVptiWEI/Dp+YIkhCOqPvjvanNpp
 PjwsH0FOj7R1BqB3Q5paSIW2Tu3qSM14TmmVzz33JxIaB8vthAqi8XIOqZ+w+ntbnIxP
 NdWdYOkNggem/QIvw4bdHDQQQZm88kvG8rM9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683310493; x=1685902493;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PiPg/UmeOzhqiGA9MZImgyB/L9zWAT+EUbVnGEk/RsE=;
 b=cuV1WiwMPie8sd2TiggjKZan0CsRxtCOxw1RnJZXeriE5mAeUy/kSno13ktjG/rqY+
 LS0HurQsMMowZ5sIQV4hBwamPOT7jLQZBAJDpJd97IgNsirpq9jFwR2e+K5FtS8E+0N5
 DqmvESIRVRXFEtJNyEVwOY6wYMyhjTcH+5sYGYjREx/ZtLeSGj2XIb7H9RdzX1/Qylv1
 3FdNGiS6crHSaICxxtbJJ2YGq0aa4r4hjcn/wi7QzN9LRTdwdohSCey7oAOTXE1oTe5d
 GO4ztDIAdG066izmSYYdDOHt0tXi6fbR/g2OhborLgcpCDv6e1j04qe3ruBEvS8AbqmW
 EhRw==
X-Gm-Message-State: AC+VfDzLu7t88ouLZoi3jqWgO8f/zACu3nyVvE4TofOMMrA6b196sSo7
 3Usmd8SYlDJjgwvcXwo+3O7yjJR5cdJjk4/Ef8SFU1J+wfi+9nfVvMQ=
X-Google-Smtp-Source: ACHHUZ65H1uT9bKXfYpJBGbolvL9YeK5tNV5NsqnXlWhr4qwZmg5XxbgmTibx5BF3Z7g8VXArTd5WH2N92ElpF5kk/I=
X-Received: by 2002:a17:907:94c2:b0:962:ec98:cd7e with SMTP id
 dn2-20020a17090794c200b00962ec98cd7emr2295080ejc.71.1683310493289; Fri, 05
 May 2023 11:14:53 -0700 (PDT)
MIME-Version: 1.0
From: Shiv Patel <spatel@cloudflare.com>
Date: Fri, 5 May 2023 11:14:45 -0700
Message-ID: <CADcrW6+_s9qyS2MfQxmkAY8TSis8+h1uXBwWTMJE3g+97k_eMw@mail.gmail.com>
Subject: WinTun - Blue Screen on Windows (DPC_WATCHDOG_VIOLATION)
To: wireguard@lists.zx2c4.com
Cc: Thibault Martin-Lagardette <thibault-ml@cloudflare.com>,
 Kyle Krum <kkrum@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 20 Dec 2023 04:58:44 +0000
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

I am a Product Manager at Cloudflare working on our WARP application.
As of Cloudflare WARP Version 2023.3.381.0, we are using WinTun to
setup our wireguard tunnel and it had been working great. In the last
few days we=E2=80=99ve received several reports regarding a Blue Screen of
Death on Windows 10 and Windows 11 devices when the product is turned
on.


The error code is DPC_WATCHDOG_VIOLATION(133). Args aren usually something =
like

Arg1: 0000000000000001, The system cumulatively spent an extended
period of time at DISPATCH_LEVEL or above.

Arg2: 0000000000001e00, The watchdog period (in ticks).

Arg3: fffff8017a4fb320, cast to nt!DPC_WATCHDOG_GLOBAL_TRIAGE_BLOCK,
which contains additional information regarding the cumulative timeout

Arg4: 0000000000000000


The function is usually different each time, but all in tpcip.sys.
Here are a few examples


SYMBOL_NAME:  tcpip!RtlAcquireScalableWriteLock+15
MODULE_NAME: tcpip
IMAGE_NAME:  tcpip.sys
IMAGE_VERSION:  10.0.19041.1221
STACK_COMMAND:  .cxr; .ecxr ; kb
BUCKET_ID_FUNC_OFFSET:  15
FAILURE_BUCKET_ID:  0x133_ISR_tcpip!RtlAcquireScalableWriteLock
OSPLATFORM_TYPE:  x64
OSNAME:  Windows 10
FAILURE_ID_HASH:  {5c8b9f1f-7ae1-233f-1a70-950d5491c936}

OR

SYMBOL_NAME:  tcpip!IppFindOrCreatePath+f47
MODULE_NAME: tcpipIMAGE_NAME:  tcpip.sys
IMAGE_VERSION:  10.0.19041.1221
STACK_COMMAND:  .cxr; .ecxr ; kb
BUCKET_ID_FUNC_OFFSET:  f47
FAILURE_BUCKET_ID:  0x133_ISR_tcpip!IppFindOrCreatePath
OS_VERSION:  10.0.19041.1
BUILDLAB_STR:  vb_release
OSPLATFORM_TYPE:  x64
OSNAME:  Windows 10
FAILURE_ID_HASH:  {bf177f95-f651-3035-3f86-b46e476b90e2}
Followup:     MachineOwner

OR

SYMBOL_NAME:  tcpip!IppFindBestSourceAddressOnInterfaceUnderLock+107
MODULE_NAME: tcpip
IMAGE_NAME:  tcpip.sys
STACK_COMMAND:  .cxr; .ecxr ; kb
BUCKET_ID_FUNC_OFFSET:  107
FAILURE_BUCKET_ID:  0x133_ISR_tcpip!IppFindBestSourceAddressOnInterfaceUnde=
rLock
OS_VERSION:  10.0.19041.1
BUILDLAB_STR:  vb_release
OSPLATFORM_TYPE:  x64
OSNAME:  Windows 10
FAILURE_ID_HASH:  {2e016b48-a7c2-0910-9f41-71eded0c9f01}


Has anyone seen this on WinTun? We can=E2=80=99t find any commonality betwe=
en
windows versions, hardware, software on the devices. Hoping this is a
known issue.
