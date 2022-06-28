Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B77C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jun 2022 17:30:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2b16b26e;
	Tue, 28 Jun 2022 17:29:05 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 295a1981
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jun 2022 17:29:03 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id v126so8667532pgv.11
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jun 2022 10:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:in-reply-to:mime-version
 :thread-index:date:message-id:subject:to;
 bh=friB79vYaxFYLDVlY8lyb7gKkFKpHCD1KwpfUeiekwQ=;
 b=G+THY3fzkY7EBw6b1g1fItGDLdFxHNLbrLpWXiSYlzM6Mf/OnUTFSBgkF1BWJEanb0
 JFy9FsqS7LJbUbRGa/SsScIR+esxhAARmWbPFgywCaWKCgfdtt7ih/NOTRN6jKKvfQMr
 kv/JmmweEBbo+thlNmcWZ425ss6u5iByei0K3QxDXAikdq5+H+NNhGNBWE713+zirHVi
 GmoWWXxUm8TvVbOVMig9qfArejM3z5XhD3CLm4vM0Yh/xnNBIqAFtfKWexyuuJP3FaGl
 bCaQWV0/8haRgjR0FwZ0eUs9vKP/tQLYzG8fvIKnQ5OJ5TiPxxSUtoUHNwqKlDO15/EX
 VuEQ==
X-Gm-Message-State: AJIora+b53ESGi6cVj4wWS3SUqaFTB3cPTRmJE49fmKEuStmOK5cpKmN
 I5O54LevyICFxe+k/D5GEVBNHBRORXvisg==
X-Google-Smtp-Source: AGRyM1sfayhTFs29cs6XqNjOzhxs43Lvr/zpJEhL4SYX4dEi2BuiD9gowDzCSs0WiQsM2pAqMzAkPQ==
X-Received: by 2002:a63:ea58:0:b0:40d:fb08:5796 with SMTP id
 l24-20020a63ea58000000b0040dfb085796mr10325168pgk.320.1656437341835; 
 Tue, 28 Jun 2022 10:29:01 -0700 (PDT)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com.
 [209.85.210.171]) by smtp.gmail.com with ESMTPSA id
 e7-20020a170902b78700b001641244d051sm9543676pls.257.2022.06.28.10.29.01
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 10:29:01 -0700 (PDT)
Received: by mail-pf1-f171.google.com with SMTP id x4so12646657pfq.2
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jun 2022 10:29:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:16d2:b0:522:81c0:a635 with SMTP id
 l18-20020a056a0016d200b0052281c0a635mr4622097pfc.0.1656437341292; Tue, 28 Jun
 2022 10:29:01 -0700 (PDT)
From: Clint Dovholuk <clint@openziti.org>
References: 12712d56014ffcc92045c59c79c49a64@mail.gmail.com
In-Reply-To: 12712d56014ffcc92045c59c79c49a64@mail.gmail.com
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdiLE6fytfG04Wk5R+a75VfbtwOWEAAANYlQ
Date: Tue, 28 Jun 2022 13:28:59 -0400
X-Gmail-Original-Message-ID: <1559d27e5d07780e786f5095afae9077@mail.gmail.com>
Message-ID: <1559d27e5d07780e786f5095afae9077@mail.gmail.com>
Subject: seems that https://www.wintun.net/ down?
To: wireguard@lists.zx2c4.com
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

Is this expected? We grab the distributions of wintun to use in our builds
but are having trouble getting them now. Should we be caching these on our
own servers to avoid the bandwidth costs to wintun?

Thanks
-Clint
