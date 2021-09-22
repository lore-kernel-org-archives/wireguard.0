Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E649DC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 00:45:29 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04350611C6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 00:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04350611C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b7bbba9;
	Wed, 22 Sep 2021 00:45:27 +0000 (UTC)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fab19e0c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 00:45:22 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id h3so847308pgb.7
 for <wireguard@lists.zx2c4.com>; Tue, 21 Sep 2021 17:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=J/z25Zynnvm8PDO5rwG0YUEem1Db1moFKpgzctQR59w=;
 b=JZ/p8o7yOdMWpzG8v68bcX56NABHOG+onbZoLanh0YFswgd81ehuZpVm9M+3WSCrSQ
 B4gIP8zlKRBz8EewpC3iKjNUwRZWdOqmef1IAIfJ3AzCDbt3lpPtdqW5QVx4VGlcwZ0V
 xmYzs9ZNdjYnrJGPG66BCso3eunG8nr0m8yUe7jPyS4xLFsC9gDzAjNbPa48+gvLu8Kh
 Vi9rCO+JrY5hjO224sAtTnoqI6NvZgurtcpGxqgBpGelFz25KnOFbbGPtMokY4XzT2fb
 C0Rnh2Ap3dUE47wPUth5rWDgePoYOHtlwpqEr3d0EQauuJTVkM/4usx/Gf+2jYq3RrxT
 wDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=J/z25Zynnvm8PDO5rwG0YUEem1Db1moFKpgzctQR59w=;
 b=E6Hlj9FP2qv4DzPARLCkin3YzOdM2hjyOIZd2X6rRC30RAS2pcm0BQStM97qylYIuf
 Yz7YbkOtR/UpFEFAT3PpTt2PC3VMX+xAdHKqac3DJnGM4WOY1Nauf/6vjWPU47MQTLEj
 bLThB+mx6fgmFdXhKS3SgSeHZdrc/JTulIq/W0LrrQ68gJvODcQTA4HZmyHFk4yqOZDO
 ddzrvH7D/8MEr58zrcntNIn2PjWX1PBo2hee+gss0I86FdtReeUTg5z11pZ7hXrA+AuF
 YiAqIfIxW0Yw+D2oBeQL8rT8/d2LxMN4HyNhMq8VX80khycjqFZ5CteTHD9KRWz+ah3X
 flfg==
X-Gm-Message-State: AOAM530UR/lRWFx9DxdOOOfYZzOaDqWh+Cr797L5hW7GCZ3UQZKyA7Mv
 NN0hslBteKvdShAxrJohYPqKGiqFLmU=
X-Google-Smtp-Source: ABdhPJyZElPa7ky7ePwrle3LUqcjZFquLe00HjD7rhrWpi5QBGhujSZPIlBs/Lpgeholzl4wqMzzmw==
X-Received: by 2002:a63:24a:: with SMTP id 71mr5669500pgc.285.1632271521189;
 Tue, 21 Sep 2021 17:45:21 -0700 (PDT)
Received: from smtpclient.apple (216-19-179-128.dyn.novuscom.net.
 [216.19.179.128])
 by smtp.gmail.com with ESMTPSA id ga24sm3577745pjb.41.2021.09.21.17.45.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Sep 2021 17:45:20 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
From: Miguel Arroz <miguel.arroz@gmail.com>
In-Reply-To: <4634569d-1f93-3544-90be-c989dd32752b@attglobal.net>
Date: Tue, 21 Sep 2021 17:45:20 -0700
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <257B7EB1-D01F-418E-AE16-F01822BF25B3@gmail.com>
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <4634569d-1f93-3544-90be-c989dd32752b@attglobal.net>
To: stunnel@attglobal.net
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

  I=E2=80=99m seeing the same problem in the app, but the tunnel does =
work. Its on-demand flag is set, so maybe the network extension is able =
to find the item in the keychain, but the app is not.

  Regards,

Miguel Arroz

 =20

> On Sep 21, 2021, at 5:28 PM, Eddie <stunnel@attglobal.net> wrote:
>=20
> On 9/21/2021 5:23 PM, Eddie wrote:
>> Title says it all.  On both iPhone and iPad.
>>=20
>> The configuration names still show, with the slider, but trying to =
activate gives:  Activation failure.  Unable to retrieve tunnel =
information from the saved configuration.
>>=20
>> Selecting a tunnel name doesn't show any configuration.
>>=20
>> Cheers.
>=20
> Quick update.
>=20
> The log shows:  [APP] Unable to open config from keychain:- 25300
>=20
> Cheers.

