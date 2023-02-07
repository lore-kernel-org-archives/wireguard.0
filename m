Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93312C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Feb 2023 23:00:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1110a2ee;
	Tue, 7 Feb 2023 22:54:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6a052a4d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Feb 2023 22:54:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 300FF61300
 for <wireguard@lists.zx2c4.com>; Tue,  7 Feb 2023 22:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE972C433EF
 for <wireguard@lists.zx2c4.com>; Tue,  7 Feb 2023 22:54:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="nKAiZDuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675810444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XZQszJl6Wy3unWW5shRFKEY0SnIj1Z2g7uZvWygPpWI=;
 b=nKAiZDuS2mSO1ofbQ39LDR3tvkQbpu3R8kd1viAn628wyIlJdasQScYJNv1Wxqdt4RWLhE
 +1lTavXoh+ag76s6Y5jCgxsqGFcXZLZzm/WfMQoqfcHydeeXuYY7UDR2tYTbWxloHe5Ln4
 67HqxqNXA6+vBYR7JXMtIkiJQDwHJUI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 16e75616
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Feb 2023 22:54:04 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id p9so808522ejj.1
 for <wireguard@lists.zx2c4.com>; Tue, 07 Feb 2023 14:54:04 -0800 (PST)
X-Gm-Message-State: AO0yUKVFTa3nkCvQ7HcrlTyreRpWwZWZVS5jU2NpDihu6oWHkfEIVjCl
 qD1NdYH7x00BPeNWypP3E7EzmACR3cdfwNCyscg=
X-Google-Smtp-Source: AK7set8UEOtMCZeYmiORtV3zrodqWS7cXRRsIffi+N7KZTV00iFgewLw31I3DfMefhwKkxWcw6N1QvUNNwiwwk1eJCM=
X-Received: by 2002:a17:906:e24c:b0:89c:7298:2de4 with SMTP id
 gq12-20020a170906e24c00b0089c72982de4mr1081880ejb.91.1675810443150; Tue, 07
 Feb 2023 14:54:03 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR04MB6155B09AAC361275C059DF1EF8D09@DM6PR04MB6155.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB6155B09AAC361275C059DF1EF8D09@DM6PR04MB6155.namprd04.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 7 Feb 2023 19:53:48 -0300
X-Gmail-Original-Message-ID: <CAHmME9ofdbSMeUPf6QbUFNqQ+HziLfkaPVrON087rdbaPaEvvg@mail.gmail.com>
Message-ID: <CAHmME9ofdbSMeUPf6QbUFNqQ+HziLfkaPVrON087rdbaPaEvvg@mail.gmail.com>
Subject: Re: [PATCH] handle a network adapter ending in a space character
To: David Leib <David.Leib@ericom.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Thanks.

Can you send this with a `Signed-off-by:` line like every commit in
that repository does, please? Then I'll apply this.

Jason
