Return-Path: <SRS0=ZUZz=4Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CFCC10F28
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Mar 2020 04:19:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC7BD2072C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Mar 2020 04:19:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryBxK2TG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC7BD2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e058dba8;
	Sun, 8 Mar 2020 04:14:01 +0000 (UTC)
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [2607:f8b0:4864:20::e2a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20efcef9
 for <wireguard@lists.zx2c4.com>; Sun, 8 Mar 2020 04:13:59 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id a19so4061337vsp.6
 for <wireguard@lists.zx2c4.com>; Sat, 07 Mar 2020 20:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FSkg5BNozydOZUPE+Jmg660V2XUOMB4Yn11xfxaTKiY=;
 b=ryBxK2TGqAMiM21oVAmKEnvdJHlLmLHeN3hebtUxvMSiIzaBwxIF13obSKaCC+yt69
 wQZmCn8e+1KqZJU9ewvhY7g/GvF/LBL8DU+9nrErE4s2FfeaEDB4OD8ZxnsVw66QLQ1k
 XKGAeCBIt2JAylyHxeJ3fHB8IK8RLQtElff6DMMvdBspF8b0CdhfPdtODZcn1B3dsEUY
 wkS35Segi7x8mDQEl/9O8YzWeb9wfko3QH7JZkxCIRxHqjncbsShpRYoqqWLI5BWFBmk
 XaJwKmOe8+Ju5KFb+ubRddUQuh2cjfUKU6nHEaX48wyoic+TT/fI2vkh/0J6IWYK4YHj
 5P8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FSkg5BNozydOZUPE+Jmg660V2XUOMB4Yn11xfxaTKiY=;
 b=s4I8na8oTiIVqHm6hYFHkSNWY96zephFS1lv6h6HdO/6LiI1juwEo0Ag5d0Ryv1Ceg
 H1WxPcJL2f3Mv+zNm56WG4Z2807UEQ7CMyD/FQCLnO3e1tP4OBImuAWNyZH7Rj61tnYO
 F3GQP9xZAVAtPREtGB42EkvU0/xaAYiPc0G+ewznYCTcaKhRNFMlnUSzHcVbyUn96Plp
 u6ta2yyogsnmPS/ifvA3Sqtksc+d3q4PIIcmxKQnECYfASYPLy+2/1IWHGW7+6h8mXzg
 6glnG9rn8FfUazMmc0rHAhUFP6L9/feVazhGJgGa8kqgnKd7EPpnL6jDlmOrp/DPJOTS
 wLmQ==
X-Gm-Message-State: ANhLgQ1TFvXRxvdF57MWZIg6KgYR37C38t0w9XfQIgpSsraHgxW1Hvnj
 ycPHpwNwWvbQWxjdaIoIzWnt8ozas9LbzT29nZyGruBK
X-Google-Smtp-Source: ADFU+vv8iGcaTP4ZHp6Fzi/2lVRZrWwItx0NoMTu7RdHSJYjHbA8Rrp1uUbRrdoTXeQFd4hqfDvELMrNQ8RI1wgsIDs=
X-Received: by 2002:a67:7f58:: with SMTP id a85mr6872858vsd.28.1583641139496; 
 Sat, 07 Mar 2020 20:18:59 -0800 (PST)
MIME-Version: 1.0
References: <F77DB7FE-175E-48E4-A071-FF86D290B494@mail.ch>
In-Reply-To: <F77DB7FE-175E-48E4-A071-FF86D290B494@mail.ch>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Sun, 8 Mar 2020 13:18:48 +0900
Message-ID: <CAA2ss9EE35hYqjOC_uY9REe-Mp0D04bPH9Ldg0wConQs8VG24A@mail.gmail.com>
Subject: Re: WireGuard for macOS
To: tormen@mail.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
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

How about install wireguard-tools from Homebrew ?
https://www.wireguard.com/install/#macos-homebrew-and-macports-basic-cli-ho=
mebrew-userspace-go-homebrew-tools-macports-userspace-go-macports-tools

I have not installed, it seems installing `wg`, `wg-quick` command and
"wireguard-go" backend.
I think you can use them for Connect / Disconnect from CLI.

And,
> I would love to use both (GUI + CLI): No automatic connect in the GUI,
I'm using "On-Demand" option for automatic connect, is it appropriate
for your purpose?

Regards,

2020=E5=B9=B43=E6=9C=888=E6=97=A5(=E6=97=A5) 10:01 <tormen@mail.ch>:
>
> Dear Wireguard Team,
>
> First off, thanks a lot for the client for macOS !!
>
> Is there a possibility to issue a "Connect" / "Disconnect" command from t=
he command line
> instead of using the buttons in the GUI ?
>
> I would love to use both (GUI + CLI): No automatic connect in the GUI, bu=
t rather automatically connect / reconnect via script (so via command-line =
interface, CLI).
> And I don't like the idea of not using the GUI and switching to the cli v=
ersion as then I don't have the icon.
>
> Thanks a lot in advance for any hint or feedback!
>
> Tormen
