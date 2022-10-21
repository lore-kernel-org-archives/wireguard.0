Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CB7C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Oct 2022 13:25:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b6d4ef4a;
	Fri, 21 Oct 2022 13:25:57 +0000 (UTC)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 989ed49a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Oct 2022 13:25:55 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so6656757pjq.3
 for <wireguard@lists.zx2c4.com>; Fri, 21 Oct 2022 06:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=990XCsrOLTXpyHOEH/DU/E+gO4K/fI1NcB5r20RNzmE=;
 b=EdOg1JnI5fwWN81P0GNju7XwjGpbuTgki/lmE5QKdTBoyRhaBnqse0OkvEE6SWkr8E
 mUo5eKIExQFF2znXOG8cwIpo7/L2RbsVmvD8roEykTKzon3WdbSlybiscJEnvfLIpowC
 +/TYaZayLXyCv02U/K32ax3QJ8k4DM1Ic11Q8hwiDOaxDks0o1Wd60REC+JZVmP1QqtF
 mOy0TZ/Xde2zA00DJIX+BHaye2asufNnlmLlAeNCSW2ogyg7CeeHvgVTeMIiucNk9Bra
 OAp9quyF74dw2bkZPKxznjPDkR24a/NgQrdXQCEf8hIpV5xJomCi9cRg1l6tRm0XOKJv
 7M1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=990XCsrOLTXpyHOEH/DU/E+gO4K/fI1NcB5r20RNzmE=;
 b=M7MsH6Xrq8D5xqwgoITgBcY4cGfgp1SvATIegzqiCkeQOj+weCu4076cs8VMHFe9vY
 HX2iAC2fMPq4TCykbKgBe/3xIZ5npoQfNKcQAU7yUJksUiqPU4GOECkkHcyXpJmrrmxd
 ku7DoxVr/T8D/ei/luAKg2zMTzR7B5wh/HXWhCANp6PEvpw/kRi+OjlaUzKzON9NG5JD
 yB4LIOGjX37ofoycquBkZfkT/1wKs4eu6BGQoGLFqBaz2nzKbvy6zFLJbiTQQGxgqtdD
 kiMiTygavUrEQJ1v4f1hotwCwUYrBOdD7YxqL8adQRI2lxrSe7S+9Df0eaPdlhI/VJsQ
 BlVw==
X-Gm-Message-State: ACrzQf3Fh+roj14KG2MExwdThPmVej53gxaplr7yhHhdzowZlmYC4Uar
 ZDCIPwgpVbdRv1VkK5drAbsT/dWEYGO35h98rEXHmEku
X-Google-Smtp-Source: AMsMyM5pe39bEtVGWKDb840vq8CZlTetfWCbMmxJkYYtl6q+1gCTUftTEqhHPbnL4OXX9CTH/YuIRISzLJ6coOdKJzM=
X-Received: by 2002:a17:902:ef47:b0:179:d18e:4262 with SMTP id
 e7-20020a170902ef4700b00179d18e4262mr18904650plx.22.1666358753338; Fri, 21
 Oct 2022 06:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <CACu-5+0Z1JPCttbZpM13870N9Wce8K3V2ZRdhV6XFmVk4FJKxQ@mail.gmail.com>
 <60b5d439-e117-f3c7-3a6b-8ce46bc48fc2@chil.at>
 <19530c0e-6e5e-f47c-8490-8338512f2cb2@chil.at>
 <e460fec5-3c8f-fafc-4a08-e739be1cf5c5@chil.at>
In-Reply-To: <e460fec5-3c8f-fafc-4a08-e739be1cf5c5@chil.at>
From: Janne Johansson <icepic.dz@gmail.com>
Date: Fri, 21 Oct 2022 15:25:41 +0200
Message-ID: <CAA6-MF_AKBUPv9KzeUa2XoxR3m2YARuwtME+Vr_q8pg5NWpubQ@mail.gmail.com>
Subject: Re: Source IP selection or multi-home or multi-interface issue -
 solved with source-based route - was: Re: Wireguard source ip selection issue
 with multi interfaces
To: Christoph Loesch <wireguard-mail@chil.at>
Cc: wireguard@lists.zx2c4.com
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

> "How should wireguard know which IP is the correct source IP address?"
>
> I digged into the source code but couldn't find the part where the source-IP is selected for outgoing connections (like a simple ping).
> I am not a developer but would like to try to understand it. Could someone give me a pointer?

I think it is left to the OS and it's tcp stack to pick the ip (and
interface) based on the UDP destination ip and the current routing
table when sending udp packets.

-- 
May the most significant bit of your life be positive.
