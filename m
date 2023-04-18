Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D193EB64D7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Jun 2023 14:48:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36ff6c44;
	Mon, 26 Jun 2023 14:43:08 +0000 (UTC)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c9920aa5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Apr 2023 15:10:05 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-247296def99so1179178a91.1
 for <wireguard@lists.zx2c4.com>; Tue, 18 Apr 2023 08:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681830603; x=1684422603;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/P3+ZMqH2DjEDWs6makDM9RnLowoNHKQlK1MTs0LiK4=;
 b=f/ZhX4QHLLoDt6PlthwchtMt+SDEbx0iAf9NmnEUeHKk1EhAEJLdWGdDPEhAiEiT89
 5KKDm+LsiJlmEb8Hwj/L19dH5B1il5AKkSWcWApYzEta9OLp6mPEhQOnBtsbffd920WY
 cZp8YIVelADQNRPF45AwUkQy68z8tQR+lf5BRNwpUDRsUOmCsSRv+i1AZkddQq87ACOX
 bc/8eRS6QfvqshxAahkKOgq3mYmsWBdo9hsmibeSoTLxdoQuY2EUt3NmfPsQCY7EiyZA
 ywh+lFq7GQqGcxhd87u/m2TSW5ZEsIvycVaNEDbcMbdbHCuDKY1fXdIUZQU3R+gK2TJW
 sgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681830603; x=1684422603;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/P3+ZMqH2DjEDWs6makDM9RnLowoNHKQlK1MTs0LiK4=;
 b=VkNuTvJ+P1y0y7wDN3rqN4wzZt8aDeDwcwApYdBw7VDDIy+za00ET7Sc4OY+JMlQna
 FutP8aOoeflzs3V1jvof+iolzshW2arHw1SOGPU6J3ATBKfIUXhYAlJHUwvx4mbrkLD8
 RmNTf1SmobObX10tmG2h7gmyTKwED24GaR/qcy47EizL3D19oG9Q2gcgA9vrCn4d5jLx
 bkVEo7R3oaA1bkZO5VWe6U4Mlgq0TM85PJEPEPE0PcHCT1Z5nUcr82l5TMqeXZqWAQWx
 yB7LvM+Un2RKErZQAXPrpjlzGUfSGA8wzYeRzp8U6niT4g2zEh0VyJzZJ/JF9+YIdAec
 a6xw==
X-Gm-Message-State: AAQBX9caTaWJAsuphvgTYRotadSpkJW7yd14dnB2zmkAk8etKsZpnAjD
 fJoY6OQL+YZ4U8SDSwM7rHumaddyQ39dDGB2uNcbxzX90SzEsA==
X-Google-Smtp-Source: AKy350bFiZBelY/8MJrUO/jbrVdsCQ5kQrVWJLhXW1EZfjULjNUlJN80Zzs+tu/fIkt5xRD7ura8PaPuDGGTYl2WN28=
X-Received: by 2002:a17:90a:4c85:b0:230:b842:143e with SMTP id
 k5-20020a17090a4c8500b00230b842143emr28610pjh.6.1681830603132; Tue, 18 Apr
 2023 08:10:03 -0700 (PDT)
MIME-Version: 1.0
From: "Benjcmin v. Bohr" <benjcmin@gmail.com>
Date: Tue, 18 Apr 2023 17:09:47 +0200
Message-ID: <CAMHpNfgJz7Rpju7P0XEw51uN-WJEr-EAWdFdvOJwgHbsp3zd8A@mail.gmail.com>
Subject: iOS App log disappering
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 26 Jun 2023 14:43:07 +0000
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

I'm using the wg iOS App and VPN functionality works fine. But
checking the log doesn't work anymore. When I go to Settings, Log,
show logs it shows log text for about 1sec and then they disappear. If
saved to a text file everything seems to be there but beeing able to
read them in the App is just way more comfortable.
I hope I came to the right place to address this issue.

Thx for the support.

MfG Benjamin
