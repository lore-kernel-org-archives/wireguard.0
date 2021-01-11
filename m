Return-Path: <SRS0=3yHi=GO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FAEC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Jan 2021 21:54:59 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4408B22CB2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Jan 2021 21:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4408B22CB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d8d1ad0;
	Mon, 11 Jan 2021 21:52:45 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9e821c41
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jan 2021 21:52:43 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id u19so89751edx.2
 for <wireguard@lists.zx2c4.com>; Mon, 11 Jan 2021 13:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=UUELT5Z6zgQ8NTQYsbADqyjXM+YjNBYbMghGu7GG9LU=;
 b=KJoNUpUpeVJ0ma4HhvmEU7XY/i39OyefPmfA+egS+hI+rrTHzZ+uZ8eJVZq9zuuXf1
 GVBKJ75ODP8Tk5akPAa6fevdc76nH1pFYiWKQPv1iU5GPky5Sd/UdaOutmlaqXT7iGfc
 4fHzGtwy0UZE58gXHgaKPaNWduUfIsJnR5iumT6H5bHVn1kJoZl2R48vWZxqvMkeTS44
 HX3hQQZdn6aGJCodF/Z97J8k5vnkje6LzUPQeluUmt3q4vz2vbwHE2QT4Zt0Nk6hRFjg
 xjTymAPsiDR42oxCSbN1SKH1kYRjhSDpJ5mdU5YAaN6lrElLzzzllu5qSqGXAlcX8Lwl
 FPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=UUELT5Z6zgQ8NTQYsbADqyjXM+YjNBYbMghGu7GG9LU=;
 b=dRnsARGAmybqIW8ISiL5s5HceOrayG2MevBccrOPHQbpA1IvwOtlvZdk89ZSboGp1Z
 VCDx+O3AGlV7u9iDTq4GTRNfru4CbpwH8ACUEIv9Avq8Qy50ySdFWp/P2iocFsMC7ZGg
 MwAneBWGS8oM+f+ALa08GnjTNIat7CBTcpuVpg5HEdOuJUsVNBH5cYqUBToHbfCtsyIB
 bNcNjjZD200VSehoGUJHmrpefpGcHSd1NH+njH0Ovt40ze12zFGR1CcHtvHtzZMr1wpi
 52MF5Jdhukjj74RqDiqmtZWh9JONd9n1PQFmo25YqMtgT8FuV3yT8psOn6LIcdCBiHt7
 5AHg==
X-Gm-Message-State: AOAM530jD65z7M9Drh/Gy3BG2l/MSItkhJ+yvFcZp8f2Ej2g27zFYwLw
 Wu4pFN96SZE7KGlhxRyS3YJhM28MFT8=
X-Google-Smtp-Source: ABdhPJxi0hfbVQR7Rj3HitHt8iso9PB7ylivi7NzAr1STQ08wOP4RbFZlQPvDZL+nZvEnSXlA0trhg==
X-Received: by 2002:aa7:d846:: with SMTP id f6mr984562eds.55.1610401962743;
 Mon, 11 Jan 2021 13:52:42 -0800 (PST)
Received: from [192.168.1.3] (93-48-172-72.ip258.fastwebnet.it. [93.48.172.72])
 by smtp.googlemail.com with ESMTPSA id d4sm512405edq.36.2021.01.11.13.52.41
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 13:52:42 -0800 (PST)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Germano Massullo <germano.massullo@gmail.com>
Subject: AMD RDRAND
Message-ID: <78d6a7df-fa89-7d75-480b-aea3c52f72ee@gmail.com>
Date: Mon, 11 Jan 2021 22:52:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

I would like to inform Wireguard developers about the following.
it seems that this [1] old AMD RDRAND problem is still present:
RDRAND on AMD Ryzen 9 5900X is flakey -
https://github.com/systemd/systemd/issues/18184

I own 2x Ryzen 3600, feel free to write me in case you would like to run
some tests

[1]:
https://arstechnica.com/gadgets/2019/10/how-a-months-old-amd-microcode-bug-destroyed-my-weekend/

