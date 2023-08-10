Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57906C001B0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Aug 2023 10:01:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ef77364;
	Thu, 10 Aug 2023 10:01:54 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5133b0a9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2023 08:35:08 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbea14706eso5260655e9.2
 for <wireguard@lists.zx2c4.com>; Thu, 10 Aug 2023 01:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1691656507; x=1692261307; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oM5c1fCe71bXjP+/DYMV8fSoBtFwccX2huN11PlbeTw=;
 b=rhsbavql8ZH5JMNDD60tdTd090g32uo+vMaRZiiW0SlZM5sGK+GkhcvSPSgZJZfvfd
 tw+Njzz3+RoZRDO7Yjr7xgvtFekWId6AEhTwHTSVzYA98ppF4HwRJWGHN8mwtzrYkK6l
 aHoxdv9WsZJaV+oRqveXjf3pYR1WtrCAsUcu5Kq9dq97PPeL1p80q5/9e0T+AUcosQei
 w0Fy96IoO+n/TB7kSBpvsu/Kw0zeTyKVTSoIWqrIeRg7+2KJdKw/65vsMDYh5dONSqW7
 KdUn4ZNluER1pGBvnYJSnd+0wqHvBvn9UP7CnVLFXD0bA+n77adBUb6208CDskdA709w
 dEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691656507; x=1692261307;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oM5c1fCe71bXjP+/DYMV8fSoBtFwccX2huN11PlbeTw=;
 b=joEYDfFhIfjM/CwxKozybfAwxNoKXlMJB82+doz9zoHeJCAQTj4IRKuvcBU1ZQONEI
 evYwew9bQrwW6U81rQX1Oqqm1Bkx8/rRCW4zrqNbX/jR3E2RBQ03WWZMkENQx52p3Wak
 fuX2TV8Cu1Wy9s0jUpqOaPClGcbpkpp84Quxbb+9inasXzQf5f5ouA5ED+GL+geQ1/CS
 7b7d5xEFKqyfxI3I6swDm87OuLhd3m9Ja0+A2FExDGabGSXUks/Gh7oc2swjJMes8u9F
 5h5Sk2Nm4zghB+qz6iVLVJFjhZlL9waKAV9rJNsHjKaGd6PJoO4qAJx8U2pjjC8JGLaW
 sagQ==
X-Gm-Message-State: AOJu0YzEXFL/ugKgKMaSIPdCfzGvWBZ3XYycwr4UECONNNBZH9JEWKdn
 yP32c04FwqhJM7SFSNh0Fiep4Q==
X-Google-Smtp-Source: AGHT+IHUOsbgm9S0hE6ryodK/ySL3LaoxEfx6NRd4v0M2koiBNPFLdL77ypCCq8yK8czVI+c7fvE3g==
X-Received: by 2002:a1c:7705:0:b0:3f9:c0f2:e1a4 with SMTP id
 t5-20020a1c7705000000b003f9c0f2e1a4mr1329391wmi.34.1691656506191; 
 Thu, 10 Aug 2023 01:35:06 -0700 (PDT)
Received: from localhost ([212.23.236.67]) by smtp.gmail.com with ESMTPSA id
 o11-20020a056000010b00b0031431fb40fasm1382078wrx.89.2023.08.10.01.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 01:35:05 -0700 (PDT)
Date: Thu, 10 Aug 2023 10:35:04 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, johannes@sipsolutions.net, Jason@zx2c4.com,
 alex.aring@gmail.com, stefan@datenfreihafen.org,
 miquel.raynal@bootlin.com, krzysztof.kozlowski@linaro.org,
 jmaloy@redhat.com, ying.xue@windriver.com, floridsleeves@gmail.com,
 leon@kernel.org, jacob.e.keller@intel.com,
 wireguard@lists.zx2c4.com, linux-wpan@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net
Subject: Re: [PATCH net-next 05/10] genetlink: use attrs from struct genl_info
Message-ID: <ZNShOAs5oLBReCxC@nanopsycho>
References: <20230809182648.1816537-1-kuba@kernel.org>
 <20230809182648.1816537-6-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809182648.1816537-6-kuba@kernel.org>
X-Mailman-Approved-At: Thu, 10 Aug 2023 10:01:52 +0000
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

Wed, Aug 09, 2023 at 08:26:43PM CEST, kuba@kernel.org wrote:
>Since dumps carry struct genl_info now, use the attrs pointer
>use the attr pointer from genl_info and remove the one in
>struct genl_dumpit_info.
>
>Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
