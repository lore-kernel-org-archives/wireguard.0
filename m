Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029C2C6FD18
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Apr 2023 11:59:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4771f85c;
	Sat, 22 Apr 2023 11:59:50 +0000 (UTC)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5fa3ddfe
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Apr 2023 19:58:59 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-b98d4cacf6aso102602276.0
 for <wireguard@lists.zx2c4.com>; Thu, 20 Apr 2023 12:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sidebranch-com.20221208.gappssmtp.com; s=20221208; t=1682020738; x=1684612738;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IEgQ7/G1V1blUU8ytN+MqWPL/DgjB2ueIhuZOQp7jVE=;
 b=WumYaKp+P6dGnijHky+ffa9hsH+33YFoqgJ66zBhuxztxAIsRF7MtzT8Tf18+UGu17
 T/7xu5Um+iQiSfBsqxqURu8uUoTU+/9JgzBMU+nkWcE9Gglpy1MczankYwJGHd1zfn8c
 3+LGM+MWMrkEsV6Vgb0TM9v2pGowQ3sWMVFAyOgSyQZKIoN4EPAfsPBAjGcP6/2ZTDtv
 GD48hQf4m0R2T3t9xSBVjRjSGZxzaWsIU4YL4+AHF5vZO7vFES4t53iSoYzpy+Bgwiy6
 r7b/GhSw6rZ58yVitVreY0b3+lvgi+x09OGG36wir9Cb0+InldBWFR8sRvfL96yOBIXj
 uJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682020738; x=1684612738;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IEgQ7/G1V1blUU8ytN+MqWPL/DgjB2ueIhuZOQp7jVE=;
 b=j/QE8DdTKHUCO23TBDtpOUn7JvmJKhOVVMhfLS4dTbzJHjBo/DRHyRTsn/o3/rn78K
 Ghzj/DtHxGWvEfoQhrjbfwrT7efwvhawOjo/MGrkZ83KS8hVOyF/uLtebYOpMOUTqbHm
 WU2gEKJR4RjbOWNmA7fY1xBNl5Cys3w3W8/MyuiLThj0IXuu7FB6LmWWu2dpUXZllA8I
 fH5iXAzaK+AtONLBO6TApy0Fmtt3UxxyRMvzW8djCQWa+Bt/Afri7q2mFMlcnuVoBIjg
 AIc6E2V0MH8r5Ivqb3XI6pO8IHvw43YdBta3BzxAebV69Cyu1ziRlaZexaRWGEDMWEGB
 UpVg==
X-Gm-Message-State: AAQBX9fgP9ExUFQzLtRU2MNEhA/IDEm8qahyNSdMgyhD3bktPFaEyoDp
 9ttLj+ve7qfGBFF+FDqE6T3lwCMcE05n6kS5b3aFACyJLrtQcHUwrqg=
X-Google-Smtp-Source: AKy350ad2Hw1q5iQPhPTlV0Ex5JMZPWU0mNZWL/h0mvhR9pm/byp4KlmUl3l4aCy+ydiRqxTDC2Mz78IhSU1ZI0foOo=
X-Received: by 2002:a25:40e:0:b0:b8f:502c:64a0 with SMTP id
 14-20020a25040e000000b00b8f502c64a0mr127352ybe.37.1682020737547; Thu, 20 Apr
 2023 12:58:57 -0700 (PDT)
MIME-Version: 1.0
From: Leon Woestenberg <leon@sidebranch.com>
Date: Thu, 20 Apr 2023 21:58:46 +0200
Message-ID: <CAMjhiJimUHUVjTybh0kfMUWHgVv0n7qJKQU+Ac3kabdtdRMt3Q@mail.gmail.com>
Subject: Linux counter_validate() RFC6479 replay detection modifies bitmap
 before authentication?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 22 Apr 2023 11:59:49 +0000
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

Hello all,

I am trying to understand a few details in WireGuard protocol, looking
at the Linux kernel WireGuard implementation if I am unsure about the
description from the paper. One question I have:

Does counter_validate() in the receive path update the bitmap from the
Type 4 counter (their_counter) before the received Type 4 packet was
authenticated?

Regards,

Leon.
