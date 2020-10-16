Return-Path: <SRS0=ZPJq=DX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B3DC43457
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:25:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E3120897
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfGq0V4M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38E3120897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee0c57fd;
	Fri, 16 Oct 2020 13:17:00 +0000 (UTC)
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [2607:f8b0:4864:20::e29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 777481ad
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Oct 2020 01:23:06 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id v23so525799vsp.6
 for <wireguard@lists.zx2c4.com>; Thu, 15 Oct 2020 18:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wdlF4DUQWA3MoUgkYTx0ddyn2VKi/AzY4HuyAgCLVuM=;
 b=SfGq0V4M6zuoBsvlO01TekS9Mbi31WtMiL5j3hIhMkTKNYxcPxtOJfRwJnWCDBv78A
 xr/b1VU205bzbjbu20rPtmh5gvOa7xCwfhrMMn01jP895ZdhqsBZwxLuABum6X3dkFUX
 w0mLWJrLnW6NsQLo8gmOgcDHiRru07DxVZvZlD0cHMz0K2nNAZQNfqdkiHTyu65gQu/9
 HLr7+9lKQRlVGLsvntWKIrwcT15/nN43AlnFiQY53tUVmp6ZO4yD1IdfPtbcwiA8Ulq4
 hTkEr3y4KPqfPL6FaP/ibbUI90yQTyRUjCz1bY1pBpIbJemfq89Z8CfleZNuOnOwBHFJ
 Tqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wdlF4DUQWA3MoUgkYTx0ddyn2VKi/AzY4HuyAgCLVuM=;
 b=M23bYqA61HPWJJYOAq5UdQ+e9oL97X1AftimOWizXLbWT2FQaMjnep7aaDXR5ODYLm
 +3AExvdyQZW5Toem4fmhVkMTNb1VnIC5TlB9/5yo7pGEJR/pgYndmjawtMgQA09sxQ27
 GHxcyVMyaqC7IZHZuulw2dXJ6loLUuzEoaN5Ww7cJaPLQ1NV/PM7nmnHbujNNQk60uLM
 jiDLEc9G06oiQUCcHuhrMkAb6rJZGvBPxtTLO1Vc7MzAxBJOceUKYFq6psBP7j200som
 /vFvh07l/A8qkd4q5ZcvwSKOKGxvr1z+/jqZal5lutMxqJjrDm7tjD91N3D1jDq0BK67
 gEDA==
X-Gm-Message-State: AOAM530Kp2vRVHb0uEAGENoD6QW6FmueogMgoP1N7FqDu+YzVXklnUzH
 SKVNqTimzavPehzvyf5SR2EesKkwcJYhn7Zv7bpXBegA99yJv360
X-Google-Smtp-Source: ABdhPJxpOwbpygohs0zJNsikPliqRV6+AIxO6MBAwOsoWrxpt0DNnamdEL95rBtzyYeN292Ywc4nzG12+lbAbSO3tu0=
X-Received: by 2002:a67:68c9:: with SMTP id d192mr669236vsc.5.1602811410039;
 Thu, 15 Oct 2020 18:23:30 -0700 (PDT)
MIME-Version: 1.0
From: Felix-Etienne Gauthier <felixetienne.gauthier@gmail.com>
Date: Thu, 15 Oct 2020 21:23:18 -0400
Message-ID: <CACQQHaQBs99fKQ9qJ+F6EA_uJ09sbte+V=HVCqZ9cBA+XdPJtg@mail.gmail.com>
Subject: WireGuard Android TV Always On VPN
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 16 Oct 2020 15:16:50 +0200
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

Hi guys!

Is it possible to add Always-On Feature directly into the Android app?
There is no way to get access to VPN settings when using Android TV.

Thanks!
