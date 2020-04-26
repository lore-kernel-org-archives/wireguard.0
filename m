Return-Path: <SRS0=KyK9=6K=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6D8C2BA1A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 Apr 2020 03:53:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49CA12070A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 Apr 2020 03:53:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+sDYiog"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49CA12070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c40d9f1;
	Sun, 26 Apr 2020 03:41:49 +0000 (UTC)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 56d8ce8b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Apr 2020 03:41:47 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x25so15748900wmc.0
 for <wireguard@lists.zx2c4.com>; Sat, 25 Apr 2020 20:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=9dfRV6cwCg1b3g7JD9rGEr4306ZPMu55LqDuUEGlT34=;
 b=h+sDYiogl2iXbCH++eH5weALum9j9gAc2BpoIbxaHbMoe9i+xH+aRdohZu/LhQ9dCh
 F+cft4hQ4vuk6CxJIL1nkmCvPiKhDsmML3PjvtdFTVnTDUvKajyjXG3qr3E6nLyPftYe
 cmhI7G5tJI7C4Ecu611XHxM1zRn5ibgsTZgHHgyMbCS1gb+BVHKa0coYwLRCaowPZXgb
 sechGwY4UFQGmQGr1wuD7pLRtLYHYbc28kpbgptf2AZAIl3XnfBhA9+y4Os6bk9rli5p
 J1YbjsBOsK0wP/o7kmPQRgNOwvjv7zZkjTdhaG5ceLpLIGTODP+GmIBtpguNxIDlW3Qq
 SWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=9dfRV6cwCg1b3g7JD9rGEr4306ZPMu55LqDuUEGlT34=;
 b=b7DbA+W6Pr7peIzJCVjj2p776+9SRaiDTBfAWPlKBNZGTJMmVyXO5WOVG8d4v0UCUB
 5X1nQlBzBN7Ubl02eoA8QVkSpdPBfve4Epups9Ht2hPX9Pi6pNeJVJznXrT3BpIe/T9e
 fQu0feYr5TlYEcJe3XJc3tduewjum5bBcwTbZnBrJbzA4AacckOIhJHVEce4sv+qHgcv
 KM/P5JVQtdHukLFg7DD0nmY0Uwg687TzjSHyDQIyDvKjL1yy84MBjAxLFIakDYchxpjt
 8R0eLKJpckHjl+e9LzmopVwMpWmBJ7gQYl5jYjqmc89ZFbEetCsr87GMvHbe5BAmnewM
 ThqA==
X-Gm-Message-State: AGi0PuavUCFSD6SGtBo49/miuCuHq825dVKK9Itz1Jx3e8byrsksvvVk
 mVrEHxzdN6Ci8Enlaa98AvUeb8tq2mhTrNNIvsGLsKcU
X-Google-Smtp-Source: APiQypKu0nnHqVWQqcUaKpWiWsNkG0nYqtkrwrYCwTfoOMu22Rvr6olG2xCeUPL71GXJu7i7ZjhOmUpm3+JlajLDrRo=
X-Received: by 2002:a1c:80c3:: with SMTP id
 b186mr20460324wmd.117.1587873185921; 
 Sat, 25 Apr 2020 20:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200424234327.1814-1-godisgovernment@gmail.com>
 <20200424234327.1814-2-godisgovernment@gmail.com>
In-Reply-To: <20200424234327.1814-2-godisgovernment@gmail.com>
From: Shawn Hoffman <godisgovernment@gmail.com>
Date: Sat, 25 Apr 2020 20:52:53 -0700
Message-ID: <CAPqQDTDPUH17QUQG4xehfiM9zFGw7PVQu=u00v5x15ts=L7SVQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] use ExEnterCriticalRegionAndAcquireResourceExclusive
 and ExReleaseResourceAndLeaveCriticalRegion
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

Looking back over this, the enter+acquire of the existing code is
shared here, so replacing with exclusive will change behavior.
For now, please ignore this patch.


On Fri, Apr 24, 2020 at 4:44 PM Shawn Hoffman <godisgovernment@gmail.com> wrote:
>
> Signed-off-by: Shawn Hoffman <godisgovernment@gmail.com>
> ---
>  wintun.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/wintun.c b/wintun.c
> index 90e7930..00ac378 100644
> --- a/wintun.c
> +++ b/wintun.c
> @@ -884,15 +884,13 @@ TunDispatchDeviceControl(DEVICE_OBJECT *DeviceObject, IRP *Irp)
>      switch (Stack->Parameters.DeviceIoControl.IoControlCode)
>      {
>      case TUN_IOCTL_REGISTER_RINGS: {
> -        KeEnterCriticalRegion();
> -        ExAcquireResourceSharedLite(&TunDispatchCtxGuard, TRUE);
> +        ExEnterCriticalRegionAndAcquireResourceExclusive(&TunDispatchCtxGuard);
>  #pragma warning(suppress : 28175)
>          TUN_CTX *Ctx = DeviceObject->Reserved;
>          Status = NDIS_STATUS_ADAPTER_NOT_READY;
>          if (Ctx)
>              Status = TunRegisterBuffers(Ctx, Irp);
> -        ExReleaseResourceLite(&TunDispatchCtxGuard);
> -        KeLeaveCriticalRegion();
> +        ExReleaseResourceAndLeaveCriticalRegion(&TunDispatchCtxGuard);
>          break;
>      }
>      case TUN_IOCTL_FORCE_CLOSE_HANDLES:
> @@ -913,14 +911,12 @@ _Use_decl_annotations_
>  static NTSTATUS
>  TunDispatchClose(DEVICE_OBJECT *DeviceObject, IRP *Irp)
>  {
> -    KeEnterCriticalRegion();
> -    ExAcquireResourceSharedLite(&TunDispatchCtxGuard, TRUE);
> +    ExEnterCriticalRegionAndAcquireResourceExclusive(&TunDispatchCtxGuard);
>  #pragma warning(suppress : 28175)
>      TUN_CTX *Ctx = DeviceObject->Reserved;
>      if (Ctx)
>          TunUnregisterBuffers(Ctx, IoGetCurrentIrpStackLocation(Irp)->FileObject);
> -    ExReleaseResourceLite(&TunDispatchCtxGuard);
> -    KeLeaveCriticalRegion();
> +    ExReleaseResourceAndLeaveCriticalRegion(&TunDispatchCtxGuard);
>      return NdisDispatchClose(DeviceObject, Irp);
>  }
>
> --
> 2.26.2.windows.1
>
