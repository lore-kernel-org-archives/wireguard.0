Return-Path: <SRS0=38ps=PI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2FAC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Oct 2021 06:23:41 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3687D6115A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Oct 2021 06:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3687D6115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f78a5ee;
	Wed, 20 Oct 2021 06:21:07 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ddbc9861
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Oct 2021 12:18:44 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso2838562wmb.3
 for <wireguard@lists.zx2c4.com>; Tue, 19 Oct 2021 05:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=HD++/zPXcnUmn2kRtnPtFpAfRsxiNm8lqSjbkuFbU4Y=;
 b=MMQZu1KtwMKVSADPmGhPffCNINDgpxK2nQFV51XxlQsoT+O8TqtJFUYglXSatGnEnG
 iW4LSJDkoVDrz1ug7mCqnstkBE0KVDt+pTj/04bgp3QiVHHr+q/QbvdopvQAps8fgqAD
 eUgcL2zF0JnW9JUGyKxOJziLr4OlLWEzfd9mwghVoWZPabP6VJEpQYf2RaYJpqglc9AZ
 wE2n9WBNFC/ksxI/NcaE0Wg5EpUDB3IQ77ZMxMc2p0d0HKtvZPdHvWfdRC00OehH5rtQ
 BH8ziX8cR7ezsNdYtRjKuZg5Lrf+CXL3nsPoEzM7gtNdRmTS1+LoynluSaMrQCn9dZTT
 Thew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=HD++/zPXcnUmn2kRtnPtFpAfRsxiNm8lqSjbkuFbU4Y=;
 b=irhMjLBpvfbuuYmYWd/2OBIF2eME2R1T4LacdZdZbJtjS4UHxWA5mZaob7jDMnVm5a
 EANyW1kaQO/Y3VdgJnfSF3xSaFm9LHhxoN8mgIG29297Nb3J/sV+TFitrDHGYzvXH3yU
 eRSYRCMUPn6xLDrLho5JJgT7uRgmrl40YyeduzSF3oPzObFBadPsc99Erdv1AKUmyESR
 q5IYGJlRarV2QXtWutII7++6/C4Y/ubgodPkFp/a2myfrEtIXg2gtd3wqWTxRWPVcJ6C
 WwHpdGR+ws+KUjd/pM+a7CJ6z5q3Bb4cpbtjuhtIJ6gAd38LhtOgRRCKgbN887V+gYY3
 olYA==
X-Gm-Message-State: AOAM530UiE1BoynRPwiWdY/3IJXtgjoNbgUKg/unhab2TarUv0i7v/Xt
 ZOCOY0YIH4DUZydsf0U7wE8ptPAlojQllw==
X-Google-Smtp-Source: ABdhPJzjvBNq7L+aSY4r4nLGAbVhbJQMho3FZx4Ijb72iApspigLImJkVEPC1Enu6lvoly+N4YIN0Q==
X-Received: by 2002:a7b:ce8d:: with SMTP id q13mr5571619wmj.103.1634645923748; 
 Tue, 19 Oct 2021 05:18:43 -0700 (PDT)
Received: from smtpclient.apple (82-132-228-119.dab.02.net. [82.132.228.119])
 by smtp.gmail.com with ESMTPSA id
 w5sm14887221wra.87.2021.10.19.05.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 05:18:43 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: CW <optionmaker@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Build wireguard-linux-compat on SLES15 (s390x)
Date: Tue, 19 Oct 2021 13:18:40 +0100
Message-Id: <F0E5BD71-BEA5-4DB5-A8F0-C51EF048A2CD@gmail.com>
References: <YW6ljZ3yvGsv9Njq@falared>
Cc: wireguard@lists.zx2c4.com
In-Reply-To: <YW6ljZ3yvGsv9Njq@falared>
To: faustin@fala.red
X-Mailer: iPhone Mail (19A348)
X-Mailman-Approved-At: Wed, 20 Oct 2021 06:21:06 +0000
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
If I didn=E2=80=99t remember wrong, wg should be included in kernel with 15s=
p3.


Sent from my iPhone


> On 19 Oct 2021, at 12:05, Faustin Lammler <faustin@fala.red> wrote:
>=20
> =EF=BB=BFHi!
>=20
> FYI,
> I have managed to build wireguard by removing the #define.
> https://git.zx2c4.com/wireguard-linux-compat/tree/src/compat/compat.h#n859=

>=20
> I am not a C dev, so I am not sure what the implications are but I
> understand that it's a kind of debugging structure and it's also not
> defined on CENTOS8 so, I guess it should be OK.
>=20
> Cheers!
>=20
> --
> Faustin
