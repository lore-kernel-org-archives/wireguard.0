Return-Path: <SRS0=+Ywq=PB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F798C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Oct 2021 00:09:26 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE1E860ED4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Oct 2021 00:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE1E860ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc24972d;
	Wed, 13 Oct 2021 00:08:02 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3f1bf326
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Oct 2021 23:59:54 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id p13so2855711edw.0
 for <wireguard@lists.zx2c4.com>; Tue, 12 Oct 2021 16:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZJ1BUIP6qogFEfescTQUVVNYAB0p1PgUuZZ0DDCA958=;
 b=XdnB8CHVeZA1qqMxR1318t91NhcVzM5PSednxYangjz2kaaGUjMlLz55Y5XA/9eglN
 Kq0uinfultp+Acm6/Aaa2nl57dlmk666yCl0vdlw4Fdjpv5os7M1xEuqL/QliCbJwFIe
 /Q7g2AtVO90QvXSQ3M0lCDIN0kPAAYdreMwWiyPkfNUNyuxJcdBWNMSdZi3xRDNxPUoe
 BnAwiHtZuAS3xPCekk4gzLMQM+pOD1jGhPYWZVFvsIyzl9QtOSv50vDsXR2Af8h88SwX
 4TpJaz4q8PvkOhW3reHoZtfVZrzI10MVzy5F7s5F+wyhk1aBDP4/W0TSNsBqtYrgcRtB
 +VNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZJ1BUIP6qogFEfescTQUVVNYAB0p1PgUuZZ0DDCA958=;
 b=ckVl3x1Ve1jIGEG52gMYsMbSJOI6xWb5/9MUtj87jg5A8FFn7/rnIyg+YGLrogKRXY
 TGEdptIXK+advUs98gVF/3vl9q6vdpii+Gp5RcLKjwTItdiQ0YoBkcGERf1IHPQ8r8kJ
 2lZUNrpYzqiAzieBRMQnmoHVOpViXHEBk3TPv7Rlu+TpUVsIqp2FayNLTzslgUrY04wj
 HEI08BCtKx3CmczwL+AM/pHSy7ZCrZe7Qy/9JggVdODYcHXhaxYJSqHkzXclUmQNOv/C
 JopBpUl3+pM5SlttYP+SKgq69NPZaxRqmyr/ckJquyBQ1Efql/LOwawxkYWdhHniIlVL
 aPHA==
X-Gm-Message-State: AOAM531Kj0dl3EIhLYiLF/L+Mhh0wcKH7SyX/czTmhaVVt9KAkSw6jTE
 IRRQMrr09vzQLtRsJ4YcjJKf2ReQ05UGkxm3s623y7hbFb4VJA==
X-Google-Smtp-Source: ABdhPJw4CJ6cgHQCYlPMrQQfHEIPswvNykoYpKns5kE6c9n5qQMNorCsxINiNmr0JwpBhNXTy6WfinmTVOLKF7JDvuw=
X-Received: by 2002:a50:8dcb:: with SMTP id s11mr4281578edh.143.1634083193877; 
 Tue, 12 Oct 2021 16:59:53 -0700 (PDT)
MIME-Version: 1.0
From: Scott Bonar <sbonar@gmail.com>
Date: Tue, 12 Oct 2021 17:59:43 -0600
Message-ID: <CABGW2bUxOaOBuChZTS4w7+3OX0WNvypjYc-+cSNgQO-zWQHaFw@mail.gmail.com>
Subject: Wintun.dll (amd64) GetProcAddress failure
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 13 Oct 2021 00:08:01 +0000
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

I will be the first to admit I maybe doing something wrong, but the
DLL loads just fine, however when I try to init the API functions the
only one that is successful is WintunCreateAdapter.
All other calls to GetProcAddress() return NULL and LastError is
coming back as 0.  Any help would be appreciated.

Thanks
