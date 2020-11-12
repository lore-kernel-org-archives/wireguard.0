Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE924C2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:44:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC41E206E3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:44:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="I6qgZpT3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC41E206E3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6772a19;
	Thu, 12 Nov 2020 08:40:24 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3ba92b09
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 08:40:21 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e97001a
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 08:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=4KIiV0yG1gMmG8Ruo7Xou+RTY40=; b=I6qgZp
 T38DbGEnJfx9CePhxWHu1ZPGa7hUBvdB3avjmF5yJSjjQurPxeD1Xe2urLT6MFyo
 2q02t+lF1hj88cQij0t/KwwUmfv6PMr2rHnpl1VtP5uXZ2yQfknR4r65BdKy0OIe
 FhKjSOPASX50koGdwXO4m8tUWWxAteVmMtM38/fTUND/75L3MiGMd/lpBvFbBECu
 NDTlbcN2TDoeNmZKKwZwVSQ9q2qWxw0wZRYKDuoRIZ6QGr8KEjAdX1/Yebo03Nca
 +70WBNQjPCTuzaj5b6kOeUekf0EeF58Kd+PZFyJa4js0ocfnFdqrjUYvQDMmro+p
 OaSrSggT2Kee79Bg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fe127a66
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 08:41:07 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id l14so471308ybq.3
 for <wireguard@lists.zx2c4.com>; Thu, 12 Nov 2020 00:44:17 -0800 (PST)
X-Gm-Message-State: AOAM532v6uNvU9CnUnxIek29LW/lcxjl3keaYq9U/FKaCEjdH8q/Cbeo
 X+rLEr2O1DWa+3pi6IXyRDLJesn4COaSYo96m+Q=
X-Google-Smtp-Source: ABdhPJzJHgiQvgEHcXUGqSLyHi4YypLUlN2oFL3KPZHQi6sFdPJbzprpnt9seUFfiu9+iOV2SywS/0zwxpy31SgrAmM=
X-Received: by 2002:a25:4943:: with SMTP id w64mr39096095yba.178.1605170656933; 
 Thu, 12 Nov 2020 00:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20201110185656.541102fe@natsu> <20201110192055.1ab28462@natsu>
In-Reply-To: <20201110192055.1ab28462@natsu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 12 Nov 2020 09:44:06 +0100
X-Gmail-Original-Message-ID: <CAHmME9prEgyuPDBwTmh+1GvL=K1=qDQkTZkYff4wYF+JGpgVbA@mail.gmail.com>
Message-ID: <CAHmME9prEgyuPDBwTmh+1GvL=K1=qDQkTZkYff4wYF+JGpgVbA@mail.gmail.com>
Subject: Re: No longer compiles on 5.4.76
To: Roman Mamedov <rm@romanrm.net>
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

Thanks! Applied. I'll have a new release out today.
