Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E714A606A33E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2026 02:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ERgnQqYv
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ec3b88ab;
	Thu, 12 Nov 2026 02:37:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f160ab01
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2026 02:37:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id EECDD636E3;
 Thu, 12 Nov 2026 02:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9541F00A08;
 Thu, 12 Nov 2026 02:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794451061;
 bh=sLyZtPTkFdbyABhOZWUDHW8SHa1Rc6mfsRhG3LxmUD0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ERgnQqYvfvolna7L7ee0cAQo8HaWthmedT63ZNTS0MmzNGGR+I5/57I2BE/lpQVAL
 EtRz3ryIJex7MoSFK7Ln1s37xaI6rOLUtqcBlHJ6yyivBJBh8SiH8oMeoTybg/wy7A
 NLbX9qxT1xoY+RLSbDuBlqiMSN3h0EqvZW6HlBJFID8K+Koe40lGImaFeV9ghzcOvc
 ZkYE0lGcJh/D00cg2UTZkKhgHSBz4WbG2U0REmBKU1kqCs4aMyt6F0f/cRd6pRJSmf
 cyzBnO+Hf/A5ThrapbDWSOoroSHvl28Upq8UR0omQi7Vku1+wuPDT2TIF5QdliyUR1
 64hhPeeL/H4Tg==
From: netdev-bot+sinfo@kernel.org
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: Jason@zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wireguard: Mark concurrent accesses to reused indices
Date: Thu, 12 Nov 2026 02:37:40 +0000
Message-ID: <179445106063.2168702.961983939936124723@kernel.org>
In-Reply-To: <20261112023022.118119-1-zhujun2@cmss.chinamobile.com>
References: <20261112023022.118119-1-zhujun2@cmss.chinamobile.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
