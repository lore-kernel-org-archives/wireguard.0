Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1462C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 May 2022 23:31:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 35c1a7ee;
	Fri, 13 May 2022 23:31:30 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 86de0304
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 May 2022 20:04:38 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ch13so484611ejb.12
 for <wireguard@lists.zx2c4.com>; Mon, 09 May 2022 13:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agillic.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=tHQXUVgeNrfxPuPI8BjeMONk+ZGhC5Se2MPwti7zQEA=;
 b=SbG+CSF3VC4clk6ttzlVtKa8fL9q+BcrqPB9fG9BmeYTayUppQvsyUob10G10nlOyR
 B6O6KppsDTIHJ7EWFyBzb45uolOkNU4zqi18zbqwDtJYq91fjmMZW7cI24rkni/ft1gv
 DN8XKTM6D5YqT2WFUjn00XkPuYoJTfjT08O5mUGzSczTyjDviEp/15ugtoJbUehimjFW
 rn2MtPzL7Y2dqKyzONz1t1g7/b2UpM1PrJPe5yDpvMrkr+VkxFrTJ1iBNu0bVV4iChDZ
 3fBolBDSLIgLbNoCazLwwpxZ+ZS7241R2XYMe5OZvPNniWFs6eTnIjQdNzlaz5oSCDXv
 EhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tHQXUVgeNrfxPuPI8BjeMONk+ZGhC5Se2MPwti7zQEA=;
 b=6Aotzj36PrU5zwtsCWbqN00xx4vLlFTJ9VqzzhABNBPbKcOipLbxYITosnO6C2sR+U
 JgmQA+ON9T4uVoDrF0qAmZQQtdJgl3tVrui+9odLickK7KFSTvVEO6Mi8DzdeV0GZo6V
 9Sv1Dsz0zuX58UgGNwji4a6uBrlq7aF2d57UP7ArC0u4sAMEXm0wARmw8eb07yGXCUCW
 ZjsME0VzuGsmITds+tOJDo16j55gfcjAUPhPIAl4FifSkdUzvxr74MXb8eLXiBj3oINT
 dJHPTBLMYZ8OJdXVNPlKoh0upGnYCL3gWb6NSVt20qpW2ugNKf1yBuq7e9cJ2uEvZTpX
 P5/g==
X-Gm-Message-State: AOAM532+s9Pe74qQM1nVZamUP1HEmiFo/UY4M29o7nO7BcFEqOrrNczw
 YR7YoPPUBKVXtsi6IqpoEvuAlLRepoApji8jb2KMOkLdqJfNCg==
X-Google-Smtp-Source: ABdhPJzUp9n+yrWWY8pqLnIm2byvmqkpy/I6mNDL7MeN3QqhUKGLsGzyHE2u6F8YyVvZ/rBchzm+Wgr0vF40VOoqu2g=
X-Received: by 2002:a17:906:58d3:b0:6da:bdb2:2727 with SMTP id
 e19-20020a17090658d300b006dabdb22727mr15940641ejs.549.1652126677749; Mon, 09
 May 2022 13:04:37 -0700 (PDT)
MIME-Version: 1.0
From: Simon Karberg <simon.karberg@agillic.com>
Date: Mon, 9 May 2022 22:04:27 +0200
Message-ID: <CALDyVtvd64jE7KwMC5UxMw0t6pkZQHbDH5vvz6zpL5noQsBm_A@mail.gmail.com>
Subject: [MacOS] Multiple search domains settings based on config file
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 13 May 2022 23:31:24 +0000
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

I can see in my config file under DNS that I have our primary DNS
server ip address and then added search domains with comma list after.
On linux & Windows it seems to be set correctly but it's not being set
through the MacOS client from the app store.

I have tried to look through the source code to identify if the
settings are there for the app but i'm not sure.

I am on MacOS 12.13.1 (Monterey) in a M1 Max (arm64).
App version: 1.0.15 (26)
Go backend version: 2ef39d47

Best regards,

Simon Karberg
