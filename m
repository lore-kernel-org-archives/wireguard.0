Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EE1C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Mar 2022 17:16:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e8c18144;
	Mon, 14 Mar 2022 17:11:48 +0000 (UTC)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [2607:f8b0:4864:20::644])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5523cd73
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Mar 2022 07:31:41 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id e2so16288004pls.10
 for <wireguard@lists.zx2c4.com>; Mon, 07 Mar 2022 23:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=AzPD7q8txdDIgtwh9LNL3h8HyNsNj9Pb4z6vMoVDAyM=;
 b=eqlF6B3ZH4aG6nRfZvm9+ahxZx0dFp7eGNqbdmkInsbZGhu3XdqjzgjaAYtgMkQ/WL
 NN0nnCGDMgLuWSriFGZFCUTff3XKNb17UX6oo4Unroeu+WaCSrVPwLzSRkOvBn9fGMIE
 VNVcwRsmf9/MriSXOFQPRVaI3DDJFXkY70UW+epl8jOZtRKhj+OKYUCfDrMuzx9EN29e
 JIiRUWdkd38ARN6CuN77fV0so6U5A8URcCHUimNhkDT7pTJh3ph6pZX521fgItJnq89+
 IDXAj9hhkCuORp2AvHDTItTpckgKOzH9yOtpPlml2XjObYl55xKBRtZdU09bc7uyWuat
 DvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=AzPD7q8txdDIgtwh9LNL3h8HyNsNj9Pb4z6vMoVDAyM=;
 b=Ug4clowXz4PrbVPDatnkJQtUC4yjbviw+ovYTXOA3CwH9e7sJo3wRS2xd2n8rvlKez
 2s7vgZbXnjhMn0yIUMyodue9wTF5WyIIz2Z3NtsTLYcZmOf3DbtwtsoUS8hha+chQL5j
 oFkRQbX1yUvsv64Lss6vjd1+Od41p8PPvLX2dls/E975wzjKIPsK5bWzwnBsf/Ezt4GE
 WCIsA+B9HF9p5y0Bt+NSZJITFuhlNk4R9iM/tX/OOu8K+CYkWRn+qx4yqbiy+qStMYUn
 tn3v9TcsbnbE0US5fBu4t+DxN1t9QNCtfQXM+cOwM09581V+hoj1gNhHxqEvFh5r3v1X
 ZwSg==
X-Gm-Message-State: AOAM532QnNxI7vEf+3Wsf2B9PMX6KCmU6/EdfwQ7bRMV+dr4gqaEW3FC
 Q30roCNP4q5hkBH+URRj13ZBGxVyM4fnwi39nnbFbXsr4eU=
X-Google-Smtp-Source: ABdhPJw3im14oEMp2fWgObITc4EeIia4H/AaB0PQY+avDDRtxndEyMvlqKLCiIpCaynde5w1vwwFh4zSDCdqMsaYgKc=
X-Received: by 2002:a17:902:dac7:b0:151:95cf:7863 with SMTP id
 q7-20020a170902dac700b0015195cf7863mr16287775plx.123.1646724699513; Mon, 07
 Mar 2022 23:31:39 -0800 (PST)
MIME-Version: 1.0
References: <CAMTegSQZ=7GQMtbKpRu8Z-+igZVdKwQHb9HPyFt3ikYS2i5GsA@mail.gmail.com>
In-Reply-To: <CAMTegSQZ=7GQMtbKpRu8Z-+igZVdKwQHb9HPyFt3ikYS2i5GsA@mail.gmail.com>
From: Dan George <dgeor8@gmail.com>
Date: Tue, 8 Mar 2022 18:31:28 +1100
Message-ID: <CAMTegSQfJiwcQnAzQP3hD4Bo8zcCLkUGWiUifBFaVvLPoCoUdQ@mail.gmail.com>
Subject: [wireguard-linux-compat] fallthrough macro breaks pre-5.4 kernel
 compatibility?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 14 Mar 2022 17:11:40 +0000
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

Hi all,

I just tried compiling the latest wireguard-linux-compat kernel module
v1.0.20211208 for kernel 4.4 [1] and encountered the following error:
"net/wireguard/compat/siphash/siphash.c:112:36: error: =E2=80=98fallthrough=
=E2=80=99
undeclared (first use in this function)"
The previous version v1.0.20210606 compiles and runs fine.

Some (inexpert) digging suggests that this is because a recent patch
[2] modified siphash.c to use 'fallthrough', which is a Linux kernel
compiler macro that was only added in kernel 5.4 [3].

In which case, presumably, either 'fallthrough' needs to be removed
again, or the macro added in wireguard-linux-compat somewhere. I'm
happy to submit a patch for either (although would appreciate some
guidance if the second option), or someone with more experience can.

In my immediate case, removing all instances of 'fallthrough' from
siphash.c has fixed compilation.

Thanks,
Dan.

[1] Specifically, in case this becomes relevant, cross-compiling for
the Synology RT2600AC router (armv7l, kernel 4.4.60) from Ubuntu
20.04.4 x64 using gcc 4.9.3 according to the steps at
https://gitlab.com/Kendek/syno-router-scripts/-/issues/3
[2] https://git.zx2c4.com/wireguard-linux-compat/commit/?id=3Dea6b8e7be5072=
553b37df4b0b8ee6e0a37134738
[3] https://github.com/torvalds/linux/commit/294f69e662d1570703e9b56e95be37=
a9fd3afba5
