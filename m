Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09DDC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 03:57:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B75E660F3A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 03:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B75E660F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43d2b5e2;
	Thu, 14 Oct 2021 03:55:22 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d8dd3eac
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 03:55:20 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id g25so15067577wrb.2
 for <wireguard@lists.zx2c4.com>; Wed, 13 Oct 2021 20:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AN3g9ccXUyTtkR3h4wIKe479ar9w0Ai24roIK8Y1ReQ=;
 b=F6sUa2wOCFQT0LQu1OV8h/89aMV9MgC6ri9BoqmpWFbDiS4rD7ea4G36er30f2Khov
 tX1rVqLHqtcRj2ncRwiapPr8UD9lnEYGcbxyxVUJuZy0z5Qu+YIjKMmdwxXreoWiBxWb
 Gcqc9umTS7snOvR4925Xvoi75u9wPSTlco7Ziv1JsXj0BAgmpot+94Gc12Q32qg0Ek7u
 RG1LEN9bocPRAK/UJ2eFFU7hzLJoIxShk4jdITRSQkVMDHOlK0gPVRf9ZTKrJnhL+ZQF
 ZekazjASix7m5psBm/hjA6yjVf1I4PBNZlHu0NqphGqu6d1x7HK4k9wPC/P++ZwUAtQU
 v3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AN3g9ccXUyTtkR3h4wIKe479ar9w0Ai24roIK8Y1ReQ=;
 b=zmbiFlWt+TH0bicm1L45mi6+UopZ2QxkY7MiyzqSYtslEI0rutZTo1XcyjuF68MEYG
 B5RPzweXovTuECVM9dlmzxbxkl4ps+JeMR0iNIytvlMKGEwyT2PnPvUQTlkoLq0atS8g
 Eg+pmuev+rs7D184pHGb+8lvC7lPLyRTTGT/nZbTrMS4JxYwbh31JOw6JADhnL/3cRAA
 e6ZUWCCOn/oVaEzfxN39KIYe0LiyTC4YR6TDnqIx5Nj7SV7NTtWfsWFOUpNsLnLnYiD+
 nrjfJZfTVWXW3aW+SP0nTzvZ3nuKD5Fk9seJIesikzXKlTvW+hO9VK8obtV18uCBrPs/
 ZfNQ==
X-Gm-Message-State: AOAM533Ns5LnI57XbCgBr248UisYNyJNunWfJ2pJdVqTH+PuG+SNrB3z
 yLiIuT7rMvQ0vOl8lxi5w+kGBgDosJZgKLnhRBl27Enxn2wg8A==
X-Google-Smtp-Source: ABdhPJw+f76wBAXDJulWXlK1IeMKNzECTbo9nC1QRewyLYbutH/+sCrX3AJGSLsLaWWnnVRnpVHONLV3O0kRlE38O60=
X-Received: by 2002:a05:600c:2044:: with SMTP id
 p4mr3236160wmg.53.1634183719719; 
 Wed, 13 Oct 2021 20:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <83B7BA7B-85A0-4461-B4E5-91EA33BBF2C4@eutampieri.eu>
In-Reply-To: <83B7BA7B-85A0-4461-B4E5-91EA33BBF2C4@eutampieri.eu>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Thu, 14 Oct 2021 12:55:06 +0900
Message-ID: <CAA2ss9EZnrN78rvLbSrY-4x0o9k91FMXucoh+KndYUZ+E3BYbQ@mail.gmail.com>
Subject: Re: wireguard-apple localization
To: Eugenio Tampieri <eugenio@eutampieri.eu>
Cc: wireguard@lists.zx2c4.com
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

Hi,

When I did Japanese localization before, I was told to use Crowdin.
https://crowdin.com/project/WireGuard

I think you have to create an account and contact the project manager.

Hope this helps.

2021=E5=B9=B410=E6=9C=8813=E6=97=A5(=E6=B0=B4) 21:02 Eugenio Tampieri <euge=
nio@eutampieri.eu>:
>
> Hello,
>
> I=E2=80=99d like to provide a new set of localized strings in Italian, si=
nce the current one is quite broken, with a few strings missing and others =
not exactly correct.
> I=E2=80=99ve noticed that the repo tries to sync the localized strings wi=
th an online platform and I was wondering what=E2=80=99s the best way to co=
ntribute.
>
> Regards,
>
> Eugenio Tampieri
