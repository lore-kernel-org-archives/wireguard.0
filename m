Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543DBC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 26 Nov 2021 08:51:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id de56afc6;
	Fri, 26 Nov 2021 08:48:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 89151ac4
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 Nov 2021 08:48:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C17C610A7
 for <wireguard@lists.zx2c4.com>; Fri, 26 Nov 2021 08:48:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="WnSI+Atg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1637916484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DWRWUHZq+UPxTJ8L062K0l1URxqW9rA4tQExpvbiHt4=;
 b=WnSI+AtgJJEs8HxD506yCjc0bHsjSVFVWkTGufJOoo0Dmq69dklwOEVZrvoYdkFQrie8/r
 lsYxZAfttOu7m7SqllMW7Sw1uKc07yHekIG3Xp24Rcy4K8GIoU1lDBwxUV3dQCD5wI4jnq
 Y3uCmo9mOMdMIcUUD0B5n9o4ZENi+d8=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 402646a1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 Nov 2021 08:48:04 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id e136so18298523ybc.4
 for <wireguard@lists.zx2c4.com>; Fri, 26 Nov 2021 00:48:04 -0800 (PST)
X-Gm-Message-State: AOAM531KlXCRMRwfe253u1itr+1hg1R5clpqGkQc8wJoAYD4nGuN+Txs
 93aZBtjU0wHESQKFScJlAKvVxk75NMTkAxMzwno=
X-Google-Smtp-Source: ABdhPJysIUfe9lTLc4IHlDL2Y1S2AZo4ljjohyOnYyhkvA93ntSW23jEXCRG6aXlPbfGunA6PGicRC0+zbdpabYv/h8=
X-Received: by 2002:a25:a2cd:: with SMTP id c13mr13626764ybn.95.1637916483385; 
 Fri, 26 Nov 2021 00:48:03 -0800 (PST)
MIME-Version: 1.0
References: <1da227e6-5b12-40ca-a6de-3117835a2f16@ut1.org>
 <CAHmME9oqvV9E9cVXeF5nVpumE0fJgdASaBqG6aCPyS-NLq9rXQ@mail.gmail.com>
 <ccf4971633fdd62807ff51ddf7de1299@purelymail.com>
 <406a9568-8f70-b222-4e08-23fc5884847e@ut1.org>
 <CAHmME9roq+Qp7TFA4h3KZDuTd6DYJ68y2j9__MrX3+FDdtwVbA@mail.gmail.com>
In-Reply-To: <CAHmME9roq+Qp7TFA4h3KZDuTd6DYJ68y2j9__MrX3+FDdtwVbA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 26 Nov 2021 09:47:52 +0100
X-Gmail-Original-Message-ID: <CAHmME9rwFyJ4W3nnbTWq0e0X_P_FOQx6Z3kcuUhcYuYjkc0atQ@mail.gmail.com>
Message-ID: <CAHmME9rwFyJ4W3nnbTWq0e0X_P_FOQx6Z3kcuUhcYuYjkc0atQ@mail.gmail.com>
Subject: Re: [Windows Client] Out of date Title scare my users
To: Bruno UT1 <bandry@ut1.org>
Cc: Diab Neiroukh <lazerl0rd@thezest.dev>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

https://git.zx2c4.com/wireguard-windows/commit/?id=8120d07dd5fc9a5e545419fe13490086ce920f31

Is this okay with both of you?
