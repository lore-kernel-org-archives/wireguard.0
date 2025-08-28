Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E7ACA0EED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Aug 2025 08:33:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95266b93;
	Thu, 28 Aug 2025 08:25:18 +0000 (UTC)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5741249f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Aug 2025 08:25:17 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-32326e09f58so735495a91.2
 for <wireguard@lists.zx2c4.com>; Thu, 28 Aug 2025 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sidebranch-com.20230601.gappssmtp.com; s=20230601; t=1756369515; x=1756974315;
 darn=lists.zx2c4.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sn5toHP2UTjOZ/DRMAyJtr7Bls8Mri2KQ79nYSbzKXc=;
 b=MMygqe7F6DEd6kua9yIlZUQJ8QQSQ18RdTTB3latRV2b2qIqIEPp/XzwlioUbZS9q4
 ucbB2ar4WIuwQJzdDy71iJG2qqNBa85448YMJQSIXrOj8tVmKY08F/ULDYfa21StdW7p
 Zc9iksoGXQhLRZsEHM5zJeobK8Zgdt7Reu96ltUWnTaHw+E7+qMUaKRnFGf/lMssAB0G
 zeCr02y0/nNDsAenHWkfqM4gCnL7U0CcxAnrBvXTQIHTeP+LavuPt0HRF5cv8ZBaXMx3
 /ZcYosCnsfFJZaHMLCeYYtn8Wdl9e76qGjm4mFPCc6p5EnvmrOzD3DlX4xqhr3K5xfdJ
 JRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756369515; x=1756974315;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sn5toHP2UTjOZ/DRMAyJtr7Bls8Mri2KQ79nYSbzKXc=;
 b=Xo3cuefhdWmAY77j6pJcVjm8VArgOUT6ChpL/UZATdq++Twlaqfz6DS4VppnHz2WBu
 1nksqK6KVnljP+LTncU4COdeYiUx0C+dG9yal0fIpd22c9jaMO3oAfRo/vPkPYxBzEQ1
 bSZ18fFUnet77GO0SYn7SgrsJgMj0O03WSvjHmuK9X8pkw2xAsOik/13i3StcSaYSXw4
 5cpHOBnL5NeP2J2cZvTzHoFak12CeppeNjuop0AipncIP7ubNMC8JVQA75VjJICJPRxS
 ISviGRZF3ZN78JOMxm+FMJWV65WsPO4eLSTkUUZcVOD2mESH/B7iaZNrS36ufg3kvYoJ
 AURg==
X-Gm-Message-State: AOJu0YweBdSawO2r//VSF6hnfAcg7Ij516vMs+RfmA7CXwRJjws4d/Tj
 c3DB2RmzLRE+RWrFuZa2OpkYZ0sY4kyGUl+PRpNHfLGn+OGZsm+JTWhEQBCohLMJReldXtDarhP
 EiVAOnEsFfvBCksAUbzeValDZP+M2Zl4/IETtEouoiw==
X-Gm-Gg: ASbGncv1O2LC4csBKUkXijaFTDLrRIsboiYBN+dGSwMkcujhc2RczqBX5LPKW0o/gFB
 AqxAFkrgRB+sSQtOGF4lehznqXPWXnVi/o74S4MrlQD9mtZpBo36sCmBOIc2XlJ+GLFynImk5D9
 9BLK4QwN8X4g1FcudhXGaCyJcXFh+JATvvv0INq7xH1L9LptyxnB5z/SYSnfYKr8eU7vWtnvypv
 aqUjTKo4P92R6swVJP8LR5zRoMs6P1N+gzlpDq9Xl+9S+aW
X-Google-Smtp-Source: AGHT+IHpUYzW3KnjU6Z4wpICS0bshcXWp/cQ3UNAGslZJRcUZoGNkbskMzZHV75VwBpC/Yey2xxhTI5mCm1dwUzq/sg=
X-Received: by 2002:a17:90b:5281:b0:325:7307:bbc9 with SMTP id
 98e67ed59e1d1-3257307c19cmr20856689a91.18.1756369514813; Thu, 28 Aug 2025
 01:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <CABBZOsmKJYs9HeaMeNx60om81V2mCagWWhCgbxeppr_2FD_xfw@mail.gmail.com>
In-Reply-To: <CABBZOsmKJYs9HeaMeNx60om81V2mCagWWhCgbxeppr_2FD_xfw@mail.gmail.com>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Thu, 28 Aug 2025 10:25:03 +0200
X-Gm-Features: Ac12FXysr2D7lcykSqAQJ876OE2UmqCujE2mnDzzPRlJpu8nnMs9-r35UnQeKXc
Message-ID: <CAMjhiJjtnyRt5khY9L0cCNXr969mbmLDoWhzAL1wvnmXziSH2A@mail.gmail.com>
Subject: Re: Google Play 16KB alignment issue with WireGuard library - fix
 needed
To: Houman <houmie@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Thu, Aug 28, 2025 at 9:31=E2=80=AFAM Houman <houmie@gmail.com> wrote:
>
> Google PlayStore is no longer accepting apps affected by Google Play's
> 16 KB page size requirements.
>
> The native library `arm64-v8a/libwg-go.so` (from
> `com.wireguard.android:tunnel:1.0.20230706`) is not 16 KB aligned
>
From what I read, the requirement is not to rely on 4KiB (hard coded)
page sizes.  Or are they going to hard-code 16KiB now??!

https://android-developers.googleblog.com/2024/12/get-your-apps-ready-for-1=
6-kb-page-size-devices.html

-
Leon.
