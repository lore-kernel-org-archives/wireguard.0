Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3680C6FD1D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Mar 2023 14:16:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 126326b4;
	Thu, 30 Mar 2023 14:16:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e6660857
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Mar 2023 14:16:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E77A461F3C
 for <wireguard@lists.zx2c4.com>; Thu, 30 Mar 2023 14:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CC7C4339E
 for <wireguard@lists.zx2c4.com>; Thu, 30 Mar 2023 14:16:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="B4uZ8BWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1680185778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=viNgEZFEn6veGKFigilnWYOPVmCcl66+Oq6gcIS6oQY=;
 b=B4uZ8BWLoKIwnfM1WA8vO8F7wM9yfTiqYpwlcFW0+IUDKB14LehL2Ni97r7kAjlmH0a0rV
 COLzy+yN75M47WwH2AYduIEPdW65jqRUNUrEuW25kFqcXTOGSMFztY0bNIuLKc8qi1fxGM
 Jdd50DQctKKvayKSbi7XPED4LNxdXt4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 447c3051
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Mar 2023 14:16:18 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id c1so16372458vsk.2
 for <wireguard@lists.zx2c4.com>; Thu, 30 Mar 2023 07:16:18 -0700 (PDT)
X-Gm-Message-State: AAQBX9fzExyXuZzMIJcVPDwKEs3XdgG6HO4ntUO4JTm9/0W/DBZAf0FD
 4IK1bpMKc2SSqAc5aex6Omh1fxe7r5YmOBf25Nc=
X-Google-Smtp-Source: AKy350aeH8jyDW9uVrSrstpeAityaWv4HK3hcg8e1fWSNski1XutDwc/oO9TCX0qM/rAleOyh3mGo5ZiRIffmMusCnU=
X-Received: by 2002:a67:d88e:0:b0:426:3a3d:180b with SMTP id
 f14-20020a67d88e000000b004263a3d180bmr12398506vsj.5.1680185777630; Thu, 30
 Mar 2023 07:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <CA+CGqoKvx-Yeh6zP1_9goVFaPMKaVPQUij2UrO9B9Ea8cRd7iQ@mail.gmail.com>
In-Reply-To: <CA+CGqoKvx-Yeh6zP1_9goVFaPMKaVPQUij2UrO9B9Ea8cRd7iQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Mar 2023 16:16:06 +0200
X-Gmail-Original-Message-ID: <CAHmME9pXvghVW7RUD3gMRR4R9bAfS9YZ7kbt+27m2tnbGtjXFQ@mail.gmail.com>
Message-ID: <CAHmME9pXvghVW7RUD3gMRR4R9bAfS9YZ7kbt+27m2tnbGtjXFQ@mail.gmail.com>
Subject: Re: Nw Android version crashes on Android TV / Google TV
To: Kai Haberzettl <khaberz@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Already fixed and just waiting on Google to approve the app:
https://git.zx2c4.com/wireguard-android/commit/?id=b734f44200c40fb630fbc566dd245693145f93ec
